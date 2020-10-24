req = ""
query = ""
results = ""
pw = "Jays123!" // put your database password here
userName = "mml21934"
allCustomers = []

drpUpdate.onclick = function(s) {
  if (typeof(s) == "object") {
    return
  } else {
    //begin the journey
    drpUpdate.value = s // show user selection in drpCustomers
    
    origionalName = drpUpdate.value
  }
}
customerUpdate.onshow = function() {
  txtResponse.style.height = "140px"
  // get the data to populate the dropdown with names from database
  let query = "SELECT DISTINCT name FROM customer;"
  req = Ajax("https://ormond.creighton.edu/courses/375/ajax-connection.php", "POST", "host=ormond.creighton.edu&user=mml21934&pass=" + pw + "&database=mml21934&query=" + query)

  if (req.status == 200) { //transit worked.
    allCustomers = JSON.parse(req.responseText)

    // names now in results array - load names into the dropdown
    drpUpdate.clear()
    for (i = 0; i <= allCustomers.length - 1; i++)
      drpUpdate.addItem(allCustomers[i])
  } else {
    // transit error
    NSB.MsgBox(`Error: ${req.status}`);
  }
}


btnUpdate.onclick = function() {
  newName = inptUpdate.value
    query = `UPDATE customer SET name = '${newName}' WHERE name = '${origionalName}';`
    // get the remaining customers
    req = Ajax("https://ormond.creighton.edu/courses/375/ajax-connection.php", "POST", "host=ormond.creighton.edu&user=mml21934&pass=" + pw + "&database=mml21934&query=" + query)

    if (req.status == 200) { //transit worked.
      //save the sate of the customer 
      remainingCustomers = JSON.parse(req.responseText)
      console.log(remainingCustomers)
    } else
      console.log("error")
    
      //QUERY REMAINING CUSTOMERS
    query = `SELECT name FROM customer;`
    // get the remaining customers
    req = Ajax("https://ormond.creighton.edu/courses/375/ajax-connection.php", "POST", "host=ormond.creighton.edu&user=mml21934&pass=" + pw + "&database=mml21934&query=" + query)

    if (req.status == 200) { //transit worked.
      //save the sate of the customer 
      remainingCustomers3 = JSON.parse(req.responseText)
      console.log(remainingCustomers3)
    } else
      console.log("error")

    let customerList3 = ""
    for (i = 0; i <= remainingCustomers3.length - 1; i++)
      customerList3 = customerList3 + remainingCustomers3[i] + "\n"
    txtUpdate.value = customerList3
}
