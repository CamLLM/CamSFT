# 民航维修大模型监督微调(SFT)
## 背景
针对民航维修领域，在构建了 [CAMB](https://github.com/CamLLM/CamBenchmark) 民航评估基准之后，我们发现现阶段模型均缺乏民航维修领域的专业知识。在经过以补入领域知识为目的的持续预训练之后，我们需要进一步监督微调，对齐现实业务中的指令任务。

## 监督微调数据构建标准
在构建 [CAMB](https://github.com/CamLLM/CamBenchmark) 基准时，已经拆解了现实业务的场景，将其映射到大模型擅长处理的自然语言任务上，并建立完备了适合大模型完成的指令任务集，如下所示：
<p align="center"> <img src="images/sft_tasks_schema.png" style="width: 85%;" id="title-icon"></p>

此外，我们清楚，大模型的监督对齐阶段，主要是激发 LLM 在预训练或者持续预训练阶段学习到的知识。因此，我们在上述指令任务集 Schema 的约束下，从与[预训练同源的数据源](https://github.com/CamLLM/CamCPT/tree/main?tab=readme-ov-file#%E9%A2%84%E8%AE%AD%E7%BB%83%E6%95%B0%E6%8D%AE%E6%94%B6%E9%9B%86)中挖掘监督对齐数据。


## 监督微调数据构建
### 民航维修领域中英翻译
针对此任务，有相当量的民航维修领域的中英双语对齐语料可以利用，从词语、短语、句子到段落，甚至篇章粒度。再结合“中英翻译任务”的真实使用环境，构建多样的、丰富的 prompt 指令即可。具体做法参照[之前类似工作](https://codeaspoetry.github.io/2023/07/01/sft_translate/)。

> **Note：**
> [民航英语教材-辞典-对齐术语 PDF 目录](https://github.com/CamLLM/CamCPT/tree/main/pt_data_collect/%E6%B0%91%E8%88%AA%E8%8B%B1%E8%AF%AD%E6%95%99%E6%9D%90%26%E8%BE%9E%E5%85%B8%26%E5%AF%B9%E9%BD%90%E6%9C%AF%E8%AF%AD)
<p align="center"> <img src="images/translation.png" style="width: 85%;" id="title-icon"></p>

### 民航故障系统分类 & 民航维修文本系统章节分类
这两个任务都是文本分类任务，并且来自各数据源的民航维修文本基本都是以飞机系统为章节进行组织，因此两个任务的标签体系都一样。

标签体系：
<p align="center"> <img src="images/label.png" style="width: 85%;" id="title-icon"></p>

对于民航故障系统分类，只需要按照[机务在线](https://www.airacm.com/thread/103/) 已经分好的飞机系统 tag 进行抓取，并从其中过滤出我们需要的关于飞机故障描述的帖子；而对于文本系统章节分类，只需要在不同系统章节目录和对应页码文本采样即可。

<p align="center"> <img src="images/classification.png" style="width: 85%;" id="title-icon"></p>

### 民航故障描述与排故手册条目匹配
pass

### 涉及民航维修执照资格及上岗考试的学习及答题任务
pass

### 民航维修领域的知识问答
pass

### 民航维修基于排故树的推理问答
pass

### 民航维修给出建议排故方案
pass

### 通用领域的基本问答(包括模型人设)
pass



