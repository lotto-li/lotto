package com.lotto.services;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import com.lotto.domain.SysUser;

/** 
* @author lotto
* @version 创建时间:2017年4月9日 上午1:10:27 
* @Description 
*/
@Service
public interface SysUserService extends JpaRepository<SysUser, Long> {

    SysUser findByUsername(String username);
    
    SysUser findByUsernameAndPassword(String username, String password);
    
    @Query("select n from SysUser n where username like %:username%")
    List<SysUser> findByUsernameLike(@Param("username") String username);
    
}
