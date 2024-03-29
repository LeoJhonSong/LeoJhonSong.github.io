<div class="site-author motion-element" itemprop="author" itemscope itemtype="http://schema.org/Person">
  {%- if theme.avatar.url %}
    <img class="site-author-image" itemprop="image"
      src="{{ url_for( theme.avatar.url | default(theme.images + '/avatar.gif') ) }}"
      alt="{{ author }}">
  {%- endif %}
  <p class="site-author-name" itemprop="name">{{ author }}</p>
  <div class="site-description" itemprop="description">{{ description }}</div>
</div>

{%- if theme.site_state %}
  <nav class="site-state motion-element">
    {%- if config.archive_dir != '/' and site.posts.length > 0 %}
      <div class="site-state-item site-state-posts">
        {%- if theme.menu.archives %}
          <a href="{{ url_for(theme.menu.archives).split('||')[0] | trim }}">
        {% else %}
          <a href="{{ url_for(config.archive_dir) }}">
        {%- endif %}
          <span class="site-state-item-count">{{ site.posts.length }}</span>
          <span class="site-state-item-name">{{ __('state.posts') }}</span>
        </a>
      </div>
    {%- endif %}

    {%- if site.categories.length > 0 %}
      {%- set categoriesPageQuery = site.pages.find({type: 'categories'}, {lean: true}) %}
      {%- set hasCategoriesPage = categoriesPageQuery.length > 0 %}
      <div class="site-state-item site-state-categories">
        {%- if hasCategoriesPage %}
          {%- if theme.menu.categories %}
            <a href="{{ url_for(theme.menu.categories).split('||')[0] | trim }}">
          {% else %}
            <a href="{{ url_for(config.category_dir) + '/' }}">
          {%- endif %}
        {%- endif %}
        <span class="site-state-item-count">{{ site.categories.length }}</span>
        <span class="site-state-item-name">{{ __('state.categories') }}</span>
        {%- if hasCategoriesPage %}</a>{%- endif %}
      </div>
    {%- endif %}

    {%- if site.tags.length > 0 %}
      {%- set tagsPageQuery = site.pages.find({type: 'tags'}, {lean: true}) %}
      {%- set hasTagsPage = tagsPageQuery.length > 0 %}
      <div class="site-state-item site-state-tags">
        {%- if hasTagsPage %}
          {%- if theme.menu.tags %}
            <a href="{{ url_for(theme.menu.tags).split('||')[0] | trim }}">
          {% else %}
            <a href="{{ url_for(config.tag_dir) + '/' }}">
          {%- endif %}
        {%- endif %}
        <span class="site-state-item-count">{{ site.tags.length }}</span>
        <span class="site-state-item-name">{{ __('state.tags') }}</span>
        {%- if hasTagsPage %}</a>{%- endif %}
      </div>
    {%- endif %}
  </nav>
{%- endif %}

{%- if theme.rss %}
  <div class="feed-link motion-element">
    <a href="{{ url_for(theme.rss) }}" rel="alternate">
      <i class="fa fa-rss"></i>RSS
    </a>
  </div>
{%- endif %}

{%- if theme.chat.enable and theme.chat.service !== '' %}
  <div class="chat motion-element">
  {%- if theme.chat.service == 'chatra' and theme.chatra.enable %}
    <a onclick="Chatra('openChat', true)">
  {%- endif %}
  {%- if theme.chat.service == 'tidio' and theme.tidio.enable %}
    <a onclick="tidioChatApi.open();">
  {%- endif %}
  {%- if theme.chat.icon %}<i class="fa fa-{{ theme.chat.icon }}"></i>{%- endif %}
    {{ theme.chat.text }}
  </a>
  </div>
{%- endif %}

{%- if theme.social %}
  <div class="links-of-author motion-element">
    {%- for name, link in theme.social %}
      <span class="links-of-author-item">
      {%- set sidebarURL = link.split('||')[0] | trim %}
      {%- if not (theme.social_icons.enable) or (not theme.social_icons.icons_only) %}
        {%- set sidebarText = ' ' + name %}
      {%- endif %}
      {%- if theme.social_icons.enable %}
        {#%- set sidebarIcon = '<i class="fa fa-fw fa-' + link.split('||')[1] | trim | default('globe') + '"></i>' %#}
        {% set sidebarIcon = '<svg class="icon" aria-hidden="true"><use xlink:href="#' + link.split('||')[1] | trim + '"></use></svg>' %}
      {%- endif %}
        {{ next_url(sidebarURL, sidebarIcon + sidebarText, {title: name + ' &rarr; ' + sidebarURL}) }}
      </span>
    {%- endfor %}
  </div>
{%- endif %}

<div>
<script type='text/javascript' id='clustrmaps' src='//cdn.clustrmaps.com/map_v2.js?cl=ffffff&w=a&t=tt&d=bFSXKampqeUl7LSBi0lk9EqEYCDXkOi6RQZJE54uQIk&co=2d78ad&cmo=3acc3a&cmn=ff5353&ct=ffffff'>
</script>
</div>

{%- if theme.creative_commons.license and theme.creative_commons.sidebar %}
  <div class="cc-license motion-element" itemprop="license">
  {%- set ccLanguage = theme.creative_commons.language %}
  {%- if theme.creative_commons.license === 'zero' %}
    {%- set ccType = 'publicdomain/zero/1.0/' + ccLanguage %}
  {% else %}
    {%- set ccType = 'licenses/' + theme.creative_commons.license + '/4.0/' + ccLanguage %}
  {%- endif %}
  {%- set ccURL = 'https://creativecommons.org/' + ccType %}
  {%- set ccImage = '<img src="' + url_for(theme.images + '/cc-' + theme.creative_commons.license + '.svg') + '" alt="Creative Commons">' %}
    {{ next_url(ccURL, ccImage, {class: 'cc-opacity'}) }}
  </div>
{%- endif %}

{# Blogroll #}
{%- if theme.links %}
  <div class="links-of-blogroll motion-element">
    <div class="links-of-blogroll-title">
      <i class="fa fa-fw fa-{{ theme.links_settings.icon | default('link') | lower }}"></i>
      {{ theme.links_settings.title }}
    </div>
    <ul class="links-of-blogroll-list">
      {%- for blogrollText, blogrollURL in theme.links %}
        <li class="links-of-blogroll-item">
          {{ next_url(blogrollURL, blogrollText, {title: blogrollURL}) }}
        </li>
      {%- endfor %}
    </ul>
  </div>
{%- endif %}
