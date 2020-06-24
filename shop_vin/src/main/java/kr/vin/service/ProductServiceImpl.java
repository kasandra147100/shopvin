package kr.vin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.vin.domain.Criteria;
import kr.vin.domain.ProductVO;
import kr.vin.mapper.ProductMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {

	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;

	@Override
	public void register(ProductVO product) {
		log.info("register....." + product);
		mapper.insertSelectKey(product);

	}

	@Override
	public ProductVO get(Long bno) {
		log.info("get....." + bno);
		return mapper.read(bno);
	}


	@Override
	public boolean modify(ProductVO product) {
		log.info("modify....." + product);
		return mapper.update(product) == 1;
	}
	@Override
	public boolean remove(Long bno) {
		log.info("remove....." + bno);
		return mapper.delete(bno) == 1;
	}

//	@Override
//	public List<ProductVO> getList() {
//		log.info("getList.......");
//		return mapper.getList();
//	}

	@Override
	public List<ProductVO> getList(Criteria cri) {
		log.info("get List with criteria: " + cri);
		return mapper.getListWithPaging(cri);
	}

}
