import numpy as np

# Original array
original_array = np.array([[1., 2., 3.],
                           [4., 5., np.nan],
                           [7., 8., 9.],
                           [1.0, 1., np.nan]])

print("Original array:")
print(original_array)

# Function to remove non-numeric rows
def remove_non_numeric_rows(arr):
    return arr[~np.isnan(arr).any(axis=1)]

# Remove non-numeric rows
filtered_array = remove_non_numeric_rows(original_array)

print("Remove all non-numeric elements of the said array:")
print(filtered_array)






import datetime

class BankAccount:
    def __init__(self, account_number, customer_name, initial_balance):
        self.account_number = account_number
        self.customer_name = customer_name
        self.balance = initial_balance
        self.date_of_opening = datetime.date.today()

    def deposit(self, amount):
        if amount > 0:
            self.balance += amount
            print(f"Deposit of {amount} successfully made to account {self.account_number}.")
        else:
            print("Invalid deposit amount.")

    def withdraw(self, amount):
        if amount > 0:
            if self.balance >= amount:
                self.balance -= amount
                print(f"Withdrawal of {amount} successfully made from account {self.account_number}.")
            else:
                print("Insufficient funds.")
        else:
            print("Invalid withdrawal amount.")

    def check_balance(self):
        print(f"Account {self.account_number} balance: {self.balance}")

# Example usage:
account = BankAccount("123456789", "John Doe", 1000)
account.check_balance()  # Output: Account 123456789 balance: 1000
account.deposit(500)     # Output: Deposit of 500 successfully made to account 123456789.
account.check_balance()  # Output: Account 123456789 balance: 1500
account.withdraw(2000)   # Output: Insufficient funds.
account.withdraw(200)    # Output: Withdrawal of 200 successfully made from account 123456789.
account.check_balance()  # Output: Account 123456789 balance: 1300




import pandas as pd

# Load the dataset
df = pd.read_csv('automobile.csv')

# 1. Clean the dataset and update the CSV file
cleaned_df = df.replace({'?': pd.NA, 'n.a': pd.NA, 'NaN': pd.NA}).dropna()
cleaned_df.to_csv('cleaned_automobile.csv', index=False)

# 2. Find the most expensive car company name
most_expensive_company = cleaned_df.loc[cleaned_df['price'].idxmax(), 'company']

# 3. Print All Toyota Cars detail
toyota_cars = cleaned_df[cleaned_df['company'].str.lower() == 'toyota']
print("Most expensive car company:", most_expensive_company)
print("All Toyota Cars detail:")
print(toyota_cars)



# Define the thermostat regular agent function
def thermostat_control(temperature, lower_threshold, upper_threshold):
    if temperature < lower_threshold:
        return "Turn on heating system"
    elif temperature > upper_threshold:
        return "Turn on cooling system"
    else:
        return "Maintain current state"

# Temperature readings
temperatures = [20, 22, 25, 18, 23]

# Comfort range
lower_threshold = 20
upper_threshold = 23

# Determine actions for each temperature reading
for idx, temp in enumerate(temperatures, start=1):
    action = thermostat_control(temp, lower_threshold, upper_threshold)
    print(f"Temperature {idx}: {temp}°C - {action}")




