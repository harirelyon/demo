# App Home Controller
require 'open-uri'

class HomeController < ApplicationController
  def index
    @users = User.all

    respond_to do |format|
      format.html
      # format.pdf { render_pdf(@users) }
      format.pdf { render_list_pdf(@users) }
    end
  end

  def render_pdf(users)
    report = Thinreports::Report.new layout: File.join(Rails.root,
                                                       'app',
                                                       'reports',
                                                       'defaultMasterPaySlip.tlf')

    report.list.header do |header|
      header.item(:company_name).value('Relyon')
      header.item(:company_address).value('918, 5th Main Rd, Sector 7, HSR Layout, Bengaluru, Karnataka 560102')
      header.item(:company_logo).src(open('http://erachana.net/images/Clients_List/relyon.png'))
      header.item(:company_logo_1).src(open('http://erachana.net/images/Clients_List/relyon.png'))
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
                   in_words: user.in_words,
                   basic_1: user.basic,
                   da_1: user.da,
                   hra_1: user.hra,
                   loan_1: user.loan,
                   canteen_1: user.canteen,
                   total_earnings_1: user.total_earnings,
                   total_deductions_1: user.total_deductions,
                   net_salary_1: user.net_salary,
                   in_words_1: user.in_words
      end
    end

    send_data report.generate, filename: 'users.pdf',
                               type: 'application/pdf',
                               disposition: 'attachment'
  end

  def render_list_pdf(users)
    report = Thinreports::Report.new layout: File.join(Rails.root,
                                                       'app',
                                                       'reports',
                                                       'advanceListExperiment.tlf')

    users.each do |user|
      report.start_new_page do |page|
        page.list do |list|
          list.header { |header| header.item(:company_name).value('Relyon') }
          user.attributes.each { |key, value| list.add_row head: key, value: value }
        end
      end
    end

    send_data report.generate, filename: 'users.pdf',
                               type: 'application/pdf',
                               disposition: 'attachment'
  end
end
