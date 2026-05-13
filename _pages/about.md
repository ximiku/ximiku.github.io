---
layout: about
title: about
permalink: /
subtitle: Bioinformatics · Biomedical AI · Protein Language Models

profile:
  align: left
  image: jiaxi-liu.png
  image_circular: true
  more_info: >
    <p>School of Life Sciences</p>
    <p>Peking University</p>
    <p><a href="mailto:jiaxi_liu@stu.pku.edu.cn">jiaxi_liu@stu.pku.edu.cn</a></p>

selected_papers: true
social: true

announcements:
  enabled: true
  scrollable: true
  limit: 5

latest_posts:
  enabled: false
  scrollable: true
  limit: 3
---

I am an undergraduate student in **Bioinformatics** at the School of Life Sciences, Peking University. My research interests include bioinformatics, biomedical AI, protein language models, and efficient inference systems for large models.

I have been involved in research projects on protein large language models, edge-side inference optimization for complex-valued large models, assisted reproduction genetics, and cancer gene expression analysis platforms. Some links and publication artifacts are still placeholders and can be replaced when available.

<div class="research-grid">
  {% for item in site.data.research %}
    <article class="research-card">
      <h3>{{ item.title }}</h3>
      <p>{{ item.description }}</p>
    </article>
  {% endfor %}
</div>

<h2 id="education">education</h2>
<div class="compact-timeline">
  {% for item in site.data.education %}
    <article>
      <time>{{ item.period }}</time>
      <div>
        <h3>{{ item.degree }}</h3>
        <p>{{ item.institution }}</p>
        {% if item.detail %}<p class="muted">{{ item.detail }}</p>{% endif %}
      </div>
    </article>
  {% endfor %}
</div>

<h2 id="talks">talks & slides</h2>
{% include talks.liquid %}

<h2 id="achievements">achievements</h2>
<div class="achievement-list">
  {% for item in site.data.achievements %}
    <article>
      <span>{{ item.year }}</span>
      <p>{{ item.title }}</p>
    </article>
  {% endfor %}
</div>
