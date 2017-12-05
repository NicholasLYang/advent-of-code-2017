import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

public class Main {

    public static BufferedReader openFile() {
        BufferedReader input = null;
        try {
            input = new BufferedReader(new FileReader("input.txt"));
        } catch(Exception e) {
            System.out.println("File could not be read");
            System.out.println(e);
        }
        return input;
    }
    
    public static void traverseList(List<Integer> list) {
        int index = 0;
        int counter = 0;
        while (true) {
            if (index >= list.size()) {
                System.out.println(counter);
                break;
            }
            int listVal = list.get(index);
            if (listVal >= 3) {
                list.set(index, listVal - 1);
            } else {
                list.set(index, listVal + 1);
            }
            index = index + listVal;
            counter++;
        }
    }
    
    public static void main(String[] args) {
        BufferedReader input = openFile();
        Stream<String> inputStream = input.lines();
        List<Integer> list = new ArrayList<>();
        inputStream.forEach(line ->
            list.add(Integer.parseInt(line))
        );
        traverseList(list);
    }
}
