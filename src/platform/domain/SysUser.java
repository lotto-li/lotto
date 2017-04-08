package platform.domain;

/** 
* @author Hydra
* @version 创建时间:2017年4月4日 下午11:48:44 
* @Description 系统用户的实体。
*/
public class SysUser {

    private Long id;
    private String username;
    private String userpwd;
    
    public SysUser(Long id, String username, String userpwd) {
        this.id = id;
        this.username = username;
        this.userpwd = userpwd;
    }
    
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getUserpwd() {
        return userpwd;
    }
    public void setUserpwd(String userpwd) {
        this.userpwd = userpwd;
    }
    
}
