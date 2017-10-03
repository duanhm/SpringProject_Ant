package com.dhm;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml") 
/*@TransactionConfiguration(transactionManager = "txManager",defaultRollback = false)
@Transactional*/
public class BaseTest {
}
