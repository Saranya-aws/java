public class HelloWorld {
    public static void main(String[] args) throws InterruptedException {
        System.out.println("Hello from Docker!");
        // Keep the container running
        Thread.sleep(Long.MAX_VALUE);
    }
}


