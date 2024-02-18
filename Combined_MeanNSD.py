import math ##Math Class for sqrt operation
def comb_mean(n1,n2,x1,x2):
"""Combined Mean Calculator for 2 datasets."""
    Mean=(x1*n1+x2*n2)/(n1+n2)
    return Mean
def comb_SD(n1,n2,x1,x2,s1,s2):
"""Combined Standard Deviation Calculator for 2 datasets"""
    x=comb_mean(n1,n2,x1,x2)
    var=(n1*s1*s1+n2*s2*s2+n1*(x1-x)*(x1-x)+n2*(x2-x)*(x2-x))/(n1+n2)
    s=math.sqrt(var)
    return s
    
def main():
    x1=float(input("Enter First Mean: "))
    x2=float(input("Enter Second Mean: "))
    n1=int(input("Enter n for dataset1: "))
    n2=int(input("Enter n for dataset2: "))
    s1=float(input("Enter First SD: "))
    s2=float(input("Enter Second SD: "))
    Mean=comb_mean(n1,n2,x1,x2)
    s=comb_SD(n1,n2,x1,x2,s1,s2)
    print("The combied mean is: ",Mean)
    print("The combied SD is: ",s)
    
if __name__ == "__main__":#Code runs automaticaaly only if the script is run as a main program. 
    main()