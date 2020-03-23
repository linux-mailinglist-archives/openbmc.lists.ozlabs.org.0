Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 091C718FFE2
	for <lists+openbmc@lfdr.de>; Mon, 23 Mar 2020 21:54:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mRTH4JCJzDqhb
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 07:54:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f33;
 helo=mail-qv1-xf33.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=poEHE2/X; dkim-atps=neutral
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mRSc61d4zDqXr
 for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2020 07:54:08 +1100 (AEDT)
Received: by mail-qv1-xf33.google.com with SMTP id v38so8038505qvf.6
 for <openbmc@lists.ozlabs.org>; Mon, 23 Mar 2020 13:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language;
 bh=C8CyZgfbm0Y8yd0Uk7N0w+Q5o8EdsJ9oWjz6rGy2b6Q=;
 b=poEHE2/XEpRGPXPt+ANo6v4tZvrVJx66TOeM0X+tKYST/s/+jJQw0sq8o0F4BwjT09
 2YFOCZ2bhxCSOCIsLMf+Jp2OZowuxw8SCqUp9LNxdCfqsn/dlFfdCcS+sZ30FLJ2+egO
 hrbhfMJr02CglizHPRvvFJekMgCsraSpbP2/pmWWP0S2pg9IjaFB47YkPIJISU1G1ZlQ
 JSkRnbH+dkt4ySjcICGOhxpdzVM9AMAShxXPZhn413TktquEPmsAA0Y3hAELSE7GGYx7
 DmYpkuxn9wADtFsKjCtdZjxzv1RZ+dnyjaMyoCLv7JK3COhZNlo0yLlnw+oWxQpqAzXP
 LoIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=C8CyZgfbm0Y8yd0Uk7N0w+Q5o8EdsJ9oWjz6rGy2b6Q=;
 b=DmUdAPil2bIZTjaHlM+f108rfY7XiYrNA3wZRI5P3UiNxut1NFI50CoElwUjuL2NKN
 S5f92rHMzThJo7XXN23vPgwO6UD6ChzIHOQ7Hc3pp9fxU7kVtokfp+XH5QFuXTeHKRju
 OnAc8qZHOFDJsKUhh0qYLLrn2Yt/e/1bniZITvariBcu2ZsgqhAbXI4b0up0hkxVUA1b
 7JLnjHOrbBUR1GaTHwi/5ffN5VqcFlMc6ypYwSf0XhNwtNghjN7M7QHUnkGA1ttPeZw3
 9LSOqSp5Ju1J4BiWprLAgzEy0Ol/EZSqbY+VEVJtqsBZcWBE1iFIhLVRiVOzNSV5Oso8
 5EBw==
X-Gm-Message-State: ANhLgQ36FLQiUhNTljs570yb5cFPtjchVHt62wEX/9kdOM0xEYRi1rOI
 CnGglHCwRuncVBYT7aAfpnd70Hdr
X-Google-Smtp-Source: ADFU+vvLeTCOAzF/vPIQMaCSB2myBIs+Xb1WOvNMPvAOzepKlzgrwO4Jn4DZviNGEgJNNkLtWEZ68g==
X-Received: by 2002:ad4:49cc:: with SMTP id j12mr22161957qvy.94.1584996844619; 
 Mon, 23 Mar 2020 13:54:04 -0700 (PDT)
Received: from [192.168.1.114] (96-42-251-64.dhcp.roch.mn.charter.com.
 [96.42.251.64])
 by smtp.gmail.com with ESMTPSA id q1sm9068929qtn.69.2020.03.23.13.54.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2020 13:54:03 -0700 (PDT)
Subject: Re: build environment
To: =?UTF-8?B?6Zmz77yM5p2+5YSJ?= <ckimchan17@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <5e776d91.1c69fb81.75c18.85c6@mx.google.com>
From: Brandon Wyman <bjwyman@gmail.com>
Message-ID: <0029f62e-233e-0d2e-1106-1ebaccf413ee@gmail.com>
Date: Mon, 23 Mar 2020 15:53:56 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <5e776d91.1c69fb81.75c18.85c6@mx.google.com>
Content-Type: multipart/alternative;
 boundary="------------4C417E65C983E1B8E28458C0"
Content-Language: en-US
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------4C417E65C983E1B8E28458C0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

No. I know this as I personally hit it. There is a wiki page with a bit 
more details on why:

https://github.com/openbmc/openbmc/wiki/Developing-on-Windows

On 2020-03-22 08:52, 陳，松儉 wrote:
>
> Hi all,
>
> Can I use Windows subsystem (ubuntu) or Cygwin to build openbmc?
>
> I tried but error at “. openbmc-env” command, any idea?
>
> ### Initializing OE build env ###
>
> -bash: ./oe-init-build-env: No such file or directory
>
> Jeff
>

--------------4C417E65C983E1B8E28458C0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>No. I know this as I personally hit it. There is a wiki page with
      a bit more details on why:</p>
    <p><a class="moz-txt-link-freetext" href="https://github.com/openbmc/openbmc/wiki/Developing-on-Windows">https://github.com/openbmc/openbmc/wiki/Developing-on-Windows</a><br>
    </p>
    <div class="moz-cite-prefix">On 2020-03-22 08:52, 陳，松儉 wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5e776d91.1c69fb81.75c18.85c6@mx.google.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
      <div class="WordSection1">
        <p class="MsoNormal"><span lang="EN-US">Hi all,</span></p>
        <p class="MsoNormal"><span lang="EN-US">Can I use Windows
            subsystem (ubuntu) or Cygwin to build openbmc?</span></p>
        <p class="MsoNormal"><span lang="EN-US">I tried but error at “.
            openbmc-env” command, any idea?</span></p>
        <p class="MsoNormal"><span lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US">### Initializing OE
            build env ###</span></p>
        <p class="MsoNormal"><span lang="EN-US">-bash:
            ./oe-init-build-env: No such file or directory</span><span
            lang="EN-US"><o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US">Jeff</span></p>
        <p class="MsoNormal"><span
            style="font-family:&quot;新細明體&quot;,serif" lang="EN-US"><o:p> </o:p></span></p>
      </div>
    </blockquote>
  </body>
</html>

--------------4C417E65C983E1B8E28458C0--
