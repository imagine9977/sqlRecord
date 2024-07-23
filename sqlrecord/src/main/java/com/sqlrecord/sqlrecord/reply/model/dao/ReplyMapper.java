package com.sqlrecord.sqlrecord.reply.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sqlrecord.sqlrecord.product.model.vo.Product;
import com.sqlrecord.sqlrecord.reply.model.vo.ChReply;
import com.sqlrecord.sqlrecord.reply.model.vo.Reply;
import com.sqlrecord.sqlrecord.reply.model.vo.ReplyFile;

@Mapper
public interface ReplyMapper {

	List<Reply> getReplyList(int productNo);
	Reply getReply(int replyNo);
	int replyCount(int productNo);
	int insReply(Reply reply);
	int changeReply(Reply reply);
	int delReply(Reply replyNo);
	List<Map<String, Object>> getReplyStarAll(int productNo);
	float avgStar(int productNo);
	int chInsReply(ChReply chReply);
	List<ChReply> getChReplyList();
	int changeChReply(ChReply chReply);
	int delChReply(ChReply chReplyNo);
	int chReplyCount();
	int insFile(ReplyFile replyFile);
	List<ReplyFile> getImgList();
	int delFile(Reply replyNo);


}
