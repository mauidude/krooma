require 'spec_helper'

describe HomeController do
  context "#index" do
    subject { get :index }

    it { should render_template('layouts/base' )}
  end

end
