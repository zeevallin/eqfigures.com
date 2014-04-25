class AddUniqueIndexToChoiceAttributes < ActiveRecord::Migration

  def up
    choices = Choice.all.inject({}) do |hash, choice|
      permitation = ([choice.user_id] + [choice.a, choice.b].sort)
      hash[permitation] ||= []
      hash[permitation].push(choice.id)
      hash
    end

    redundant_choice_ids = choices.collect{|k,v|v.drop(1)}.flatten
    redundant_choice_ids.each_slice(100) do |ids|
      Choice.destroy(ids)
      puts "removed #{ids.count} redundant things"
    end

    add_index "choices", ["user_id", "a", "b"], :unique => true
  end

  def down
    remove_index "choices", ["user_id", "a", "b"]
  end

end
