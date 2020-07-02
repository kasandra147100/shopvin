package kr.vin.service;

import java.util.List;

import kr.vin.domain.CartListVO;
import kr.vin.domain.Criteria;
import kr.vin.domain.Criteria2;
import kr.vin.domain.ProductVO;

public interface ProductService {

   public void addCart(CartListVO cart) throws Exception;

   public List<CartListVO> cartList(String userId) throws Exception;

   public int getTotal(Criteria cri);

   public void register(ProductVO product);

   public ProductVO get(Long bno);

   public boolean modify(ProductVO product);

   public boolean remove(Long bno);

//   public List<ProductVO> getList();

   public List<ProductVO> getList(Criteria cri);

   public List<ProductVO> topView(Criteria2 cri2);

   public List<ProductVO> teeView(Criteria2 cri2);

   public List<ProductVO> shirtView(Criteria2 cri2);

   public List<ProductVO> knitView(Criteria2 cri2);

   public List<ProductVO> bottomView(Criteria2 cri2);

   public List<ProductVO> denimView(Criteria2 cri2);

   public List<ProductVO> slacksView(Criteria2 cri2);

   public List<ProductVO> shoesView(Criteria2 cri2);

   public List<ProductVO> accView(Criteria2 cri2);

   public List<ProductVO> bagView(Criteria2 cri2);

   public List<ProductVO> beltList(Criteria2 cri2);

   public List<ProductVO> hatView(Criteria2 cri2);

   public List<ProductVO> neckLaceView(Criteria2 cri2);

   public List<ProductVO> ringView(Criteria2 cri2);

   public List<ProductVO> saleView(Criteria2 cri2);

   public List<ProductVO> outerView(Criteria2 cri2);

   public List<ProductVO> productInView(Criteria cri);

   public int getTotal2(Criteria2 cri2);

}