package com.sqlrecord.sqlrecord.reply.model.service;

import java.util.List;
import java.util.Map;

import com.sqlrecord.sqlrecord.reply.model.vo.ChReply;
import com.sqlrecord.sqlrecord.reply.model.vo.Reply;

public interface ReplyService {

	public List<Reply> getReplyList();
	public Reply getReply(int replyNo );
	public int replyCount();
	public int insReply(Reply reply);
	public int changeReply(Reply reply);
	public int delReply(Reply replyNo);
	public List<Map<String, Object>> getReplyStarAll();
	public float avgStar();
	public int chInsReply();
	public List<ChReply> getChReplyList();
}
