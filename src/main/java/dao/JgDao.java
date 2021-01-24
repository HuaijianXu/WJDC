package dao;

import bean.Jg;
import bean.Power;
import bean.User;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class JgDao {
    public static boolean addJg(String gzdw) {
        boolean b=false;
        String sql="insert into t_jgsxbm(jgmc) values('"+ gzdw +"')";
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

}
