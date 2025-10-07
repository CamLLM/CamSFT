CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 \
NPROC_PER_NODE=8 \
swift sft \
    --model /home/jovyan/pcj-backup/models/Qwen3-32B/Qwen/Qwen3-32B \
    --train_type lora \
    --dataset '/home/jovyan/yzhang4046/qwen3_training_data_1000_items.jsonl' \
    --torch_dtype bfloat16 \
    --num_train_epochs 3 \
    --per_device_train_batch_size 4 \
    --per_device_eval_batch_size 1 \
    --learning_rate 1e-4 \
    --lora_rank 8 \
    --lora_alpha 32 \
    --target_modules q_proj k_proj v_proj o_proj gate_proj up_proj down_proj \
    --gradient_accumulation_steps 4 \
    --eval_steps 50 \
    --save_steps 50 \
    --save_total_limit 2 \
    --logging_steps 1 \
    --max_length 2048 \
    --output_dir /home/jovyan/yzhang4046/output/lora \
    --system 'You are a helpful assistant.' \
    --warmup_ratio 0.05 \
    --dataloader_num_workers 4 \
    --model_author swift \
    --model_name swift-robot \
    --attn_impl flash_attn \
    --gradient_checkpointing true \
    --deepspeed zero3
    # --deepspeed /home/jovyan/yzhang4046/hummer/configs \
