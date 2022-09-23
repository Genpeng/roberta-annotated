#!/usr/bin/env bash

set -uex

CURRENT_DIR=$(cd "$(dirname "$0")" && pwd)

TASK_NAME="msra_ner"
DATA_DIR="$CURRENT_DIR/data"
MODEL_DIR="/Users/gerry.xu/pretrained_model/chinese_roberta_wwm_ext_L-12_H-768_A-12"
OUTPUT_DIR="$CURRENT_DIR/output/$TASK_NAME"

if [ ! -d $OUTPUT_DIR ]; then
  mkdir -p $OUTPUT_DIR
  echo "makedir $OUTPUT_DIR"
fi

#python run_ner.py \
#  --task_name=$TASK_NAME \
#  --do_train=true \
#  --do_eval=false \
#  --do_predict=true \
#  --data_dir=$DATA_DIR/$TASK_NAME \
#  --vocab_file=$MODEL_DIR/vocab.txt \
#  --bert_config_file=$MODEL_DIR/bert_config.json \
#  --init_checkpoint=$MODEL_DIR/bert_model.ckpt \
#  --max_seq_length=256 \
#  --train_batch_size=16 \
#  --learning_rate=2e-5 \
#  --num_train_epochs=5.0 \
#  --output_dir=$OUTPUT_DIR \
