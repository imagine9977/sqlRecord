package com.sqlrecord.sqlrecord.guest.model.vo;

import java.util.Date;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Guest {
	private int guestNo;
    private String guestName;
    private String guestPw;
    private String guestAddress1;
    private String guestAddress2;
    private String guestPostcode;
    private Date guestDate;
}
