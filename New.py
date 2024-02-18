def mean(data):
"""Input data which is a list of numbers and returns mean"""
  sum=0
  n=0
  for num in data:
    sum=sum+num
    n+=1
  mean=sum/n
  return mean

def main():
  user_input=input("Enter data points seperated by space: ") ###user_input is a long chain of numbers in a string format###
  Data_str=user_input.split(" ")      #Data_str is a list of numbers still in string format like "58"##
  data=[int(i) for i in Data_str]    ##Using List Comprehension to make a list of operable numbers instead of a list of string literals##
  x=mean(data)
  print("Mean is: ",x)
if __name__ == "__main__":#Code runs automaticaaly only if the script is run as a main program. 
    main()
  
