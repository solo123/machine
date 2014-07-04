class GodownEntriesController < ResourcesController
  def import
    params.permit!
    @object = GodownEntry.new(params[:godown_entry])
    if @object.changed_for_autosave?
      @object.import
    end
    redirect_to @object
  end

  def valid_for_godown
    return false unless self.godown_number
    return false if GodownEntry.where(godown_number: self.godown_number)
    return false if self.total_items
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def godown_entry_params
      params.require(:godown_entry).permit(:godown_number, :total_items, :total_amount, :status, :creator_id)
    end
end
