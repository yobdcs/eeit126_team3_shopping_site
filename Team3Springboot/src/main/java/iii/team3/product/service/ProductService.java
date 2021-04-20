package iii.team3.product.service;

import org.springframework.stereotype.Service;

@Service
public class ProductService {

	public String EOLspliter(String productDesc) {
		var strs = productDesc.split("\\n");
		var sb = new StringBuffer();
		
		for(String str : strs)
			sb.append(str + "<br>");
		
		return sb.toString();
	}
}