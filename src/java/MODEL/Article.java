
package MODEL;
public class Article  implements java.io.Serializable {
     private int code;
     private String designation;
     private Float prix;
    public Article() {    }

    public Article(int code) {        this.code = code;
    }
    public Article(int code, String designation, Float prix) {
       this.code = code;
       this.designation = designation;
       this.prix = prix;
    }
   
    public int getCode() {  return this.code;    }
    
    public void setCode(int code) {        this.code = code;    }
    public String getDesignation() {        return this.designation;    }
    
    public void setDesignation(String designation) {
        this.designation = designation;
    }
    public Float getPrix() {        return this.prix;    }
    
    public void setPrix(Float prix) {        this.prix = prix;    }
}


