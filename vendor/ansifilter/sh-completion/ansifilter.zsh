#compdef ansifilter

_ansifilter() {
  local -a options=(
    {-i,--input}"[Name of input file]: :_files"
    {-o,--output}"[Name of output file]: :_files"
    {-O,--outdir}"[Name of output directory]: :_files"
    {-x,--max-size}"[Set maximum input file size (default\: 256M)]: :_files"
    {-t,--tail}"[Continue reading after end-of-file (like tail -f)]"
    {-T,--text}"[Output text]"
    {-H,--html}"[Output HTML]"
    {-M,--pango}"[Output Pango Markup]"
    {-L,--latex}"[Output LaTeX]"
    {-P,--tex}"[Output Plain TeX]"
    {-R,--rtf}"[Output RTF]"
    {-S,--svg}"[Output SVG]"
    {-B,--bbcode}"[Output BBCODE]"
    {-a,--anchors}"[Add HTML line anchors (opt\: self referencing, assumes -l)]: :(self)"
    {-d,--doc-title}"[Set HTML/LaTeX/SVG document title]: :_files"
    {-e,--encoding}"[Set HTML/RTF encoding or omit if NONE]: :_files"
    {-f,--fragment}"[Omit HTML header and footer]"
    {-F,--font}"[Set HTML/RTF/SVG font face]: :_files"
    {-k,--ignore-clear}"[Do not adhere to clear (ESC K) commands (default\: true]: :(0 1)"
    {-c,--ignore-csi}"[Do not adhere to CSI commands]"
    {-l,--line-numbers}"[Print line numbers in output file]"
    {-m,--map}"[Read color mapping file]: :_files"
    {-r,--style-ref}"[Set HTML/TeX/LaTeX/SVG stylesheet path]: :_files"
    {-s,--font-size}"[Set HTML/RTF/SVG font size]: :_files"
    {-p,--plain}"[Ignore ANSI formatting information]"
    {-w,--wrap}"[Wrap long lines]: :_files"
    "--no-trailing-nl[Omit trailing newline]"
    "--no-version-info[Omit version info comment]"
    "--wrap-no-numbers[Omit line numbers of wrapped lines]"
    "--derived-styles[Output dynamic stylesheets (HTML/SVG)]"
    "--art-cp437[Parse codepage 437 ANSI art]"
    "--art-bin[Parse BIN/XBIN ANSI art]"
    "--art-tundra[Parse Tundra ANSI art]"
    "--art-width[Set ANSI art width]: :_files"
    "--art-height[Set ANSI art height]: :_files"
    "--height[set SVG image height]: :_files"
    "--width[set SVG image width]: :_files"
    {-v,--version}"[Print version and license info]"
    {-h,--help}"[Print help]"
  )
  _arguments -s -S \
    $options \
    "*: :_files" \
    && return 0

  return 1
}

_ansifilter
