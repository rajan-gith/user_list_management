class ExcelWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(*args)
    @users = User.all
    view = html = ActionView::Base.new(Rails.root.join('app/views/users/'))
    view.class.include ApplicationHelper
    view.render(
      template: 'excell.xlsx',
      format: :xlsx,
      users: @users
    )
    # render axlsx: 'excel'
    # Do something
  end
end
