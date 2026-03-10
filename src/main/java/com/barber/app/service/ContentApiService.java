package com.barber.app.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.barber.app.dto.StaffContentDto;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 어드민 백엔드(port 8090) API를 호출해 콘텐츠를 가져옵니다.
 */
@Service
public class ContentApiService {

    private static final Logger logger = LoggerFactory.getLogger(ContentApiService.class);
    private static final String ADMIN_API_BASE = "http://localhost:8090/api/contents/type";
    private static final String ADMIN_API_ROOT = "http://localhost:8090/api/contents";

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
}
