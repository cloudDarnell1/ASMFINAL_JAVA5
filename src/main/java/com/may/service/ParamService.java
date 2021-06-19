package com.may.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


@Service
public class ParamService {
	@Autowired
	HttpServletRequest request;
	
	/**
	 * Ä�á»�c chuá»—i giÃ¡ trá»‹ cá»§a tham sá»‘
	 * @param name tÃªn tham sá»‘
	 * @param defaultValue giÃ¡ trá»‹ máº·c Ä‘á»‹nh
	 * @return giÃ¡ trá»‹ tham sá»‘ hoáº·c giÃ¡ trá»‹ máº·c Ä‘á»‹nh náº¿u khÃ´ng tá»“n táº¡i
	 */
	
	
	
	
	
	public String getString(String name, String defaultValue){
		String value = request.getParameter(name);
		return value != null ? value : defaultValue;
	}
	/**
	 * Ä�á»�c sá»‘ nguyÃªn giÃ¡ trá»‹ cá»§a tham sá»‘
	 * @param name tÃªn tham sá»‘
	 * @param defaultValue giÃ¡ trá»‹ máº·c Ä‘á»‹nh
	 * @return giÃ¡ trá»‹ tham sá»‘ hoáº·c giÃ¡ trá»‹ máº·c Ä‘á»‹nh náº¿u khÃ´ng tá»“n táº¡i
	 */
	public int getInt(String name, int defaultValue){
		String value = getString(name, String.valueOf(defaultValue));
		return Integer.parseInt(value);
	}
	/**
	* Đọc số thực giá trị của tham số
	* @param name tên tham số
	* @param defaultValue giá trị mặc định
	* @return giá trị tham số hoặc giá trị mặc định nếu không tồn tại
	*/

	public double getDouble(String name, double defaultValue){
		String value = getString(name, String.valueOf(defaultValue));
		return Double.parseDouble(value);
	}
	/**
	 * Ä�á»�c giÃ¡ trá»‹ boolean cá»§a tham sá»‘
	 * @param name tÃªn tham sá»‘
	 * @param defaultValue giÃ¡ trá»‹ máº·c Ä‘á»‹nh
	 * @return giÃ¡ trá»‹ tham sá»‘ hoáº·c giÃ¡ trá»‹ máº·c Ä‘á»‹nh náº¿u khÃ´ng tá»“n táº¡i
	 */
	public boolean getBoolean(String name, boolean defaultValue){
		String value = getString(name, String.valueOf(defaultValue));
		return Boolean.parseBoolean(value);
	}
	/**
	 * Ä�á»�c giÃ¡ trá»‹ thá»�i gian cá»§a tham sá»‘
	 * @param name tÃªn tham sá»‘
	 * @param pattern lÃ  Ä‘á»‹nh dáº¡ng thá»�i gian
	 * @return giÃ¡ trá»‹ tham sá»‘ hoáº·c null náº¿u khÃ´ng tá»“n táº¡i
	 * @throws RuntimeException náº¿u khÃ´ng Ä‘Ãºng Ä‘á»‹nh dáº¡ng
	 */
	public Date getDate(String name, String pattern){
		String value = getString(name, "");
		try {
			return new SimpleDateFormat(pattern).parse(value);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * LÆ°u file upload vÃ o thÆ° má»¥c
	 * @param file chá»©a file upload tá»« client
	 * @param path Ä‘Æ°á»�ng dáº«n tÃ­nh tá»« webroot
	 * @return Ä‘á»‘i tÆ°á»£ng chá»©a file Ä‘Ã£ lÆ°u hoáº·c null náº¿u khÃ´ng cÃ³ file upload
	 * @throws RuntimeException lá»—i lÆ°u file
	 */
	public File save(MultipartFile file, String path) {
		if(!file.isEmpty()) {
			File dir = new File(request.getServletContext().getRealPath(path));
			if(!dir.exists()) {
				dir.mkdirs();
			}
			try {
				File savedFile = new File(dir, file.getOriginalFilename());
				file.transferTo(savedFile);
				return savedFile;
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
		return null;
	}
}
