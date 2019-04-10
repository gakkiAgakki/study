package cn.haokeweiye.dao;

import cn.haokeweiye.bean.Message;
import cn.haokeweiye.utils.C3p0Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by HASEE on 2019/3/25.
 */
public class MessageDao extends SQLException {
    //添加留言板信息
    public boolean addInfo(Message ms) {
        QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());

        String sql = "INSERT INTO messagess(title,NAME,telephone,mail,unit,site,content,category,accessory) VALUES(?,?,?,?,?,?,?,?,?)";
        Object[] params = {ms.gettitle(), ms.getname(), ms.gettelephone(), ms.getmail(), ms.getunit(), ms.getsite(), ms.getcontent(),ms.getcategory(),ms.getaccessory()};
        try {
            queryRunner.update(sql,params);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    //查询全部留言
    public List<Message> findAll() throws SQLException {
        QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "SELECT * FROM messagess";
        return queryRunner.query(sql,new BeanListHandler<Message>(Message.class));
    }
    /**
     * 根据ID删除留言
     */
    public void delById(String id) throws SQLException{
        QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "DELETE FROM messagess WHERE id = ?";
        Object[] params = {id};
        queryRunner.update(sql,params);
    }
    /**
     * 根据ID查询留言用于修改前的回显
     */
    public Message findById(int id) throws SQLException{
        QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
//        String sql = "SELECT m.id,m.title,m.name,m.telephone,m.mail,m.unit,m.site,m.content FROM messagess m WHERE m.id = ?";
        String sql = "SELECT * FROM messagess m WHERE m.id = ?";
        Object[] params = {id};
        return queryRunner.query(sql,new BeanHandler<Message>(Message.class),params);
    }
    /**
     * 修改留言
     */
    public void modifyMsg(Message msg) throws SQLException{
        QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "UPDATE messagess SET title =?,NAME=?,telephone=?,mail=?,unit=?,site=?,content=? WHERE id=?";
        Object[] params = {msg.gettitle(), msg.getname(), msg.gettelephone(), msg.getmail(), msg.getunit(), msg.getsite(), msg.getcontent(), msg.getid()};
        queryRunner.update(sql,params);
    }

    /**
     * 根据ID数组删除多条留言
     * @param ids
     * @throws SQLException
     */
    public void delByIds(String[] ids) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "DELETE FROM messagess WHERE id = ?";

        Object[][] params = new Object[ids.length][];
        for (int i = 0; i < params.length ;i++){
            params[i] = new Object[]{ids[i]};
        }
        queryRunner.batch(sql,params);
    }

    /**
     * 根据category查询数据属于哪个类别的
     * @param category
     * @return
     */
    public List<Message> findByCategory(String category) throws SQLException{
        QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "SELECT * FROM messagess WHERE category LIKE ?;";
        Object[] params = {category};

        return queryRunner.query(sql,new  BeanListHandler<Message>(Message.class),params);
    }

    /**
     * 分页查询留言
     */
    public List<Message> findByPage(int start) throws SQLException{
        QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "SELECT * FROM messagess LIMIT ?,?";
        Object[] params = {start,10};
        return queryRunner.query(sql,new BeanListHandler<Message>(Message.class),params);
    }
    /**
     * 查询总条数，用于配合分页获得页码数
     */
    public int getCount() throws SQLException{
        QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
        //查询出的是long类型的
        String sql = "SELECT COUNT(*) FROM messagess";
        long obj =(long) queryRunner.query(sql, new ScalarHandler());
        int count = (int) obj;
        return count;
    }
    /**
     * 根据条件分页查询
     */
    public List<Message> findCategoryByPage(String category, int start) throws SQLException{
        QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "SELECT * FROM messagess WHERE category LIKE ? LIMIT ?,?";
        Object[] params = {category, start,10};
        return queryRunner.query(sql,new BeanListHandler<Message>(Message.class),params);
    }
    /**
     * 根据条件查询总条数，用于配合分页获得页码数
     */
    public int getCategoryByCount(String category) throws SQLException{
        QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
        //查询出的是long类型的
        String sql = "SELECT COUNT(*) FROM messagess WHERE category LIKE ?";
        Object[] params = {category};
        long obj =(long) queryRunner.query(sql, new ScalarHandler(),params);
        int count = (int) obj;
        return count;
    }

    public void replyMsg(Message ms) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "UPDATE messagess SET reply = ?,replier = ?,state = ? WHERE id=?";
        Object[] params = {ms.getReply(),ms.getReplier(),ms.getState(),ms.getid()};
        queryRunner.update(sql,params);
    }

    public void replyState(Message ms) throws SQLException{
        QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "UPDATE messagess SET state = ? WHERE id = ?";
        Object[] params = {ms.getState(),ms.getid()};
        queryRunner.update(sql,params);
    }

    public Message getState(String id) throws SQLException{
        QueryRunner queryRunner = new QueryRunner(C3p0Utils.getDataSource());
        String sql = "SELECT m.state FROM messagess m WHERE m.id = ?";
        Object[] params = {id};
        return queryRunner.query(sql,new BeanHandler<Message>(Message.class),params);

    }
}
