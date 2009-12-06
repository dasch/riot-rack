#used for functional testing
app = Proc.new { [200,{"Content-Type"=>"text/html"},["yo!"]] }
run app
