package top.dreamyy.hrm.dao.provider;

import org.apache.ibatis.jdbc.SQL;
import top.dreamyy.hrm.domain.User;

import java.util.Map;

import static top.dreamyy.hrm.util.common.HrmConstants.USERTABLE;

/**
 * @author 肖文吉    36750064@qq.com
 * @version V1.0
 * @Description: 用户动态SQL语句提供类
 * <br>网站：<a href="http://www.fkit.org">疯狂Java</a>
 * @date 2016年7月11日 上午11:19:23
 */
public class UserDynaSqlProvider {
    // 分页动态查询
    public String selectWhitParam(final Map<String, Object> params) {
        String sql = new SQL() {
            {
                SELECT("*");
                FROM(USERTABLE);
                if (params.get("user") != null) {
                    User user = (User) params.get("user");
                    if (user.getUsername() != null && !user.getUsername().equals("")) {
                        WHERE("  username LIKE CONCAT ('%',#{user.username},'%') ");
                    }
                    if (user.getEstatus() != null && !user.getEstatus().equals("")) {
                        WHERE(" status LIKE CONCAT ('%',#{user.status},'%') ");
                    }
                }
            }
        }.toString();

        if (params.get("pageModel") != null) {
            sql += " limit #{pageModel.firstLimitParam} , #{pageModel.pageSize}  ";
        }

        return sql;
    }

    // 动态查询总数量
    public String count(final Map<String, Object> params) {
        return new SQL() {
            {
                SELECT("count(*)");
                FROM(USERTABLE);
                if (params.get("user") != null) {
                    User user = (User) params.get("user");
                    if (user.getUsername() != null && !user.getUsername().equals("")) {
                        WHERE(" username LIKE CONCAT ('%',#{user.username},'%') ");
                    }
                    if (user.getEstatus() != null && !user.getEstatus().equals("")) {
                        WHERE(" status LIKE CONCAT ('%',#{user.status},'%') ");
                    }
                }
            }
        }.toString();
    }

    // 动态插入
    public String insertUser(final User user) {
        return new SQL() {
            {
                INSERT_INTO(USERTABLE);
                if (user.getUsername() != null && !user.getUsername().equals("")) {
                    VALUES("username", "#{username}");
                }
                if (user.getEstatus() != null && !user.getEstatus().equals("")) {
                    VALUES("estatus", "#{estatus}");
                }
                if (user.getLoginname() != null && !user.getLoginname().equals("")) {
                    VALUES("loginname", "#{loginname}");
                }
                if (user.getPassword() != null && !user.getPassword().equals("")) {
                    VALUES("password", "#{password}");
                }
            }
        }.toString();
    }

    // 动态更新
    public String updateUser(final User user) {
        return new SQL() {
            {
                UPDATE(USERTABLE);
                if (user.getUsername() != null) {
                    SET(" username = #{username} ");
                }
                if (user.getLoginname() != null) {
                    SET(" loginname = #{loginname} ");
                }
                if (user.getPassword() != null) {
                    SET(" password = #{password} ");
                }
                if (user.getEstatus() != null) {
                    SET(" estatus = #{estatus} ");
                }
                if (user.getCreateDate() != null) {
                    SET(" create_date = #{createDate} ");
                }
                WHERE(" id = #{id} ");
            }
        }.toString();
    }
}

