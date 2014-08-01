module Biz
  class ImportBiz < BasicBiz
    def initialize(usage)
      @usage = usage
      @current_row = 0
    end

    def rows_count
      0
    end
    def next_row
      @current_row += 1
    end

    def import(import_text)
      PrepareData.import(import_text, @usage)
    end

    def cell(cell_index)
      p = PrepareData.where(usage: @usage, x: @current_row, y: cell_index)
      p ? p.val : nil
    end

    def row_info
      cell(1000)
    end
    def row_info= (info)
      p = PrepareData.find_or_create_by(usage: @usage, x: @current_row, y: 1000)
      p.val = info
      p.save
    end
  end
end
