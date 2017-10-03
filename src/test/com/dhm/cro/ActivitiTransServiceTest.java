package com.dhm.cro;

import com.dhm.BaseTest;
import com.dhm.cro.biz.ActivitiTransService;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ActivitiTransServiceTest extends BaseTest {

    @Resource(name = ActivitiTransService.SERVICE_ID)
    private ActivitiTransService activitiTransService;

    @Test
    public void queryActHiTaskInst() {
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("procInstId", "995002");
        List<Map<String, Object>> actHiProcInstList = activitiTransService.queryActHiTaskInst(param);
        System.out.println("actHiProcInstList=" + actHiProcInstList);
    }

    @Test
    public void saveActHiDetailInTransaction() throws Exception {
        Map<String, Object> param = new HashMap<String, Object>();

        String procInstId = "995002";
        String executionId = "995002";
        String procDefId = "carP2pProcess:17:722525";
        String startEvent = "startEvent";
        String submitAppl = "submitAppl";
        String firstApprove = "firstApprove";
        String submitApplTaskId = "995003";
        String firstApproveTaskId = "995004";


        //1. actHiProcInst
        Map<String, Object> actHiProcInst = new HashMap<String, Object>();
        actHiProcInst.put("procInstId", procInstId);
        actHiProcInst.put("procDefId", procDefId);
        //超出数据库长度64,插入失败
        /*actHiProcInst.put("procDefId","carP2pProcess:17:722525carP2pProcess:17:722525carP2pProcess:17:722525");*/
        actHiProcInst.put("startActId", startEvent);

        //2. actHiActInstList
        List<Map<String, Object>> actHiActInstList = new ArrayList<Map<String, Object>>();
        Map<String, Object> actHiActInst = new HashMap<String, Object>();

        actHiActInst.put("procDefId", procDefId);
        //超出数据库长度64,插入失败
        /*actHiActInst.put("procDefId","carP2pProcess:17:722525carP2pProcess:17:722525carP2pProcess:17:722525");*/
        actHiActInst.put("procInstId", procInstId);
        actHiActInst.put("executionId", executionId);
        actHiActInst.put("actId", startEvent);
        actHiActInst.put("taskId", "");
        actHiActInst.put("actName", "开始");
        actHiActInst.put("actType", startEvent);
        actHiActInst.put("assignee", "");
        actHiActInst.put("duration", "16");

        actHiActInstList.add(actHiActInst);

        actHiActInst = new HashMap<String, Object>();

        actHiActInst.put("procDefId", procDefId);
        //超出数据库长度64,插入失败
        actHiActInst.put("procDefId", "carP2pProcess:17:722525carP2pProcess:17:722525carP2pProcess:17:722525");
        actHiActInst.put("procInstId", procInstId);
        actHiActInst.put("executionId", executionId);
        actHiActInst.put("actId", submitAppl);
        actHiActInst.put("taskId", submitApplTaskId);
        actHiActInst.put("actName", "申请提交");
        actHiActInst.put("actType", "userTask");
        actHiActInst.put("assignee", "000");
        actHiActInst.put("duration", "84662");

        actHiActInstList.add(actHiActInst);

        actHiActInst = new HashMap<String, Object>();

        actHiActInst.put("procDefId", procDefId);
        //超出数据库长度64,插入失败
		/*actHiActInst.put("procDefId","carP2pProcess:17:722525carP2pProcess:17:722525carP2pProcess:17:722525");*/
        actHiActInst.put("procInstId", procInstId);
        actHiActInst.put("executionId", executionId);
        actHiActInst.put("actId", firstApprove);
        actHiActInst.put("taskId", firstApproveTaskId);
        actHiActInst.put("actName", "初审/录入");
        actHiActInst.put("actType", "userTask");
        actHiActInst.put("assignee", "002");
        actHiActInst.put("duration", "224551");

        actHiActInstList.add(actHiActInst);

        //3. actHiTaskInstList
        List<Map<String, Object>> actHiTaskInstList = new ArrayList<Map<String, Object>>();
        Map<String, Object> actHiTaskInst = new HashMap<String, Object>();

        actHiTaskInst.put("id", submitApplTaskId);
        actHiTaskInst.put("procDefId", procDefId);
        //超出数据库长度64,插入失败
		/*actHiTaskInst.put("procDefId","carP2pProcess:17:722525carP2pProcess:17:722525carP2pProcess:17:722525");*/
        actHiTaskInst.put("taskDefKey", submitAppl);
        actHiTaskInst.put("procInstId", procInstId);
        actHiTaskInst.put("executionId", executionId);
        actHiTaskInst.put("name", "申请提交");
        actHiTaskInst.put("description", "进入初审/录入");
        actHiTaskInst.put("owner", "dhm");
        actHiTaskInst.put("assignee", "000");
        actHiTaskInst.put("duration", "84584");
        actHiTaskInst.put("deleteReason", "completed");
        actHiTaskInst.put("priority", "50");

        actHiTaskInstList.add(actHiTaskInst);

        actHiTaskInst = new HashMap<String, Object>();

        actHiTaskInst.put("id", firstApproveTaskId);
        actHiTaskInst.put("procDefId", procDefId);
        //超出数据库长度64,插入失败
		/*actHiTaskInst.put("procDefId","carP2pProcess:17:722525carP2pProcess:17:722525carP2pProcess:17:722525");*/
        actHiTaskInst.put("taskDefKey", firstApprove);
        actHiTaskInst.put("procInstId", procInstId);
        actHiTaskInst.put("executionId", executionId);
        actHiTaskInst.put("name", "初审/录入");
        actHiTaskInst.put("description", "拒绝");
        actHiTaskInst.put("owner", "dhm");
        actHiTaskInst.put("assignee", "002");
        actHiTaskInst.put("duration", "224407");
        actHiTaskInst.put("deleteReason", "completed");
        actHiTaskInst.put("priority", "50");

        actHiTaskInstList.add(actHiTaskInst);


        param.put("actHiProcInst", actHiProcInst);
        param.put("actHiActInstList", actHiActInstList);
        param.put("actHiTaskInstList", actHiTaskInstList);


        activitiTransService.saveActHiDetailInTransCatchException3Rollback(param);
    }
}
