*** Variables ***
${login_button}                           id:Login
${user_name_textbox}                      id:username
${password_textbox}                       id:password
${user_nav_label}                         id:userNavLabel
${login from user details button}         //input[@name = 'login']
${logged as message}                      //div[@id="AppBodyHeader"]//span[contains(@class,'highImportance')][contains(.,"Logged in as")]
${logout menu item}                       //div/a[@title="Logout"]
${switch to le}                           //div[@class="navLinks"]//a[.="Switch to Lightning Experience"]
${le header}                              //header[@id="oneHeader"]
${le user button}                         //button//img[@alt="User"]/ancestor::button
${switch to classic}                      //a[.="Switch to Salesforce Classic"]
${user profile card}                      //div[@class="oneUserProfileCard"]