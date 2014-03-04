USER_PATH=`readlink -f /home/keq9/src/php/user/`
TESTCASE_PATH=`readlink -f /home/keq9/src/php/testcases/`
LOG_PATH=`readlink -f /home/keq9/src/php/log/`

prob_dir=$TESTCASE_PATH/$PROBLEM;
input_dir="${prob_dir}/input";
output_dir="${prob_dir}/output";

time_now=`date +%m-%d-%y-%H-%M-%S`;
log_file=$LOG_PATH/$time_now.log;

