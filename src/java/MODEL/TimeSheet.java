/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL;

/**
 *
 * @author Yassine Klilich
 */
public class TimeSheet {
    private String fullName;
    private String companyName;
    private String hours;
    
    public TimeSheet(String fullName, String companyName, String hours) {
        this.fullName = fullName;
        this.companyName = companyName;
        this.hours = hours;
    }
    
    public String getFullName() {
        return fullName;
    }
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    
    public String getCompanyName() {
        return companyName;
    }
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }
    
    public String getHours() {
        return hours;
    }
    public void setHours(String hours) {
        this.hours = hours;
    }
}
