module Admin::ArgumentHelper
 
  def check_argument(*args)
    args.each do |arg|
      if arg.blank?
 	    return false
 	  end
    end
 	return true
  end

end