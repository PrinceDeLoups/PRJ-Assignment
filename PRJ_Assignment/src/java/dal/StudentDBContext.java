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
import model.Group;
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
            String sql = "INSERT INTO Student([StudentID],[StudentName],[Img],[Email],[Contact],[Gender],[Dob],) VALUES(?,?,?,?,?,?,?)";
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

    @Override
    public ArrayList<Student> all() {
        ArrayList<Student> students = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT StudentID, StudentName, Img, Email, Contact, Gender, Dob, GroupName FROM Student";
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
                Group g = new Group();
                g.setGroupName(rs.getString("GroupName"));
                s.setGroup(g);
                students.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }

            try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return students;
    }

    public ArrayList<Student> search(int course, int sclass) {
        ArrayList<Student> students = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT s.StudentID, s.StudentName, s.Img, s.Email, s.Contact, s.Gender, s.Dob, s.GroupID, g.GroupName\n"
                    + "FROM Student s FULL JOIN [Group] g\n"
                    + "ON s.GroupID = g.GroupID\n"
                    + "FULL JOIN CIS c\n"
                    + "ON c.GroupID = g.GroupID\n"
                    + "WHERE c.GroupID = ?\n"
                    + "AND c.SubjectID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, sclass);
            stm.setInt(2, course);
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
                
                Group g = new Group();
                g.setGroupID(rs.getInt("GroupID"));
                g.setGroupName(rs.getString("GroupName"));
                s.setGroup(g);

                students.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }

            try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return students;
    }
}
