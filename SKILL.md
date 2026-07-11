---
name: xiaohongshu-frontend-term-card
description: Use when creating short Chinese Xiaohongshu cards explaining frontend terms, UI component terms, product-interaction terms, search terms, web rendering terms, or common frontend jargon such as Toast, SUG, Modal, Drawer, Skeleton, Debounce, Throttle, SSR, Hydration, or AutoComplete.
---

# 小红书前端术语卡片 Skill

将前端术语、UI 组件术语、产品交互术语或搜索产品黑话做成中文小红书短卡。默认 1-2 页，不做长教程，目标是一眼讲清定义、场景、区别和一个关键流程。

## 先读共享规范

制作前读取：

- `references/visual-style.md`
- `references/xiaohongshu-layout.md`
- `references/attribution.md`
- `references/complete-knowledge-card.md`
- `references/xiaohongshu-copywriting.md`
- `references/visual-quality-gates.md`

必须遵守：3:4 竖版、白底、黑色手绘线稿、少量红蓝橙强调、角色参与核心动作。

## 默认输出

除非用户另有要求，输出：

1. 1 个最终小红书标题，另附 2 个备选标题
2. 1-2 页卡片结构
3. 每页文案和视觉分镜
4. 每页已生成的 3:4 配图
5. 简洁正文
6. 标签
7. 术语准确性检查报告

## 直接成品交付

除非用户明确只要脚本、分镜或提示词，否则必须直接完成可发布交付：

1. 必须调用内置 `image_gen`，直接生成 1-2 张独立的 3:4 竖版完整知识卡；不能只描述“应该怎么画”。
2. 信息密度为中到高：第 1 页必须包含定义、用户可见场景和用途；第 2 页必须包含完整流程、相似术语对比和实现注意点。
3. 术语定义、流程、比较结论和注意点必须进入最终成品图的排版。若需要后期排版，输出的是已经排好字的最终成品图；overlay 文案建议不算完成。
4. 生成后直接展示配图，再给出标题、简洁正文和 5-10 个精准标签。
5. 不得只生成纯插画底图、分镜或提示词；不得只输出分镜或提示词。只有 `image_gen` 不可用时，才说明原因并把每页完整提示词作为降级交付。

## 严格 3:4 成品检查

3:4 是硬性发布规格，不是生图提示词里的软性建议：

1. 每页提示词必须明确写 `3:4 vertical portrait` 和 `1080 × 1440`。
2. `image_gen` 返回图片后，必须检查实际像素尺寸和宽高比，不能相信提示词或文件名。
3. 最终文件必须精确为 `1080 × 1440`；不得交付 `2:3`、`16:9`、正方形或多页拼接图作为单页轮播。
4. 在 macOS 上优先运行 `scripts/normalize_3x4.sh input.png output.png`。该脚本会对白底图片补白或裁切，再导出 `1080 × 1440`；其他环境执行等价的像素归一化。
5. 归一化后再次检查尺寸；检查失败时重新处理，不能把原始比例图片交付给用户。

## 默认结构

单页版：

```text
定义 → 用户看到什么 → 解决什么问题 → 易混淆区别
```

双页版：

```text
第 1 页：术语定义、场景、用户看到的效果
第 2 页：关键流程、相似术语区别、实现注意点
```

## 工作流程

1. 先判断术语属于 UI 组件、搜索产品、前端工程还是编程技巧。
2. 明确术语语境。若是公司或业务常用缩写，说明不是统一标准。
3. 用一句话定义术语。
4. 讲用户实际看到什么。
5. 只选一个最容易混淆的相似术语比较。
6. 需要代码时只给核心伪代码或简短片段。
7. 检查可访问性、键盘操作、状态反馈和边界情况。
8. 按 `references/visual-quality-gates.md` 检查是否出现空框、占位线、假搜索结果、标题重叠或九宫格堆砌；任一失败都必须重新生成或重新排版。

## 必须读取的参考

- 前端术语卡模板：`references/frontend-term-template.md`
- SUG 示例：`references/sug-example.md`
- 术语 QA：`references/qa-checklist.md`

## 技术检查

交付前必须检查：

- 术语定义是否准确
- 是否说明语境
- 是否把产品内部缩写误说成 Web 标准
- 是否讲清用户可见效果
- 是否比较了真正容易混淆的概念
- 是否避免过长代码和大段文字

## 发布文案

先读取 `references/xiaohongshu-copywriting.md`。发布文案必须是可直接粘贴到小红书的格式，不得只给一段平铺的术语定义。

交付图片后，必须给出与该轮播一一对应、可直接发布的以下内容：

```text
标题：1 个最终标题，另附 2 个备选标题
正文/简介：2-5 个短段，使用 4-8 个有语义的 emoji，至少 3 个分点；说明术语是什么、用户会在哪里看到它、为什么要理解它
标签：5-10 个精准标签，覆盖术语、前端或产品语境和受众
```

标题要直白解释术语或提出用户可感知的问题；正文要有 `📌`、`✅`、`⚠️`、`💡`、`💾` 等清晰层次，并明确一个易混淆术语；标签不得使用无关热门词。

## 禁止

- 把一个术语硬扩成 8 页。
- 在一页里塞十几个无关术语。
- 把 SUG 画成固定 Select。
- 把 Toast 画成必须确认的 Modal。
- 未经用户要求使用 16:9。
