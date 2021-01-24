package servlet;

import bean.Power;
import bean.User;
import dao.PowerDao;
import dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;


public class PowerManage extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String method = request.getParameter("method");
        PowerDao powerDao = new PowerDao();
        if (method.equals("power"))
        {
            ArrayList<Power> list = powerDao.getPowerList();
            request.setAttribute("list", list);
            request.getRequestDispatcher("templete/qxgl.jsp").forward(request, response);
        }
        if (method.equals("edit_power"))
        {
            int powerid = Integer.parseInt(request.getParameter("powerid"));
            String[] power = request.getParameterValues("power");
            power = power[0].split(",");
            int[] arr = new int[7];
            for (int i=0;i<power.length;i++)
            {
                arr[i] = Integer.parseInt(power[i]);
            }
            if(PowerDao.update_power(powerid,arr))
                request.setAttribute("message","权限修改成功");
            else
                request.setAttribute("message","权限修改失败");
            request.getRequestDispatcher("PowerManage?method=power").forward(request, response);
        }
        if (method.equals("role"))
        {
            ArrayList<User> list = UserDao.getAllUser();
            request.setAttribute("list", list);
            request.getRequestDispatcher("templete/jsgl.jsp").forward(request, response);
        }
        if (method.equals("edit_role"))
        {
            String username = request.getParameter("username");
            int powerid = Integer.parseInt(request.getParameter("powerid"));
            if(PowerDao.update_status(powerid,username))
                request.setAttribute("message","角色修改成功");
            else
                request.setAttribute("message","角色修改失败");
            request.getRequestDispatcher("PowerManage?method=role").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
