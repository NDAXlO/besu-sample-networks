#!/bin/bash -u

# Copyright 2018 ConsenSys AG.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with
# the License. You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on
# an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.

. ./.env

# Import the following accounts into metamask
# 0xc87509a1c067bbde78beb793e6fa76530b6382a4c0241e5e4a9ec0a0f44dc0d3

# build the dapp
cd pet-shop
npm install

# compile the contracts
truffle compile
truffle migrate --network quickstartWallet
truffle test --network quickstartWallet

docker build . -t besu-sample-network_pet_shop
docker run -p 3001:3001 --name besu-sample-network_pet_shop --detach besu-sample-network_pet_shop


