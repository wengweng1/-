package entity;

import java.util.Date;
import java.util.List;

public class LostGoods {
    int I_id;
    String I_img;
    String I_name;
    String I_sort;
    int I_feature;
    String I_typename;
    String I_place;
    String I_time;
    String I_loster;
    String I_telephone;

    public LostGoods(String img, String goodsname, int typeId, String typename, String desc, String lostaddress, String losttime, String nikename, String phone) {
        this.I_img=img;
        this.I_name=goodsname;
        this.I_feature=typeId;
        this.I_typename=typename;
        this.I_sort=desc;
        this.I_place=lostaddress;
        this.I_time= losttime;
        this.I_loster=nikename;
        this.I_telephone=phone;
    }
    public LostGoods(){

    }

    public int getI_id() {
        return I_id;
    }

    public void setI_id(int i_id) {
        I_id = i_id;
    }

    public String getI_img() {
        return I_img;
    }

    public void setI_img(String i_img) {
        I_img = i_img;
    }

    public String getI_name() {
        return I_name;
    }

    public void setI_name(String i_name) {
        I_name = i_name;
    }

    public String getI_sort() {
        return I_sort;
    }

    public void setI_sort(String i_sort) {
        I_sort = i_sort;
    }

    public int getI_feature() {
        return I_feature;
    }

    public void setI_feature(int i_feature) {
        I_feature = i_feature;
    }

    public String getI_typename() {
        return I_typename;
    }

    public void setI_typename(String i_typename) {
        I_typename = i_typename;
    }

    public String getI_place() {
        return I_place;
    }

    public void setI_place(String i_place) {
        I_place = i_place;
    }

    public String getI_time() {
        return I_time;
    }

    public void setI_time(String i_time) {
        I_time = i_time;
    }

    public String getI_loster() {
        return I_loster;
    }

    public void setI_loster(String i_loster) {
        I_loster = i_loster;
    }

    public String getI_telephone() {
        return I_telephone;
    }

    public void setI_telephone(String i_telephone) {
        I_telephone = i_telephone;
    }
}
