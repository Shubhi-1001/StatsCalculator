def mean(data):
  sum=0
  n=0
  for num in data:
    sum=sum+num
    n+=1
  mean=sum/n
  return mean

def main():
  user_input=input("Enter data points seperated by space: ")
  ###user_input is a long chain of numbers in a string format###
  Data_str=user_input.split(" ")
  # for i in Data_str:
  data=[int(i) for i in Data_str]
  x=mean(data)
  print("Mean is: ",x)
  
