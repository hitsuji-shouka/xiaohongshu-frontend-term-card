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

必须遵守：3:4 竖版、白底、黑色手绘线稿、少量红蓝橙强调、角色参与核心动作。

## 默认输出

除非用户另有要求，输出：

1. 3-5 个小红书标题
2. 1-2 页卡片结构
3. 每页文案和视觉分镜
4. 每页生图提示词或生成图说明
5. 小红书正文
6. 标签
7. 术语准确性检查报告

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

## 禁止

- 把一个术语硬扩成 8 页。
- 在一页里塞十几个无关术语。
- 把 SUG 画成固定 Select。
- 把 Toast 画成必须确认的 Modal。
- 未经用户要求使用 16:9。
