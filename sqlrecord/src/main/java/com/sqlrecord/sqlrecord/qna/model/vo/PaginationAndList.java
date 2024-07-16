package com.sqlrecord.sqlrecord.qna.model.vo;

import java.util.List;

import com.sqlrecord.sqlrecord.common.vo.PageInfo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PaginationAndList {
	List<Qna> qnaList;
	PageInfo pageInfo;
}
