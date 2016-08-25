class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
    	t.date :collection_date
			t.string :responsible_for_collecting

			#DADOS SOCIOMEDOGRÁFICOS
			t.string :medical_record_number
			t.date :birthday
			t.date :birthplace																	#Qd1
			t.string :place_residence														#Qd2
			t.integer :age																			#Qd3
			t.integer :sex																			#Qd4
			t.string :breed #raça																#Qd5
			t.integer :schooling																#Qd6
			t.string :family_income #renda familiar							#Qd7
			t.integer :dependent_income #dependentes da renda		#Qd8
			t.integer :marital_status														#Qd9
			t.integer :marital_status_duration									#Qd10
			t.integer :type_of_residence												#Qd11
			t.integer :characterization_of_housing							#Qd12
			t.string :characterization_of_housing_other					#Qd12_
			t.string :occupation																#Qd13

			#DADOS CLÍNICOS
			t.integer :situation_nch_sitema																				#Qc1
			t.string :cause_of_death																							#Qc2
			t.integer :diagnosis_time_and_end_of_treatment_years, default: 0			#Qc3
			t.integer :diagnosis_time_and_end_of_treatment_months, default: 0			#Qc3_
			t.integer :hsct_follow_up_of_the_nhc_years, default: 0								#Qc4
			t.integer :hsct_follow_up_of_the_nhc_months, default: 0								#Qc4_
			t.integer :hla_major_tests																						#Qc5
			t.string :hla_major_tests_other																				#Qc5_
			t.integer :there_examination_icd_10																		#Qc6
			t.string :there_examination_icd_10_other															#Qc6_
			t.string :diagnosis_doctor_in_medical_records													#Qc7
			t.string :described_comorbidities																			#Qc8
			t.string :treatments_described																				#Qc9
			t.integer :type_of_hsct																								#Qc10
			t.boolean :presence_of_gvhd																						#Qc11
			t.integer :forms_of_gvhd																							#Qc12
			t.integer :survival_time_years, default: 0														#Qc13
			t.integer :survival_time_months, default: 0														#Qc13_

      t.timestamps null: false
    end
  end
end
