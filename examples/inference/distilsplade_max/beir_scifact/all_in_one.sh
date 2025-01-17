if [ ! -d "distilsplade_max" ]; then
    mkdir distilsplade_max
    cd distilsplade_max
    wget https://github.com/naver/splade/raw/main/weights/distilsplade_max/pytorch_model.bin
    wget https://github.com/naver/splade/raw/main/weights/distilsplade_max/config.json
    wget https://github.com/naver/splade/raw/main/weights/distilsplade_max/special_tokens_map.json
    wget https://github.com/naver/splade/raw/main/weights/distilsplade_max/tokenizer_config.json
    wget https://github.com/naver/splade/raw/main/weights/distilsplade_max/vocab.txt
    cd ..
fi

# Please make sure you have installed the repo

nohup python -m sparse_retrieval.inference.aio \
    --encoder_name splade \
    --ckpt_name distilsplade_max \
    --data_name beir_scifact \
    --gpus 11 12 \
    --output_dir beir_scifact-distilsplade_max \
    --do_quantization \
    --quantization_method ndigits-round \
    --ndigits 2 \
    --original_query_format beir \
    --topic_split test \
    > all_in_one.log &

