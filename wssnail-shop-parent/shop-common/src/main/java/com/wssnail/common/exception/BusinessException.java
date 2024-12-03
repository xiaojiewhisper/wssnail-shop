package com.wssnail.common.exception;


import com.wssnail.common.web.CodeMsg;
import lombok.Getter;
import lombok.Setter;

/**
 * Created by wolfcode
 */
@Setter
@Getter
public class BusinessException extends RuntimeException {
    private CodeMsg codeMsg;
    public BusinessException(CodeMsg codeMsg){
        this.codeMsg = codeMsg;
    }
}
