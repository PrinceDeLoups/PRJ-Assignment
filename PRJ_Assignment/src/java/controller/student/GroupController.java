/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.student;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class GroupController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                processRequest(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                processRequest(request, response);

    }
    
      private void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        DBContext<Student> db = new StudentDBContext();
//        ArrayList<Student> students = db.all();
//        req.setAttribute("students", students);
//
//        DBContext<Department> db1 = new DeptDBContext();
//        ArrayList<Department> depts = db1.all();
//        req.setAttribute("depts", depts);
        req.getRequestDispatcher("../view/student/group.jsp").forward(req, resp);
    }

}
