from robot.libraries.BuiltIn import BuiltIn

def get_table_column_cell_values(searched_column_text = ''):
    """Get table column values from certain header to list"""
    seleniumlib = BuiltIn().get_library_instance('SeleniumLibrary')

    # Get column index from the searched header
    table_columns_count = seleniumlib.get_element_count('xpath://table/thead/tr/th')
    for i in range(1,table_columns_count + 1):
        text = seleniumlib.get_text('xpath://table/thead/tr/th[%s]' % i)
        if text == searched_column_text:
            searched_column_index = i
            break

    # Table rows count including header
    table_rows_count = seleniumlib.get_element_count('xpath://table/tbody/tr') + 1

    # Loop through certain column without header and create list
    table_cells_text_list = []
    for i in range(2, table_rows_count + 1):
        table_cells_text_list.append(seleniumlib.get_table_cell('xpath://table', i, searched_column_index))

    return table_cells_text_list
