# App Home Controller
class HomeController < ApplicationController
  def index
    @users = User.all

    # respond_to do |format|
    #   format.html
    #   # format.pdf { render_pdf(@users) }
    #   # format.pdf { render_list_pdf(@users) }
    #   format.pdf { render_test_payslip_pdf(@users) }
    # end

    respond_to do |format|
    format.html
      format.pdf { send_data Report.generate(params[:report_type], @users), filename: 'users.pdf', type: 'application/pdf', disposition: 'attachment' }
    end
  end

  # def render_pdf(users)
  #   report = Thinreports::Report.new layout: File.join(Rails.root,
  #                                                      'app',
  #                                                      'reports',
  #                                                      'defaultMasterPaySlip.tlf')

  #   report.list.header do |header|
  #     header.item(:company_name).value('Relyon')
  #     header.item(:company_address).value('918, 5th Main Rd, Sector 7, HSR Layout, Bengaluru, Karnataka 560102')
  #     header.item(:company_logo).src(open('http://erachana.net/images/Clients_List/relyon.png'))
  #     header.item(:company_logo_1).src(open('http://erachana.net/images/Clients_List/relyon.png'))
  #     header.item(:paymonth).value('Jul/2013')
  #   end

  #   users.each do |user|
  #     report.list.add_row do |row|
  #       row.values ref_no: user.ref_no,
  #                  dob: user.dob,
  #                  pay_days: user.pay_days,
  #                  acc_no: user.acc_no,
  #                  pf_no: user.pf_no,
  #                  salary_structure: user.salary_structure,
  #                  pan: user.pan,
  #                  branch: user.branch,
  #                  designation: user.designation,
  #                  occupation: user.occupation,
  #                  grade: user.grade,
  #                  leave_policy: user.leave_policy,
  #                  emp_name: user.emp_name,
  #                  doj: user.doj,
  #                  present_days: user.present_days,
  #                  bank_name: user.bank_name,
  #                  esi_no: user.esi_no,
  #                  att_structure: user.att_structure,
  #                  uan: user.uan,
  #                  department: user.department,
  #                  division: user.division,
  #                  section: user.section,
  #                  basic: user.basic,
  #                  da: user.da,
  #                  hra: user.hra,
  #                  loan: user.loan,
  #                  canteen: user.canteen,
  #                  total_earnings: user.total_earnings,
  #                  total_deductions: user.total_deductions,
  #                  net_salary: user.net_salary,
  #                  in_words: user.in_words,
  #                  basic_1: user.basic,
  #                  da_1: user.da,
  #                  hra_1: user.hra,
  #                  loan_1: user.loan,
  #                  canteen_1: user.canteen,
  #                  total_earnings_1: user.total_earnings,
  #                  total_deductions_1: user.total_deductions,
  #                  net_salary_1: user.net_salary,
  #                  in_words_1: user.in_words
  #     end
  #   end

  #   send_data report.generate, filename: 'users.pdf',
  #                              type: 'application/pdf',
  #                              disposition: 'attachment'
  # end

  # def render_list_pdf(users)
  #   report = Thinreports::Report.new layout: File.join(Rails.root,
  #                                                      'app',
  #                                                      'reports',
  #                                                      'advanceListExperiment.tlf')

  #   users.each do |user|
  #     report.start_new_page do |page|
  #       page.list do |list|
  #         list.header { |header| header.item(:company_name).value('Relyon') }
  #         user.attributes.each { |key, value| list.add_row head: key, value: value }
  #       end
  #     end
  #   end

  #   send_data report.generate, filename: 'users.pdf',
  #                              type: 'application/pdf',
  #                              disposition: 'attachment'
  # end

  # def render_test_payslip_pdf(users)
  #   report = Thinreports::Report.new layout: File.join(Rails.root,
  #                                                      'app',
  #                                                      'reports',
  #                                                      'testPaySlip.tlf')
  #   users.each do |user|
  #     report.start_new_page do |page|
  #       page.list do |list|
  #         list.header do |header|
  #           header.item(:company_name).value('Relyon')
  #           header.item(:salarymonth).value('Jul/2018')
  #           header.item(:emp_name).value(user.emp_name)
  #           header.item(:designation).value(user.designation)
  #           header.item(:ref_no).value(user.ref_no)
  #           header.item(:paymonth).value('Aug/2018')
  #           header.item(:presentdays).value(user.pay_days)
  #         end

  #         list.add_row do |row|
  #           row.values total_earnings: user.total_earnings,
  #                     total_deductions: user.total_deductions,
  #                     net_salary: user.net_salary
  #         end
  #       end

  #       user.attributes.each do |key, value|
  #         page.list(:earnings).add_row do |earningRow|
  #           earningRow.values head: key,
  #                             value: value || 'N/A'
  #         end

  #         page.list(:deduction).add_row do |deductionRow|
  #           deductionRow.values head: key,
  #                             value: value || 'N/A'
  #         end
  #       end
  #     end
  #   end

  #   send_data report.generate, filename: 'users.pdf',
  #                              type: 'application/pdf',
  #                              disposition: 'attachment'
  # end
end
