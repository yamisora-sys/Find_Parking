package com.yamisora.superwebne.dto;

import lombok.Setter;
import lombok.Getter;
import lombok.NoArgsConstructor;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import com.yamisora.superwebne.model.Role;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UserDto {
    private int id;

    @NotEmpty
    private String username;

    @NotEmpty
    private String email;

    @NotEmpty
    private String password;

    private int roleId;

    public void loadFromDto(UserDto userDto) {
        this.id = userDto.getId();
        this.username = userDto.getUsername();
        this.email = userDto.getEmail();
        this.password = userDto.getPassword();
        this.roleId = userDto.getRoleId();
    }
}
