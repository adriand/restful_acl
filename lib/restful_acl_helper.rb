module RestfulAclHelper
  # Adrian: sometimes, we want links to create a resource in a view that belongs to a different controller than the resource's
  # controller.  E.g. on a company page, I may want a link to create a new user at that company, in which case I can now use
  # if creatable(User), or if indexable(User)  
  
  def indexable(specified_klass = nil)
    return true if admin_enabled
    (specified_klass || klass).is_indexable_by(current_user, parent_obj)
  end

  
  def creatable(specified_klass = nil)
    return true if admin_enabled
    (specified_klass || klass).is_creatable_by(current_user, parent_obj)
  end
  alias_method :createable, :creatable
  
  
  def updatable(object)
    return true if admin_enabled

    parent = object.get_mom rescue nil
    object.is_updatable_by(current_user, parent)
  end
  alias_method :updateable, :updatable


  def deletable(object)
    return true if admin_enabled

    parent = object.get_mom rescue nil
    object.is_deletable_by(current_user, parent)
  end
  alias_method :deleteable, :deletable


  def readable(object)
    return true if admin_enabled

    parent = object.get_mom rescue nil
    object.is_readable_by(current_user, parent)
  end


  private

    def klass
      params[:controller].classify.constantize
    end

    def parent_obj
      parent_klass.find(parent_id) rescue nil
    end

    def parent_klass
      klass.mom.to_s.classify.constantize
    end

    def parent_id
      params["#{klass.mom.to_s}_id"]
    end

    def admin_enabled
      current_user.respond_to?("is_admin?") && current_user.is_admin?
    end

end
