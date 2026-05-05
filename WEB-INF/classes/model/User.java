package model;
public class User {
    private String name, email, username, password;
    public User(String name, String email, String username, String password) {
        this.name = name; this.email = email; this.username = username; this.password = password;
    }
    public String toFileString() { return name+","+email+","+username+","+password; }
    public String getUsername() { return username; }
}
