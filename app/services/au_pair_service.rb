class AuPairService
  def self.search(search_query)
    if search_query
      AuPair.only_approved.where(['name LIKE :query OR skills LIKE :query OR ' \
                                  'degree LIKE :query OR city LIKE :query OR ' \
                                  'languages LIKE :query',
                                  query: "%#{search_query}%"])
    else
      AuPair.only_approved.all
    end
  end
end
