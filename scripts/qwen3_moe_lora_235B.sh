CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 \
NPROC_PER_NODE=8 \
swift sft \
    --model /home/jovyan/pcj-backup/models/Qwen3-235B-A22B/Qwen/Qwen3-235B-A22B \
    --train_type lora \
    --dataset '/home/jovyan/yzhang4046/qwen3_training_data_1000_items.jsonl' \
    --torch_dtype bfloat16 \
    --num_train_epochs 3 \
    --per_device_train_batch_size 1 \
    --per_device_eval_batch_size 1 \
    --learning_rate 5e-5 \
    --lora_rank 8 \
    --lora_alpha 32 \
    --target_modules q_proj k_proj \
    --gradient_accumulation_steps 8 \
    --eval_steps 50 \
    --save_steps 50 \
    --save_total_limit 2 \
    --logging_steps 5 \
    --max_length 2048 \
    --output_dir output \
    --system 'You are a helpful assistant.' \
    --warmup_ratio 0.05 \
    --dataloader_num_workers 4 \
    --model_author swift \
    --model_name swift-robot \
    --gradient_checkpointing true \
    --attn_impl flash_attn \
    --deepspeed zero3 
    # --device_map none 
    # --deepspeed /home/jovyan/yzhang4046/hummer/configs \
