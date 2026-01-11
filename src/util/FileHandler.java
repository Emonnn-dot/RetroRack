package util;

import java.io.*;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.List;
import model.Product; // Import kelas model

public class FileHandler {

    // Lokasi fail untuk menyimpan data produk
    private static final String PRODUCT_FILE_PATH = "data/products.txt";

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
            System.err.println("Ralat semasa menyimpan produk: " + e.getMessage());
        }
    }

    //tambah kaedah loadUsers(), saveUsers(), dan lain-lain di sini.
}