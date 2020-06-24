package kr.vin.mapper;

import java.util.List;

import kr.vin.domain.Criteria;
import kr.vin.domain.ProductVO;


public interface ProductMapper {	
	public List<ProductVO> getList();
	
	public List<ProductVO> getListWithPaging(Criteria cri);
	
	public void insert(ProductVO product);
	
	public void insertSelectKey(ProductVO product);

	public ProductVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(ProductVO product);


}
