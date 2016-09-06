class CacheProfessionCount < ActiveRecord::Migration
  def up
  	execute "update professions set records_count=(select count(*) from records where profession_id=professions.id)"
  end

  def down
  	execute "update professions set records_count=(select count(1) from records where profession_id=professions.id)"
  end
end
