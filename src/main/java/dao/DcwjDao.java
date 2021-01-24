package dao;

import bean.Dcwj;
import bean.Tool;
import util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DcwjDao {

    public boolean wjdc_insert(Dcwj dcwj) {
        String sql = "insert into t_dcwjxx(sfsh,jgmc,txdz,dwwz,dzyx,frdb,yzbm,lxr,gddh,yddh,cz,jgsx,jgjj,jsxqmc,qsxqnf,jzxqnf,zdkjxqgs,zdkjxqgs2,zdkjxqgs3,gjz,yjlx,xkfl,xqjsssly,qtjsms,xqjsyyhy,jsxqhzms,jhztz,bmsfsh,username,szdy) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        Connection conn = DBUtil.getConn();
        PreparedStatement preparedStatement = null;
        boolean f = false;
        int i = 0;
        try {
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setInt(1,dcwj.getSfsh());
            preparedStatement.setString(2,dcwj.getJgmc());
            preparedStatement.setString(3,dcwj.getTxdz());
            preparedStatement.setString(4,dcwj.getDwwz());
            preparedStatement.setString(5,dcwj.getDzyx());
            preparedStatement.setString(6,dcwj.getFrdb());
            preparedStatement.setString(7,dcwj.getYzbm());
            preparedStatement.setString(8,dcwj.getLxr());
            preparedStatement.setString(9,dcwj.getGddh());
            preparedStatement.setString(10,dcwj.getYddh());
            preparedStatement.setString(11,dcwj.getCz());
            preparedStatement.setString(12,dcwj.getJgsx());
            preparedStatement.setString(13,dcwj.getJgjj());
            preparedStatement.setString(14,dcwj.getJsxqmc());
            preparedStatement.setString(15,dcwj.getQsxqnf());
            preparedStatement.setString(16,dcwj.getJzxqnf());
            preparedStatement.setString(17,dcwj.getZdkjxqgs());
            preparedStatement.setString(18,dcwj.getZdkjxqgs2());
            preparedStatement.setString(19,dcwj.getZdkjxqgs3());
            preparedStatement.setString(20,dcwj.getGjz());
            preparedStatement.setString(21,dcwj.getYjlx());
            preparedStatement.setString(22,dcwj.getXkfl());
            preparedStatement.setString(23,dcwj.getXqjsssly());
            preparedStatement.setString(24,dcwj.getQtjsms());
            preparedStatement.setString(25,dcwj.getXqjsyyhy());
            preparedStatement.setString(26,dcwj.getJsxqhzms());
            preparedStatement.setString(27,dcwj.getJhztz());
            preparedStatement.setInt(28,-1);
            preparedStatement.setString(29,dcwj.getUsername());
            preparedStatement.setString(30,dcwj.getSzdy());
            i = preparedStatement.executeUpdate();
            if (i == 1)
            {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(preparedStatement, conn);
        }
        return f;
    }

    public static ArrayList<Dcwj> getDoces(String type) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet rSet = null;
        try {
            connection = DBUtil.getConn();
            String sql;
            if(type.equals("checked"))
            {
                sql="select * from t_dcwjxx where sfsh=0 or sfsh=1 order by wjid desc";
            }
            else if(type.equals("notchecked"))
            {
                sql="select * from t_dcwjxx where sfsh=-1 order by wjid desc";
            }
            else if(type.equals("fchecked"))
            {
                sql="select * from t_dcwjxx where bmsfsh=0 or bmsfsh=1 order by wjid desc";
            }
            else if(type.equals("notfchecked"))
            {
                sql="select * from t_dcwjxx where sfsh=1 and bmsfsh=-1 order by wjid desc";
            }
            else if(type.equals("receive"))
            {
                sql="select * from t_dcwjxx where status=0 or status=2 or status=3 or status=6 or status=7 or status=-1 and deletestatus=0";
            }
            else if(type.equals("send"))
            {
                sql="select * from t_dcwjxx where status=1 or status=4 or status=5 or status=8 or status=9 or status=10 and deletestatus=0";
            }
            else if(type.equals("delete"))
            {
                sql="select * from t_dcwjxx where deletestatus=1";
            }
            else if (type.equals("all")){
                sql="select * from t_dcwjxx order by wjid desc";
            }
            else {
                sql="select * from t_dcwjxx where username='"+type+"'";
            }
            preparedStatement=connection.prepareStatement(sql);
            rSet=preparedStatement.executeQuery();
            ArrayList<Dcwj> list=new ArrayList<Dcwj>();
            while(rSet.next())
            {
                Dcwj dcwj=new Dcwj();
                dcwj.setWjid(rSet.getInt("wjid"));
                dcwj.setSfsh(rSet.getInt("sfsh"));
                dcwj.setXsscyj(rSet.getString("xsscyj"));
                dcwj.setBmsfsh(rSet.getInt("bmsfsh"));
                dcwj.setBmshyj(rSet.getString("bmshyj"));
                dcwj.setGlcs(rSet.getInt("glcs"));
                dcwj.setJgmc(rSet.getString("jgmc"));
                dcwj.setTxdz(rSet.getString("txdz"));
                dcwj.setDwwz(rSet.getString("dwwz"));
                dcwj.setDzyx(rSet.getString("dzyx"));
                dcwj.setFrdb(rSet.getString("frdb"));
                dcwj.setYzbm(rSet.getString("yzbm"));
                dcwj.setLxr(rSet.getString("lxr"));
                dcwj.setGddh(rSet.getString("gddh"));
                dcwj.setYddh(rSet.getString("yddh"));
                dcwj.setCz(rSet.getString("cz"));
                dcwj.setJgsx(rSet.getString("jgsx"));
                dcwj.setJgjj(rSet.getString("jgjj"));
                dcwj.setJsxqmc(rSet.getString("jsxqmc"));
                dcwj.setQsxqnf(rSet.getString("qsxqnf"));
                dcwj.setJzxqnf(rSet.getString("jzxqnf"));
                dcwj.setZdkjxqgs(rSet.getString("zdkjxqgs"));
                dcwj.setZdkjxqgs2(rSet.getString("zdkjxqgs2"));
                dcwj.setZdkjxqgs3(rSet.getString("zdkjxqgs3"));
                dcwj.setGjz(rSet.getString("gjz"));
                dcwj.setYjlx(rSet.getString("yjlx"));
                dcwj.setXkfl(rSet.getString("xkfl"));
                dcwj.setXqjsssly(rSet.getString("xqjsssly"));
                dcwj.setQtjsms(rSet.getString("qtjsms"));
                dcwj.setXqjsyyhy(rSet.getString("xqjsyyhy"));
                dcwj.setJsxqhzms(rSet.getString("jsxqhzms"));
                dcwj.setJhztz(rSet.getString("jhztz"));
                list.add(dcwj);
            }
            return list;
        } catch (SQLException e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        finally {
            DBUtil.close(rSet, preparedStatement, connection);
        }
        return null;
    }

    public static ArrayList<Dcwj> getDocesByCase(String type,String value) {
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet rSet=null;
        try {
            connection=DBUtil.getConn();
            String sql="";
            System.out.println(type);
            if(type.equals("title"))
            {
                sql="select * from doc_list where title='"+value+"'";
            }
            else if(type.equals("owner"))
            {
                sql="select * from doc_list where owner='"+value+"'";
            }
            else if(type.equals("receiver"))
            {
                sql="select * from doc_list where receiver='"+value+"'";
            }
            else if(type.equals("result"))
            {
                sql="select * from doc_list where result='"+value+"'";
            }
            preparedStatement=connection.prepareStatement(sql);
            rSet=preparedStatement.executeQuery();
            ArrayList<Dcwj> list=new ArrayList<Dcwj>();
            while(rSet.next())
            {
                Dcwj dcwj =new Dcwj();
                dcwj.setWjid(rSet.getInt("wjid"));
                dcwj.setSfsh(rSet.getInt("sfsh"));
                dcwj.setXsscyj(rSet.getString("xsscyj"));
                dcwj.setBmsfsh(rSet.getInt("bmsfsh"));
                dcwj.setBmshyj(rSet.getString("bmshyj"));
                dcwj.setGlcs(rSet.getInt("glcs"));
                dcwj.setJgmc(rSet.getString("jgmc"));
                dcwj.setTxdz(rSet.getString("txdz"));
                dcwj.setDwwz(rSet.getString("dwwz"));
                dcwj.setDzyx(rSet.getString("dzyx"));
                dcwj.setFrdb(rSet.getString("frdb"));
                dcwj.setYzbm(rSet.getString("yzbm"));
                dcwj.setLxr(rSet.getString("lxr"));
                dcwj.setGddh(rSet.getString("gddh"));
                dcwj.setYddh(rSet.getString("yddh"));
                dcwj.setCz(rSet.getString("cz"));
                dcwj.setJgsx(rSet.getString("jgsx"));
                dcwj.setJgjj(rSet.getString("jgjj"));
                dcwj.setJsxqmc(rSet.getString("jsxqmc"));
                dcwj.setQsxqnf(rSet.getString("qsxqnf"));
                dcwj.setJzxqnf(rSet.getString("jzxqnf"));
                dcwj.setZdkjxqgs(rSet.getString("zdkjxqgs"));
                dcwj.setZdkjxqgs2(rSet.getString("zdkjxqgs2"));
                dcwj.setZdkjxqgs3(rSet.getString("zdkjxqgs3"));
                dcwj.setGjz(rSet.getString("gjz"));
                dcwj.setYjlx(rSet.getString("yjlx"));
                dcwj.setXkfl(rSet.getString("xkfl"));
                dcwj.setXqjsssly(rSet.getString("xqjsssly"));
                dcwj.setQtjsms(rSet.getString("qtjsms"));
                dcwj.setXqjsyyhy(rSet.getString("xqjsyyhy"));
                dcwj.setJsxqhzms(rSet.getString("jsxqhzms"));
                dcwj.setJhztz(rSet.getString("jhztz"));
                list.add(dcwj);
            }
            return list;
        } catch (SQLException e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        finally {
            DBUtil.close(rSet,preparedStatement,connection);
        }
        return null;
    }

    public static Dcwj getDocById(Dcwj dcwj) {
        Connection connection=null;
        PreparedStatement preparedStatement=null;
        ResultSet rSet=null;
        try {
            connection=DBUtil.getConn();
            String sql="select * from t_dcwjxx where wjid="+dcwj.getWjid();
            preparedStatement=connection.prepareStatement(sql);
            rSet=preparedStatement.executeQuery();
            if(rSet.next())
            {
                dcwj.setWjid(rSet.getInt("wjid"));
                dcwj.setSfsh(rSet.getInt("sfsh"));
                dcwj.setXsscyj(rSet.getString("xsscyj"));
                dcwj.setBmsfsh(rSet.getInt("bmsfsh"));
                dcwj.setBmshyj(rSet.getString("bmshyj"));
                dcwj.setGlcs(rSet.getInt("glcs"));
                dcwj.setSzdy(rSet.getString("szdy"));
                dcwj.setJgmc(rSet.getString("jgmc"));
                dcwj.setTxdz(rSet.getString("txdz"));
                dcwj.setDwwz(rSet.getString("dwwz"));
                dcwj.setDzyx(rSet.getString("dzyx"));
                dcwj.setFrdb(rSet.getString("frdb"));
                dcwj.setYzbm(rSet.getString("yzbm"));
                dcwj.setLxr(rSet.getString("lxr"));
                dcwj.setGddh(rSet.getString("gddh"));
                dcwj.setYddh(rSet.getString("yddh"));
                dcwj.setCz(rSet.getString("cz"));
                dcwj.setJgsx(rSet.getString("jgsx"));
                dcwj.setJgjj(rSet.getString("jgjj"));
                dcwj.setJsxqmc(rSet.getString("jsxqmc"));
                dcwj.setQsxqnf(rSet.getString("qsxqnf"));
                dcwj.setJzxqnf(rSet.getString("jzxqnf"));
                dcwj.setZdkjxqgs(rSet.getString("zdkjxqgs"));
                dcwj.setZdkjxqgs2(rSet.getString("zdkjxqgs2"));
                dcwj.setZdkjxqgs3(rSet.getString("zdkjxqgs3"));
                dcwj.setGjz(rSet.getString("gjz"));
                dcwj.setYjlx(rSet.getString("yjlx"));
                dcwj.setXkfl(rSet.getString("xkfl"));
                dcwj.setXqjsssly(rSet.getString("xqjsssly"));
                dcwj.setQtjsms(rSet.getString("qtjsms"));
                dcwj.setXqjsyyhy(rSet.getString("xqjsyyhy"));
                dcwj.setJsxqhzms(rSet.getString("jsxqhzms"));
                dcwj.setJhztz(rSet.getString("jhztz"));
                return dcwj;
            }
        } catch (SQLException e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        finally {
            DBUtil.close(rSet,preparedStatement,connection);
        }
        return null;
    }

    public ArrayList search_user(String[] xuanze, String[] type, String[] text, String[] cipin,String username) {
        String sql = "select * from t_dcwjxx ";
        String sql_last = "where username='"+username+"'";
        for (int i=0;i<xuanze.length;i++){
            //并
            if (xuanze[i].equals("and"))
            {
                if (cipin[i].equals("="))
                {
                    sql_last+=" and "+type[i]+" = '"+text[i]+"'";
                }
                else if (cipin[i].equals("like"))
                {
                    sql_last+=" and "+type[i]+" like '%"+text[i]+"%'";
                }
            }
            //非
            else if (xuanze[i].equals("not"))
            {
                if (cipin[i].equals("="))
                {
                    sql_last+=" and not "+type[i]+" = '"+text[i]+"'";
                }
                else if (cipin[i].equals("like"))
                {
                    sql_last+=" and not "+type[i]+" like '%"+text[i]+"%'";
                }
            }
            //或
            else if (xuanze[i].equals("or"))
            {
                if (cipin[i].equals("="))
                {
                    sql_last+=" or "+type[i]+" = '"+text[i]+"'";
                }
                else if (cipin[i].equals("like"))
                {
                    sql_last+=" or "+type[i]+" like '%"+text[i]+"%'";
                }
            }
        }
        sql+=sql_last;
        System.out.println(sql);
        Connection conn = DBUtil.getConn();
        ResultSet rSet = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = conn.prepareStatement(sql);
            rSet = preparedStatement.executeQuery();
            ArrayList<Dcwj> list = new ArrayList<Dcwj>();
            while (rSet.next())
            {
                Dcwj dcwj=new Dcwj();
                dcwj.setWjid(rSet.getInt("wjid"));
                dcwj.setSfsh(rSet.getInt("sfsh"));
                dcwj.setXsscyj(rSet.getString("xsscyj"));
                dcwj.setBmsfsh(rSet.getInt("bmsfsh"));
                dcwj.setBmshyj(rSet.getString("bmshyj"));
                dcwj.setGlcs(rSet.getInt("glcs"));
                dcwj.setJgmc(rSet.getString("jgmc"));
                dcwj.setTxdz(rSet.getString("txdz"));
                dcwj.setDwwz(rSet.getString("dwwz"));
                dcwj.setDzyx(rSet.getString("dzyx"));
                dcwj.setFrdb(rSet.getString("frdb"));
                dcwj.setYzbm(rSet.getString("yzbm"));
                dcwj.setLxr(rSet.getString("lxr"));
                dcwj.setGddh(rSet.getString("gddh"));
                dcwj.setYddh(rSet.getString("yddh"));
                dcwj.setCz(rSet.getString("cz"));
                dcwj.setJgsx(rSet.getString("jgsx"));
                dcwj.setJgjj(rSet.getString("jgjj"));
                dcwj.setJsxqmc(rSet.getString("jsxqmc"));
                dcwj.setQsxqnf(rSet.getString("qsxqnf"));
                dcwj.setJzxqnf(rSet.getString("jzxqnf"));
                dcwj.setZdkjxqgs(rSet.getString("zdkjxqgs"));
                dcwj.setZdkjxqgs2(rSet.getString("zdkjxqgs2"));
                dcwj.setZdkjxqgs3(rSet.getString("zdkjxqgs3"));
                dcwj.setGjz(rSet.getString("gjz"));
                dcwj.setYjlx(rSet.getString("yjlx"));
                dcwj.setXkfl(rSet.getString("xkfl"));
                dcwj.setXqjsssly(rSet.getString("xqjsssly"));
                dcwj.setQtjsms(rSet.getString("qtjsms"));
                dcwj.setXqjsyyhy(rSet.getString("xqjsyyhy"));
                dcwj.setJsxqhzms(rSet.getString("jsxqhzms"));
                dcwj.setJhztz(rSet.getString("jhztz"));
                list.add(dcwj);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rSet,preparedStatement,conn);
        }
        return null;
    }

    public ArrayList search(String[] xuanze, String[] type, String[] text, String[] cipin) {
        String sql = "select * from t_dcwjxx ";
        String sql_last = "where";
        for (int i=0;i<xuanze.length;i++){
            //并
            if (xuanze[i].equals("and"))
            {
                //如果第一个不加and
                if (i==0)
                {
                    if (cipin[i].equals("="))
                    {
                        sql_last+=" "+type[i]+" = '"+text[i]+"'";
                    }
                    else if (cipin[i].equals("like"))
                    {
                        sql_last+=" "+type[i]+" like '%"+text[i]+"%'";
                    }
                }
                //其他加and
                else
                {
                    if (cipin[i].equals("="))
                    {
                        sql_last+=" and "+type[i]+" = '"+text[i]+"'";
                    }
                    else if (cipin[i].equals("like"))
                    {
                        sql_last+=" and "+type[i]+" like '%"+text[i]+"%'";
                    }
                }
            }
            //非
            else if (xuanze[i].equals("not"))
            {
                //如果第一个不加and
                if (i==0)
                {
                    if (cipin[i].equals("="))
                    {
                        sql_last+=" not "+type[i]+"  = '"+text[i]+"'";
                    }
                    else if (cipin[i].equals("like"))
                    {
                        sql_last+=" not "+type[i]+" like '%"+text[i]+"%'";
                    }
                }
                //其他加and
                else
                {
                    if (cipin[i].equals("="))
                    {
                        sql_last+=" and not "+type[i]+" = '"+text[i]+"'";
                    }
                    else if (cipin[i].equals("like"))
                    {
                        sql_last+=" and not "+type[i]+" like '%"+text[i]+"%'";
                    }
                }
            }
            //或
            else if (xuanze[i].equals("or"))
            {
                if (cipin[i].equals("="))
                {
                    sql_last+=" or "+type[i]+" = '"+text[i]+"'";
                }
                else if (cipin[i].equals("like"))
                {
                    sql_last+=" or "+type[i]+" like '%"+text[i]+"%'";
                }
            }
        }
        sql+=sql_last;
        System.out.println(sql);
        Connection conn = DBUtil.getConn();
        ResultSet rSet = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = conn.prepareStatement(sql);
            rSet = preparedStatement.executeQuery();
            ArrayList<Dcwj> list = new ArrayList<Dcwj>();
            while (rSet.next())
            {
                Dcwj dcwj=new Dcwj();
                dcwj.setWjid(rSet.getInt("wjid"));
                dcwj.setSfsh(rSet.getInt("sfsh"));
                dcwj.setXsscyj(rSet.getString("xsscyj"));
                dcwj.setBmsfsh(rSet.getInt("bmsfsh"));
                dcwj.setBmshyj(rSet.getString("bmshyj"));
                dcwj.setGlcs(rSet.getInt("glcs"));
                dcwj.setJgmc(rSet.getString("jgmc"));
                dcwj.setTxdz(rSet.getString("txdz"));
                dcwj.setDwwz(rSet.getString("dwwz"));
                dcwj.setDzyx(rSet.getString("dzyx"));
                dcwj.setFrdb(rSet.getString("frdb"));
                dcwj.setYzbm(rSet.getString("yzbm"));
                dcwj.setLxr(rSet.getString("lxr"));
                dcwj.setGddh(rSet.getString("gddh"));
                dcwj.setYddh(rSet.getString("yddh"));
                dcwj.setCz(rSet.getString("cz"));
                dcwj.setJgsx(rSet.getString("jgsx"));
                dcwj.setJgjj(rSet.getString("jgjj"));
                dcwj.setJsxqmc(rSet.getString("jsxqmc"));
                dcwj.setQsxqnf(rSet.getString("qsxqnf"));
                dcwj.setJzxqnf(rSet.getString("jzxqnf"));
                dcwj.setZdkjxqgs(rSet.getString("zdkjxqgs"));
                dcwj.setZdkjxqgs2(rSet.getString("zdkjxqgs2"));
                dcwj.setZdkjxqgs3(rSet.getString("zdkjxqgs3"));
                dcwj.setGjz(rSet.getString("gjz"));
                dcwj.setYjlx(rSet.getString("yjlx"));
                dcwj.setXkfl(rSet.getString("xkfl"));
                dcwj.setXqjsssly(rSet.getString("xqjsssly"));
                dcwj.setQtjsms(rSet.getString("qtjsms"));
                dcwj.setXqjsyyhy(rSet.getString("xqjsyyhy"));
                dcwj.setJsxqhzms(rSet.getString("jsxqhzms"));
                dcwj.setJhztz(rSet.getString("jhztz"));
                list.add(dcwj);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rSet,preparedStatement,conn);
        }
        return null;
    }

    public String search1(String[] xuanze, String[] type, String[] text, String[] cipin) {
        String sql_last = "where";
        for (int i=0;i<xuanze.length;i++){
            //并
            if (xuanze[i].equals("and"))
            {
                //如果第一个不加and
                if (i==0)
                {
                    if (cipin[i].equals("="))
                    {
                        sql_last+=" "+type[i]+" = '"+text[i]+"'";
                    }
                    else if (cipin[i].equals("like"))
                    {
                        sql_last+=" "+type[i]+" like '%"+text[i]+"%'";
                    }
                }
                //其他加and
                else
                {
                    if (cipin[i].equals("="))
                    {
                        sql_last+=" and "+type[i]+" = '"+text[i]+"'";
                    }
                    else if (cipin[i].equals("like"))
                    {
                        sql_last+=" and "+type[i]+" like '%"+text[i]+"%'";
                    }
                }
            }
            //非
            else if (xuanze[i].equals("not"))
            {
                //如果第一个不加and
                if (i==0)
                {
                    if (cipin[i].equals("="))
                    {
                        sql_last+=" not "+type[i]+"  = '"+text[i]+"'";
                    }
                    else if (cipin[i].equals("like"))
                    {
                        sql_last+=" not "+type[i]+" like '%"+text[i]+"%'";
                    }
                }
                //其他加and
                else
                {
                    if (cipin[i].equals("="))
                    {
                        sql_last+=" and not "+type[i]+" = '"+text[i]+"'";
                    }
                    else if (cipin[i].equals("like"))
                    {
                        sql_last+=" and not "+type[i]+" like '%"+text[i]+"%'";
                    }
                }
            }
            //或
            else if (xuanze[i].equals("or"))
            {
                if (cipin[i].equals("="))
                {
                    sql_last+=" or "+type[i]+" = '"+text[i]+"'";
                }
                else if (cipin[i].equals("like"))
                {
                    sql_last+=" or "+type[i]+" like '%"+text[i]+"%'";
                }
            }
        }
        return sql_last;
    }

    public static boolean delete_wj(int wjid) {
        Connection con=null;
        PreparedStatement pstmt=null;
        try {
            con=DBUtil.getConn();
            String sql="delete from t_dcwjxx where wjid = "+wjid;
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

    public static boolean update_dcwj(Dcwj dcwj) {
        Connection con=null;
        PreparedStatement pstmt=null;
        try {
            con=DBUtil.getConn();
            String sql="update t_dcwjxx set jgmc=?,txdz=?,dwwz=?,dzyx=?,frdb=?,yzbm=?,lxr=?,gddh=?,yddh=?,cz=?,jgsx=?,jgjj=?,jsxqmc=?,qsxqnf=?,jzxqnf=?,zdkjxqgs=?,zdkjxqgs2=?,zdkjxqgs3=?,gjz=?,yjlx=?,xkfl=?,xqjsssly=?,qtjsms=?,xqjsyyhy=?,jsxqhzms=?,jhztz=?,glcs=?,szdy=? where wjid = "+dcwj.getWjid();
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1,dcwj.getJgmc());
            pstmt.setString(2,dcwj.getTxdz());
            pstmt.setString(3,dcwj.getDwwz());
            pstmt.setString(4,dcwj.getDzyx());
            pstmt.setString(5,dcwj.getFrdb());
            pstmt.setString(6,dcwj.getYzbm());
            pstmt.setString(7,dcwj.getLxr());
            pstmt.setString(8,dcwj.getGddh());
            pstmt.setString(9,dcwj.getYddh());
            pstmt.setString(10,dcwj.getCz());
            pstmt.setString(11,dcwj.getJgsx());
            pstmt.setString(12,dcwj.getJgjj());
            pstmt.setString(13,dcwj.getJsxqmc());
            pstmt.setString(14,dcwj.getQsxqnf());
            pstmt.setString(15,dcwj.getJzxqnf());
            pstmt.setString(16,dcwj.getZdkjxqgs());
            pstmt.setString(17,dcwj.getZdkjxqgs2());
            pstmt.setString(18,dcwj.getZdkjxqgs3());
            pstmt.setString(19,dcwj.getGjz());
            pstmt.setString(20,dcwj.getYjlx());
            pstmt.setString(21,dcwj.getXkfl());
            pstmt.setString(22,dcwj.getXqjsssly());
            pstmt.setString(23,dcwj.getQtjsms());
            pstmt.setString(24,dcwj.getXqjsyyhy());
            pstmt.setString(25,dcwj.getJsxqhzms());
            pstmt.setString(26,dcwj.getJhztz());
            pstmt.setInt(27,dcwj.getGlcs());
            pstmt.setString(28,dcwj.getSzdy());
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

    public boolean check(int wjid, String suggest, int result) {
        Connection con=null;
        PreparedStatement pstmt=null;
        try {
            con=DBUtil.getConn();
            String sql="update t_dcwjxx set sfsh = "+result+",xsscyj = '"+suggest+"' where wjid = "+wjid;
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

    public boolean fcheck(int wjid, String suggest, int result) {
        Connection con=null;
        PreparedStatement pstmt=null;
        try {
            con=DBUtil.getConn();
            String sql="update t_dcwjxx set bmsfsh = "+result+",bmshyj = '"+suggest+"' where wjid = "+wjid;
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

    public static ArrayList<Tool> listAll(String type,String sql_last) {
        ArrayList<Tool> list = new ArrayList<Tool>();
        Connection conn=DBUtil.getConn();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        //String sql="select szdy,count(szdy)as num from t_dcwjxx group by szdy";
        String sql="select "+ type +",count("+type+")as num from t_dcwjxx "+sql_last+" group by "+type;
        System.out.println(sql);
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                if (rs.getString(type)!=null)
                {
                    Tool tool = new Tool();
                    tool.setName(rs.getString(type));
                    tool.setValue(rs.getInt("num"));
                    list.add(tool);
                }
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

}
