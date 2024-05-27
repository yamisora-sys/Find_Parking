package com.yamisora.superwebne.dto;

import lombok.Setter;
import lombok.Getter;
import lombok.NoArgsConstructor;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;

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
}
