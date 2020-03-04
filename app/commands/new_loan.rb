class NewLoan
  prepend SimpleCommand
  attr_reader :user, :loan_params, :klass

  def initialize(loan_type:, user_id:, loan_params:)
    @user = User.find_by(id: user_id)
    @loan_params = loan_params
    @klass = MultiPurposeLoan if loan_type == "multi_purpose_loan"
    @klass = EducationalLoan if loan_type == "educational_loan"
    @klass = BusinessLoan if loan_type == "business_loan"
  end

  def call
    return create_loan if user.present? && klass.present?
    return error_message("No params received.")
  end

private
  def create_loan
    loan = klass.new(loan_params)
    return true, loan if loan.save
    return error_message(loan.errors.full_messages.join(", "))
  end

  def error_message(message)
    errors.add :base, message
    return false, nil
  end
end