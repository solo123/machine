class PrepareData < ActiveRecord::Base
  def self.import(import_text, usage)
    import_text.split(/\n/).each do |line|
      row = self.new(usage: usage, status: 0)
      line.split(/[\t]/).each_with_index do |dt, idx|
        row["c#{idx}"] = dt if dt && !dt.blank?
      end
      row.save
    end
  end
end
