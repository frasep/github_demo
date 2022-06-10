import pandas as pd
import sys

# Get data from input node (in this case CAS table) to a panda dataframe
in_df = SAS.sd2df(_input1)

# Compute the size of the resulting panda dataframe
sys.getsizeof(in_df)

# Compute descriptive statistics on the panda dataframe
output_describe_df=in_df.describe()

SAS.df2sd(output_describe_df,_output1)
	