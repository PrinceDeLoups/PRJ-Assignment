/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Student;

/**
 *
 * @author sonnt
 */
public class StudentDBContext extends DBContext<Student> {

    @Override
    public void insert(Student model) {
        PreparedStatement stm = null;
        try {
            String sql = "INSERT INTO Student([StudentID],[StudentName],[Img],[Email],[Contact],[Gender],[Dob]) VALUES(?,?,?,?,?,?,?)";
            stm = connection.prepareStatement(sql);
            stm.setString(1, model.getId());
            stm.setString(2, model.getName());
            stm.setString(3, model.getImg());
            stm.setString(4, model.getEmail());
            stm.setInt(5, model.getContact());
            stm.setBoolean(6, model.isGender());
            stm.setDate(7, model.getDob());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    @Override
    public void delete(Student model) {
        PreparedStatement stm = null;
        try {
            String sql = "DELETE Student WHERE [StudentID] = ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, model.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

//    @Override
//    public Student get(int id) {
//        PreparedStatement stm = null;
//        ResultSet rs = null;
//        try {
//            String sql = "SELECT s.[sid],s.sname,s.gender,s.dob,d.did,d.dname FROM Student s\n"
//                    + "			INNER JOIN Department d\n"
//                    + "			ON s.did = d.did WHERE s.[sid] = ?";
//            stm = connection.prepareStatement(sql);
//            stm.setInt(1, id);
//            rs = stm.executeQuery();
//            if (rs.next()) {
//                Student s = new Student();
//                Department d = new Department();
//
//                s.setId(rs.getInt("sid"));
//                s.setName(rs.getString("sname"));
//                s.setGender(rs.getBoolean("gender"));
//                s.setDob(rs.getDate("dob"));
//                d.setId(rs.getInt("did"));
//                d.setName(rs.getString("dname"));
//
//                s.setDept(d);
//                return s;
//            }
//
//        } catch (SQLException ex) {
//            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
//        } finally {
//            try {
//                rs.close();
//                stm.close();
//                connection.close();
//            } catch (SQLException ex) {
//                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }
//        return null;
//    }
//
    @Override
    public ArrayList<Student> all() {
        ArrayList<Student> students = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT [StudentID], [StudentName], [Img], [Email], [Contact], [Gender], [Dob] FROM Student s\n";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getString("StudentID"));
                s.setName(rs.getString("StudentName"));
                s.setImg(rs.getString("Img"));
                s.setEmail(rs.getString("Email"));
                s.setContact(rs.getInt("Contact"));
                s.setGender(rs.getBoolean("Gender"));
                s.setDob(rs.getDate("Dob"));

                students.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
                stm.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return students;
    }
}
