package entity;

public class Admin {
    int a_id;
    String a_name;

    public Admin(String username, String phone, String email, String password) {
        this.a_name=username;
        this.a_telephone=phone;
        this.a_email=email;
        this.a_password=password;
    }

    public Admin() {

    }

    public int getA_id() {
        return a_id;
    }

    public void setA_id(int a_id) {
        this.a_id = a_id;
    }

    public String getA_name() {
        return a_name;
    }

    public void setA_name(String a_name) {
        this.a_name = a_name;
    }

    public String getA_password() {
        return a_password;
    }

    public void setA_password(String a_password) {
        this.a_password = a_password;
    }

    public String getA_telephone() {
        return a_telephone;
    }

    public void setA_telephone(String a_telephone) {
        this.a_telephone = a_telephone;
    }

    public String getA_email() {
        return a_email;
    }

    public void setA_email(String a_email) {
        this.a_email = a_email;
    }

    public String getA_role() {
        return a_role;
    }

    public void setA_role(String a_role) {
        this.a_role = a_role;
    }

    String a_password;
    String a_telephone;
    String a_email;
    String a_role;
}
