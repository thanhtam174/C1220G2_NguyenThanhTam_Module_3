package model.responsitory.impl;

import model.bean.Product;
import model.responsitory.ProductRespository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class ProductRespositoryImpl implements ProductRespository {
    private static Map<Integer, Product> products;

    static {
        products = new TreeMap<>();
        products.put(1, new Product(1, "Iphone 7 Plus", 500.0));
        products.put(2, new Product(2, "SamSung Galaxy S8", 400.0));
        products.put(3, new Product(3, "Xiaomi 8", 430.0));
        products.put(4, new Product(4, "Iphone X", 700.0));
        products.put(5, new Product(5, "Sony Xperia Z", 280.0));

    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id,product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

    @Override
    public List<Product> search(String str) {
        List<Product> allProduct = this.findAll();
        List<Product> searchList = new ArrayList<>();
        for (Product product:allProduct) {
            if (product.getName().equals(str)){
                searchList.add(product);
            }
        }
        return searchList;
    }
}
