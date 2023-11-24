package ra.service.customer;

import ra.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerServiceIMPL implements ICustomerService{
  public static   List<Customer> customerList = new ArrayList<>();
  static {
      customerList.add(new Customer(1,"Anh Béo","HN","anhbeo@gmail.com"));
      customerList.add(new Customer(2,"Leesin","BD","vietanh@gmail.com"));
      customerList.add(new Customer(3,"Thầy Chiến","Anime","yasuo@gmail.com"));
  }
    @Override
    public List<Customer> findAll() {
        return customerList;
    }

    @Override
    public void save(Customer customer) {
        if (findById(customer.getCustomerId())== null){
            customerList.add(customer);
        }else{
            customerList.set(customerList.indexOf(customer),customer);
        }
    }

    @Override
    public void deleteById(int id) {
      customerList.remove(findById(id));
    }

    @Override
    public Customer findById(int id) {
        for (Customer customer : customerList) {
            if (customer.getCustomerId() == id){
                return customer;
            }
        }
        return null;
    }

    @Override
    public int getNewId() {
        int idMax = 0;
        for (Customer customer : customerList) {
            if (customer.getCustomerId() > idMax){
                idMax = customer.getCustomerId();
            }
        }
        return idMax + 1;
    }

    @Override
    public List<Customer> findByName(String name) {
        List<Customer> customerSearch = new ArrayList<>();
        for (Customer customer : customerList) {
            if (customer.getCustomerName().toLowerCase().contains(name.toLowerCase().trim())){
                customerSearch.add(customer);
            }
        }
        return customerSearch;
    }
}
