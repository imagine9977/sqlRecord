package com.sqlrecord.sqlrecord.product.model.service;

import java.util.List;
import java.util.Map;

import com.sqlrecord.sqlrecord.product.model.vo.Product;
import com.sqlrecord.sqlrecord.reply.model.vo.ChReply;
import com.sqlrecord.sqlrecord.reply.model.vo.Reply;
import com.sqlrecord.sqlrecord.reply.model.vo.ReplyFile;

public interface ReplyService {

	public List<Reply> getReplyList(int productNo);
	public Reply getReply(int replyNo );
	public int replyCount(int productNo);
	public int insReply(Reply reply);
	public int changeReply(Reply reply);
	public int delReply(Reply replyNo);
	public List<Map<String, Object>> getReplyStarAll(int productNo);
	public float avgStar(int productNo);
	public int chInsReply(ChReply chReply);
	public List<ChReply> getChReplyList();
	public int changeChReply(ChReply chReply);
	public int delChReply(ChReply chReplyNo);
	public int chReplyCount();
	public int insFile(ReplyFile replyFile);
	public List<ReplyFile> getImgList();
	public int delFile(Reply replyNo);
}
