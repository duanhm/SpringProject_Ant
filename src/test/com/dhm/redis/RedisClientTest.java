package com.dhm.redis;

import com.dhm.BaseTest;
import com.dhm.common.redis.RedisCallback;
import com.dhm.common.redis.RedisClient;
import org.junit.Test;
import redis.clients.jedis.Jedis;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

public class RedisClientTest extends BaseTest {

    @Resource(name = RedisClient.SERVICE_ID)
    private RedisClient redisClient;

    @Test
    public void putObJToRedis() throws Exception {
        Map<String, Object> person = new HashMap<String, Object>();

        person.put("name", "dhm");
        person.put("age", "25");
        person.put("sex", "female");

        redisClient.excute(new RedisCallback<Object>() {

            @Override
            public Object doInRedis(Jedis jedis) {
//				String result=jedis.set("name", "dhm");
//				System.out.println("result="+result);

                String value = jedis.get("name");
                System.out.println("value=" + value);
                return null;
            }
        });
    }
}
