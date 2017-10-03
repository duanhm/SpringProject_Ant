package com.dhm.workmanagement.biz.dao;

import com.dhm.workmanagement.dto.WorkExecutorDTO;

import java.util.List;

/**
 * @author EX-DUANHONGMEI001
 */
public interface WorkManagementDAO {

    public List<WorkExecutorDTO> getWorkManagementProfile();
}
