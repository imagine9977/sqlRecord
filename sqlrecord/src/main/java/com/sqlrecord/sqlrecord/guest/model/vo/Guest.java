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
	private int guest_no;
    private String guest_name;
    private String guest_pw;
    private String guest_address1;
    private String guest_address2;
    private String guest_postcode;
    private Date guest_date;
}
