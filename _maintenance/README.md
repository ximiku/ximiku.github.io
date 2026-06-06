# 个人主页内容维护说明

这个文件用于记录后续维护个人主页时应该修改哪些文件。它放在 `_maintenance/` 目录下，不是仓库根目录的 `README.md`，因此不会作为 GitHub 项目首页显示。

修改完成后建议运行一次：

```bash
/opt/homebrew/opt/ruby/bin/bundle exec jekyll build --config _config.yml,/private/tmp/home_page_jekyll_local.yml
```

本地预览地址通常是：

```text
http://127.0.0.1:4000/
```

## 首页正文

首页主体内容主要在：

```text
_pages/about.md
```

这个文件里按页面顺序写了：

```text
个人介绍
News
Education
Research Interests
Achievements
Internships
Teaching
Publications
```

如果只是改首页文字，优先从 `_pages/about.md` 找对应标题，例如 `## News`、`## Achievements`。

## 修改 News

News 现在不是单独栏目，也不再使用 `_news/` 目录。它直接写在：

```text
_pages/about.md
```

找到：

```markdown
## News
```

在下面的表格里新增一条：

```html
<tr>
  <th scope="row">Sep 2026</th>
  <td>Started a new project on protein language models.</td>
</tr>
```

日期建议使用英文月份格式，例如 `Jun 2026`、`Sep 2025`。如果希望最新消息显示在最上面，把新的 `<tr>` 放在 `<tbody>` 的最前面。

## 修改 Education

Education 也在：

```text
_pages/about.md
```

找到：

```markdown
## Education
```

当前结构是：

```html
<div class="education-entry">
  <div>
    <div class="education-degree">B.E. in Bioinformatics</div>
    <div class="education-meta">School of Life Sciences, Peking University</div>
  </div>
  <div class="education-date">2024 - 2028 (Expected)</div>
</div>
```

只改文字即可。如果要改样式，相关样式在：

```text
_sass/_components.scss
```

搜索 `.education-entry`。

## 添加 Achievements

Achievements 在：

```text
_pages/about.md
```

找到：

```markdown
## Achievements
```

在 `<tbody>` 里新增：

```html
<tr>
  <th scope="row">Sep 2026</th>
  <td>
    <div class="achievement-title">Award or Achievement Title</div>
    <div class="achievement-detail">Award level; ranking; project role; short context</div>
  </td>
</tr>
```

建议写法：

- `achievement-title` 写奖项名称或成就名称。
- `achievement-detail` 写等级、排名、项目角色、补充说明。
- 新条目按时间倒序放置。

相关样式在：

```text
_sass/_components.scss
```

搜索 `.achievements`、`.achievement-title`、`.achievement-detail`。

## 添加 Internships

Internships 在：

```text
_pages/about.md
```

找到：

```markdown
## Internships
```

新增一个实习条目可以复制这个结构：

```html
<div class="experience-list">
  <div class="experience-entry">
    <div class="experience-logo">
      <img src="{{ '/assets/img/internship_logos/company-logo.png' | relative_url }}" alt="Company logo">
    </div>
    <div class="experience-body">
      <div class="experience-header">
        <div>
          <div class="experience-title"><a href="https://example.com" target="_blank" rel="external nofollow noopener">Company or Lab Name</a></div>
          <div class="experience-org">Research Intern</div>
        </div>
        <div class="experience-date">Jul 2026 - Sep 2026</div>
      </div>
      <div class="experience-detail">One concise sentence describing the work.</div>
    </div>
  </div>
</div>
```

Logo 推荐放在：

```text
assets/img/internship_logos/
```

命名建议：

```text
medin-ai-logo.png
intelligent-biosystem-logo.png
company-name-logo.svg
```

图片建议使用透明背景 PNG 或 SVG。不要放太大的原图，宽度几百像素通常足够。

相关样式在：

```text
_sass/_components.scss
```

搜索 `.experience-list`、`.experience-entry`、`.experience-logo`。

## 添加 Teaching

Teaching 在：

```text
_pages/about.md
```

找到：

```markdown
## Teaching
```

新增课程助教条目：

```html
<div class="teaching-entry">
  <div class="teaching-mark">TA</div>
  <div class="teaching-body">
    <div class="teaching-course">Course Name</div>
    <div class="teaching-role">Teaching Assistant</div>
  </div>
  <div class="teaching-date">Mar 2026 - Jun 2026</div>
</div>
```

如果要添加多门课，把多个 `.teaching-entry` 放在同一个：

```html
<div class="teaching-list">
  ...
</div>
```

相关样式在：

```text
_sass/_components.scss
```

搜索 `.teaching-list`、`.teaching-entry`。

## 添加 Publications

论文数据主要在：

```text
_bibliography/papers.bib
```

新增论文时，在这个文件里添加一个 BibTeX 条目。当前 GEPIA3 条目可以作为模板：

```bibtex
@article{key2026example,
  title={Paper Title},
  author={Author A and Liu, Jiaxi and Author B},
  equal_contribution={Author A; Liu, Jiaxi},
  corresponding_author={Author B},
  journal={Journal Name},
  impact_factor={13.1},
  impact_factor_year={2024},
  jcr={Q1},
  year={2026},
  month={June},
  doi={10.0000/example},
  pmid={12345678},
  url={https://publisher.example/article},
  pdf={paper-file-name.pdf},
  pubmed={https://pubmed.ncbi.nlm.nih.gov/12345678/},
  preview={paper-preview.jpeg},
  selected={true},
  altmetric={true},
  google_scholar_id={google_scholar_cluster_or_citation_id},
  abstract={One concise abstract or summary paragraph.}
}
```

常用字段说明：

- `title`：论文标题。
- `author`：作者列表，按 BibTeX 格式写。
- `equal_contribution`：共同一作，用分号分隔，例如 `Author A; Liu, Jiaxi`。
- `corresponding_author`：通讯作者，用分号分隔。
- `journal`：期刊或会议名。
- `impact_factor`、`impact_factor_year`、`jcr`、`ccf`：期刊或会议评级小标签。
- `year`、`month`：页面期刊行会显示年份和月份。
- `url`：出版社原文链接，对应 `Link` 按钮。
- `pdf`：PDF 文件名。
- `pubmed`：PubMed 链接，对应 `PubMed` 按钮。
- `preview`：左侧示意图文件名。
- `selected={true}`：显示在首页 Publications 区块；不写或设为 `false` 则只在 Publications 页面显示。
- `abstract`：点击 `Abs` 时显示的简介。

PDF 放在：

```text
assets/pdf/
```

例如：

```text
assets/pdf/gepia3-nar-2025.pdf
```

论文左侧预览图放在：

```text
assets/img/publication_preview/
```

例如：

```text
assets/img/publication_preview/gepia3-nar-2025.jpeg
```

Publications 页面入口在：

```text
_pages/publications.md
```

一般不需要改这个文件。论文渲染样式和按钮逻辑在：

```text
_layouts/bib.liquid
```

只有需要改按钮、作者标注、IF/JCR/CCF 小标签样式时才改它。

## 添加 Materials

Materials 页面数据在：

```text
_data/materials.yml
```

新增一条材料：

```yaml
- title: CRISPR Live-cell DNA Imaging Analysis
  type: project_report
  date: Jun 2026
  context: Research project report
  description: A concise description of the report or slides.
  pdf: /assets/pdf/materials/crispr-live-cell-dna-imaging-report.pdf
  preview: /assets/img/materials/crispr-live-cell-dna-imaging-report-preview.png
  preview_ratio: 16 / 9
  tags:
    - Project Report
    - CRISPR
    - Live-cell Imaging
  enabled: true
```

`type` 当前支持：

```text
talk_slides      -> Talk Slides
course_report    -> Course Reports
project_report   -> Project Reports
```

如果 `enabled: false`，该条不会显示。  
如果 `pdf:` 留空，页面不显示 PDF 预览和按钮。  
如果 `pdf:` 有路径，页面右侧显示 `PDF` 按钮。  
如果 `preview:` 有路径，页面左侧显示静态缩略图；建议优先使用它，因为浏览器直接嵌入 PDF 时可能无法稳定显示完整第一页。

Materials PDF 推荐放在：

```text
assets/pdf/materials/
```

如果这个目录还不存在，先创建它。命名建议：

```text
protein-language-models-talk.pdf
bioinformatics-lab-report-2026.pdf
crispr-live-cell-dna-imaging-report.pdf
```

Materials 预览图推荐放在：

```text
assets/img/materials/
```

预览图由你手动准备，可以用 PDF 第一页截图、PPT 导出的第一页图片，或自己设计的项目封面图。放入该目录后，在 `_data/materials.yml` 的 `preview:` 字段写它的路径。

命名建议：

```text
protein-language-models-talk-preview.png
bioinformatics-lab-report-2026-preview.png
crispr-live-cell-dna-imaging-report-preview.png
```

如果是横版 slides，建议：

```yaml
preview_ratio: 16 / 9
```

如果是竖版 A4 报告，建议：

```yaml
preview_ratio: 1 / 1.414
```

Materials 页面入口在：

```text
_pages/materials.md
```

一般不需要改。材料列表渲染逻辑在：

```text
_includes/materials.liquid
```

如果以后要新增分类，例如 `Lab Notes`，需要改 `_includes/materials.liquid` 第一行：

```liquid
{% assign material_sections = 'talk_slides|Talk Slides,course_report|Course Reports,project_report|Project Reports' | split: ',' %}
```

并添加类似：

```text
lab_notes|Lab Notes
```

Materials 页面样式在：

```text
_sass/_materials.scss
```

## 修改头像和社交链接

头像图片在：

```text
assets/img/jiaxi-liu.jpg
```

替换同名文件即可。头像显示由 `_pages/about.md` 的 front matter 控制：

```yaml
profile:
  align: right
  image: jiaxi-liu.jpg
  image_circular: true
```

头像下方社交链接在：

```text
_data/profile_links.yml
```

空 URL 或 `enabled: false` 的条目不会显示。

社交模块渲染逻辑在：

```text
_includes/profile_links.liquid
```

社交模块样式在：

```text
_sass/_components.scss
```

搜索 `.profile-links`。

## 修改导航栏

站内页面导航通常在页面 front matter 中控制，例如：

```yaml
nav: true
nav_order: 3
```

当前主要页面：

```text
_pages/about.md
_pages/publications.md
_pages/materials.md
```

HanaBio Archive 是外部导航链接，相关代码在：

```text
_includes/header.liquid
```

如果要改导航栏样式，也看 `_includes/header.liquid` 和对应 Sass 文件。

## 修改主题色和整体样式

主题色在：

```text
_sass/_variables.scss
```

当前主题色是 `#39c5bb`。如果要改为其他颜色，优先搜索：

```text
39c5bb
```

首页各模块样式主要在：

```text
_sass/_components.scss
```

Materials 页面样式在：

```text
_sass/_materials.scss
```

Publications 论文条目样式主要在：

```text
_sass/_publications.scss
_layouts/bib.liquid
```

如果找不到具体位置，优先用 `rg` 搜索页面上的文字或 class 名。

## 常用检查清单

每次改完内容后建议检查：

- 首页顺序是否仍为：个人介绍、News、Education、Research Interests、Achievements、Internships、Teaching、Publications。
- 桌面端头像栏是否遮挡介绍文字。
- 移动端是否有横向滚动。
- Publications 的 PDF、PubMed、Link、Abs 是否能打开。
- Materials 的 PDF 预览和 PDF 按钮是否显示正确。
- 外部链接是否使用 `target="_blank"` 和 `rel="external nofollow noopener"`。

构建时如果只看到下面这个已知警告，一般不影响页面生成：

```text
Terser Exception: "\xE2" on US-ASCII
```
