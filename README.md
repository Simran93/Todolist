# Todolist : This app allows to create new to-do lists and all the data is persisted locally on the device using CoreData with SQLite as a database.
 For instance, you can make  different sections like shopping, travelling, work etc.
 You can tick the items off and swipe to delete them, search any item from the to-do list. As the number of items gets increased, the colour of items in a section gets darker and darker.

Purpose: The main purpose is to persist data locally on the device.I have created different versions of the application using diffrent methods of persisting data. 
1. To store small bits of data into plist, Userdefaults is used.
2. Encoding and decoding data with NSCoder to save and get data back from Documents directory from iPhone.
3. Core Data is implemented using SQLite as a database to store big chunks of data.



