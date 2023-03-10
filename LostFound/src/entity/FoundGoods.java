package entity;

public class FoundGoods {
    int F_id;
    String F_img;
    String F_name;
    String F_sort;
    String F_typename;

    public FoundGoods(String img, String goodsname, int typeId, String typename, String desc, String lostaddress, String losttime, String nikename, String phone) {
        this.F_img=img;
        this.F_name=goodsname;
        this.F_feature=typeId;
        this.F_typename=typename;
        this.F_sort=desc;
        this.F_place=lostaddress;
        this.F_time= losttime;
        this.F_founder=nikename;
        this.F_telephone=phone;
    }

    public FoundGoods() {

    }

    public int getF_id() {
        return F_id;
    }

    public void setF_id(int f_id) {
        F_id = f_id;
    }

    public String getF_typename() {
        return F_typename;
    }

    public void setF_typename(String f_typename) {
        F_typename = f_typename;
    }

    public String getF_img() {
        return F_img;
    }

    public void setF_img(String f_img) {
        F_img = f_img;
    }

    public String getF_name() {
        return F_name;
    }

    public void setF_name(String f_name) {
        F_name = f_name;
    }

    public String getF_sort() {
        return F_sort;
    }

    public void setF_sort(String f_sort) {
        F_sort = f_sort;
    }

    public int getF_feature() {
        return F_feature;
    }

    public void setF_feature(int f_feature) {
        F_feature = f_feature;
    }

    public String getF_place() {
        return F_place;
    }

    public void setF_place(String f_place) {
        F_place = f_place;
    }

    public String getF_time() {
        return F_time;
    }

    public void setF_time(String f_time) {
        F_time = f_time;
    }

    public String getF_founder() {
        return F_founder;
    }

    public void setF_founder(String f_founder) {
        F_founder = f_founder;
    }

    public String getF_telephone() {
        return F_telephone;
    }

    public void setF_telephone(String f_telephone) {
        F_telephone = f_telephone;
    }

    int F_feature;
    String F_place;
    String F_time;
    String F_founder;
    String F_telephone;
}
