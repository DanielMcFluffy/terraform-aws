#!/bin/sh

echo "yes" | terraform apply
terraform output -json | jq '.'

