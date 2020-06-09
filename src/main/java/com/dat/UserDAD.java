package com.dat;

import com.qojo.Collection;
import com.qojo.Userinfo;
import com.util.DButil;

import java.util.List;

public class UserDAD {

    public Userinfo login(String username ,String password){

        String sql = "select username ,password from userinfo where username =? and password=?";
        List<Userinfo> list= DButil.query(sql , Userinfo.class , username , password);

        if (list.size()>0){
            return list.get(0);
        }

        return null;
    }

    public List<Collection> check(String username, String goodsid) {

        String sql = "select goodsid , username from collection where username = ? and goodsid = ?";

        List<Collection> list =DButil.query(sql ,Collection.class ,username,goodsid);


        return list;

    }

    public void addcollection(String username, String goodsid) {

        String sql="insert into collection (username , goodsid ) values(?,?) ";
        DButil.zsg(sql,username,goodsid);
    }
}
