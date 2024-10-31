package com.demiurgo.user;

import jakarta.persistence.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Entity
@Table(name = "demiurgo_user")
public class UserModel{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "demiurgo_user", nullable = false)
    private Long userId;

    @Column(name = "user_name", nullable = false)
    private String userName;

    @Column(name = "user_birthdate", nullable = false)
    private String userBirthdate;

    @Column(name = "user_address", nullable = false)
    private String userAddress;

    @Column(name = "user_cpf", nullable = false)
    private String userCPF;

    @Column(name = "user_password", nullable = false)
    private String userPassword;

    public Long getUserId(){ return userId; };
    public void setUserId(Long userId){ this.userId = userId; }

    public String getUserName(){ return userName; }
    public void setUserName(String userName){ this.userName = userName; }

    public String getUserBirthdate(){ return userBirthdate; }
    public void setUserBirthdate(String userBirthdate){ this.userBirthdate = userBirthdate; }

    public String getUserAddress(){ return userAddress; }
    public void setUserAddress(String userAddress){ this.userAddress = userAddress; }

    public String getUserCPF(){ return userCPF; }
    public void setUserCPF(String userCPF){ this.userCPF = userCPF; }

    private static BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

    public String getUserPassword(){ return userPassword; }
    public void setUserPassword(String userPassword){ this.userPassword = encoder.encode(userPassword); }

}
