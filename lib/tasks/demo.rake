namespace :demo do
	desc "Reset Database"
	task database: :environment do
		Rake::Task['db:drop'].execute
		Rake::Task['db:create'].execute
		Rake::Task['db:migrate'].execute
		Rake::Task['db:seed'].execute
	end
end
