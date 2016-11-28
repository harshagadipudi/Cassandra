#! /bin/bash


FILE=$1


KS_STR="Keyspace"
CF_STR="Table"
SSTBL_STR="SSTable count"
RC_STR="Local read count"
RL_STR="Local read latency"
WC_STR="Local write count"
WL_STR="Local write latency"
KS_VAL=""
CF_VAL=""
SSTBL_VAL=""
CF_PREVAL=""
RC_VAL=""
RL_VAL=""
WC_VAL=""
WL_VAL=""


OUTFILE="$1.csv"
k=1


echo $KS_STR,$CF_STR,$SSTBL_STR,$RC_STR,$RL_STR,$WC_STR,$WL_STR > $OUTFILE


while read line;do
    #echo "Line # $k: $line"
    #echo "==>" $CF_VAL $CF_PREVAL


    IFS=':' read -ra NAMES <<< "$line"


    if [[ "$line" =~ "$KS_STR :" ]]; then
        KS_VAL=$(echo ${NAMES[1]}|sed 's/^ *//g')
        echo $KS_VAL
    elif [[ "$line" =~ "$CF_STR:" ]]; then
        CF_VAL=$(echo ${NAMES[1]}|sed 's/^ *//g')
        if [[ -n "$CF_PREVAL" ]]; then
            echo $KS_VAL,$CF_PREVAL,$SSTBL_VAL,$RC_VAL,$RL_VAL,$WC_VAL,$WL_VAL >> $OUTFILE
        fi


CF_PREVAL=$CF_VAL
    elif [[ "$line" =~ "$SSTBL_STR:" ]]; then
        SSTBL_VAL=$(echo ${NAMES[1]}|sed 's/^ *//g')
    elif [[ "$line" =~ "$RC_STR:" ]]; then
        RC_VAL=$(echo ${NAMES[1]}|sed 's/^ *//g')
    elif [[ "$line" =~ "$RL_STR:" ]]; then
        IFS=' ' read -ra NAMES2 <<< "${NAMES[1]}"
        RL_VAL=$(echo ${NAMES2[0]}|sed 's/^ *//g')
    elif [[ "$line" =~ "$WC_STR:" ]]; then
        WC_VAL=$(echo ${NAMES[1]}|sed 's/^ *//g')
    elif [[ "$line" =~ "$WL_STR:" ]]; then
        IFS=' ' read -ra NAMES2 <<< "${NAMES[1]}"
        WL_VAL=$(echo ${NAMES2[0]}|sed 's/^ *//g')
    fi
    k=$(($k+1))
done < $FILE


echo $KS_VAL,$CF_PREVAL,$SSTBL_VAL,$RC_VAL,$RL_VAL,$WC_VAL,$WL_VAL >> $OUTFILE




