package dao;

import bean.Power;
import bean.User;
import util.DBUtil;

import java.sql.*;
import java.util.ArrayList;

public class UserDao {

    public static boolean addUser(User user) {
        boolean b=false;
        String sql="insert into user (username,password,name,sfzh,txdz,yzbm,gddh,yddh,dzxx,powerid,jgmc,status) values('"+
                user.getUsername() + "','" +  user.getPassword()  + "','" +  user.getName() + "','" +  user.getSfzh() + "','"+ user.getTxdz() + "','" +  user.getYzbm() + "','" +user.getGddh() + "','" +  user.getYddh() + "','"+user.getDzxx()  + "','" +4+ "','" +  user.getJgmc()+"','"+0+"')";
        Connection conn= DBUtil.getConn();
        Statement state=null;
        try {
            state=conn.createStatement();
            int n=state.executeUpdate(sql);
            if(n!=0) {
                b=true;
            }
        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(state, conn);
        }
        return b;
    }

    public static ArrayList<User> getAllUser() {
        // TODO Auto-generated method stub
        String sql = "select * from user where not powerid=1";
        Connection conn = DBUtil.getConn();
        ResultSet rs = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = conn.prepareStatement(sql);
            rs = preparedStatement.executeQuery();
            ArrayList<User> list = new ArrayList<User>();
            while (rs.next())
            {
                User user=new User();
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setName(rs.getString("name"));
                user.setSfzh(rs.getString("sfzh"));
                user.setTxdz(rs.getString("txdz"));
                user.setYzbm(rs.getString("yzbm"));
                user.setGddh(rs.getString("gddh"));
                user.setYddh(rs.getString("yddh"));
                user.setDzxx(rs.getString("dzxx"));
                user.setPowerid(rs.getInt("powerid"));
                list.add(user);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs,preparedStatement,conn);
        }
        return null;
    }

    public boolean login(String username,String password) {
        // TODO Auto-generated method stub
        String sql = "select * from user where username ='" + username + "' and status = 0";
        Connection conn = DBUtil.getConn();
        Statement state = null;
        ResultSet rs = null;
        boolean b=false;
        try {
            state = conn.createStatement();
            rs = state.executeQuery(sql);
            while (rs.next()) {
                if(password.equals(rs.getString("password"))) {
                    b=true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, state, conn);
        }
        return b;
    }

    public User getUserInfo(String username) {
        // TODO Auto-generated method stub
        ArrayList<Power> list = new ArrayList<Power>();
        Connection conn= DBUtil.getConn();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql="select * from user where username = ?";
        User user = new User();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                user.setName(rs.getString("name"));
                user.setJgmc(rs.getString("jgmc"));
                user.setTxdz(rs.getString("txdz"));
                user.setSfzh(rs.getString("sfzh"));
                user.setGddh(rs.getString("gddh"));
                user.setYddh(rs.getString("yddh"));
                user.setDzxx(rs.getString("dzxx"));
                user.setYzbm(rs.getString("yzbm"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return user;
    }

    public static boolean delete_user(User user) {
        Connection con=null;
        PreparedStatement pstmt=null;
        try {
            con=DBUtil.getConn();
            String sql="delete from user where username = '"+user.getUsername()+"'";
            System.out.println(sql);
            pstmt=con.prepareStatement(sql);
            pstmt.executeUpdate();
            return true;
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        finally {
            DBUtil.close(pstmt,con);
        }
        return false;
    }

    public static boolean update_userstatus(User user) {
        Connection con=null;
        PreparedStatement pstmt=null;
        try {
            con=DBUtil.getConn();
            String sql="update user set status = ? where username = ?";
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1, user.getStatus());
            pstmt.setString(2, user.getUsername());
            pstmt.executeUpdate();
            return true;
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        finally {
            DBUtil.close(pstmt,con);
        }
        return false;
    }

    public static User getUserByUsername(User user) {
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet rs=null;
        String sql="select * from user where username ='"+user.getUsername()+"'";
        try {
            connection=DBUtil.getConn();
            preparedStatement=connection.prepareStatement(sql);
            rs=preparedStatement.executeQuery();
            User user1=new User();
            if(rs.next())
            {
                user1.setUsername(rs.getString("username"));
                user1.setPassword(rs.getString("password"));
                user1.setName(rs.getString("name"));
                user1.setSfzh(rs.getString("sfzh"));
                user1.setTxdz(rs.getString("txdz"));
                user1.setYzbm(rs.getString("yzbm"));
                user1.setGddh(rs.getString("gddh"));
                user1.setYddh(rs.getString("yddh"));
                user1.setDzxx(rs.getString("dzxx"));
                user1.setPowerid(rs.getInt("powerid"));
            }
            return user1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBUtil.close(preparedStatement,connection);
        }
        return null;
    }

    public static boolean update_user(User user) {
        Connection con=null;
        PreparedStatement pstmt=null;
        try {
            con=DBUtil.getConn();
            String sql="update user set sfzh=?,name=?,txdz=?,yzbm=?,gddh=?,yddh=?,dzxx=? where username = '"+user.getUsername()+"'";
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1, user.getSfzh());
            pstmt.setString(2, user.getName());
            pstmt.setString(3, user.getTxdz());
            pstmt.setString(4, user.getYzbm());
            pstmt.setString(5, user.getGddh());
            pstmt.setString(6, user.getYddh());
            pstmt.setString(7, user.getDzxx());
            System.out.println(pstmt);
            pstmt.executeUpdate();
            return true;
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        finally {
            DBUtil.close(pstmt,con);
        }
        return false;
    }

    public boolean xgmm(String username, String password) {
        Connection con=null;
        PreparedStatement pstmt=null;
        try {
            con=DBUtil.getConn();
            String sql="update user set password=? where username = ?";
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1, password);
            pstmt.setString(2, username);
            pstmt.executeUpdate();
            return true;
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        finally {
            DBUtil.close(pstmt,con);
        }
        return false;
    }
}
