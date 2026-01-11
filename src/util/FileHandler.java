package util;

import java.io.*;
import java.util.*;

// Import class model
import model.User;
import model.Product;
import model.Order;

public class FileHandler {

    // Lokasi fail untuk menyimpan data
    private static final String PRODUCT_FILE_PATH = "data/products.txt";
    private static final String USER_FILE_PATH = "data/users.txt";
    private static final String ORDER_FILE_PATH = "data/orders.txt";


    public List<Product> loadProducts() {
        List<Product> products = new ArrayList<>();
        // Pastikan direktori 'data' wujud
        new File("data").mkdirs();

        try (Scanner scanner = new Scanner(new File(PRODUCT_FILE_PATH))) {
            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                // Anggap data dipisahkan oleh koma (CSV format: ID,Nama,Description,Harga,Stok)
                String[] parts = line.split(",");

                if (parts.length == 5) {
                    Product p = new Product(
                            parts[0].trim(), // productID
                            parts[1].trim(), // name
                            parts[2].trim(), // description
                            Double.parseDouble(parts[3].trim()), // price
                            Integer.parseInt(parts[4].trim()) // stockQuantity
                    );
                    products.add(p);
                }
            }
        } catch (FileNotFoundException e) {
            System.out.println("Fail produk tidak ditemui. Memulakan dengan senarai kosong.");
            // Boleh diabaikan jika fail belum dicipta
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    public void saveProducts(List<Product> products) {
        // Pastikan direktori 'data' wujud
        new File("data").mkdirs();

        try (FileWriter writer = new FileWriter(PRODUCT_FILE_PATH)) {
            for (Product p : products) {
                // Tulis data dalam format CSV
                String line = String.format("%s,%s,%s,%.2f,%d\n",
                        p.getProductID(),
                        p.getName(),
                        p.getDescription(),
                        p.getPrice(),
                        p.getStockQuantity());
                writer.write(line);
            }
        } catch (IOException e) {
            System.err.println("Error when saving product: " + e.getMessage());
        }
    }

    //USER HANDLING
    public void saveUser(User user) //Save new user information
    {
        new File("data").mkdirs();

        try (FileWriter writer = new FileWriter(USER_FILE_PATH, true)) // true enables appending
        {
            String line = String.format("%s,%s,%s,%s,%s\n", user.getUserID(),
                    user.getUsername(), user.getEmail(),
                    user.getPassword(), "Customer");
            writer.write(line);
        }
        catch (IOException e)
        {
            System.err.println("Error when saving user info: " + e.getMessage());
        }
    }

    public User validateUser(String username, String password) //check if user registered
    {
        try (Scanner scanner = new Scanner(new File(USER_FILE_PATH)))
        {
            while (scanner.hasNextLine()) {
                String parts[] = scanner.nextLine().split(",");
                // Check if username and pass same
                if (parts.length >= 4 && parts[1].equals(username) && parts[3].equals(password))
                {
                    return new User(parts[0], parts[1], parts[2],
                            parts[3], parts[4]); // return if user found

                }
            }
        }
        catch (FileNotFoundException e)
        {
            return null; // user not registered
        }
        return null;
    }

    //ORDER HANDLING
    public void saveOrder(Order order, String userID) // creates and save new order
    {
        new File("data").mkdirs();

        try (FileWriter writer = new FileWriter(ORDER_FILE_PATH, true))
        {
            String line = String.format("%s, %s, %.2f, %s\n", order.getOrderId(),
                    userID, order.getOrderTotal(), order.getStatus());
            writer.write(line);
        }
        catch (IOException e)
        {
            System.err.println("Error when saving order: " + e.getMessage());
        }
    }

}