#!bin/bash

# cd ../
# if [ $? -ne 0 ]; then echo "FAIL!"; exit 1; else echo "SUCCESS!"; exit 0; fi

cd ../does-not-exists
if [ $? -ne 0 ]; then echo "FAIL!"; exit 1; else echo "SUCCESS!"; exit 0; fi
