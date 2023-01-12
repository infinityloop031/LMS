class CreateBatch < ActiveRecord::Migration[7.0]
  def change
    create_table :batches do |t|
      t.bigint :batch_number

      t.timestamps
    end
  end
end
