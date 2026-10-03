<div align="center">
  <p><img src=".assets/icon.avif" align="center" width="128"></p>
  <h1><code>MACATONI</code></h1>
</div>

<table>
  <tbody><tr><td align="center" width="99999"><div>
    <a href="https://olankens.com">WEBSITE</a>
  </div></td></tr></tbody>
  <tbody><tr><td align="center" width="99999">&nbsp;<div>
    Custom macOS icons crafted with Figma and Bash scripts for popular developer tools, IDEs, and creative applications to personalize your workspace and enhance your daily development workflow experience.
  </div>&nbsp;</td></tr></tbody>
  <tbody><tr><td align="center" width="99999">
    <a href="https://apple.com/os/macos"><img src=".assets/logo-apple.svg" align="center" width="56"></a>
    <picture><img src=".assets/splitter.gif" align="center" height="40" width="1"/></picture>
    <a href="https://figma.com"><img src=".assets/logo-figma.svg" align="center" width="56"></a>
    <picture><img src=".assets/splitter.gif" align="center" height="40" width="1"/></picture>
    <a href="https://wikipedia.org/wiki/Bash_(Unix_shell)"><img src=".assets/logo-bash.svg" align="center" width="56"></a>
  </td></tr></tbody>
</table>

## PREVIEWS

<table><tbody><tr><td width="99999">
  <img src=".assets/preview-01.avif" align="center" width="100%">
</td></tr></tbody></table>

## FEATURES

<!-- START_BLOCK -->
<table>
  <tbody><tr>
    <td align="center" width="99999"><p align="center"><a href="source/android-studio-preview/android-studio-preview.icns"><img src="source/android-studio-preview/android-studio-preview.png" align="center" width="96"></a></p></td>
    <td align="center" width="99999"><p align="center"><a href="source/android-studio/android-studio.icns"><img src="source/android-studio/android-studio.png" align="center" width="96"></a></p></td>
    <td align="center" width="99999"><p align="center"><a href="source/calibre/calibre.icns"><img src="source/calibre/calibre.png" align="center" width="96"></a></p></td>
    <td align="center" width="99999"><p align="center"><a href="source/chromium/chromium.icns"><img src="source/chromium/chromium.png" align="center" width="96"></a></p></td>
    <td align="center" width="99999"><p align="center"><a href="source/clion/clion.icns"><img src="source/clion/clion.png" align="center" width="96"></a></p></td>
    <td align="center" width="99999"><p align="center"><a href="source/datagrip/datagrip.icns"><img src="source/datagrip/datagrip.png" align="center" width="96"></a></p></td>
    <td align="center" width="99999"><p align="center"><a href="source/davinci-resolve/davinci-resolve.icns"><img src="source/davinci-resolve/davinci-resolve.png" align="center" width="96"></a></p></td>
  </tr></tbody>
  <tbody><tr>
    <td align="center" width="99999"><p align="center"><a href="source/gamehub/gamehub.icns"><img src="source/gamehub/gamehub.png" align="center" width="96"></a></p></td>
    <td align="center" width="99999"><p align="center"><a href="source/goland/goland.icns"><img src="source/goland/goland.png" align="center" width="96"></a></p></td>
    <td align="center" width="99999"><p align="center"><a href="source/intellij-idea/intellij-idea.icns"><img src="source/intellij-idea/intellij-idea.png" align="center" width="96"></a></p></td>
    <td align="center" width="99999"><p align="center"><a href="source/jdownloader/jdownloader.icns"><img src="source/jdownloader/jdownloader.png" align="center" width="96"></a></p></td>
    <td align="center" width="99999"><p align="center"><a href="source/notion/notion.icns"><img src="source/notion/notion.png" align="center" width="96"></a></p></td>
    <td align="center" width="99999"><p align="center"><a href="source/obs/obs.icns"><img src="source/obs/obs.png" align="center" width="96"></a></p></td>
    <td align="center" width="99999"><p align="center"><a href="source/phpstorm/phpstorm.icns"><img src="source/phpstorm/phpstorm.png" align="center" width="96"></a></p></td>
  </tr></tbody>
  <tbody><tr>
    <td align="center" width="99999"><p align="center"><a href="source/postman/postman.icns"><img src="source/postman/postman.png" align="center" width="96"></a></p></td>
    <td align="center" width="99999"><p align="center"><a href="source/pycharm/pycharm.icns"><img src="source/pycharm/pycharm.png" align="center" width="96"></a></p></td>
    <td align="center" width="99999"><p align="center"><a href="source/recordly/recordly.icns"><img src="source/recordly/recordly.png" align="center" width="96"></a></p></td>
    <td align="center" width="99999"><p align="center"><a href="source/rider/rider.icns"><img src="source/rider/rider.png" align="center" width="96"></a></p></td>
    <td align="center" width="99999"><p align="center"><a href="source/rubymine/rubymine.icns"><img src="source/rubymine/rubymine.png" align="center" width="96"></a></p></td>
    <td align="center" width="99999"><p align="center"><a href="source/rustrover/rustrover.icns"><img src="source/rustrover/rustrover.png" align="center" width="96"></a></p></td>
    <td align="center" width="99999"><p align="center"><a href="source/webstorm/webstorm.icns"><img src="source/webstorm/webstorm.png" align="center" width="96"></a></p></td>
  </tr></tbody>
</table>
<!-- CEASE_BLOCK -->

## LEARNING

### TUNE APPLICATION ICON

```shell
address="https://github.com/olankens/macatoni/raw/refs/heads/main/source/android-studio/android-studio.icns"
picture="$(mktemp -d)/$(basename "$address")"
curl -LA "mozilla/5.0" "$address" -o "$picture"
fileicon set "/Applications/Android Studio.app" "$picture"
```

### PREPARE NODE TOOLING

```shell
command -v pnpm >/dev/null && pnpm install || npm install
```
