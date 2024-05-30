package com.yamisora.superwebne.dto;

import lombok.Setter;
import lombok.Getter;
import lombok.NoArgsConstructor;
import jakarta.validation.Constraint;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import jakarta.validation.constraints.Max;
import com.yamisora.superwebne.interfaces.validation.PasswordMatching;
import com.yamisora.superwebne.interfaces.validation.UniqueEmailValue;
import com.yamisora.superwebne.interfaces.validation.UniqueUsernameValue;
import com.yamisora.superwebne.model.Role;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UserDto {
    private int id;

    @NotEmpty(message = "Username is required")
    @Size(min = 3, max = 20, message = "Username must be between 3 and 20 characters")
    @UniqueUsernameValue(message = "Username already exists")
    private String username;

    @NotEmpty(message = "Email is required")
    @Email
    @UniqueEmailValue(message = "Email already exists")
    private String email;

    @NotEmpty(message = "Password is required")
    @Size(min = 6, message = "Password must be at least 6 characters")
    // have special character, number, and uppercase
    @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{6,}$", message = "Password must have at least one special character, number, and uppercase")
    private String password;


    @NotEmpty(message = "Confirm Password is required")
    @Size(min = 6, message = "Password must be at least 6 characters")
    @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{6,}$", message = "Password must have at least one special character, number, and uppercase")
    @PasswordMatching(password = "password", confirmPassword = "confirmPassword", message = "Password not matching")
    private String confirmPassword;

    private int roleId;

    public void loadFromDto(UserDto userDto) {
        this.id = userDto.getId();
        this.username = userDto.getUsername();
        this.email = userDto.getEmail();
        this.password = userDto.getPassword();
        this.roleId = userDto.getRoleId();
    }

    private PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }
}
