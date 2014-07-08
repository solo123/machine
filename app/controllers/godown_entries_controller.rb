class GodownEntriesController < ResourcesController
  def import
    params.permit!
    @object = GodownEntry.new(params[:godown_entry])
    if @object.changed_for_autosave?
      @object.import
    end
    redirect_to @object
  end
  def check
    load_object
    unless @object.valid_for_godown
      flash[:error] = @object.errors.messages.to_
    end
    redirect_to @object
  end

  def do_import
    load_object
    @object.do_godown
    redirect_to @object
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def godown_entry_params
      params.require(:godown_entry).permit(:godown_number, :product_id, :total_items, :total_amount, :status, :creator_id)
    end
end
