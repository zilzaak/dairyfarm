package dairy.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dairy.model.Animal;
import dairy.repo.Animalrepo;



@Controller
@RequestMapping("/upload")
public class Fileuploader {
	@Autowired
private Animalrepo anr;

	
	@PostMapping("/finalupload")
public ModelAndView   uploadfile(@RequestParam("file") MultipartFile file,
		HttpSession session) throws IOException{
		ModelAndView mv = new ModelAndView("upload");
		byte[] data = file.getBytes();
		File f = new File(file.getOriginalFilename());
		String path = session.getServletContext().getRealPath("/")+"static"+File.separator+"images"+File.separator+f.getName();
		System.out.println("the context path is as"+path);
		FileOutputStream fo = new FileOutputStream(path);
		fo.write(data);
		fo.close();
		int id =  (int) session.getAttribute("id");
		Animal a = anr.findById(id).get();
		a.setFilename(f.getName());
		anr.save(a);	
mv.addObject("sms",f.getName()+"is uploaded successfull");

		return mv;
			}
	
}
