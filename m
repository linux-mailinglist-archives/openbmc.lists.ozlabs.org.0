Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1B96B88FE
	for <lists+openbmc@lfdr.de>; Tue, 14 Mar 2023 04:33:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbJyG3rZMz3cD8
	for <lists+openbmc@lfdr.de>; Tue, 14 Mar 2023 14:33:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=AIUl5KeL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=zhangjian.3032@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=AIUl5KeL;
	dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbJxf70mwz3cB8
	for <openbmc@lists.ozlabs.org>; Tue, 14 Mar 2023 14:32:36 +1100 (AEDT)
Received: by mail-wr1-x430.google.com with SMTP id f11so13065849wrv.8
        for <openbmc@lists.ozlabs.org>; Mon, 13 Mar 2023 20:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1678764751;
        h=cc:to:subject:message-id:date:references:mime-version:from
         :in-reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=PhP8XDAcS1A/7bUuU1qSO6RfyyRwMZ1nqN1GEKJydm4=;
        b=AIUl5KeLc6Upxxc9LCSomYwSPGKhDxLz5XnNmQlNPqF9EibQksdcKYINAOht+VwJf4
         AWsS2y2DOGuCDq75XIDyyFgmBhboT6qmuaq/w3SfBr6pfoEnZOXTeK20Tk8UdsBY/daI
         QVJDrW01y6vFduynV9qp+ypbQZn3aXGmNBPAX6yUQ8TfhzTGhQ1pE7lmBE4YLGdg8oV1
         P7OI3oi5l3/3tg9Ty/203O55vYjKQQjjlY5lRsdjg4SovbWBA9N819GidZBq/As73AjC
         fldR0hXelisD6xWPavQmWPVCt8uH+vG9Sg9gGOTmUZbpl62HKY3Ph7dZt37MiLOoSRXs
         0Hrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678764751;
        h=cc:to:subject:message-id:date:references:mime-version:from
         :in-reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PhP8XDAcS1A/7bUuU1qSO6RfyyRwMZ1nqN1GEKJydm4=;
        b=C+9J6PDQfvgbobMn5ecBlA8EF9aQf2sZJaDuSYL5g5d+u613vuWEBqUD0gHZHWxcur
         VCa91VkrdalxyTuSr8exLNp8V9xOZOWkUbn1YnIxwZhfzfcrgl8oHxqgOc17/VuZ0F0+
         u97JVaYBVkPXRJJhJ+QZZMf/cgSLmKJQNOK+7k5IjaYfeblnOxcXrgjPKtlJ2Z+RBOiw
         CdEog+YjVt9AbTI1rO4XKCRwwPxnQRqiNvpPpssT3z3LqtokxjbOiFgxxuknmBLWiqdI
         iW5OwkB7s+WCrAwKc4ezH4dZW69jFn6lEdKHyEo6tgOwG1ySZqQUpo6ff7F2EhsEzBay
         2ICw==
X-Gm-Message-State: AO0yUKXBhhM7+Tb2eSaf5TS1SFzUke90YSHcOZkGMB9UACpzGv3ky7O/
	+/K/7cEXoNjwzKUU7pVls0ryrjxpdmESTbcE/iagLBcRgbI/oMQi
X-Google-Smtp-Source: AK7set+HfX1xoGGOg0VumAC2z+sSst0DWhS/ab6TvcFCVE2nakZzDeHxnnXfGyUKWk6QtZKpAb2JODqfKZNa26Ncc7Q=
X-Received: by 2002:adf:dd91:0:b0:2c9:f488:5f55 with SMTP id
 x17-20020adfdd91000000b002c9f4885f55mr6518546wrl.4.1678764751344; Mon, 13 Mar
 2023 20:32:31 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 13 Mar 2023 22:32:30 -0500
In-Reply-To: <CAB7+d-nOMCGdD7upJviTVrWuZ=mW0gyV9G0E4wke8rQstg2zzw@mail.gmail.com>
From: Jian Zhang <zhangjian.3032@bytedance.com>
Mime-Version: 1.0
References: <CAB7+d-nOMCGdD7upJviTVrWuZ=mW0gyV9G0E4wke8rQstg2zzw@mail.gmail.com>
Date: Mon, 13 Mar 2023 22:32:30 -0500
Message-ID: <CA+J-oUsaF8rNYYff9QZj8C0iZgHf8+YE=LfPuQ74ndx+XrwAnA@mail.gmail.com>
Subject: Re: [External] Running evb-ast2600 image using qemu
To: David Bashaw <theactualdbashaw@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000aa7e7405f6d3e0b7"
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000aa7e7405f6d3e0b7
Content-Type: text/plain; charset="UTF-8"

The command that I used.
```
qemu-system-arm -M ast2600-evb  -nographic -drive
file=image-bmc,format=raw,if=mtd -net nic,model=ftgmac100,netdev=netdev1
-netdev user,id=netdev1,hostfwd=:127.0.0.1:3222-:22,hostfwd=:127.0.0.1:1443-:443,hostfwd=udp::1623-:623

```
For your reference.

Jian
From: "David Bashaw"<theactualdbashaw@gmail.com>
Date: Tue, Mar 14, 2023, 07:52
Subject: [External] Running evb-ast2600 image using qemu
To: <openbmc@lists.ozlabs.org>
I'm new to openbmc but have read lots fo docs.
I want to try running an evb-ast2600 image using qemu.
I ran the following steps:
.setup evb-ast2600
bitbake obmc-phosphor-image

The build completes fine.
I installed qemu-system-arm also.

What command line should I use to invoke qemu?

--000000000000aa7e7405f6d3e0b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div id=3D"editor_version_1.29.5_YkJYyBhx" style=
=3D"word-break:break-word"><div style=3D"margin-top:4px;margin-bottom:4px;l=
ine-height:1.6"><div class=3D"" style=3D"font-size:14px">The command that I=
 used.
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px">```
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px">qemu-system-arm -M ast2600-evb=C2=
=A0 -nographic -drive file=3Dimage-bmc,format=3Draw,if=3Dmtd -net nic,model=
=3Dftgmac100,netdev=3Dnetdev1 -netdev user,id=3Dnetdev1,hostfwd=3D:127.0.0.=
1:3222-:22,hostfwd=3D:127.0.0.1:1443-:443,hostfwd=3Dudp::1623-:623
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px">```
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px">For your reference.
</div></div><div style=3D"margin-top:4px;margin-bottom:4px;line-height:1.6"=
><div class=3D"" style=3D"font-size:14px"><br></div></div><div style=3D"mar=
gin-top:4px;margin-bottom:4px;line-height:1.6"><div class=3D"" style=3D"fon=
t-size:14px">Jian
</div></div></div><div class=3D"history-quote-wrapper" id=3D"lark-mail-quot=
e-167876472"><div style=3D"list-style-position:inside"><div class=3D"adit-h=
tml-block adit-html-block--collapsed" style=3D"border-left:none;padding-lef=
t:0px"><div><div class=3D"adit-html-block__attr history-quote-meta-wrapper =
history-quote-gap-tag" id=3D"lark-mail-meta-WqZOEPU8H" style=3D"padding:12p=
x;background:rgb(245,246,247);color:rgb(31,35,41);border-radius:4px;margin-=
top:24px;margin-bottom:12px"><div id=3D"lark-mail-quote-4892a39c936a394f576=
156da4b8bf9e2"><div style=3D"word-break:break-word"><div style=3D""><span s=
tyle=3D"">From: </span><span style=3D"white-space:nowrap">&quot;David Basha=
w&quot;&lt;<a style=3D"white-space:pre-wrap;word-break:break-word;text-deco=
ration:none;color:inherit" href=3D"mailto:theactualdbashaw@gmail.com" class=
=3D"quote-head-meta-mailto">theactualdbashaw@gmail.com</a>&gt;</span></div>=
<div style=3D""><span style=3D"">Date: </span> Tue, Mar 14, 2023, 07:52</di=
v><div style=3D""><span style=3D"">Subject: </span> [External] Running evb-=
ast2600 image using qemu</div><div style=3D""><span style=3D"">To: </span><=
span style=3D"white-space:nowrap">&lt;<a style=3D"white-space:pre-wrap;word=
-break:break-word;text-decoration:none;color:inherit" href=3D"mailto:openbm=
c@lists.ozlabs.org" class=3D"quote-head-meta-mailto">openbmc@lists.ozlabs.o=
rg</a>&gt;</span></div></div></div></div><div><div dir=3D"ltr">I&#39;m new =
to openbmc but have read lots fo docs.<div>I want to try running an evb-ast=
2600 image using qemu.</div><div>I ran the following steps:</div><div>.setu=
p evb-ast2600</div><div>bitbake obmc-phosphor-image</div><div><br></div><di=
v>The build completes fine.</div><div>I installed qemu-system-arm also.</di=
v><div><br></div><div>What command line should I use to invoke qemu?</div><=
div><br></div></div></div></div></div></div></div></body></html>

--000000000000aa7e7405f6d3e0b7--
