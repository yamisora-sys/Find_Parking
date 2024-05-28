package com.yamisora.superwebne.dto;

import lombok.Setter;
import lombok.Getter;
import lombok.NoArgsConstructor;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import com.yamisora.superwebne.model.Role;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Max;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UserDto {
    private int id;

    @NotEmpty(message = "Username is required")
    @Min(value = 3, message = "Username must be at least 3 characters")
    @Max(value = 20, message = "Username must be at most 20 characters")
    private String username;

    @NotEmpty(message = "Email is required")
    @Email
    private String email;

    @NotEmpty(message = "Password is required")
    @Min(value = 6, message = "Password must be at least 6 characters")
    // have special character, number, and uppercase
    @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{6,}$", message = "Password must have at least one special character, number, and uppercase")
    private String password;


    @NotEmpty(message = "Confirm Password is required")
    @Min(value = 6, message = "Password must be at least 6 characters")
    @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{6,}$", message = "Password must have at least one special character, number, and uppercase")
    private String confirmPassword;

    private int roleId;

    // match password and confirm password
    // run this and return message

    public boolean isPasswordMatch() {
        return this.password.equals(this.confirmPassword);
    }

    public void loadFromDto(UserDto userDto) {
        this.id = userDto.getId();
        this.username = userDto.getUsername();
        this.email = userDto.getEmail();
        this.password = userDto.getPassword();
        this.roleId = userDto.getRoleId();
    }
}
