package dao;

import bean.Power;
import bean.User;
import util.DBUtil;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class PowerDao {

    public int getPowerID(String username) {
        // TODO Auto-generated method stub
        Connection conn= DBUtil.getConn();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int id = 0;
        String sql="select powerid from user where username = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                id = rs.getInt("powerid");
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
        return id;
    }

    public List<Power> getPower(int powerid) {
        // TODO Auto-generated method stub
        ArrayList<Power> list = new ArrayList<Power>();
        Connection conn= DBUtil.getConn();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql="select * from t_power where powerid = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, powerid);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Power power = new Power();
                power.setPower(rs.getInt("power"));
                power.setXqzj_qx(rs.getInt("xqzj_qx"));
                power.setXqgl_qx(rs.getInt("xqgl_qx"));
                power.setYhxx_qx(rs.getInt("yhxx_qx"));
                power.setYhxg_qx(rs.getInt("yhxg_qx"));
                power.setXssh_qx(rs.getInt("xssh_qx"));
                power.setBmsh_qx(rs.getInt("bmsh_qx"));
                power.setTjcx_qx(rs.getInt("tjcx_qx"));
                list.add(power);
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
        return list;
    }

    public static ArrayList<Power> getPowerList() {
        // TODO Auto-generated method stub
        String sql = "select * from t_power where power = 0";
        Connection conn = DBUtil.getConn();
        ResultSet rs = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = conn.prepareStatement(sql);
            rs = preparedStatement.executeQuery();
            ArrayList<Power> list = new ArrayList<Power>();
            while (rs.next())
            {
                Power power = new Power();
                power.setPowerid(rs.getInt("powerid"));
                power.setPower(rs.getInt("power"));
                power.setXqzj_qx(rs.getInt("xqzj_qx"));
                power.setXqgl_qx(rs.getInt("xqgl_qx"));
                power.setYhxx_qx(rs.getInt("yhxx_qx"));
                power.setYhxg_qx(rs.getInt("yhxg_qx"));
                power.setXssh_qx(rs.getInt("xssh_qx"));
                power.setBmsh_qx(rs.getInt("bmsh_qx"));
                power.setTjcx_qx(rs.getInt("tjcx_qx"));
                power.setStatus(rs.getString("status"));
                list.add(power);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs,preparedStatement,conn);
        }
        return null;
    }

    public static boolean update_status(int powerid,String username) {
        Connection con=null;
        PreparedStatement pstmt=null;
        try {
            con=DBUtil.getConn();
            String sql="update user set powerid = ? where username = ?";
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1, powerid);
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

    public static boolean update_power(int powerid, int[] power) {
        Connection con=null;
        PreparedStatement pstmt=null;
        try {
            con=DBUtil.getConn();
            String sql="update t_power set xqzj_qx=?,xqgl_qx=?,yhxx_qx=?,yhxg_qx=?,xssh_qx=?,bmsh_qx=?,tjcx_qx=? where powerid = ?";
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1, power[0]);
            pstmt.setInt(2, power[1]);
            pstmt.setInt(3, power[2]);
            pstmt.setInt(4, power[3]);
            pstmt.setInt(5, power[4]);
            pstmt.setInt(6, power[5]);
            pstmt.setInt(7, power[6]);
            pstmt.setInt(8, powerid);
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
}
