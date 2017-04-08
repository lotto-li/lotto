package com.lotto.services;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import com.lotto.domain.SysUser;

/** 
* @author Hydra
* @version 创建时间:2017年4月9日 上午1:10:27 
* @Description 
*/
@Service
public interface SysUserService extends JpaRepository<SysUser, Long> {

    SysUser findByUsername(String username);
    
    SysUser findByUsernameAndPassword(String username, String password);
    
}
