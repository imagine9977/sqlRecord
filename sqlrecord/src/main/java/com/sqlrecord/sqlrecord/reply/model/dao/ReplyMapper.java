package com.sqlrecord.sqlrecord.reply.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.sqlrecord.sqlrecord.reply.model.vo.ChReply;
import com.sqlrecord.sqlrecord.reply.model.vo.Reply;

@Mapper
public interface ReplyMapper {

	List<Reply> getReplyList();
	Reply getReply(int replyNo);
	int replyCount();
	int insReply(Reply reply);
	int changeReply(Reply reply);
	int delReply(Reply replyNo);
	List<Map<String, Object>> getReplyStarAll();
	float avgStar();
	int chInsReply();
	List<ChReply> getChReplyList();


}
