#!/usr/bin/env bash

set -uex

CURRENT_DIR=$(cd "$(dirname "$0")" && pwd)

TASK_NAME="msra_ner"
DATA_DIR="$CURRENT_DIR/datasets/$TASK_NAME"
MODEL_NAME="chinese_roberta_wwm_ext_L-12_H-768_A-12"
MODEL_DIR="/Users/gerry.xu/pretrained_model/$MODEL_NAME"
OUTPUT_DIR="$CURRENT_DIR/outputs/$TASK_NAME"

if [ ! -d $OUTPUT_DIR ]; then
  mkdir -p $OUTPUT_DIR
fi

python run_token_cls.py \
  --task_name=$TASK_NAME \
  --data_dir=$DATA_DIR \
  --do_train=true \
  --do_eval=false \
  --do_predict=false \
  --vocab_file=$MODEL_DIR/vocab.txt \
  --bert_config_file=$MODEL_DIR/bert_config.json \
  --init_checkpoint=$MODEL_DIR/bert_model.ckpt \
  --max_seq_length=128 \
  --train_batch_size=8 \
  --learning_rate=5e-5 \
  --num_train_epochs=5 \
  --output_dir=$OUTPUT_DIR \
