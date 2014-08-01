class AccountsController < ResourcesController
  def index
    @collection ||= Account.where('balance <> 0 and partner_id > 0')
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:partner_id, :balance)
    end
end
