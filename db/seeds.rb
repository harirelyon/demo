# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do |user|
  User.create!(ref_no: "REL-#{user+1}",
               dob: Faker::Date.birthday(18, 65),
               pay_days: Faker::Boolean.boolean,
               acc_no: Faker::Bank.account_number,
               pf_no: Faker::Bank.swift_bic,
               salary_structure: Faker::Job.position,
               pan: Faker::Bank.swift_bic,
               branch: Faker::Address.city,
               designation: Faker::Job.title,
               occupation: Faker::Job.employment_type,
               grade: Faker::Job.seniority,
               leave_policy: 'Regular',
               emp_name: Faker::Name.unique.name,
               doj: Faker::Date.backward(500),
               present_days: Faker::Boolean.boolean,
               bank_name: Faker::Bank.name,
               esi_no: Faker::Bank.swift_bic,
               att_structure: Faker::Job.position,
               uan: Faker::Bank.iban("be"),
               department: Faker::Job.field,
               division: Faker::Job.seniority,
               section: Faker::Job.field,
               basic: Faker::Number.number(5),
               da: Faker::Number.number(4),
               hra: Faker::Number.number(4),
               loan:Faker::Number.number(4),
               canteen: Faker::Number.number(3),
               total_earnings: Faker::Number.number(5),
               total_deductions: Faker::Number.number(3),
               net_salary: Faker::Number.number(5),
               in_words: 'Some Thousands and Hundreds',
               name: Faker::Name.unique.name,
               email: Faker::Internet.email,
               address: Faker::Address.full_address,
               phone_number: Faker::PhoneNumber.cell_phone,
               gender: Faker::Gender.binary_type,
               team: Faker::Team.name,
               funny_name: Faker::FunnyName.name,
               job: Faker::Job.title)
end
