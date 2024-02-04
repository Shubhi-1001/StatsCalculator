###THIS PROGRAM INPUTS A DATA SET FROM THE USER AND THEN SORTS IT OUT INTO A DISCRETE FREQUENCY DISTRIBUTION###

def create_frequency_distribution(data):
    #Creating an empty dictionary
    frequency_dict = {}

    # Count occurrences of each unique element in the data
    for item in data:
        if item in frequency_dict:
            frequency_dict[item] += 1
        else:
            frequency_dict[item] = 1
    frequency_dict = {int(key): int(value) for key, value in frequency_dict.items()}
return frequency_dict

def main():
    # Get data from the user
    user_input = input("Enter data separated by spaces: ")#datatype of user_input is str
    
    # Split the input into a list of items
    data = user_input.split()#type(data)=str

    # Create a frequency distribution
    frequency_distribution = create_frequency_distribution(data)

    # Display the frequency distribution
    print("\nFrequency Distribution:")
    for item, frequency in frequency_distribution.items():
        print(f"{item}: {frequency}")#usage of f-string 

if __name__ == "__main__":#Code runs automaticaaly only if the script is run as a main program. 
    main()


