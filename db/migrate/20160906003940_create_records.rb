class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
    	t.date :collection_date
			t.string :responsible_for_collecting

			#DADOS SOCIOMEDOGRÁFICOS
			t.string :medical_record_number
			t.date :birthday
			t.string :birthplace																	#Qd1
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
			t.string :type_of_residence_other										#Qd11_
			t.integer :characterization_of_housing							#Qd12
			t.string :characterization_of_housing_other					#Qd12_
			t.references :profession														#Qd13

			#DADOS CLÍNICOS
			t.integer :situation_nch_sitema																				#Qc1
			t.text :cause_of_death																							  #Qc2
			t.integer :diagnosis_time_and_end_of_treatment_years									#Qc3
			t.integer :diagnosis_time_and_end_of_treatment_months									#Qc3_
			t.integer :hsct_follow_up_of_the_nhc_years														#Qc4
			t.integer :hsct_follow_up_of_the_nhc_months														#Qc4_
			t.integer :hla_major_tests																						#Qc5
			t.string :hla_major_tests_other																				#Qc5_
			t.integer :there_examination_icd_10																		#Qc6
			t.string :there_examination_icd_10_note 															#Qc6_
			t.text :diagnosis_doctor_in_medical_records													  #Qc7
			t.text :described_comorbidities																			  #Qc8
			t.text :treatments_described																				  #Qc9
			t.integer :type_of_hsct																								#Qc10
			t.text :type_of_hsct_note																							#Qc10_
			t.integer :presence_of_gvhd																						#Qc11
			t.integer :forms_of_gvhd																							#Qc12
			t.integer :survival_time_years																				#Qc13
			t.integer :survival_time_months																				#Qc13_

      t.timestamps null: false
    end
  end
end
