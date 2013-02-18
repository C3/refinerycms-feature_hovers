# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "FeatureHovers" do
    describe "Admin" do
      describe "feature_hovers" do
        login_refinery_user

        describe "feature_hovers list" do
          before do
            FactoryGirl.create(:feature_hover, :title => "UniqueTitleOne")
            FactoryGirl.create(:feature_hover, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.feature_hovers_admin_feature_hovers_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.feature_hovers_admin_feature_hovers_path

            click_link "Add New Feature Hover"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::FeatureHovers::FeatureHover.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::FeatureHovers::FeatureHover.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:feature_hover, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.feature_hovers_admin_feature_hovers_path

              click_link "Add New Feature Hover"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::FeatureHovers::FeatureHover.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:feature_hover, :title => "A title") }

          it "should succeed" do
            visit refinery.feature_hovers_admin_feature_hovers_path

            within ".actions" do
              click_link "Edit this feature hover"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:feature_hover, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.feature_hovers_admin_feature_hovers_path

            click_link "Remove this feature hover forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::FeatureHovers::FeatureHover.count.should == 0
          end
        end

      end
    end
  end
end
