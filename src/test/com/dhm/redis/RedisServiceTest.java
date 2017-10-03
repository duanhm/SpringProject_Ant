package com.dhm.redis;

import com.dhm.BaseTest;
import com.dhm.redis.biz.RedisService;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

public class RedisServiceTest extends BaseTest {

    @Resource(name = RedisService.SERVICE_ID)
    private RedisService redisService;

    @Test
    public void putObJToRedis() throws Exception {
        Map<String, Object> person = new HashMap<String, Object>();

        person.put("name", "dhm");
        person.put("age", "25");
        person.put("sex", "female");

        String resultCode = redisService.putObJToRedis("dhm", person);

        System.out.println("putObJToRedis---resultCode=" + resultCode);
    }

    @SuppressWarnings("unchecked")
    @Test
    public void getObJForRedis() throws Exception {
        Map<String, Object> person = (Map<String, Object>) redisService.getObJForRedis("dhm");

        System.out.println("getObJForRedis---person=" + person);
    }
}
