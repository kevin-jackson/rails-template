require 'rails_helper'

RSpec.describe OmniSearch do

  describe '#apply_scope_to' do
    subject { omnisearch.apply_scope_to(initial_scope) }
    let(:omnisearch)    { OmniSearch.new(search_term, attribute_definitions) }
    let(:search_term)   { "jordan" }
    let(:attribute_definitions) { {attribute_name => attribute_type} }
    let(:attribute_name)        { "email" }

    let(:initial_scope) { User.all }

    describe "scoping by a string attribute" do
      let(:attribute_type) { "string" }

      context "when attribute_name is a valid attribute on the model" do
        it { should     include(FactoryGirl.create(:user, email: "jordan@example.com")) }
        it { should     include(FactoryGirl.create(:user, email: "JORDAN@example.com")) }
        it { should_not include(FactoryGirl.create(:user, email: "nimrod@example.com")) }
      end

      context "when attribute_name is NOT a valid attribute on the model" do
        let(:attribute_name) { :i_love_wagon_wheels }

        it "raises an exception" do
          expect { subject }.to raise_error(ArgumentError)
        end
      end
    end

    describe "scoping by an unhandled attribute" do
      let(:attribute_type) { "noodle" }

      it "raises an exception" do
        expect { subject }.to raise_error(ArgumentError)
      end
    end
  end

end
