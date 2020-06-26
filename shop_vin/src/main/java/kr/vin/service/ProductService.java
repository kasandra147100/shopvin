package kr.vin.service;

import java.util.List;

import kr.vin.domain.Criteria;
import kr.vin.domain.ProductVO;

public interface ProductService {

   public void register(ProductVO product);

   public ProductVO get(Long bno);

   public boolean modify(ProductVO product);

   public boolean remove(Long bno);

//   public List<ProductVO> getList();

   public List<ProductVO> getList(Criteria cri);

   public List<ProductVO> topView(Criteria cri);

   public List<ProductVO> teeView(Criteria cri);

   public List<ProductVO> shirtView(Criteria cri);

   public List<ProductVO> knitView(Criteria cri);

   public List<ProductVO> bottomView(Criteria cri);

   public List<ProductVO> denimView(Criteria cri);

   public List<ProductVO> slacksView(Criteria cri);

   public List<ProductVO> shoesView(Criteria cri);

   public List<ProductVO> accView(Criteria cri);

   public List<ProductVO> bagView(Criteria cri);

   public List<ProductVO> beltList(Criteria cri);

   public List<ProductVO> hatView(Criteria cri);

   public List<ProductVO> neckLaceView(Criteria cri);

   public List<ProductVO> ringView(Criteria cri);

   public List<ProductVO> saleView(Criteria cri);

   public List<ProductVO> outerView(Criteria cri);

   public List<ProductVO> productInView(Criteria cri);

}