module UserValidator

  def validate_cns_size(cns)
    cns.to_s.size == 15
  end
end
