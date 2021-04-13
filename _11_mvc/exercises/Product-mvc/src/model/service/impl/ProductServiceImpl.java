package model.service.impl;

import model.bean.Product;
import model.responsitory.ProductRespository;
import model.responsitory.impl.ProductRespositoryImpl;
import model.service.ProductService;

import java.util.List;

public class ProductServiceImpl implements ProductService {
    private ProductRespository productRespository = new ProductRespositoryImpl();

    @Override
    public List<Product> findAll() {
        return  this.productRespository.findAll();
    }

    @Override
    public void save(Product product) {
        this.productRespository.save(product);
    }

    @Override
    public Product findById(int id) {
        return this.productRespository.findById(id);
    }

    @Override
    public void update(int id, Product product) {
        this.productRespository.update(id,product);
    }

    @Override
    public void remove(int id) {
        this.productRespository.remove(id);
    }

    @Override
    public List<Product> search(String str) {
       return this.productRespository.search(str);
    }
}
