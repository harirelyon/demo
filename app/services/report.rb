require 'open-uri'

class Report
  def self.generate(type, users)
    if type.eql?('default_payslip')
      default_payslip(users)
    elsif type.eql?('detailed_payslip')
      detailed_payslip(users)
    elsif type.eql?('employee_details')
      list_employee_details(users)
    end
  end
  def self.default_payslip(users)
    report = Thinreports::Report.new layout: File.join(Rails.root,
                                                       'app',
                                                       'reports',
                                                       'refactored',
                                                       'defaultPaySlip.tlf')
    users.each do |user|
      report.start_new_page do |page|
        page.list do |list|
          list.header do |header|
            header.item(:company_name).value('Relyon')
            header.item(:salarymonth).value('Jul/2018')
            header.item(:emp_name).value(user.emp_name)
            header.item(:designation).value(user.designation)
            header.item(:ref_no).value(user.ref_no)
            header.item(:paymonth).value('Aug/2018')
            header.item(:presentdays).value(user.pay_days)
          end

          list.add_row do |row|
            row.values total_earnings: user.total_earnings,
                      total_deductions: user.total_deductions,
                      net_salary: user.net_salary
          end
        end

        user.attributes.each do |key, value|
          page.list(:earnings).add_row do |earningRow|
            earningRow.values head: key,
                              value: value || 'N/A'
          end

          page.list(:deduction).add_row do |deductionRow|
            deductionRow.values head: key,
                              value: value || 'N/A'
          end
        end
      end
    end

    report.generate
  end

  def self.detailed_payslip(users)
    report = Thinreports::Report.new layout: File.join(Rails.root,
                                                       'app',
                                                       'reports',
                                                       'refactored',
                                                       'detailedPaySlip.tlf')

    report.list.header do |header|
      header.item(:company_name).value('Relyon')
      header.item(:company_address).value('918, 5th Main Rd, Sector 7, HSR Layout, Bengaluru, Karnataka 560102')
      header.item(:company_logo).src(open('http://erachana.net/images/Clients_List/relyon.png'))
      header.item(:paymonth).value('Jul/2013')
    end

    users.each do |user|
      report.list.add_row do |row|
        row.values ref_no: user.ref_no,
                   dob: user.dob,
                   pay_days: user.pay_days,
                   acc_no: user.acc_no,
                   pf_no: user.pf_no,
                   salary_structure: user.salary_structure,
                   pan: user.pan,
                   branch: user.branch,
                   designation: user.designation,
                   occupation: user.occupation,
                   grade: user.grade,
                   leave_policy: user.leave_policy,
                   emp_name: user.emp_name,
                   doj: user.doj,
                   present_days: user.present_days,
                   bank_name: user.bank_name,
                   esi_no: user.esi_no,
                   att_structure: user.att_structure,
                   uan: user.uan,
                   department: user.department,
                   division: user.division,
                   section: user.section,
                   basic: user.basic,
                   da: user.da,
                   hra: user.hra,
                   loan: user.loan,
                   canteen: user.canteen,
                   total_earnings: user.total_earnings,
                   total_deductions: user.total_deductions,
                   net_salary: user.net_salary,
                   in_words: user.in_words
      end
    end

    report.generate
  end

  def self.list_employee_details(users)
    report = Thinreports::Report.new layout: File.join(Rails.root,
                                                       'app',
                                                       'reports',
                                                       'refactored',
                                                       'listEmployeeDetails.tlf')

    users.each do |user|
      report.start_new_page do |page|
        page.list do |list|
          list.header { |header| header.item(:company_name).value('Relyon') }
          user.attributes.each { |key, value| list.add_row head: key, value: value }
        end
      end
    end

    report.generate
  end
end
