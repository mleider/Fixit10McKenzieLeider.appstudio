{
  "!type": "Form",
  "_uuid": "5bfc2f9f1ee949e3b82e8aaae07c6ddd",
  "HTML": "",
  "attributes": "",
  "background": "",
  "backgroundimage": "",
  "borderColor": "",
  "borderStyle": "",
  "borderWidth": "",
  "cached_js": "req = \"\"\nquery = \"\"\nresults = \"\"\npw = \"Jays123!\"\u00a0\u00a0// put your database password here\nuserName = \"mml21934\"\nallCustomers = []\n\ncustomerDelete.onshow=function(){\n\u00a0\u00a0\u00a0\u00a0txtResponse.style.height = \"140px\"\n\u00a0\u00a0\u00a0\u00a0// get the data to populate the dropdown with names from database\n\u00a0\u00a0\u00a0\u00a0let query = \"SELECT DISTINCT name FROM customer;\"\n\u00a0\u00a0\u00a0\u00a0req = Ajax(\"https://ormond.creighton.edu/courses/375/ajax-connection.php\", \"POST\", \"host=ormond.creighton.edu&user=mml21934&pass=\" + pw + \"&database=mml21934&query=\" + query)\n\n\u00a0\u00a0\u00a0\u00a0if (req.status == 200) { //transit worked.\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0allCustomers = JSON.parse(req.responseText)\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0// names now in results array - load names into the dropdown\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0drpNames.clear()\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0for (i = 0; i <= allCustomers.length - 1; i++)\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0drpNames.addItem(allCustomers[i])\n\u00a0\u00a0\u00a0\u00a0} else {\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0// transit error\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0NSB.MsgBox(`Error: ${req.status}`);\n\u00a0\u00a0\u00a0\u00a0}\u00a0\u00a0\n}\n\n\ndrpNames.onclick=function(s){\n\u00a0\u00a0\u00a0\u00a0if(typeof(s) == \"object\") {\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0return\n\u00a0\u00a0\u00a0\u00a0} else {\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0//begin the journey\n\u00a0\u00a0\u00a0\u00a0drpNames.value = s // show user selection in drpCustomers\n\u00a0\u00a0\u00a0\u00a0\n\u00a0\u00a0\u00a0\u00a0//create query to check if name exists\n\u00a0\u00a0\u00a0\u00a0query = `SELECT name FROM customer WHERE name = '${s}';`\n\u00a0\u00a0\u00a0\u00a0\n\u00a0\u00a0\u00a0\u00a0req = Ajax(\"https://ormond.creighton.edu/courses/375/ajax-connection.php\", \"POST\", \"host=ormond.creighton.edu&user=mml21934&pass=\" + pw + \"&database=mml21934&query=\" + query)\n\u00a0\u00a0\u00a0\u00a0\n\u00a0\u00a0\u00a0\u00a0if (req.status == 200) {\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0customerName = JSON.parse(req.responseText)\n\u00a0\u00a0\u00a0\u00a0/*\u00a0\u00a0if () {\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0console.log(`The customer called ${customerName}`)\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0else {\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0}*/\n\u00a0\u00a0\u00a0\u00a0} else \n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0console.log(\"error\")\n\u00a0\u00a0\u00a0\u00a0\n\u00a0\u00a0\u00a0\u00a0//DELETE CUSTOMER\n\u00a0\u00a0\u00a0\u00a0query = `DELETE FROM customer WHERE name = '${customerName[0]}';`\n\u00a0\u00a0\u00a0\u00a0// get the other customers who have the same state\n\u00a0\u00a0\u00a0\u00a0req = Ajax(\"https://ormond.creighton.edu/courses/375/ajax-connection.php\", \"POST\", \"host=ormond.creighton.edu&user=mml21934&pass=\" + pw + \"&database=mml21934&query=\" + query)\n\u00a0\u00a0\u00a0\u00a0\n\u00a0\u00a0\u00a0\u00a0if (req.status == 200) { //transit worked.\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0//save the sate of the customer \n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0deletedCustomer = JSON.parse(req.responseText)\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0console.log(deletedCustomer)\n\u00a0\u00a0\u00a0\u00a0} else\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0console.log(\"error\")\n\u00a0\u00a0\u00a0\u00a0\n\u00a0\u00a0\u00a0\u00a0\n\u00a0\u00a0\u00a0\u00a0//QUERY REMAINING CUSTOMERS\n\u00a0\u00a0\u00a0\u00a0query = `SELECT name FROM customer;`\n\u00a0\u00a0\u00a0\u00a0// get the remaining customers\n\u00a0\u00a0\u00a0\u00a0req = Ajax(\"https://ormond.creighton.edu/courses/375/ajax-connection.php\", \"POST\", \"host=ormond.creighton.edu&user=mml21934&pass=\" + pw + \"&database=mml21934&query=\" + query)\n\u00a0\u00a0\u00a0\u00a0\n\u00a0\u00a0\u00a0\u00a0if (req.status == 200) { //transit worked.\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0//save the sate of the customer \n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0remainingCustomers = JSON.parse(req.responseText)\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0console.log(remainingCustomers)\n\u00a0\u00a0\u00a0\u00a0} else\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0console.log(\"error\")\n\u00a0\u00a0\u00a0\u00a0\n\u00a0\u00a0\u00a0\u00a0let customerList = \"\"\n\u00a0\u00a0\u00a0\u00a0for (i = 0; i <= remainingCustomers.length - 1; i++)\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0customerList = customerList + remainingCustomers[i] + \"\\n\"\n\u00a0\u00a0\u00a0\u00a0txtResults.value = customerList\n\u00a0\u00a0}\n}",
  "cached_js_script_hash": "49905b7a188854147924edf30c63ca90",
  "children": [
    {
      "!type": "Dropdown_bs4",
      "_uuid": "4188214a32744badbf7366479e466ff0",
      "align": "",
      "appearance": " btn-secondary",
      "backgroundColor": "",
      "badge": "",
      "badgeAppearance": " badge-info",
      "blockLevel": "",
      "borderColor": "",
      "borderStyle": "",
      "borderWidth": "",
      "bottom": "auto",
      "cached_js": "",
      "cached_js_script_hash": "d41d8cd98f00b204e9800998ecf8427e",
      "children": [],
      "class": "",
      "color": "",
      "disabled": "",
      "display": "",
      "dropdown": "dropdown",
      "expanded_pmp": true,
      "filter": "false",
      "filterPlaceholder": "Search...",
      "fontFamily": "",
      "fontSize": "",
      "fontStyle": "",
      "fontWeight": "",
      "groupStyle": "",
      "grouping": "",
      "height": "auto",
      "hidden": "",
      "icon": "caret",
      "id": "drpNames",
      "items": "!Heading\nItem 1\nItem 2\n-\n*Item 3 (disabled)",
      "left": 56,
      "mAll": "",
      "mBottom": "",
      "mLeft": "",
      "mRight": "",
      "mTop": "",
      "onclick": "drpNames.onclick()",
      "onmousedown": "",
      "onmousemove": "",
      "onmouseout": "",
      "onmouseup": "",
      "onresize": "",
      "ontouchend": "",
      "ontouchmove": "",
      "ontouchstart": "",
      "outline": "",
      "pAll": "",
      "pBottom": "",
      "pLeft": "",
      "pRight": "",
      "pTop": "",
      "popBody": "Body",
      "popClose": "hover",
      "popPosition": "",
      "popStyle": "popover",
      "popTitle": "Title",
      "right": "auto",
      "script": "",
      "size": " btn-md",
      "style": "",
      "top": 272,
      "value": "Customers",
      "width": "auto"
    },
    {
      "!type": "Textarea_bs4",
      "_uuid": "1f85a102bc874550802c4d3800309b4b",
      "align": "",
      "autocapitalize": "",
      "autocomplete": "",
      "autocorrect": "",
      "backgroundColor": "",
      "badge": "",
      "badgeAppearance": " badge-info",
      "bottom": "auto",
      "cached_js": "",
      "cached_js_script_hash": "d41d8cd98f00b204e9800998ecf8427e",
      "children": [],
      "class": "",
      "color": "",
      "disabled": "",
      "display": "",
      "expanded_pmp": true,
      "fontFamily": "",
      "fontSize": "",
      "fontStyle": "",
      "fontWeight": "",
      "footer": "",
      "header": "Remaining Customers",
      "headerCols": 2,
      "height": "auto",
      "hidden": "",
      "icon": "",
      "iconTitle": "",
      "id": "txtResults",
      "inputmode": "",
      "left": 56,
      "mAll": "",
      "mBottom": "",
      "mLeft": "",
      "mRight": "",
      "mTop": "",
      "maxlength": "",
      "name": "",
      "onchange": "",
      "onclick": "",
      "oncopy": "",
      "oncut": "",
      "onfocusin": "",
      "onfocusout": "",
      "oninput": "",
      "onkeypress": "",
      "onkeyup": "",
      "onmousedown": "",
      "onmousemove": "",
      "onmouseout": "",
      "onmouseup": "",
      "onpaste": "",
      "onresize": "",
      "ontouchend": "",
      "ontouchmove": "",
      "ontouchstart": "",
      "pAll": "",
      "pBottom": "",
      "pLeft": "",
      "pRight": "",
      "pTop": "",
      "placeholder": "Enter text here",
      "popBody": "Body",
      "popClose": "hover",
      "popPosition": "",
      "popStyle": "popover",
      "popTitle": "Title",
      "readonly": "",
      "required": "",
      "right": "auto",
      "rows": "",
      "script": "",
      "spellcheck": "true",
      "style": "",
      "top": 144,
      "validation": "",
      "value": "",
      "valueCols": 10,
      "width": 240
    }
  ],
  "class": "",
  "designHeight": 0,
  "designWidth": 0,
  "expanded_pmp": true,
  "fullScreen": "true",
  "height": 460,
  "id": "customerDelete",
  "language": "JavaScript",
  "left": "0",
  "locked": false,
  "modal": "false",
  "onhide": "",
  "onkeypress": "",
  "onresize": "",
  "onshow": "customerSelect.onshow()",
  "openMode": "none",
  "parentForm": "",
  "position": "absolute",
  "script": "req = \"\"\nquery = \"\"\nresults = \"\"\npw = \"Jays123!\"\u00a0\u00a0// put your database password here\nuserName = \"mml21934\"\nallCustomers = []\n\ncustomerDelete.onshow=function(){\n\u00a0\u00a0\u00a0\u00a0txtResponse.style.height = \"140px\"\n\u00a0\u00a0\u00a0\u00a0// get the data to populate the dropdown with names from database\n\u00a0\u00a0\u00a0\u00a0let query = \"SELECT DISTINCT name FROM customer;\"\n\u00a0\u00a0\u00a0\u00a0req = Ajax(\"https://ormond.creighton.edu/courses/375/ajax-connection.php\", \"POST\", \"host=ormond.creighton.edu&user=mml21934&pass=\" + pw + \"&database=mml21934&query=\" + query)\n\n\u00a0\u00a0\u00a0\u00a0if (req.status == 200) { //transit worked.\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0allCustomers = JSON.parse(req.responseText)\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0// names now in results array - load names into the dropdown\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0drpNames.clear()\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0for (i = 0; i <= allCustomers.length - 1; i++)\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0drpNames.addItem(allCustomers[i])\n\u00a0\u00a0\u00a0\u00a0} else {\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0// transit error\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0NSB.MsgBox(`Error: ${req.status}`);\n\u00a0\u00a0\u00a0\u00a0}\u00a0\u00a0\n}\n\n\ndrpNames.onclick=function(s){\n\u00a0\u00a0\u00a0\u00a0if(typeof(s) == \"object\") {\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0return\n\u00a0\u00a0\u00a0\u00a0} else {\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0//begin the journey\n\u00a0\u00a0\u00a0\u00a0drpNames.value = s // show user selection in drpCustomers\n\u00a0\u00a0\u00a0\u00a0\n\u00a0\u00a0\u00a0\u00a0//create query to check if name exists\n\u00a0\u00a0\u00a0\u00a0query = `SELECT name FROM customer WHERE name = '${s}';`\n\u00a0\u00a0\u00a0\u00a0\n\u00a0\u00a0\u00a0\u00a0req = Ajax(\"https://ormond.creighton.edu/courses/375/ajax-connection.php\", \"POST\", \"host=ormond.creighton.edu&user=mml21934&pass=\" + pw + \"&database=mml21934&query=\" + query)\n\u00a0\u00a0\u00a0\u00a0\n\u00a0\u00a0\u00a0\u00a0if (req.status == 200) {\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0customerName = JSON.parse(req.responseText)\n\u00a0\u00a0\u00a0\u00a0/*\u00a0\u00a0if () {\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0console.log(`The customer called ${customerName}`)\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0else {\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0}*/\n\u00a0\u00a0\u00a0\u00a0} else \n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0console.log(\"error\")\n\u00a0\u00a0\u00a0\u00a0\n\u00a0\u00a0\u00a0\u00a0//DELETE CUSTOMER\n\u00a0\u00a0\u00a0\u00a0query = `DELETE FROM customer WHERE name = '${customerName[0]}';`\n\u00a0\u00a0\u00a0\u00a0// get the other customers who have the same state\n\u00a0\u00a0\u00a0\u00a0req = Ajax(\"https://ormond.creighton.edu/courses/375/ajax-connection.php\", \"POST\", \"host=ormond.creighton.edu&user=mml21934&pass=\" + pw + \"&database=mml21934&query=\" + query)\n\u00a0\u00a0\u00a0\u00a0\n\u00a0\u00a0\u00a0\u00a0if (req.status == 200) { //transit worked.\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0//save the sate of the customer \n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0deletedCustomer = JSON.parse(req.responseText)\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0console.log(deletedCustomer)\n\u00a0\u00a0\u00a0\u00a0} else\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0console.log(\"error\")\n\u00a0\u00a0\u00a0\u00a0\n\u00a0\u00a0\u00a0\u00a0\n\u00a0\u00a0\u00a0\u00a0//QUERY REMAINING CUSTOMERS\n\u00a0\u00a0\u00a0\u00a0query = `SELECT name FROM customer;`\n\u00a0\u00a0\u00a0\u00a0// get the remaining customers\n\u00a0\u00a0\u00a0\u00a0req = Ajax(\"https://ormond.creighton.edu/courses/375/ajax-connection.php\", \"POST\", \"host=ormond.creighton.edu&user=mml21934&pass=\" + pw + \"&database=mml21934&query=\" + query)\n\u00a0\u00a0\u00a0\u00a0\n\u00a0\u00a0\u00a0\u00a0if (req.status == 200) { //transit worked.\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0//save the sate of the customer \n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0remainingCustomers = JSON.parse(req.responseText)\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0console.log(remainingCustomers)\n\u00a0\u00a0\u00a0\u00a0} else\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0console.log(\"error\")\n\u00a0\u00a0\u00a0\u00a0\n\u00a0\u00a0\u00a0\u00a0let customerList = \"\"\n\u00a0\u00a0\u00a0\u00a0for (i = 0; i <= remainingCustomers.length - 1; i++)\n\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0customerList = customerList + remainingCustomers[i] + \"\\n\"\n\u00a0\u00a0\u00a0\u00a0txtResults.value = customerList\n\u00a0\u00a0}\n}",
  "setFocusID": "",
  "style": "",
  "theme": "",
  "top": "0",
  "width": 320,
  "_functions": [
    {
      "!type": "Form",
      "_uuid": "8556ec7213084c818fa5d1bc340f6fc0",
      "cached_js": "",
      "cached_js_script_hash": "d41d8cd98f00b204e9800998ecf8427e",
      "children": [],
      "expanded_pmp": true,
      "id": "customerDelete.onshow",
      "location": [
        7,
        8
      ],
      "script": "",
      "signature": "customerDelete.onshow()"
    },
    {
      "!type": "Form",
      "_uuid": "b126ec10ca01493481acf2891ddb48db",
      "cached_js": "",
      "cached_js_script_hash": "d41d8cd98f00b204e9800998ecf8427e",
      "children": [],
      "expanded_pmp": true,
      "id": "drpNames.onclick",
      "location": [
        27,
        28
      ],
      "script": "",
      "signature": "drpNames.onclick(s)"
    }
  ]
}