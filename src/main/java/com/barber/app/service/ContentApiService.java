package com.barber.app.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.barber.app.dto.StaffContentDto;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 어드민 백엔드(port 8090) API를 호출해 콘텐츠를 가져옵니다.
 */
@Service
public class ContentApiService {

    private static final Logger logger = LoggerFactory.getLogger(ContentApiService.class);

    // 환경변수 ADMIN_API_HOST 없으면 로컬 기본값(localhost:8090) 사용
    // Docker 운영 환경에서는 docker-compose.yml에서 http://app:8090 으로 주입
    private static final String ADMIN_HOST =
        System.getenv("ADMIN_API_HOST") != null ? System.getenv("ADMIN_API_HOST") : "http://localhost:8090";

    private static final String ADMIN_API_BASE = ADMIN_HOST + "/api/contents/type";
    private static final String ADMIN_API_ROOT = ADMIN_HOST + "/api/contents";

    private final ObjectMapper objectMapper = new ObjectMapper();

    /**
     * contentType 에 해당하는 공개(visible=true) 콘텐츠를 displayOrder 순으로 반환합니다.
     */
    public List<StaffContentDto> getVisibleContentsByType(String contentType) {
        List<StaffContentDto> result = new ArrayList<StaffContentDto>();
        CloseableHttpClient httpClient = null;
        CloseableHttpResponse response = null;

        try {
            httpClient = HttpClients.createDefault();
            HttpGet request = new HttpGet(ADMIN_API_BASE + "/" + contentType);
            response = httpClient.execute(request);

            String json = EntityUtils.toString(response.getEntity(), "UTF-8");
            JsonNode root = objectMapper.readTree(json);
            JsonNode data = root.get("data");

            if (data != null && data.isArray()) {
                for (JsonNode item : data) {
                    StaffContentDto dto = objectMapper.treeToValue(item, StaffContentDto.class);
                    if (Boolean.TRUE.equals(dto.getVisible())) {
                        result.add(dto);
                    }
                }
            }

            // displayOrder 오름차순 정렬 (Spring 3.x ASM 호환 - 람다 미사용)
            Collections.sort(result, new Comparator<StaffContentDto>() {
                public int compare(StaffContentDto a, StaffContentDto b) {
                    int ao = a.getDisplayOrder() != null ? a.getDisplayOrder() : 0;
                    int bo = b.getDisplayOrder() != null ? b.getDisplayOrder() : 0;
                    return ao - bo;
                }
            });

        } catch (Exception e) {
            logger.warn("[{}] 콘텐츠 로딩 실패 (어드민 백엔드 미기동 또는 네트워크 오류): {}", contentType, e.getMessage());
        } finally {
            try { if (response != null) response.close(); } catch (Exception ignore) {}
            try { if (httpClient != null) httpClient.close(); } catch (Exception ignore) {}
        }

        return result;
    }

    /**
     * SHOP_INFO 타입 중 visible=true인 첫 번째 항목을 반환합니다.
     * title = 상호명, description = 주소, skills = 전화번호 로 사용합니다.
     */
    public StaffContentDto getShopInfo() {
        List<StaffContentDto> list = getVisibleContentsByType("SHOP_INFO");
        return list.isEmpty() ? null : list.get(0);
    }

    /**
     * SOCIAL_LINKS 타입 중 visible=true인 첫 번째 항목을 반환합니다.
     * title = 인스타그램 URL, description = 유튜브 URL, skills = 네이버 예약 URL 로 사용합니다.
     */
    public StaffContentDto getSocialLinks() {
        List<StaffContentDto> list = getVisibleContentsByType("SOCIAL_LINKS");
        return list.isEmpty() ? null : list.get(0);
    }

    /**
     * 커뮤니티 글 목록 (최신순). GET /api/community 사용.
     */
    public List<StaffContentDto> getCommunityPosts() {
        List<StaffContentDto> result = new ArrayList<StaffContentDto>();
        CloseableHttpClient httpClient = null;
        CloseableHttpResponse response = null;
        try {
            httpClient = HttpClients.createDefault();
            HttpGet request = new HttpGet(ADMIN_HOST + "/api/community");
            response = httpClient.execute(request);
            String json = EntityUtils.toString(response.getEntity(), "UTF-8");
            JsonNode root = objectMapper.readTree(json);
            JsonNode data = root.get("data");
            if (data != null && data.isArray()) {
                for (JsonNode item : data) {
                    StaffContentDto dto = objectMapper.treeToValue(item, StaffContentDto.class);
                    if (Boolean.TRUE.equals(dto.getVisible())) {
                        dto.setImageUrl(normalizeUrl(dto.getImageUrl()));
                        result.add(dto);
                    }
                }
            }
        } catch (Exception e) {
            logger.warn("커뮤니티 목록 로딩 실패: {}", e.getMessage());
        } finally {
            try { if (response != null) response.close(); } catch (Exception ignore) {}
            try { if (httpClient != null) httpClient.close(); } catch (Exception ignore) {}
        }
        return result;
    }

    /**
     * 커뮤니티 글 등록 (이미지 선택). POST /api/community 로 전달.
     */
    public void submitCommunityPost(String title, String description, MultipartFile file) throws IOException {
        CloseableHttpClient httpClient = null;
        CloseableHttpResponse response = null;
        try {
            httpClient = HttpClients.createDefault();
            HttpPost post = new HttpPost(ADMIN_HOST + "/api/community");
            MultipartEntityBuilder builder = MultipartEntityBuilder.create();
            builder.addTextBody("title", title != null ? title : "");
            builder.addTextBody("description", description != null ? description : "");
            if (file != null && !file.isEmpty()) {
                builder.addBinaryBody("file", file.getInputStream(),
                    ContentType.create(file.getContentType() != null ? file.getContentType() : "image/png"),
                    file.getOriginalFilename() != null ? file.getOriginalFilename() : "image.png");
            }
            HttpEntity entity = builder.build();
            post.setEntity(entity);
            response = httpClient.execute(post);
            int code = response.getStatusLine().getStatusCode();
            if (code < 200 || code >= 300) {
                String body = EntityUtils.toString(response.getEntity(), "UTF-8");
                throw new RuntimeException("등록 실패 (" + code + "): " + body);
            }
        } finally {
            try { if (response != null) response.close(); } catch (Exception ignore) {}
            try { if (httpClient != null) httpClient.close(); } catch (Exception ignore) {}
        }
    }

    private String normalizeUrl(String url) {
        if (url == null || url.isEmpty()) return url;
        if (url.startsWith("/")) return ADMIN_HOST + url;
        return url.replace("http://app:8090", ADMIN_HOST).replace("https://app:8090", ADMIN_HOST);
    }
}
