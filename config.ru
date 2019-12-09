require_relative './config/environment'

use Rack::MethodOverride

if ActiveRecord::Base.connection.migration_context.needs_migration?
    raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use SessionsController
use OwnersController
use PlantsController
use CommentsController
run ApplicationController