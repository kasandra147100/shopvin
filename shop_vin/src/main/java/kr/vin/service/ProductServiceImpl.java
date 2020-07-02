package kr.vin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.vin.domain.CartListVO;
import kr.vin.domain.Criteria;
import kr.vin.domain.Criteria2;
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

//   @Override
//   public List<ProductVO> getList() {
//      log.info("getList.......");
//      return mapper.getList();
//   }

   @Override
   public List<ProductVO> getList(Criteria cri) {
      log.info("get List with criteria: " + cri);
      return mapper.getListWithPaging(cri);
   }

   @Override
   public List<ProductVO> topView(Criteria2 cri2) {
      // log.info("get List with criteria2: " + cri2);
      return mapper.topView(cri2);
   }

   @Override
   public List<ProductVO> teeView(Criteria2 cri2) {
      return mapper.teeView(cri2);
   }

   @Override
   public List<ProductVO> shirtView(Criteria2 cri2) {
      return mapper.shirtView(cri2);
   }

   @Override
   public List<ProductVO> knitView(Criteria2 cri2) {
      return mapper.knitView(cri2);
   }

   @Override
   public List<ProductVO> bottomView(Criteria2 cri2) {
      return mapper.bottomView(cri2);
   }

   @Override
   public List<ProductVO> denimView(Criteria2 cri2) {
      return mapper.denimView(cri2);
   }

   @Override
   public List<ProductVO> slacksView(Criteria2 cri2) {
      return mapper.slacksView(cri2);
   }

   @Override
   public List<ProductVO> shoesView(Criteria2 cri2) {
      return mapper.shoesView(cri2);
   }

   @Override
   public List<ProductVO> accView(Criteria2 cri2) {
      return mapper.accView(cri2);
   }

   @Override
   public List<ProductVO> bagView(Criteria2 cri2) {
      return mapper.bagView(cri2);
   }

   @Override
   public List<ProductVO> beltList(Criteria2 cri2) {
      return mapper.beltView(cri2);
   }

   @Override
   public List<ProductVO> hatView(Criteria2 cri2) {
      return mapper.hatView(cri2);
   }

   @Override
   public List<ProductVO> neckLaceView(Criteria2 cri2) {
      return mapper.neckLaceView(cri2);
   }

   @Override
   public List<ProductVO> ringView(Criteria2 cri2) {
      return mapper.ringView(cri2);
   }

   @Override
   public List<ProductVO> saleView(Criteria2 cri2) {
      return mapper.saleView(cri2);
   }

   @Override
   public List<ProductVO> outerView(Criteria2 cri2) {
      return mapper.outerView(cri2);
   }

   @Override
   public List<ProductVO> productInView(Criteria cri) {
      // TODO Auto-generated method stub
      return mapper.productInView(cri);
   }

   @Override
   public int getTotal(Criteria cri) {
      // TODO Auto-generated method stub
      log.info("get total count");
      return mapper.getTotalCount(cri);
   }

   @Override
   public int getTotal2(Criteria2 cri2) {
      // TODO Auto-generated method stub
      return mapper.getTotal2Count(cri2);
   }

   @Override
   public void addCart(CartListVO cart) throws Exception {
      mapper.addCart(cart);
   }

   @Override
   public List<CartListVO> cartList(String userId) throws Exception {
      return mapper.cartList(userId);
   }

}