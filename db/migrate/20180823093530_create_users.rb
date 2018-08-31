class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :phone_number
      t.string :gender
      t.string :team
      t.string :funny_name
      t.string :job
      t.string :ref_no
      t.string :dob
      t.string :pay_days
      t.string :acc_no
      t.string :pf_no
      t.string :salary_structure
      t.string :pan
      t.string :branch
      t.string :designation
      t.string :occupation
      t.string :grade
      t.string :leave_policy
      t.string :emp_name
      t.string :doj
      t.string :present_days
      t.string :bank_name
      t.string :esi_no
      t.string :att_structure
      t.string :uan
      t.string :department
      t.string :division
      t.string :section
      t.string :basic
      t.string :da
      t.string :hra
      t.string :loan
      t.string :canteen
      t.string :total_earnings
      t.string :total_deductions
      t.string :net_salary
      t.string :in_words
      t.timestamps null: false
    end
  end
end
