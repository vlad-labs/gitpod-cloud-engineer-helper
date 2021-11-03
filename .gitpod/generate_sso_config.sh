check_env_var AWS_SSO_START_URL
check_env_var AWS_SSO_REGION
check_env_var AWS_SSO_ACCOUNT_ID
check_env_var AWS_SSO_ROLE_NAME
check_env_var AWS_REGION

mkdir ~/.aws3 && cat << EOF > ~/.aws3/config
[default]
sso_start_url = ${AWS_SSO_START_URL}
sso_region = ${AWS_SSO_REGION}
sso_account_id = ${AWS_SSO_ACCOUNT_ID}
sso_role_name = ${AWS_SSO_ROLE_NAME}
region = ${AWS_REGION}
EOF

check_env_var() {
    if [[ -z ${!1+set} ]]; then echo "$1 should be set as workspace environment variable. Ref: https://www.gitpod.io/docs/environment-variables"; fi
}