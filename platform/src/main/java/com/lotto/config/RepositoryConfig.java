package com.lotto.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurer;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurerAdapter;

import com.lotto.domain.Issue;
import com.lotto.domain.IssueRecord;
import com.lotto.domain.Notice;
import com.lotto.domain.Team;

/** 
* @author Hydra
* @version 创建时间:2017年4月9日 下午2:35:47 
* @Description 
*/
@Configuration
class SpringDataRestConfig {
    @Bean
    public RepositoryRestConfigurer repositoryRestConfigurer() {

        return new RepositoryRestConfigurerAdapter() {
            @Override
            public void configureRepositoryRestConfiguration(
                                 RepositoryRestConfiguration config) {
                config.exposeIdsFor(Notice.class, Team.class, Issue.class, IssueRecord.class);
            }
        };
    }
}
