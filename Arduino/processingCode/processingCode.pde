import com.francisli.processing.http.*; 
import processing.serial.*;

String api_key = ""; //put your API key here
 
com.francisli.processing.http.HttpClient client;

// The serial port:
Serial myPort;    

// The serial port:
Serial arduino;    


 String ticketid;
 String merchantid;
      String productid;
      String startDate;
      String endDate;

 PFont f;
 
 boolean firstTime = true;
 
 int timenow = 100;
 
 PImage head; // A variable for the image file
 
 PImage remove; // A variable for the image file
 
 
 boolean ticketValid = false;
 
 PImage barcode; // A variable for the image file

void setup() {
  
// List all the available serial ports:
println(Serial.list());

  head = loadImage("Check.png");
  remove = loadImage("Delete.png");

  barcode = loadImage("barcode.jpg");

  // Open the port you are using at the rate you want:
  myPort = new Serial(this, "COM8", 115200 );
  
  
  arduino = new Serial(this, "COM5", 9600 );
  
  
  
   myPort.write("2Ap"); 
  size(500,300);
  f = createFont("Arial",16,true); // STEP 3 Create Font

  // create new client
  client = new com.francisli.processing.http.HttpClient(this, "www.bornvoyage.com");
  callHTTP();
}
 
void callHTTP() {
 

}
 
void responseReceived(com.francisli.processing.http.HttpRequest request, com.francisli.processing.http.HttpResponse response) {
 
 
   
//  callHTTP();

}
 
 int number_bars = int(random(50,100));
int bar=0;
 
 

void draw() {
  
     //Date currentDay = new Date();
     
     
     
     String sDate = "2013-02-25 00:00:00";
     String[] startArr = split(sDate, '-');
     
      
      int sYear = Integer.parseInt(startArr[0]);
      int sMonth = Integer.parseInt(startArr[1]);
    //  int sDay = Integer.parseInt(startArr[2].substr(0,2);
     
     
     print(sYear+","+sMonth+","+sDay);
  
     background(255);
   fill(255);                        // STEP 5 Specify font color 
  rect(20, 160, 460, 100);
  fill(0);                        // STEP 5 Specify font color 
   textFont(f,16);                 // STEP 4 Specify font to be used
  
  text("Type:",25,190);  // STEP 6 Display Text
  text("Start Date:",25,210);  // STEP 6 Display Text
  text("End Date:",25,230);  // STEP 6 Display Text
  
  
  
     
   myPort.write("2Ap");   
    
   
  String s = myPort.readString();
  
  println(s);
  
  String[] list = split(s, ',');
  
  if( s != null ) {  
    if( list.length > 3 ) {
      
      int i = 2;
      
      if( list[1].length()== 1 ) {
        i = 1; 
      }
      
    
      println(list);
      ticketid = list[i];      i++;

      merchantid = list[i];      i++;
      productid = list[i];      i++;
      startDate = list[i];      i++;
      endDate = list[i];
      
    println(ticketid);
    println(merchantid);
    println(productid);
    println(startDate);
    println(endDate);
    
     // search for the artist Radiohead
   
      
      
    if( merchantid.equals("Singapore Zoo")  
       //&& ( < timenow && endDate > timenow ) 
     //&& !ticketid.equals("65052742845_00002")
       ) {
    ticketValid = true; 
    
     client = new com.francisli.processing.http.HttpClient(this, "www.bornvoyage.com");
    
    //  // instantiate a new HashMap
//  HashMap params = new HashMap();
// 
//  // pass parameters as key-value pairs
//  params.put("ticketid", ticketid);
// 
//  // make the request
  client.GET("ticketman/ticketman_api.php?mode=claim&deviceid=12312312312&username=chandra&ticketid="+ ticketid);
    
    arduino.write(1);
  } else {
     ticketValid = false; 
    arduino.write(2);
  }

    
    if( !firstTime ) {
       delay(1000);
       firstTime = false;
    }  
    
    }
  
  
  }
  
  
  if( ticketid != null && !ticketid.equals("peration Mode :2") ) {

  
  
  
  image(barcode,70,0); 
  if( ticketValid ) {
    image(head,0,0); 
  } else {
    image(remove,0,0); 
  }
  
  
  text(ticketid,150,145);  // STEP 6 Display Text
  
  textFont(f,20);                 // STEP 4 Specify font to be used
  
 
  text(productid,120,190);  // STEP 6 Display Text
 text(startDate,120,210);  // STEP 6 Display Text
  
 if( endDate != null ) { 
  text(endDate,120,230);  // STEP 6 Display Text
 }

  
 
  
  }
  
//  
//  // instantiate a new HashMap
//  HashMap params = new HashMap();
// 
//  // pass parameters as key-value pairs
//  params.put("ticketid", ticketid);
// 
//  // make the request
//  client.GET("ticketman/check.php");
  delay(2000);
  
  

}

