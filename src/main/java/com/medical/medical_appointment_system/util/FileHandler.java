package com.medical.medical_appointment_system.util;


import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.List;

public class FileHandler {

    private static final String DATA_DIR_PROPERTY = "medical.data.dir";

    private FileHandler() {}

    public static List<String> readFile(String fileName) throws IOException {
        Path filePath = resolvePath(fileName);
        if (!Files.exists(filePath)) {
            Files.createDirectories(filePath.getParent());
            Files.createFile(filePath);
        }
        return Files.readAllLines(filePath, StandardCharsets.UTF_8);
    }

    public static void writeFile(String fileName, List<String> lines) throws IOException {
        Path filePath = resolvePath(fileName);
        Files.createDirectories(filePath.getParent());
        Files.write(filePath, lines, StandardCharsets.UTF_8, StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);
    }

    private static Path resolvePath(String fileName) {
        String configuredDataDir = System.getProperty(DATA_DIR_PROPERTY);
        Path dataDir = configuredDataDir == null || configuredDataDir.isBlank()
                ? Paths.get(System.getProperty("user.dir"), "data")
                : Paths.get(configuredDataDir);
        return dataDir.resolve(fileName).normalize();
    }

    public static String escape(String value) {
        if (value == null) {
            return "";
        }
        return value.replace("\\", "\\\\").replace("|", "\\p").replace("\r", " ").replace("\n", " ");
    }

    public static List<String> split(String line) {
        List<String> values = new ArrayList<>();
        StringBuilder current = new StringBuilder();
        boolean escaping = false;
        for (char c : line.toCharArray()) {
            if (escaping) {
                current.append(c == 'p' ? '|' : c);
                escaping = false;
            } else if (c == '\\') {
                escaping = true;
            } else if (c == '|') {
                values.add(current.toString());
                current.setLength(0);
            } else {
                current.append(c);
            }
        }
        if (escaping) {
            current.append('\\');
        }
        values.add(current.toString());
        return values;
    }
}
