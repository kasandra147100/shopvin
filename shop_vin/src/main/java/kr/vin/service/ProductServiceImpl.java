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
   public List<ProductVO> topView(Criteria cri) {
      return mapper.topView(cri);
   }

   @Override
   public List<ProductVO> teeView(Criteria cri) {
      return mapper.teeView(cri);
   }

   @Override
   public List<ProductVO> shirtView(Criteria cri) {
      return mapper.shirtView(cri);
   }

   @Override
   public List<ProductVO> knitView(Criteria cri) {
      return mapper.knitView(cri);
   }

   @Override
   public List<ProductVO> bottomView(Criteria cri) {
      return mapper.bottomView(cri);
   }

   @Override
   public List<ProductVO> denimView(Criteria cri) {
      return mapper.denimView(cri);
   }

   @Override
   public List<ProductVO> slacksView(Criteria cri) {
      return mapper.slacksView(cri);
   }

   @Override
   public List<ProductVO> shoesView(Criteria cri) {
      return mapper.shoesView(cri);
   }

   @Override
   public List<ProductVO> accView(Criteria cri) {
      return mapper.accView(cri);
   }

   @Override
   public List<ProductVO> bagView(Criteria cri) {
      return mapper.bagView(cri);
   }

   @Override
   public List<ProductVO> beltList(Criteria cri) {
      return mapper.beltView(cri);
   }

   @Override
   public List<ProductVO> hatView(Criteria cri) {
      return mapper.hatView(cri);
   }

   @Override
   public List<ProductVO> neckLaceView(Criteria cri) {
      return mapper.neckLaceView(cri);
   }

   @Override
   public List<ProductVO> ringView(Criteria cri) {
      return mapper.ringView(cri);
   }

   @Override
   public List<ProductVO> saleView(Criteria cri) {
      return mapper.saleView(cri);
   }

   @Override
   public List<ProductVO> outerView(Criteria cri) {
      return mapper.outerView(cri);
   }

   @Override
   public List<ProductVO> productInView(Criteria cri) {
      // TODO Auto-generated method stub
      return mapper.productInView(cri);
   }


}