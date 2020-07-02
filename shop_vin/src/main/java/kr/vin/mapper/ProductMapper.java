package kr.vin.mapper;

import java.util.List;

import kr.vin.domain.CartListVO;
import kr.vin.domain.Criteria;
import kr.vin.domain.Criteria2;
import kr.vin.domain.ProductVO;

public interface ProductMapper {

   public void addCart(CartListVO cart) throws Exception;

   public List<CartListVO> cartList(String userId) throws Exception;

   public int getTotalCount(Criteria cri);

   public int getTotal2Count(Criteria2 cri2);

   public List<ProductVO> getList();

   public List<ProductVO> getListWithPaging(Criteria cri);

   public void insert(ProductVO product);

   public void insertSelectKey(ProductVO product);

   public ProductVO read(Long bno);

   public int delete(Long bno);

   public int update(ProductVO product);

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

   public List<ProductVO> beltView(Criteria2 cri2);

   public List<ProductVO> hatView(Criteria2 cri2);

   public List<ProductVO> neckLaceView(Criteria2 cri2);

   public List<ProductVO> ringView(Criteria2 cri2);

   public List<ProductVO> saleView(Criteria2 cri2);

   public List<ProductVO> outerView(Criteria2 cri2);

   public List<ProductVO> productInView(Criteria cri);

}