{%- if theme.back2top.enable and not theme.back2top.sidebar %}
  <div class="back-to-top">
    <i class="fa fa-arrow-up"></i>
    <span>0%</span>
  </div>
{%- endif %}
{%- if theme.reading_progress.enable %}
  <div class="reading-progress-bar"></div>
{%- endif %}
{%- if theme.bookmark.enable %}
  <a class="book-mark-link book-mark-link-fixed" href="#"></a>
{%- endif %}
{%- if theme.github_banner.enable %}
  {%- set github_URL = theme.github_banner.permalink %}
  {%- set github_title = theme.github_banner.title %}

  {%- set github_image = '<svg
   width="60"
   height="60"
   viewBox="0 0 187.5 187.5"
   aria-hidden="true">
  <circle
     style="#ffffff"
     cx="93.75"
     cy="93.161804"
     r="67.464378"/>
  <path
     d="m 79.431414,145.35627 c -20.254197,4.42528 -24.424174,-8.59526 -24.424174,-8.59526 -3.318969,-8.42508 -8.084652,-10.63772 -8.084652,-10.63772 -6.723038,-4.51038 0.510606,-4.42528 0.510606,-4.42528 7.233642,0.59571 11.148317,7.57405 11.148317,7.57405 6.55283,10.97811 16.765026,8.08464 21.105218,5.95711"
     fill="currentColor"
     transform-origin="85px 140px"
     class="octo-arm"/>
  <path
     d="m 73.219004,161.78089 c 0,0.1702 4.42528,-1.87224 4.42528,-3.74448 l 0.08509,-23.57315 c 0.680819,-4.76571 2.553049,-7.99956 4.680593,-9.78669 -16.169314,-1.87223 -33.104555,-8.08466 -33.189655,-35.912909 0.08509,-7.91445 2.893464,-14.467279 7.574047,-19.488275 -0.851009,-1.872237 -3.318957,-9.27608 0.680818,-19.232974 0,0 6.042225,-1.957337 19.998894,7.403843 5.701804,-1.61693 11.914224,-2.382846 18.126646,-2.467947 6.127313,0 12.424843,0.851017 18.211753,2.553049 13.87157,-9.446282 19.9989,-7.574047 19.9989,-7.574047 3.91467,10.041996 1.44672,17.445839 0.68081,19.232973 4.68059,5.191201 7.48894,11.573828 7.48894,19.573378 0,27.913349 -17.02032,34.040679 -33.18965,35.912909 2.55305,2.21264 4.9359,6.63793 4.9359,13.44606 l -0.085,19.82869 c 0,2.04243 5.1061,4.08487 5.1912,3.82957 z"
     fill="currentColor"
     class="octo-body"/>
</svg>'%}

  {{ next_url(github_URL, github_image, {class: 'github-corner', title: github_title, "aria-label": github_title}) }}
{%- endif %}
