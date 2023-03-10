package entity;

public class User {
    int u_id;
    String u_name;

    public User(String username, String phone, String email, String password) {
        this.u_name=username;
        this.u_password=password;
        this.u_telephone =phone;
        this.u_email =email;
    }
    public User(){

    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public String getU_name() {
        return u_name;
    }

    public void setU_name(String u_name) {
        this.u_name = u_name;
    }

    public String getU_password() {
        return u_password;
    }

    public void setU_password(String u_password) {
        this.u_password = u_password;
    }

    public String getU_telephone() {
        return u_telephone;
    }

    public void setU_telephone(String u_telephone) {
        this.u_telephone = u_telephone;
    }

    public String getU_email() {
        return u_email;
    }

    public void setU_email(String u_email) {
        this.u_email = u_email;
    }

    String u_password;
    String u_telephone;
    String u_email;
}
