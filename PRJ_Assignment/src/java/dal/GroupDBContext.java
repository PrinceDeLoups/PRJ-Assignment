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
import model.Course;
import model.Group;
import model.Instructor;
import model.Student;

/**
 *
 * @author ADMIN
 */
public class GroupDBContext extends DBContext {

    @Override
    public void insert(Object model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Object model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Group> all() {
        ArrayList<Group> groups = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT g.GroupID, c.SubjectCode, i.InstructorID, s.StudentID\n"
                    + "FROM GroupStudent g INNER JOIN Course c\n"
                    + "ON g.SubjectCode = c.SubjectCode\n"
                    + "INNER JOIN Instructor i\n"
                    + "ON g.InstructorID = i.InstructorID\n"
                    + "INNER JOIN Student s\n"
                    + "ON g.StudentID = s.StudentID";
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                Group g = new Group();
                g.setGroupID(rs.getString("GroupID"));

                Course c = new Course();
                c.setSubjectCode(rs.getString("SubjectCode"));
                g.setCours(c);

                Instructor i = new Instructor();
                i.setIid(rs.getInt("InstructorID"));
                g.setInstruct(i);

                Student s = new Student();
                s.setId(rs.getString("StudentID"));
                g.setStu(s);

                groups.add(g);
            }

        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }

            try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return groups;
    }

}
