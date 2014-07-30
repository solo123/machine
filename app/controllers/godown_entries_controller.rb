class GodownEntriesController < ResourcesController
  def check
    load_object
    @object.recaculate
    unless @object.valid_for_godown
      flash[:error] = @object.errors.full_messages.to_sentence

    end
    redirect_to @object
  end

  def import
    load_object
    unless @object.do_import
      flash[:error] = @object.errors.full_messages.to_sentence
    end
    render :show
  end

  def do_import
    load_object
    @object.recaculate
    unless @object.do_godown
      flash[:error] = @object.errors.full_messages.to_sentence
    end
    redirect_to @object
  end

  def clear_items
    load_object
    OrderImport.destroy_all
    redirect_to action: :edit
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def godown_entry_params
      params.require(:godown_entry).permit(:godown_number, :product_id, :total_items, :total_amount, :status, :creator_id)
    end
end
