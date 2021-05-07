import static org.junit.jupiter.api.Assertions.*;

class HelloWorldTest {

    @org.junit.jupiter.api.Test
    void sayHello() {
        HelloWorld helloWorld = new HelloWorld();
        assertEquals("Hello Nexus", helloWorld.sayHello());
    }
}