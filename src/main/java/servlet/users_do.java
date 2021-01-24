package servlet;

import bean.User;
import dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class users_do extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method=request.getParameter("method");
        String username = request.getParameter("username");
        User user=new User();
        user.setUsername(username);
        if(method.equals("delete"))
        {
            if(UserDao.delete_user(user))
                response.getWriter().write("yes");
            else
                response.getWriter().write("no");
        }
        else if(method.equals("pause"))
        {
            int status=Integer.parseInt(request.getParameter("status"));
            if(status==0)
                status=1;
            else {
                status=0;
            }
            user.setStatus(status);
            if(UserDao.update_userstatus(user))
                response.getWriter().write(status);
            else
                response.getWriter().write("no");
        }
        else {
            response.sendRedirect("editUserInfo?username="+username);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
