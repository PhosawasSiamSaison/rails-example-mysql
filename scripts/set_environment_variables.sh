#!/bin/bash
function set_parameter {
  SSM_PARAM_NAME=$1
  SSM_VALUE=`aws ssm get-parameters --name "${SSM_PARAM_NAME}" --query 'Parameters[*].Value' --output text`
  [ "$(eval echo "$"$1)" == "" ] && echo "export ${SSM_PARAM_NAME}=${SSM_VALUE}" >> ~/.bashrc
}
# echo "export RAILS_ENV=staging" >> ~/.bashrc
set_parameter "RAILS_ENV"
set_parameter "RACK_ENV"
set_parameter "SECRET_KEY_TEST_BASE"
set_parameter "RDS_DATABASE"
set_parameter "RDS_USERNAME"
set_parameter "RDS_PASSWORD"
set_parameter "RDS_HOST"