# xiaohongshu-frontend-term-card

把前端术语、UI 组件术语和产品交互黑话做成 1-2 页中文小红书短卡的 Codex Skill。

## 适合什么

适合快速解释一个前端或产品术语，例如：

- Toast
- SUG
- Modal
- Drawer
- Tooltip
- Skeleton
- Debounce
- Throttle
- SSR
- Hydration

这个 Skill 的重点是：一眼讲清定义、用户看到什么、解决什么问题、和相似术语有什么区别。

## 默认输出

- 小红书标题选项
- 1-2 页术语卡结构
- 每页文案和视觉分镜
- 每页生图提示词
- 小红书正文与标签
- 术语准确性检查报告

## 视觉风格

默认采用小红书前端术语卡风：

- 3:4 竖版
- 白底黑色手绘线稿
- 少量红蓝橙强调
- 画真实 UI 行为，而不是只画图标
- 默认不放大段代码
- 一个术语最多讲一个核心流程和一个易混淆概念

视觉方法参考并署名 `helloianneo/ian-xiaohei-illustrations`，见 `NOTICE.md`。

## 安装

```bash
mkdir -p ~/.agents/skills
cp -R xiaohongshu-frontend-term-card ~/.agents/skills/
```

也可以放到项目级：

```text
.agents/skills/xiaohongshu-frontend-term-card/
```

## 示例

```text
$xiaohongshu-frontend-term-card
把 SUG 做成 1-2 页小红书前端术语卡，解释它和 Select 的区别。
```

## 目录结构

```text
xiaohongshu-frontend-term-card/
├── SKILL.md
├── README.md
├── LICENSE
├── NOTICE.md
└── references/
    ├── frontend-term-template.md
    ├── sug-example.md
    ├── qa-checklist.md
    ├── visual-style.md
    ├── xiaohongshu-layout.md
    └── attribution.md
```
