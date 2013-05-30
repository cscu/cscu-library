begin
  # http://www.mattvanhorn.com/2012/07/30/rake-analysis/

  desc "Run rails_best_practices and inform about found issues"
  task :rails_best_practices do
    require 'rails_best_practices'
    app_root = Rake.application.original_dir
    analyzer = RailsBestPractices::Analyzer.new(app_root, {
      'spec' => true,
      'feature' => true
    })
    analyzer.analyze
    analyzer.output
    fail "found bad practices" if analyzer.runner.errors.size > 0
  end

  desc "Run rails_best_practices and generate HTML file about found issues"
  task :rails_best_practices_html do
    require 'rails_best_practices'
    app_root = Rake.application.original_dir
    output_file = File.join(app_root, 'rails_best_practices_output.html')
    analyzer = RailsBestPractices::Analyzer.new(app_root, {
      'format' => 'html',
      'output-file' => output_file,
      'spec' => true,
      'feature' => true
    })
    analyzer.analyze
    analyzer.output
  end
end
