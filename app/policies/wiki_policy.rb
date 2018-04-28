class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def index?
    user.present?
  end

  def show?
    scope.where(:id => wiki.id).exists?
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin?
  end

  def update?
    user.present?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
    wikis = []
    if user.nil?
        all_wikis = scope.all
        wikis = []
        all_wikis.each do |wiki|
            if wiki.private == false
                wikis << wiki
            end
        end
    elsif user.admin?
        wikis = scope.all
    elsif user.premium?
        all_wikis = scope.all
        wikis = []
        all_wikis.each do |wiki|
            end
            if wiki.private == false || wiki.user == user
                wikis << wiki

        end
    else
        all_wikis = scope.all
        wikis = []
        all_wikis.each do |wiki|
            end
            if wiki.private == false
                wikis << wiki
            end
        end
    end
    wikis
end
end
