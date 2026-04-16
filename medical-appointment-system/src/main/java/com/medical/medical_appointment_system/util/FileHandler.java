package com.medical.medical_appointment_system.util;


import java.io.*;
import java.util.*;

public class FileHandler {

    private static final String FILE_PATH = "D:/Downloads/SLIIT/1y2s/OOP/prjct/medical-appointment-system/medical-appointment-system/data/patients.txt";
    public static List<String> readFile() throws IOException {
        File file = new File(FILE_PATH);
        if (!file.exists()) file.createNewFile();

        BufferedReader br = new BufferedReader(new FileReader(file));
        List<String> lines = new ArrayList<>();

        String line;
        while ((line = br.readLine()) != null) {
            lines.add(line);
        }
        br.close();
        return lines;
    }

    public static void writeFile(List<String> lines) throws IOException {
        BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH));
        for (String line : lines) {
            bw.write(line);
            bw.newLine();
        }
        bw.close();
    }
}