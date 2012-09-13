#!/bin/sh
CTL=$1

$CTL set_parameter federation-upstream localhost '{"uri": "amqp://"}' # Test direct connections
$CTL set_parameter federation-upstream local5673 '{"uri": "amqp://localhost:5673"}'

$CTL set_parameter federation-upstream-set upstream '[{"upstream": "localhost", "exchange": "upstream"}]'
$CTL set_parameter federation-upstream-set upstream12 '[{"upstream": "localhost", "exchange": "upstream"}, {"upstream": "localhost", "exchange": "upstream2"}]'
$CTL set_parameter federation-upstream-set one '[{"upstream": "localhost", "exchange": "one"}]'
$CTL set_parameter federation-upstream-set two '[{"upstream": "localhost", "exchange": "two"}]'
$CTL set_parameter federation-upstream-set upstream5673 '[{"upstream": "local5673", "exchange": "upstream"}]'
$CTL set_parameter policy fed '{"pattern": "^fed.", "policy": {"federation-upstream-set": "upstream"}}'
$CTL set_parameter policy fed12 '{"pattern": "^fed12.", "policy": {"federation-upstream-set": "upstream12"}}'
$CTL set_parameter policy one '{"pattern": "^two$", "policy": {"federation-upstream-set": "one"}}'
$CTL set_parameter policy two '{"pattern": "^one$", "policy": {"federation-upstream-set": "two"}}'
$CTL set_parameter policy hare '{"pattern": "^hare.", "policy": {"federation-upstream-set": "upstream5673"}}'
$CTL set_parameter policy all '{"pattern": "^all.", "policy": {"federation-upstream-set": "all"}}'
$CTL set_parameter policy new '{"pattern": "^new.", "policy": {"federation-upstream-set": "new-set"}}'
