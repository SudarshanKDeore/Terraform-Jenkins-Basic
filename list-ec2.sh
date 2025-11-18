echo "Fetching EC2 instances from region: $AWS_REGION ..."
echo "-----------------------------------------------"

aws ec2 describe-instances \
    --query "Reservations[*].Instances[*].{
        InstanceId: InstanceId,
        Name: Tags[?Key=='Name']|[0].Value,
        Type: InstanceType,
        State: State.Name,
        PublicIP: PublicIpAddress
    }" \
    --output table
