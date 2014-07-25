class GodownEntriesController < ResourcesController
  def check
    load_object
    unless @object.valid_for_godown
      flash[:error] = @object.errors.full_messages.to_sentence

    end
    redirect_to @object
  end

  def do_import
    load_object
    @object.do_godown
    redirect_to @object
  end

  def clear_items
    load_object
    if @object.status == 0
      @object.godown_items.where(status: 0).destroy_all
      @object.recaculate
    end
  
    redirect_to action: :edit
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def godown_entry_params
      params.require(:godown_entry).permit(:godown_number, :product_id, :total_items, :total_amount, :status, :creator_id)
    end
end
