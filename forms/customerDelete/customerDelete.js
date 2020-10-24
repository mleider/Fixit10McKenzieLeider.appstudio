req = ""
query = ""
results = ""
pw = "Jays123!"  // put your database password here
userName = "mml21934"
allCustomers = []

customerDelete.onshow=function(){
    txtResponse.style.height = "140px"
    // get the data to populate the dropdown with names from database
    let query = "SELECT DISTINCT name FROM customer;"
    req = Ajax("https://ormond.creighton.edu/courses/375/ajax-connection.php", "POST", "host=ormond.creighton.edu&user=mml21934&pass=" + pw + "&database=mml21934&query=" + query)

    if (req.status == 200) { //transit worked.
            allCustomers = JSON.parse(req.responseText)
            
            // names now in results array - load names into the dropdown
            drpNames.clear()
            for (i = 0; i <= allCustomers.length - 1; i++)
                drpNames.addItem(allCustomers[i])
    } else {
        // transit error
        NSB.MsgBox(`Error: ${req.status}`);
    }  
}


drpNames.onclick=function(s){
    if(typeof(s) == "object") {
      return
    } else {
      //begin the journey
    drpNames.value = s // show user selection in drpCustomers
    
    //create query to check if name exists
    query = `SELECT name FROM customer WHERE name = '${s}';`
    
    req = Ajax("https://ormond.creighton.edu/courses/375/ajax-connection.php", "POST", "host=ormond.creighton.edu&user=mml21934&pass=" + pw + "&database=mml21934&query=" + query)
    
    if (req.status == 200) {
      customerName = JSON.parse(req.responseText)
    /*  if () {
        console.log(`The customer called ${customerName}`)
      else {
       
       }*/
    } else 
      console.log("error")
    
    //DELETE CUSTOMER
    query = `DELETE FROM customer WHERE name = '${customerName[0]}';`
    // get the other customers who have the same state
    req = Ajax("https://ormond.creighton.edu/courses/375/ajax-connection.php", "POST", "host=ormond.creighton.edu&user=mml21934&pass=" + pw + "&database=mml21934&query=" + query)
    
    if (req.status == 200) { //transit worked.
      //save the sate of the customer 
      deletedCustomer = JSON.parse(req.responseText)
      console.log(deletedCustomer)
    } else
      console.log("error")
    
    
    //QUERY REMAINING CUSTOMERS
    query = `SELECT name FROM customer;`
    // get the remaining customers
    req = Ajax("https://ormond.creighton.edu/courses/375/ajax-connection.php", "POST", "host=ormond.creighton.edu&user=mml21934&pass=" + pw + "&database=mml21934&query=" + query)
    
    if (req.status == 200) { //transit worked.
      //save the sate of the customer 
      remainingCustomers = JSON.parse(req.responseText)
      console.log(remainingCustomers)
    } else
      console.log("error")
    
    let customerList = ""
    for (i = 0; i <= remainingCustomers.length - 1; i++)
      customerList = customerList + remainingCustomers[i] + "\n"
    txtResults.value = customerList
  }
}