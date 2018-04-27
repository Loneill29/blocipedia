class ApplicationPolicy
<<<<<<< HEAD
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
=======
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
>>>>>>> user-roles
  end

  def index?
    false
  end

  def show?
<<<<<<< HEAD
    scope.where(:id => record.id).exists?
=======
    scope.where(:id => wiki.id).exists?
>>>>>>> user-roles
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    user.present?
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
<<<<<<< HEAD
    Pundit.policy_scope!(user, record.class)
=======
    Pundit.policy_scope!(user, wiki.class)
>>>>>>> user-roles
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
