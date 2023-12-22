# db/seeds.rb

# Seed Categories
categories = ['Entertainment', 'Transportation', 'School Fees', 'License Fees', 'Others']
categories.each do |category_name|
  Category.create(name: category_name)
end

# Seed Transactions
Transaction.create([
  { title: 'Movie Night', description: 'Tickets and snacks', amount: 30.00, bank_name: 'Habib Bank', archived: false, category: Category.find_by(name: 'Entertainment') },
  { title: 'Bus Fare', description: 'Monthly transportation expense', amount: 20.00, bank_name: 'HBL', archived: false, category: Category.find_by(name: 'Transportation') },
  { title: 'School Tuition', description: 'Monthly school tuition fees', amount: 100.00, bank_name: 'UBL', archived: false, category: Category.find_by(name: 'School Fees') },
  { title: 'Driver License Renewal', description: 'Renewal of license', amount: 50.00, bank_name: 'National Bank', archived: false, category: Category.find_by(name: 'License Fees') },
  { title: 'Miscellaneous Expense', description: 'Other miscellaneous expense', amount: 15.00, bank_name: 'ABC Bank', archived: false, category: Category.find_by(name: 'Others') }
])

puts 'Seed data has been created.'
