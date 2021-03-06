require 'faker'
require 'pp'
require 'csv'

def generate_people
  people = []
  i = 0
  while i < 350
    people << [Faker::Name.first_name, Faker::Name.last_name]
    i += 1
  end
  people
end

def generate_companies
  companies = []
  i = 0
  while i < 27
    companies << [Faker::Company.name]
    i += 1
  end
  companies
end

def generate_employment
  employment = []
  people = generate_people
  companies = generate_companies
  i = 0
  people.each do |person|
    employment << person + companies[i]
    i += 1
    if i == 27
      i = 0
    end
  end
  employment
end

def generate
CSV.open("data/company.csv", "wb") do |csv|
  generate_employment.each do |emp|
    csv << emp
  end
end
end

generate

# Look at the CSV docs http://ruby-doc.org/stdlib-2.1.1/libdoc/csv/rdoc/CSV.html