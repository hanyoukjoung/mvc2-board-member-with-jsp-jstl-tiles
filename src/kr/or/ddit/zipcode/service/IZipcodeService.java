package kr.or.ddit.zipcode.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ZiptbVO;

public interface IZipcodeService {
	public List<ZiptbVO> zipcodeList(Map<String, String> params);

	public List<String> sidoList();

	public List<String> gugunList(String sido);
}
