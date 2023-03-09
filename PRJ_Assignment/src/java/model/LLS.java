/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class LLS {
    
    private int LLSid;
    private int lessonNum;
    private String lessonName;
    private CIS cis;
    private Room room;
    private TimeSlot slot;

    public int getLessonNum() {
        return lessonNum;
    }

    public void setLessonNum(int lessonNum) {
        this.lessonNum = lessonNum;
    }

    public String getLessonName() {
        return lessonName;
    }

    public void setLessonName(String lessonName) {
        this.lessonName = lessonName;
    }
    
    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public TimeSlot getSlot() {
        return slot;
    }

    public void setSlot(TimeSlot slot) {
        this.slot = slot;
    }

    public int getLLSid() {
        return LLSid;
    }

    public void setLLSid(int LLSid) {
        this.LLSid = LLSid;
    }

    public CIS getCis() {
        return cis;
    }

    public void setCis(CIS cis) {
        this.cis = cis;
    }
    
    

}
