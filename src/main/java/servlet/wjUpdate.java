package servlet;

import bean.Dcwj;
import dao.DcwjDao;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class wjUpdate extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        int wjid = Integer.parseInt(request.getParameter("wjid"));
        String jgmc = request.getParameter("jgmc");
        String txdz = request.getParameter("txdz");
        String dwwz = request.getParameter("dwwz");
        String szdy = request.getParameter("szdy");
        String dzyx = request.getParameter("dzyx");
        String frdb = request.getParameter("frdb");
        String yzbm = request.getParameter("yzbm");
        String lxr = request.getParameter("lxr");
        String gddh = request.getParameter("gddh");
        String yddh = request.getParameter("yddh");
        String cz = request.getParameter("cz");
        String jgsx = request.getParameter("jgsx");
        String jgjj = request.getParameter("jgjj");
        String jsxqmc = request.getParameter("jsxqmc");
        String qsxqnf = request.getParameter("qsxqnf");
        String jzxqnf = request.getParameter("jzxqnf");
        String zdkjxqgs = request.getParameter("zywt");
        String zdkjxqgs2 = request.getParameter("jsgj");
        String zdkjxqgs3 = request.getParameter("yqmb");
        String gjz1 = request.getParameter("gjz1");
        String gjz2 = request.getParameter("gjz2");
        String gjz3 = request.getParameter("gjz3");
        String gjz4 = request.getParameter("gjz4");
        String gjz5 = request.getParameter("gjz5");
        String gjz = gjz1+" "+gjz2+" "+gjz3+" "+gjz4+" "+gjz5;
        String yjlx = request.getParameter("yjlx");
        String xkfl = request.getParameter("xkfl");
        String[] arr = request.getParameterValues("xqjsssly");
        String xqjsssly = StringUtils.join(arr," ");
        String qtjsms = request.getParameter("qtjsms");
        String xqjsyyhy = request.getParameter("xqjsyyhy");
        String jsxqhzms = request.getParameter("jsxqhzms");
        String jhztz = request.getParameter("jhztz");
        Dcwj dcwj = new Dcwj();
        dcwj.setWjid(wjid);
        dcwj.setJgmc(jgmc);
        dcwj.setTxdz(txdz);
        dcwj.setSzdy(szdy);
        dcwj.setDwwz(dwwz);
        dcwj.setDzyx(dzyx);
        dcwj.setFrdb(frdb);
        dcwj.setYzbm(yzbm);
        dcwj.setLxr(lxr);
        dcwj.setGddh(gddh);
        dcwj.setYddh(yddh);
        dcwj.setCz(cz);
        dcwj.setJgsx(jgsx);
        dcwj.setJgjj(jgjj);
        dcwj.setJsxqmc(jsxqmc);
        dcwj.setQsxqnf(qsxqnf);
        dcwj.setJzxqnf(jzxqnf);
        dcwj.setZdkjxqgs(zdkjxqgs);
        dcwj.setZdkjxqgs2(zdkjxqgs2);
        dcwj.setZdkjxqgs3(zdkjxqgs3);
        dcwj.setGjz(gjz);
        dcwj.setYjlx(yjlx);
        dcwj.setXkfl(xkfl);
        dcwj.setXqjsssly(xqjsssly);
        dcwj.setQtjsms(qtjsms);
        dcwj.setXqjsyyhy(xqjsyyhy);
        dcwj.setJsxqhzms(jsxqhzms);
        dcwj.setJhztz(jhztz);
        HttpSession session = request.getSession();
        int powerid = (Integer) session.getAttribute("powerid");
        if(DcwjDao.update_dcwj(dcwj))
        {
            if (powerid==1){
                request.getRequestDispatcher("queryWjdc?type=all&message=修改成功").forward(request, response);
            }
            else{
                request.getRequestDispatcher("queryWjdc?type=user&message=修改成功").forward(request, response);
            }
        }
        else
        {
            request.getRequestDispatcher("editWjInfo?meassage=修改失败&wjid="+dcwj.getWjid()).forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
