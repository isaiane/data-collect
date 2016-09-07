class Record < ActiveRecord::Base
	belongs_to :profession, counter_cache: true
	has_one :professions

	validates_presence_of :collection_date, :responsible_for_collecting, :medical_record_number, :birthday, :birthplace, :place_residence, :age, :sex, :breed, :schooling, :marital_status, :profession, :situation_nch_sitema, :cause_of_death, :diagnosis_time_and_end_of_treatment_years, :diagnosis_time_and_end_of_treatment_months, :hsct_follow_up_of_the_nhc_years, :hsct_follow_up_of_the_nhc_months, :hla_major_tests, :there_examination_icd_10, :diagnosis_doctor_in_medical_records, :described_comorbidities, :treatments_described, :type_of_hsct, :presence_of_gvhd, :forms_of_gvhd, :survival_time_years, :survival_time_months

	# :type_of_residence_other,
	# :characterization_of_housing_other,
	# :hla_major_tests_other,

	@@sexs = {
		1 => "Masculino",
		2 => "Feminino"
	}

	@@schoolings = {
		1 => "Superior completo com pós-graduação",
		2 => "Superior completo",
		3 => "Superior incompleto",
		4 => "Ensino médio completo",
		5 => "Ensino médio incompleto",
		6 => "Ensino fundamental completo",
		7 => "Ensino fundamental incompleto",
		8 => "Analfabeto"
	}

	@@marital_status_list = {
		1 => "Solteiro",
		2 => "Casado",
		3 => "Viúvo",
		4 => "União Estável"
	}

	@@type_of_residence_list = {
		1 => "Própria",
		2 => "Alugada",
		3 => "Cedida",
		4 => "Outra"
	}

	@@characterization_of_housing_list = {
		1 => "Casa urbana",
		2 => "Casa rural",
		3 => "Apartamento",
		4 => "Outra"
	}

	@@situation_nch_sitema_list = {
		1 => "Em tratamento",
		2 => "Tratamento finalizado",
		3 => "Encaminhado",
		4 => "Óbito",
		5 => "Abandono"
	}

	@@hla_major_tests_list = {
		1 => "Biologia molecular",
		2 => "Sequence-Specific Primers (SSP)",
		3 => "Sequence-Specific Oligonucleotides Probes (SSOP)",
		4 => "Outro"
	}

	@@there_examination_icd_10_list = {
		false => "Não",
		true => "Sim"
	}

	@@presence_of_gvhd_list = {
		false => "Não",
		true => "Sim"
	}

	@@forms_of_gvhd_list = {
		1 => "Aguda",
		2 => "Crônica"
	}

	@@type_of_hsct_list = {
		1 => "Autogênico",
		2 => "Alogênico",
		3 => "Singênico",
		5 => "De cordão umbilical",
		6 => "Placentário"
	}

	def sexs
		@@sexs
	end

	def schoolings
		@@schoolings
	end

	def marital_status_list
		@@marital_status_list
	end

	def type_of_residence_list
		@@type_of_residence_list
	end

	def characterization_of_housing_list
		@@characterization_of_housing_list
	end

	def situation_nch_sitema_list
		@@situation_nch_sitema_list
	end

	def hla_major_tests_list
		@@hla_major_tests_list
	end

	def there_examination_icd_10_list
		@@there_examination_icd_10_list
	end

	def type_of_hsct_list
		@@type_of_hsct_list
	end

	def presence_of_gvhd_list
		@@presence_of_gvhd_list
	end

	def forms_of_gvhd_list
		@@forms_of_gvhd_list
	end

	def self.search(search, sort, order, page)
    if search
      if order == "desc"
        where("medical_record_number LIKE :search", search: "%#{search}%").sort_by { |h| h["#{sort}"] }.reverse.paginate(page: page, per_page: 9)
      else
        where("medical_record_number LIKE :search", search: "%#{search}%").sort_by { |h| h["#{sort}"] }.paginate(page: page, per_page: 9)
      end
    end
  end
end
