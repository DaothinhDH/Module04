package model.entity.user;

public class User {
  private int  userId;
  private String username;
  private int phoneNumber;
  private String address;
  private java.sql.Date birthday;
  private boolean sex;
  private float salary;

    public User() {
    }

    public User(int userId, String username, int phoneNumber, String address, java.sql.Date birthday, boolean sex, float salary) {
        this.userId = userId;
        this.username = username;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.birthday = birthday;
        this.sex = sex;
        this.salary = salary;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(int phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public java.sql.Date getBirthday() {
        return birthday;
    }

    public void setBirthday(java.sql.Date birthday) {
        this.birthday = birthday;
    }

    public boolean isSex() {
        return sex;
    }

    public void setSex(boolean sex) {
        this.sex = sex;
    }

    public float getSalary() {
        return salary;
    }

    public void setSalary(float salary) {
        this.salary = salary;
    }
}
