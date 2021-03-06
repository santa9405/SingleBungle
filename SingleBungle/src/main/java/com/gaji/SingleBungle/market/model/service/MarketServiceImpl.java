package com.gaji.SingleBungle.market.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gaji.SingleBungle.cafe.model.vo.Cafe;
import com.gaji.SingleBungle.findFriend.exception.InsertAttachmentFailException;
import com.gaji.SingleBungle.market.model.dao.MarketDAO;
import com.gaji.SingleBungle.market.model.exception.MarketInsertAttachmentFailException;
import com.gaji.SingleBungle.market.model.vo.Market;
import com.gaji.SingleBungle.market.model.vo.MarketAttachment;
import com.gaji.SingleBungle.market.model.vo.MarketLike;
import com.gaji.SingleBungle.market.model.vo.MarketPageInfo;

@Service
public class MarketServiceImpl implements MarketService {

	@Autowired
	private MarketDAO dao;

	// 페이징 처리 객체 생성 Service 구현
	@Override
	public MarketPageInfo getPageInfo(int cp) {
		int listCount = dao.getListCount();
		return new MarketPageInfo(cp, listCount);
	}

	// 게시글 목록 조회 Service 구현
	@Override
	public List<Market> selectList(MarketPageInfo mpInfo) {
		return dao.selectList(mpInfo);
	}
	
	// 썸네일 목록 조회 Service 구현
	@Override
	public List<MarketAttachment> selectThumbnailList(List<Market> mList) {
		return dao.selectThumbnailList(mList);
	}

	// 상세 조회 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public Market selectMarket(int marketNo) {

		Market temp = new Market();
		temp.setMarketNo(marketNo);

		Market market = dao.selectMarket(temp);

		if (market != null) {
			int result = dao.increaseReadCount(marketNo);

			if (result > 0) {
				market.setReadCount(market.getReadCount() + 1);
			}
		}
		return market;
	}
	
	// 좋아요 여부 확인 Service 구현
	@Override
	public int selectLikePushed(Map<String, Integer> map) {
		return dao.selectLikePushed(map);
	}
	
	// 게시글 상세 조회 이미지 목록 조회 Service 구현
	@Override
	public List<MarketAttachment> selectAttachmentList(int marketNo) {
		return dao.selectAttachmentList(marketNo);
	}

	
	// 좋아요 목록 조회 Service 구현
	@Override
	public List<MarketLike> selectLike(int memberNo) {
		return dao.selectLike(memberNo);
	}

	// 좋아요 증가 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int increaseLike(Map<String, Object> map) {

		return dao.increaseLike(map);
	}

	// 좋아요 감소 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int decreaseLike(Map<String, Object> map) {
		return dao.decreaseLike(map);
	}

	// 게시글 등록 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertMarket(Market market, List<MultipartFile> images, String savePath) {
		int result = 0;

		int marketNo = dao.selectNextNo();

		if (marketNo > 0) {
			market.setMarketNo(marketNo);

			String marketTitle = market.getMarketTitle();
			String marketContent = market.getMarketContent();

			marketTitle = replaceParameter(marketTitle);
			marketContent = replaceParameter(marketContent);

			market.setMarketTitle(marketTitle);
			market.setMarketContent(marketContent);
		}

		result = dao.insertMarket(market);

		if (result > 0) {
			List<MarketAttachment> uploadImages = new ArrayList<MarketAttachment>();

			String filePath = "/resources/marketImages";

			for (int i = 0; i < images.size(); i++) {
				if (!images.get(i).getOriginalFilename().equals("")) {
					String fileName = rename(images.get(i).getOriginalFilename());

					MarketAttachment at = new MarketAttachment(filePath, fileName, i, marketNo);

					uploadImages.add(at);
					System.out.println(uploadImages);
				}
			}

			if (!uploadImages.isEmpty()) {
				result = dao.insertAttachmentList(uploadImages);

				if (result == uploadImages.size()) {
					result = marketNo;

					
					 int size = uploadImages.size();;
					 
					 
					 
//					 if(!images.get(0).getOriginalFilename().equals("")) { size = images.size(); }
					 
					for (int i = 0; i < size; i++) {
						try {
							images.get(uploadImages.get(i).getFileLevel())
									.transferTo(new File(savePath + "/" + uploadImages.get(i).getFileName()));
							System.out.println("파일 저장 성공!!!!");
						} catch (Exception e) {
							e.printStackTrace();

							throw new MarketInsertAttachmentFailException("파일 서버 저장 실패");
						}
					}
				}
			} else {
				throw new MarketInsertAttachmentFailException("파일 정보 DB 삽입 실패");
			}
		} else {
			result = marketNo;
		}
		return result;
	}

	// 크로스 사이트 스크립팅 방지 처리 메소드
	private String replaceParameter(String param) {
		String result = param;
		if (param != null) {
			result = result.replaceAll("&", "&amp;");
			result = result.replaceAll("<", "&lt;");
			result = result.replaceAll(">", "&gt;");
			result = result.replaceAll("\"", "&quot;");
		}
		return result;
	}

	public String rename(String originFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));

		int ranNum = (int) (Math.random() * 100000);
		String str = "_" + String.format("%05d", ranNum);
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		return date + str + ext;
	}






}
