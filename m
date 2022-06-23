Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6A0557D14
	for <lists+openbmc@lfdr.de>; Thu, 23 Jun 2022 15:33:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTLmD6mhmz3c7s
	for <lists+openbmc@lfdr.de>; Thu, 23 Jun 2022 23:33:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=uVHtg403;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=zhangjian.3032@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=uVHtg403;
	dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTLlt6Gwpz2yn3
	for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2022 23:32:41 +1000 (AEST)
Received: by mail-lj1-x229.google.com with SMTP id q9so5314675ljp.4
        for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2022 06:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=mqBaNhzaiIYheAQaBEKpUJPWJvZo1BawrZkS7tsT8Qo=;
        b=uVHtg403qemVPU6g9U7+pJCtYRFedZJAEfeTxAS4reNdCwgy/o9UISLg3reHAqZgfb
         N6+EYRyq+IxKo63PAvYJVQUEgO9BQmxr/uLjidroaHeIvXtPFr726CBW3xecBJcxWxhl
         s58NlguYfQdFOEM1smWQYktYSLD9ycdHJplkZt8GwtBLsHGUvX5MPI+5DJQaqKh5QnYy
         thEBWGkELsGMzYmPdqIhpPw17tPiPc/gcSuQ6KJpm1mPdHzNuolcrWwy9mXP4tpibSQD
         BFx1REoga9hvdaSsXeQQgZNxJD0vyBEFg9eJjLGkmXyzVogz9yMnlyu7pDJ45grmv1de
         UcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=mqBaNhzaiIYheAQaBEKpUJPWJvZo1BawrZkS7tsT8Qo=;
        b=eLxve2G9Qe/KoNDyfSPm3hwa/nxE5+LTvE4dOHEFAd7C4sKCneyjHE+2l2z1MjWUSi
         KWdkz0j40gqY3rwfahqhFgzGdnNOe9xJv3EP2mNt2Xx/ECI1AY7ENN0FHEsuCTk6IaVV
         zy4mQJAne5bHVh+D/QqxOpoEMX+8hxjJqXp7hAtcQLe1rWC6zLnoPPRxEXYhXSnOj+Eh
         41OfyiL9yAnzOxQTZWFm3YY2WU1aKEMERgoCBIZP2cWIXl84U574kkHd3/2ApoEiqXhC
         rvw0dBCf8x0NfQH4mW+2VxwPgdH6nev8subogDpjIHK7PfT4cl46bq3/2aYY3t4LSzX9
         etww==
X-Gm-Message-State: AJIora885qqgP5mo9p4h16pN2wm/tefyvluLASmJGaIfsoRxEkdcBFX7
	4bYDLMUktcej4GsPFiJHyYJkc5yP6zb0DYp06RCKwsvWzPs=
X-Google-Smtp-Source: AGRyM1seCvMtbpkhePdmtLfu+aIbcacDuGMYizlCLUSRZ2O2EBOFT0V5Zjxp4X4rHLK56N8DE2wXqGPk2a5tu659heI=
X-Received: by 2002:a2e:a374:0:b0:25a:666c:d02e with SMTP id
 i20-20020a2ea374000000b0025a666cd02emr4695104ljn.67.1655991156116; Thu, 23
 Jun 2022 06:32:36 -0700 (PDT)
Received: from 349319672217 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Jun 2022 06:32:35 -0700
Mime-Version: 1.0
From: Jian Zhang <zhangjian.3032@bytedance.com>
Date: Thu, 23 Jun 2022 06:32:35 -0700
Message-ID: <CA+J-oUtjpD=1Dk_SKviYcj5i5Ybj5_YW8XAuqc1euo-rV+o49w@mail.gmail.com>
Subject: web-vue sol console escape sequences
To: openbmc <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000009d1ca105e21d7c1c"
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

--0000000000009d1ca105e21d7c1c
Content-Type: text/plain; charset="UTF-8"

Hi team;
   On the web view, I use the sol console, I hit an issue, the terminal
cannot determine the key (F5-F12) that I pressed.
   From the host console, I use the "showkey -a" command to capture the
keys that pressed.
Here are some results,  F1-F4 are normal, but F5-F12 are the same
```
^[P      27 0033 0x1b  ==> f1
         80 0120 0x50
^[Q      27 0033 0x1b   ==> f2
         81 0121 0x51
^[R      27 0033 0x1b.  ==> f3
         82 0122 0x52
^[S      27 0033 0x1b. ==> f4
         83 0123 0x53
^[~      27 0033 0x1b. ==> f5
        126 0176 0x7e
^[~      27 0033 0x1b. ==> f6
        126 0176 0x7e
^[~      27 0033 0x1b. == >f7
        126 0176 0x7e
``
 In putty, the result is the same at the beginning. After setting up the
keypod, they are different, and the result is what I want.
It might relate to `xterm.js  escape sequences`, but I don't know how to do
it, do you know? Thanks.

Thanks a lot.

--0000000000009d1ca105e21d7c1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div id=3D"editor_version_1.12.1_V7fPaEyl" style=3D"word-break:break-word">=
<div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6">Hi team;</d=
iv><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6">=C2=A0=
=C2=A0 On the web view, I use the sol console, I hit an issue, the terminal=
 cannot determine the key (F5-F12) that I pressed.</div><div style=3D"margi=
n-top:4px;margin-bottom:4px;line-height:1.6">=C2=A0=C2=A0 From the host con=
sole, I use the &quot;showkey -a&quot; command to capture the keys that pre=
ssed.</div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6">=
Here are some results, =C2=A0F1-F4 are normal, but F5-F12 are the same</div=
><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6">```</div><=
div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6">^[P =C2=A0=
=C2=A0=C2=A0=C2=A0 27 0033 0x1b =C2=A0=3D=3D&gt; f1</div><div style=3D"marg=
in-top:4px;margin-bottom:4px;line-height:1.6">=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 80 0120 0x50</div><div style=3D"margin-top:4px;margin=
-bottom:4px;line-height:1.6">^[Q =C2=A0=C2=A0=C2=A0=C2=A0 27 0033 0x1b =C2=
=A0 =3D=3D&gt; f2</div><div style=3D"margin-top:4px;margin-bottom:4px;line-=
height:1.6">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 81 0121 0x51</=
div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6">^[R =C2=
=A0=C2=A0=C2=A0=C2=A0 27 0033 0x1b. =C2=A0=3D=3D&gt; f3</div><div style=3D"=
margin-top:4px;margin-bottom:4px;line-height:1.6">=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 82 0122 0x52</div><div style=3D"margin-top:4px;mar=
gin-bottom:4px;line-height:1.6">^[S =C2=A0=C2=A0=C2=A0=C2=A0 27 0033 0x1b. =
=3D=3D&gt; f4</div><div style=3D"margin-top:4px;margin-bottom:4px;line-heig=
ht:1.6">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 83 0123 0x53</div>=
<div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6">^[~ =C2=A0=
=C2=A0=C2=A0=C2=A0 27 0033 0x1b. =3D=3D&gt; f5</div><div style=3D"margin-to=
p:4px;margin-bottom:4px;line-height:1.6">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 126 0176 0x7e</div><div style=3D"margin-top:4px;margin-bottom:4px=
;line-height:1.6">^[~ =C2=A0=C2=A0=C2=A0=C2=A0 27 0033 0x1b. =3D=3D&gt; f6<=
/div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6">=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 126 0176 0x7e</div><div style=3D"margi=
n-top:4px;margin-bottom:4px;line-height:1.6">^[~ =C2=A0=C2=A0=C2=A0=C2=A0 2=
7 0033 0x1b. =3D=3D &gt;f7</div><div style=3D"margin-top:4px;margin-bottom:=
4px;line-height:1.6">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 126 0176 0x=
7e</div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6">``<=
/div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6">=C2=A0=
In putty, the result is the same at the beginning. After setting up the key=
pod, they are different, and the result is what I want.</div><div style=3D"=
margin-top:4px;margin-bottom:4px;line-height:1.6"><span style=3D"font-weigh=
t:400"><span style=3D"font-size:14px"><span style=3D"font-family:LarkEmojiF=
ont,LarkChineseQuote,-apple-system,system-ui,Tahoma,&quot;PingFang SC&quot;=
,Arial,sans-serif"><span style=3D"color:rgb(31,35,41)"><span style=3D"backg=
round-color:rgb(255,255,255)">It might relate to `xterm.js =C2=A0escape seq=
uences`, </span></span></span></span></span>but I don&#39;t know how to do =
it, do you know? Thanks.</div><div style=3D"margin-top:4px;margin-bottom:4p=
x;line-height:1.6"><br></div><div style=3D"margin-top:4px;margin-bottom:4px=
;line-height:1.6"><span style=3D"font-weight:400"><span style=3D"font-size:=
14px"><span style=3D"font-family:LarkEmojiFont,LarkChineseQuote,-apple-syst=
em,system-ui,Tahoma,&quot;PingFang SC&quot;,Arial,sans-serif"><span style=
=3D"color:rgb(31,35,41)"><span style=3D"background-color:rgb(255,255,255)">=
Thanks a lot.</span></span></span></span></span></div></div>

--0000000000009d1ca105e21d7c1c--
