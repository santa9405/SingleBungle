package com.gaji.SingleBungle.findFriend.scheduling;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.gaji.SingleBungle.findFriend.model.service.FindFriendService;

@Component
public class ImageDeleteScheduling {

	@Autowired
	private ServletContext servletContext;

	@Autowired
	private FindFriendService service;

	//@Scheduled(cron = "0 * * * * *") // test
	@Scheduled(cron = "0 0 0 * * *")
	public void deleteImage() {

		String savePath = servletContext.getRealPath("/resources/findFriendImages");

		File folder = new File(savePath);

		// savePath 폴더에 있는 모든 이미지 파일이 배열로 반환
		File[] fileList = folder.listFiles();

		List<File> serverFileList = new ArrayList<File>();

		Date threeDaysAgo = new Date(System.currentTimeMillis() - (3 * 24 * 60 * 60 * 1000));
		SimpleDateFormat dateFormat = new SimpleDateFormat();

		String standard = dateFormat.format(threeDaysAgo);

		for (File file : fileList) {

			String fileName = file.toString().substring(file.toString().lastIndexOf("\\") + 1);
			// System.out.println(file.toString());
			// System.out.println(fileName);

			if (standard.compareTo(fileName.substring(0, 8)) >= 0) {
				serverFileList.add(file);
			}

		}

		List<String> dbFileList = service.selectDBFileList();

//		for(String fileName : dbFileList) {
//			System.out.println(fileName);
//		}

		if (dbFileList != null && !serverFileList.isEmpty()) {

			for (File serverFile : serverFileList) {

				String fileName = serverFile.toString().substring(serverFile.toString().lastIndexOf("\\") + 1);

				System.out.println(fileName);

				if (dbFileList.indexOf(fileName) < 0) {
					serverFile.delete();
					System.out.println(fileName + " 삭제");
				}

			}
		}

	}
}
