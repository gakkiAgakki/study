package cn.haokeweiye.dao;

import cn.haokeweiye.bean.User;
import cn.haokeweiye.utils.C3p0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by HASEE on 2019/3/28.
 */
public class UserDao {
    /**
     * 根据名字查询用户名，ID，登录使用
     * @param name
     * @param pass
     * @return
     * @throws Exception
     */
    public User findUserByName(String name, String pass) throws Exception {
        /**获取连接，因为连接工厂设置的静态方法，可以指定使用类名调用方法*/
        QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());

        /**拼接sql语句*/
        String sql = "select * from user where userName= ? and password = ?";
        //执行sql语句，返回结果集
        String[] params = {name,pass};
        return queryRunner.query(sql,new BeanHandler<User>(User.class),params);
    }

    /**
     * 查询所有用户
     * @return
     * @throws Exception
     */
    public List<User> findAll() throws Exception {
        QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "select * from user";
        return queryRunner.query(sql,new BeanListHandler<User>(User.class));
    }

    /**
     * 创建用户
     * @param user
     * @return
     */
    public boolean createUser(User user) {
        QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "INSERT INTO USER(userName,PASSWORD,keyword,description,level) VALUES(?,?,?,?,?)";
        String[] params = {user.getUserName(),user.getPassword(),user.getKeyword(),user.getDescription(), String.valueOf(user.getLevel())};
        try {
            queryRunner.update(sql,params);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * 查询用户名，去重
     * @param name
     * @return
     * @throws SQLException
     */
    public User findByName(String name) throws SQLException{
        /**获取连接，因为连接工厂设置的静态方法，可以指定使用类名调用方法*/
        QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());

        /**拼接sql语句*/
        String sql = "select * from user where userName= ? ";
        //执行sql语句，返回结果集
        String[] params = {name};
        return queryRunner.query(sql,new BeanHandler<User>(User.class),params);
    }

    /**
     * 根据ID查询用户信息,用于回显
     * @param id
     * @return
     * @throws SQLException
     */
    public User findById(int id) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "SELECT * FROM USER u WHERE u.id= ? ";
        Object[] params = {id};
        return queryRunner.query(sql,new BeanHandler<User>(User.class),params);
    }

    /**
     * 修改用户信息
     * @param user1
     * @throws SQLException
     */
    public void modifyUser(User user1) throws SQLException{
        QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "UPDATE user SET userName=?,password=?,keyword=?,description=?,level=? WHERE id = ?";
        Object[] params = {user1.getUserName(),user1.getPassword(),user1.getKeyword(),user1.getDescription(),user1.getLevel(),user1.getId()};
        queryRunner.update(sql,params);
    }

    /**
     * 根据ID删除用户
     * @param id
     * @throws SQLException
     */
    public void delById(String id) throws SQLException{
        QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "DELETE FROM user WHERE id = ?";
        Object[] params = {id};
        queryRunner.update(sql,params);
    }

    /**
     * 根据ID数组批量删除用户
     * @param ids
     * @throws SQLException
     */
    public void delByIds(String[] ids) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "DELETE FROM user WHERE id = ?";

        Object[][] params = new Object[ids.length][];
        for (int i = 0; i < params.length ;i++){
            params[i] = new Object[]{ids[i]};
        }
        queryRunner.batch(sql,params);
    }

    public void modifyNotPwd(User user1) throws SQLException{
        QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "UPDATE user SET userName=?,keyword=?,description=?,level=? WHERE id = ?";
        Object[] params = {user1.getUserName(),user1.getKeyword(),user1.getDescription(),user1.getLevel(),user1.getId()};
        queryRunner.update(sql,params);
    }
}
