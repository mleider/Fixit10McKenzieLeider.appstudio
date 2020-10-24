req = ""
query = ""
results = ""
pw = "Jays123!"  // put your database password here
userName = "mml21934"
allCustomers = []

customerAdd.onshow=function(){
   txtAddFinal.style.height = "140px"
    // get the data to populate the dropdown with names from database
    let query = "SELECT name FROM customer;"
    req = Ajax("https://ormond.creighton.edu/courses/375/ajax-connection.php", "POST", "host=ormond.creighton.edu&user=mml21934&pass=" + pw + "&database=mml21934&query=" + query)

    if (req.status == 200) { //transit worked.
            allCustomers = JSON.parse(req.responseText)
            
            // names now in results array - load names into the dropdown
            drpAdd.clear()
            for (i = 0; i <= allCustomers.length - 1; i++)
                drpAdd.addItem(allCustomers[i])
    } else {
        // transit error
        NSB.MsgBox(`Error: ${req.status}`);
    }  
}
btnAddCustomer.onclick=function(){
if(typeof(s) == "object") {
      return
    } else {
  // create querry that adds customer
  query = `INSERT INTO customer (name, street, city, state, zipcode) VALUES ('Jesse Antiques', '1113 F St', 'Omaha', 'NE', '68178');`
    // get the remaining customers
    req = Ajax("https://ormond.creighton.edu/courses/375/ajax-connection.php", "POST", "host=ormond.creighton.edu&user=mml21934&pass=" + pw + "&database=mml21934&query=" + query)
    
    if (req.status == 200) { //transit worked.
      //save the sate of the customer 
      addedCustomers = JSON.parse(req.responseText)
      console.log(addedCustomers)
    } else
      console.log("error")

  //assign result of added customer
  lblAdded.text=`The new customer, Jesse Antiques was added to the database.`

  query = `SELECT name FROM customer;`
    // get the remaining customers
    req = Ajax("https://ormond.creighton.edu/courses/375/ajax-connection.php", "POST", "host=ormond.creighton.edu&user=mml21934&pass=" + pw + "&database=mml21934&query=" + query)
    
    if (req.status == 200) { //transit worked.
      //save the sate of the customer 
      remainingCustomers2 = JSON.parse(req.responseText)
      console.log(remainingCustomers2)
    } else
      console.log("error")
    
    let customerList2 = ""
    for (i = 0; i <= remainingCustomers2.length - 1; i++)
      customerList2 = customerList2 + remainingCustomers2[i] + "\n"
    txtAddFinal.value = customerList2
  }
}




