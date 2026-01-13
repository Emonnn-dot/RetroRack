package util;

import java.io.*;
import java.util.*;

// Import class model
import model.User;
import model.Product;
import model.Order;

public class FileHandler {

    // Lokasi fail untuk menyimpan data
    private static final String BASE_PATH = System.getProperty("user.home")
            + File.separator + "RetroRackData" + File.separator;

    private static final String USER_FILE_PATH = BASE_PATH + "users.txt";
    private static final String ORDER_FILE_PATH = BASE_PATH + "orders.txt";
    private static final String PRODUCT_FILE_PATH = BASE_PATH + "products.txt";

    // Constructor to ensure folder exists immediately
    public FileHandler() {
        File folder = new File(BASE_PATH);
        if (!folder.exists()) {
            folder.mkdirs(); // Create the folder if it doesn't exist
        }
    }

    // --- SAVE USER ---
    public boolean saveUser(User user) {
        try (FileWriter writer = new FileWriter(USER_FILE_PATH, true)) {
            String line = String.format("%s,%s,%s,%s,%s\n",
                    user.getUserID(), user.getUsername(), user.getEmail(), user.getPassword(), "Customer");
            writer.write(line);
            return true; // Success!
        } catch (IOException e) {
            e.printStackTrace();
            return false; // Failed!
        }
    }

    // --- VALIDATE USER ---
    public User validateUser(String username, String password) {
        File file = new File(USER_FILE_PATH);
        System.out.println("DEBUG: Checking for user in: " + file.getAbsolutePath());

        if (!file.exists()) {
            System.out.println("DEBUG: User file does not exist yet!");
            return null;
        }

        try (Scanner scanner = new Scanner(file)) {
            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                String[] parts = line.split(",");
                if (parts.length >= 4 && parts[1].equals(username) && parts[3].equals(password)) {
                    System.out.println("DEBUG: Login Successful for " + username);
                    return new User(parts[0], parts[1], parts[2], parts[3], parts[4]);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("DEBUG: Login Failed (User not found)");
        return null;
    }

    // --- SAVE ORDER ---
    public void saveOrder(Order order, String userID) {
        try (FileWriter writer = new FileWriter(ORDER_FILE_PATH, true)) {
            String line = String.format("%s, %s, %.2f, %s\n",
                    order.getOrderId(), userID, order.getOrderTotal(), order.getStatus());
            writer.write(line);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Stub for products (kept to avoid errors)
    public List<Product> loadProducts() { return new ArrayList<>(); }
    public void saveProducts(List<Product> p) {}


    /*public List<Product> loadProducts() {
        List<Product> products = new ArrayList<>();
        // Pastikan direktori 'data' wujud
        new File("BASE_PATH").mkdirs();

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
        new File("BASE_PATH").mkdirs();

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
        new File("BASE_PATH").mkdirs();

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
        new File("BASE_PATH").mkdirs();

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
    }*/

}