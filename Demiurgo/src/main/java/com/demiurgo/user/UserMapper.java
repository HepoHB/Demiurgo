package com.demiurgo.user;

import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface UserMapper{
    UserDTO toDTO(UserModel userModel);

    UserModel toEntity(UserDTO userDTO);

}
