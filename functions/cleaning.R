# Cleaning function

cleaning <- function(data_raw){ # 'data' must be general so it can be applied to other code 
  data_raw %>% 
    clean_names() %>% # function from janitor package
    select(-starts_with("delta")) %>% # removing the same columns that were not useful in our previous cleaning function 
    select(-comments) %>% 
    remove_empty(c("rows", "cols")) # removes any empty columns or rows
}