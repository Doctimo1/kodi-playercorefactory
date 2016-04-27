#!/bin/bash

VIDEOFILE=$(printf "$VIDEOURL" | grep -Eo '(http|https)://[a-zA-Z0-9:0-9./?=_@%-]*\.(mkv|mp4|avi|flv)')
M3U8=$(printf "$VIDEOURL" | grep -Eo '(http|https)://[a-zA-Z0-9:0-9./?=_,@&%-]*\.(m3u8)')
M3U8TOKEN=$(printf "$VIDEOURL" | grep -Eo '(http|https)://[a-zA-Z0-9:0-9./?=_@%-]*\.(m3u8)\?token=[a-zA-Z0-9&=]*')
M3U8UAG=$(printf "$VIDEOURL" | grep -Eo '(http|https)://[a-zA-Z0-9:0-9./?=_@%-]*\.(m3u8)[a-zA-Z0-9?&=%*]*[^|]')
XFORWARD=$(printf "$VIDEOURL" | grep -Eo '(http|https)://[a-zA-Z0-9./?=_@%-]*\.(m3u8)\|X-Forwarded-For=[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')
XFORWARDIP=$(printf "$XFORWARD" | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')
USEREF=$(printf "$VIDEOURL" | grep -Eo '(http|https)://[a-zA-Z0-9:0-9./?=_-]*\|User-Agent=[a-zA-Z0-9/.()[:blank:],:;%+-]*\&Referer=(http|https)(://|%3A%2F%2F)[a-zA-Z%0-9./?=_-]*')
USERAGENT=$(printf "$VIDEOURL" | grep -Eo 'u?User-a?Agent=[a-zA-Z0-9/.()[:blank:],:;%+_-]*[^&]')
REFERER=$(printf "$VIDEOURL" | grep -Eo 'Referer=(http|https)(://|%3A%2F%2F)[a-zA-Z%0-9./?=_-]*' | sed 's/Referer=//')
M3U8USERAGENT=$(printf "$VIDEOURL" | grep -Eo '(http|https)://[a-zA-Z0-9./?=_@%-]*\.(m3u8)[a-zA-Z0-9?&=%*]*\|u?User-a?Agent=[a-zA-Z0-9/.()[:blank:],:;%+_-]*[^&]')
M3U8USERAGENT2=$(printf "$VIDEOURL" | grep -Eo '(http|https)://[a-zA-Z0-9./?=_@%-]*\.(m3u8)[a-zA-Z0-9?&=%*]*\|u?User-a?Agent=[a-zA-Z0-9/.()[:blank:],:;%+_-]*[^&]')
M3U8UAGENTREFERER=$(printf "$VIDEOURL" | grep -Eo '(^http|https)://[a-zA-Z0-9:0-9./?=_&@%|()[:blank:],;-]*')
M3U8UAGNTREF=$(printf "$M3U8UAGENTREFERER" | grep -Eo '(^http|https)://[a-zA-Z0-9:0-9./?=_&@%-]*')
REFUSERAGENT=$(printf "$VIDEOURL" | grep -Eo '(http|https)://[a-zA-Z0-9:0-9./?=_-]*\|Referer=(http|https)(://|%3A%2F%2F)[a-zA-Z%0-9./?=_-]*\&User-Agent=[a-zA-Z0-9/.()[:blank:],:;%+-]*')
BEEB=$(printf "$VIDEOURL" | grep -Eo '^(http|https)://[a-zA-Z0-9:0-9/.&;,~*?[:blank:]_=-]*')
GVID=$(printf "$VIDEOURL" | grep -Eo '^(http|https)://[a-zA-Z0-9:0-9/.&;,~*?_=-]*')
RTMP=$(printf "$VIDEOURL" | grep -Eo '^(rtmp|rtmpe)://[-/.&;,~*?[:blank:]#%@!()_=:a-zA-Z0-9\]*')
