require 'spec_helper'

describe Eve::API::Services::Corporation do
  context "#container_log" do
    context "with a valid api key" do
      subject { mock_service('corporation', 'container_log', :user_id => $user_id,
                                                     :character_id => $character_id,
                                                     :api_key => $full_api_key) }

      it "should load a list of container log entries" do
        subject.container_log.should behave_like_rowset('logTime,itemID,itemTypeID,actorID,actorName,flag,locationID,
                                                         action,passwordType,typeID,quantity,oldConfiguration,
                                                         newConfiguration')
      end
    end

    context "without an api key" do
      it "should raise an ArgumentError" do
        proc { mock_service('corporation', 'container_log') }.should raise_error(ArgumentError)
      end
    end
  end
end
