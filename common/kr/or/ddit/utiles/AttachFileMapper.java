package kr.or.ddit.utiles;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.io.FilenameUtils;

import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.vo.BoardFileVO;

public class AttachFileMapper {
	public static List<BoardFileVO> mapper(FileItem[] items, String bo_no){
		List<BoardFileVO> fileItemList = new ArrayList<BoardFileVO>();
		
		if(items!= null){
			BoardFileVO itemInfo = null;
			for(FileItem item : items){
				itemInfo = new BoardFileVO();
				
				itemInfo.setBo_no(bo_no);
				
				String fileName = FilenameUtils.getName(item.getName());
				itemInfo.setFile_name(fileName);
				
				String extension = FilenameUtils.getExtension(fileName);
				
				String genID= UUID.randomUUID().toString().replace("-", "");
				
				String savaFileName = genID + "." + extension;
				itemInfo.setFile_save_name(savaFileName);
				
				itemInfo.setFile_cont_type(item.getContentType());
				itemInfo.setFile_size(String.valueOf(item.getSize()));
				
				fileItemList.add(itemInfo);
				
				saveFile(savaFileName, item);
				
			}
		}
		return fileItemList;
	}

	private static void saveFile(String savaFileName, FileItem item) {
		File saveFile = new File(GlobalConstant.FILE_PATH, savaFileName);
		
		try {
			item.write(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
	
