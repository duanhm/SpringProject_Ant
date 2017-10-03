package com.dhm.service;

import com.alibaba.fastjson.JSON;
import com.dhm.common.util.Base64Util;
import com.dhm.common.util.DESEncrptionUtil;
import com.dhm.service.util.InterfaceConstantUtil;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.web.client.RestTemplate;

import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

public class CommonInterfaceTest {

    private static final String host = "http://localhost:7001/spring/processRequest.do";

    public static void main(String[] args) throws Exception {

        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
        headers.setAccept(Arrays.asList(new MediaType[]{new MediaType("application", "json", Charset.forName("UTF-8"))}));

        Map<String, Object> param = new HashMap<String, Object>();
        param.put(InterfaceConstantUtil.REQ_SYS, "cbp");
        param.put(InterfaceConstantUtil.REQ_NO, "522601199103090816");
        param.put(InterfaceConstantUtil.INTERFACE_ID, InterfaceConstantUtil._0001);

        Map<String, Object> infoContent = new HashMap<String, Object>();
        infoContent.put("name", "dhm");

        String infoContentStr = JSON.toJSONString(infoContent);
        //加签
        param.put(InterfaceConstantUtil.SIGN, DigestUtils.md5Hex(infoContentStr));
        //加密
        String encryptInfoContent = DESEncrptionUtil.encrypt(infoContentStr, "UTF-8", "paic1234", "p2p_rcslfx.jceks");

        param.put(InterfaceConstantUtil.INFO_CONTENT, encryptInfoContent);

        Map<String, Object> contentDataMap = new HashMap<String, Object>();
        contentDataMap.put(InterfaceConstantUtil.CONTENT_DATA, param);

        String reqData = Base64Util.encode(JSON.toJSONString(contentDataMap));

        HttpEntity<String> requestEntity = new HttpEntity<String>(reqData, headers);

        String post_result = restTemplate.postForObject(host, requestEntity, String.class);
        System.out.println("rest_post:" + post_result);
    }
}
