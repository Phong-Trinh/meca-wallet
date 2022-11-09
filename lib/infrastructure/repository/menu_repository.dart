import 'package:flutter_application_2/domain/entities/category_entity.dart';
import 'package:flutter_application_2/domain/entities/product_entity.dart';

import '../../domain/entities/category_products_entity.dart';

class MenuRepository {
  final List<CategoryProductsEntity> _products = [
    CategoryProductsEntity(
        CategoryEntity('boongcate1020245211', 'Cà phê',
            'https://product.hstatic.net/1000075078/product/1636647328_arme-nong_b6b45a1c3bda4568ac67fe486847dc01_large.jpg'),
        [
          ProductEntity(
              'boongcoffee01',
              'Americano Nóng',
              'https://product.hstatic.net/1000075078/product/1636647328_arme-nong_b6b45a1c3bda4568ac67fe486847dc01_large.jpg',
              45000,
              45000,
              false),
          ProductEntity(
              'boongcoffee01',
              'Cà Phê Sữa Đá',
              'https://product.hstatic.net/1000075078/product/1639377738_ca-phe-sua-da_721d7068e01045b99542243abe413080_large.jpg',
              45000,
              45000,
              false),
          ProductEntity(
              'boongcoffee01',
              'Cà Phê Sữa Nóng',
              'https://product.hstatic.net/1000075078/product/1636647328_arme-nong_b6b45a1c3bda4568ac67fe486847dc01_large.jpg',
              45000,
              45000,
              false),
          ProductEntity(
              'boongcoffee01',
              'Bạc Sỉu',
              'https://product.hstatic.net/1000075078/product/1639377904_bac-siu_3ff2e92cfa164e79a37eec224645fc09_large.jpg',
              45000,
              45000,
              false),
          ProductEntity(
              'boongcoffee01',
              'Bạc Sỉu Nóng',
              'https://product.hstatic.net/1000075078/product/1636647328_arme-nong_b6b45a1c3bda4568ac67fe486847dc01_large.jpg',
              45000,
              45000,
              false),
          ProductEntity(
              'boongcoffee01',
              'Cà Phê Đen Đá',
              'https://product.hstatic.net/1000075078/product/1639377797_ca-phe-den-da_d6012623520549cd888214f2952b062a_large.jpg',
              45000,
              45000,
              false),
          ProductEntity(
              'boongcoffee01',
              'Cà Phê Đen Nóng',
              'https://product.hstatic.net/1000075078/product/1639377816_ca-phe-den-nong_ce947a4a1a394fdfa2aa361f318a26f5_large.jpg',
              45000,
              45000,
              false)
        ]),
    CategoryProductsEntity(
        CategoryEntity('boongcate1020245542', 'Trà trái cây',
            'https://product.hstatic.net/1000075078/product/tra-dao-cam-xa_668678_6bc4945f39294b7682b02bb846a6a207_large.jpg'),
        [
          ProductEntity(
              'boongtea01',
              'Trà Long Nhãn Hạt Sen',
              'https://product.hstatic.net/1000075078/product/1649378747_tra-sen-nhan_8eec834b798a448cb70d08e6c39e6872_large.jpg',
              45000,
              45000,
              false),
          ProductEntity(
              'boongtea01',
              'Trà Đào Cam Sả - Đá',
              'https://product.hstatic.net/1000075078/product/tra-dao-cam-xa_668678_6bc4945f39294b7682b02bb846a6a207_large.jpg',
              45000,
              45000,
              false),
          ProductEntity(
              'boongtea01',
              'Trà Đào Cam Sả - Nóng',
              'https://product.hstatic.net/1000075078/product/tdcs-nong_288997_b92a1e3d60dd4612b9daf72176b0b5bb_large.jpg',
              45000,
              45000,
              false),
          ProductEntity(
              'boongtea01',
              'Trà Hạt Sen - Đá',
              'https://product.hstatic.net/1000075078/product/tra-sen_905594_9a4731a87ff34f1583ddf100b766b63e_large.jpg',
              45000,
              45000,
              false),
          ProductEntity(
              'boongtea01',
              'Trà Hạt Sen - Nóng',
              'https://product.hstatic.net/1000075078/product/tra-sen-nong_025153_a1268e088bcd4216b78e848fe28b85e3_large.jpg',
              45000,
              45000,
              false),
          ProductEntity(
              'boongtea01',
              'Trà Long Nhãn hạt Chia',
              'https://product.hstatic.net/1000075078/product/tra-nhan-da_484810_9d47021d521f4590bdace12f5259b4fc_large.jpg',
              45000,
              45000,
              false)
        ]),
    CategoryProductsEntity(
        CategoryEntity('boongcate1020245211', 'CloudFee',
            'https://product.hstatic.net/1000075078/product/1665655231_cloudfee-roasted-almond_5ecde476c87a453e9b18550bb618741d_large.jpg'),
        []),
    CategoryProductsEntity(
        CategoryEntity('boongcate1020245211', 'Hi-Tea Trà',
            'https://product.hstatic.net/1000075078/product/1655199358_xoai-aloe-vera_62dc962e86e148ebb4062e6febe92a06_large.jpg'),
        []),
    CategoryProductsEntity(
        CategoryEntity('boongcate1020245211', 'Cold Brew',
            'https://product.hstatic.net/1000075078/product/classic-cold-brew_239501_dc6c5e937cc444bba5796bb603a6b041_large.jpg'),
        []),
    CategoryProductsEntity(
        CategoryEntity('boongcate1020245211', 'CloudTea',
            'https://product.hstatic.net/1000075078/product/1665655072_hong-tra-arabica_be6e1e111646447da3ee6518fd80af34_large.jpg'),
        []),
    CategoryProductsEntity(
        CategoryEntity('boongcate1020245211', 'Macchiato',
            'https://product.hstatic.net/1000075078/product/hong-tra-sua-tran-chau_326977_09d21c8f1f834dbd8a05ae15315ea369_large.jpg'),
        [])
  ];

  List<CategoryProductsEntity> getAllProduct() {
    return _products;
  }
}
