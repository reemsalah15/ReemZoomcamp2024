if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@transformer
def transform(data, *args, **kwargs):
    """
    Template code for a transformer block.

    Add more parameters to this function if this block has multiple parent blocks.
    There should be one parameter for each output variable from each parent block.

    Args:
        data: The output from the upstream parent block
        args: The output from any additional upstream blocks (if applicable)

    Returns:
        Anything (e.g. data frame, dictionary, array, int, str, etc.)
    """
    # Specify your transformation logic here
    #print(f"Passenger greater than 0: {(data['passenger_count']<1).sum()}")
    #print(f"Trip distance that greater than 0: {(data['trip_distance']<1).sum()}")
    # Assuming 'df' is your DataFrame and 'column_name' is the name of your column
    
    # Assuming 'df' is your DataFrame and 'column1' and 'column2' are column names
    df_filtered = data[(data['passenger_count'] != 0) & (data['trip_distance'] != 0)]
    #df_filtered['lpep_pickup_datetime']=df_filtered['lpep_pickup_datetime'].dt.date
    #df_filtered['lpep_dropoff_datetime']=df_filtered['lpep_dropoff_datetime'].dt.date
    df_filtered = df_filtered.rename(columns={'VendorID': 'vendor_id','RatecodeID':'rate_code_id','PULocationID':'pu_location_id','DOLocationID':'do_location_id'})
    return df_filtered

@test
def test_output(output, *args):
    """
    Template code for testing the output of the block.
    """
    assert not output.empty