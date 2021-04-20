package iii.team3.shoppingCart.test;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import iii.team3.product.model.ProductBean;

@Repository
public class AutoCompletionBackEndProcess {

	@Autowired
	private EntityManager em;

	@Autowired
	HttpServletRequest r;
	private List<ProductBean> list;
	private String FolderName = "WEB-INF\\productnames";
	private String FileName = "\\products_names.txt";
	private String hql = "select productName from ProductBean where productVision = 0";

	public void getProductsNameAndCreateTextFileOnServer() {
		getProductsNames();
		createTextFileFromList();
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	private void getProductsNames() {
		list = em.createQuery(hql).getResultList();
	}
	
	private void createTextFileFromList() {
		var realPath = r.getSession().getServletContext().getRealPath("/") + FolderName;
		var saveDir = new File(realPath);
		saveDir.mkdirs();

		try(var writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(realPath + FileName), "utf-8"))) {
			var array = list.toArray(new String[0]);
			
			for(int i = 0 ; i < array.length - 1 ; i ++)
				writer.write(array[i] +",");
			writer.write(array[array.length - 1]);
			
			writer.flush();
		} catch (IOException e) {
			System.out.println("not complete !");
			System.out.println("CAUTION : somthing went wrong when creating text file at : "+ realPath + FileName);
			return;
		}
		System.out.println("complete !");
		System.out.println("SUCCESS : file created at : "+ realPath + FileName);
	}
}
