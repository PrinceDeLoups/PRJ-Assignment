/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class CIS {

    private int CISid;
    private Course cours;
    private Group group;
    private Instructor instruct;

    public int getCISid() {
        return CISid;
    }

    public void setCISid(int CISid) {
        this.CISid = CISid;
    }

    public Course getCours() {
        return cours;
    }

    public void setCours(Course cours) {
        this.cours = cours;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public Instructor getInstruct() {
        return instruct;
    }

    public void setInstruct(Instructor instruct) {
        this.instruct = instruct;
    }
    
}
