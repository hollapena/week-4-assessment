log_file = open("um-server-01.txt")  #This line creates a variable called log_file that contains the open server file.


def sales_reports(log_file):  #This declares the function and accepts a parameter called log_file.
    for line in log_file:   #This tells it to loop through the lines in log_file.
        line = line.rstrip()  #This changes line to a version of itself without any trailing whitespace at the end.
        day = line[0:3]  #This makes a slice called day and specifies that it should contain the characters starting from and including index 0 and stopping at and excluding index 3.
        if day == "Mon":  #These two lines are an if statement saying that if the slice contains the string "Tue"
            print(line)   #the program should print (line) to the console.


sales_reports(log_file)   #This tells the computer to run the function and calls log_file as the parameter. 


def more_than_10(log_file):
    for line in log_file:
        line = line.rstrip()
        line_array=line.split(' ')
        quantity = int(line_array[2])
        if quantity > 10:
            print(line)

more_than_10(log_file)
