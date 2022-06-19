# Terraform AWS Public Lambda Layer

This module is for use with the [Invicton Labs Public Lambda Layers](https://github.com/Invicton-Labs/public-lambda-layers) project, which hosts publicly-accessible Lambda layers for various commonly used packages.

The output of this module is intended to mimic the [`aws_lambda_layer_version` data source](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/lambda_layer_version#source_code_hash).

All layers (except those in regions where layer signing isn't supported) are signed by an AWS Signer Signing Profile with ARN `arn:aws:signer:ca-central-1:216976011668:/signing-profiles/InvictonLabs_PublicLambdaLayers`. As of the time of writing, the current version of the signing profile is `4QhjJy9LL7` (`arn:aws:signer:ca-central-1:216976011668:/signing-profiles/InvictonLabs_PublicLambdaLayers/4QhjJy9LL7`), although this version may change in the future.

## Usage

```
data "aws_region" "current" {}

module "layer_pyjwt" {
    source = "Invicton-Labs/public-lambda-layer/aws"
    package = "pyjwt"
    package_version = "2.4.0"
    runtime = "python3.9"
    architecture = "x86_64"
    region = data.aws_region.current.name
}

resource "aws_lambda_function" "test_lambda" {
  filename      = "lambda_function_payload.zip"
  function_name = "lambda_function_name"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.test"
  source_code_hash = filebase64sha256("lambda_function_payload.zip")
  runtime = "python3.9"
  layers = [
    module.layer_pyjwt.arn
  ]
}
``
