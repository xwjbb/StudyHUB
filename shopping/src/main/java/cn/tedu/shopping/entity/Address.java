package cn.tedu.shopping.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Objects;

public class Address implements Serializable {
    private Integer id;
    private String uid;
    private String username;
    private String phone;
    private String address;
    private Timestamp created;
    private Timestamp updated;

    public Address(){}
    public Address(Integer id, String username, String phone, String address, Timestamp created, Timestamp updated, String uid) {
        this.id = id;
        this.username = username;
        this.phone = phone;
        this.address = address;
        this.created = created;
        this.updated = updated;
        this.uid = uid;
    }

    public Address(String username, String phone, String address, Timestamp created, Timestamp updated, String uid) {
        this.username = username;
        this.phone = phone;
        this.address = address;
        this.created = created;
        this.updated = updated;
        this.uid = uid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getusername() {
        return username;
    }

    public void setusername(String username) {
        this.username = username;
    }



    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getaddress() {
        return address;
    }

    public void setaddress(String address) {
        this.address = address;
    }

    public Timestamp getCreated() {
        return created;
    }

    public void setCreated(Timestamp created) {
        this.created = created;
    }

    public Timestamp getUpdated() {
        return updated;
    }

    public void setUpdated(Timestamp updated) {
        this.updated = updated;
    }


    public String getUid(){
        return uid;
    }
    public void setUid(String uid){
        this.uid = uid;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Address address = (Address) o;
        return id.equals(address.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", created=" + created +
                ", updated=" + updated +
                ", uid=" + uid +
                '}';
    }

}
