package kr.vin.service;

import java.util.List;

import kr.vin.domain.Criteria;
import kr.vin.domain.ProductVO;

public interface ProductService {
	
	public void register(ProductVO product);

	public ProductVO get(Long bno);

	public boolean modify(ProductVO product);

	public boolean remove(Long bno);

//	public List<ProductVO> getList();
	
	public List<ProductVO> getList(Criteria cri);
}