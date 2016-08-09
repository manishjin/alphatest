require 'test_helper'

class ShipmentsControllerTest < ActionController::TestCase
  setup do
    @shipment = shipments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shipments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shipment" do
    assert_difference('Shipment.count') do
      post :create, shipment: { Cargo_Type: @shipment.Cargo_Type, Client_ID: @shipment.Client_ID, Client_Name: @shipment.Client_Name, Comments: @shipment.Comments, Dropff_Contact_No: @shipment.Dropff_Contact_No, Dropff_End_Time: @shipment.Dropff_End_Time, Dropoff_Contact_Person: @shipment.Dropoff_Contact_Person, Dropoff_Date: @shipment.Dropoff_Date, Dropoff_Gate: @shipment.Dropoff_Gate, Dropoff_Location: @shipment.Dropoff_Location, Dropoff_Start_Time: @shipment.Dropoff_Start_Time, No_of_Pallets: @shipment.No_of_Pallets, Palletized: @shipment.Palletized, Parent_Shipment_ID: @shipment.Parent_Shipment_ID, Pickup_Contact_No: @shipment.Pickup_Contact_No, Pickup_Contact_Person: @shipment.Pickup_Contact_Person, Pickup_Date: @shipment.Pickup_Date, Pickup_End_Time: @shipment.Pickup_End_Time, Pickup_Gate: @shipment.Pickup_Gate, Pickup_Location: @shipment.Pickup_Location, Pickup_Start_Time: @shipment.Pickup_Start_Time, Status: @shipment.Status, Sub_Shipment: @shipment.Sub_Shipment, Weight: @shipment.Weight, company_id: @shipment.company_id }
    end

    assert_redirected_to shipment_path(assigns(:shipment))
  end

  test "should show shipment" do
    get :show, id: @shipment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shipment
    assert_response :success
  end

  test "should update shipment" do
    patch :update, id: @shipment, shipment: { Cargo_Type: @shipment.Cargo_Type, Client_ID: @shipment.Client_ID, Client_Name: @shipment.Client_Name, Comments: @shipment.Comments, Dropff_Contact_No: @shipment.Dropff_Contact_No, Dropff_End_Time: @shipment.Dropff_End_Time, Dropoff_Contact_Person: @shipment.Dropoff_Contact_Person, Dropoff_Date: @shipment.Dropoff_Date, Dropoff_Gate: @shipment.Dropoff_Gate, Dropoff_Location: @shipment.Dropoff_Location, Dropoff_Start_Time: @shipment.Dropoff_Start_Time, No_of_Pallets: @shipment.No_of_Pallets, Palletized: @shipment.Palletized, Parent_Shipment_ID: @shipment.Parent_Shipment_ID, Pickup_Contact_No: @shipment.Pickup_Contact_No, Pickup_Contact_Person: @shipment.Pickup_Contact_Person, Pickup_Date: @shipment.Pickup_Date, Pickup_End_Time: @shipment.Pickup_End_Time, Pickup_Gate: @shipment.Pickup_Gate, Pickup_Location: @shipment.Pickup_Location, Pickup_Start_Time: @shipment.Pickup_Start_Time, Status: @shipment.Status, Sub_Shipment: @shipment.Sub_Shipment, Weight: @shipment.Weight, company_id: @shipment.company_id }
    assert_redirected_to shipment_path(assigns(:shipment))
  end

  test "should destroy shipment" do
    assert_difference('Shipment.count', -1) do
      delete :destroy, id: @shipment
    end

    assert_redirected_to shipments_path
  end
end
