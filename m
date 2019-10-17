Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 495FBDAE96
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 15:39:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46v9Hm09qLzDqcv
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 00:39:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52a;
 helo=mail-ed1-x52a.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="r8Zw8f1F"; 
 dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46v9Gy5SwLzDqQn
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 00:38:34 +1100 (AEDT)
Received: by mail-ed1-x52a.google.com with SMTP id r16so1743547edq.11
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 06:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PXALU3Fwwt8DeITc9Lzm9pZEIaAS8qZc0y/ZBiA1skg=;
 b=r8Zw8f1FL9NYngmm1ZX6ZisetjS1faw4+u+IR/rd/KletLHQxuy8QsIpA+z2BPBAy4
 tQITPiJiA8/w4ORXD5E1xX52/Kc7G7ATzn/MLFzMof8Zt9MAtf6Pq42F/kZ8RTTrcR/Z
 HD8uV7xf9ZdKk4/Cd/0itz29uO75e0etfp7sLH/broe2ZhLkx3YG0aC+njUXmAuiOg4l
 CZRfCeykxZOggrveVTwEWpV9C/0HIzMhsTXWY5Q7huWF9kGXf8mJwWoCyRDnot+B3fmW
 SsGS6defXR2v0OmnHjzHGPodVCo719bxqBOkeFx9FDbf/9gWN6qpoKsL1SAkSN7H83la
 mk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PXALU3Fwwt8DeITc9Lzm9pZEIaAS8qZc0y/ZBiA1skg=;
 b=Um1k4r0QfyEta6K4ivatZaIbt2dJ3MmkwEnOvgQlpa44zas7Vjt09TTBCl1dcxwaI4
 sMoC549aCa/XbtgTnR3m+JQsa3RFPWZZEPBfsrmxEfdiARk1SVhNGXfDOGYz99hkzj1x
 JXJ1xFpRORUb0nGOlG/TfRpe1G4rWIU6ybufGNvyPTFDX+RaQYgogO/DOsdo7RBgfgTL
 6Aauv8SfUKrpRCkRd7hgVDiRc+jMS+x6GlcsBB0QWrCjO6D0WCUaEZQ5A0+9qLAV4OMX
 2eP3mlDFp3ZtPxm1ImTqptm6ArzrJXE6KHop4HJmpVdfSyKKXOzkVdM+tQgPUMKwp8E3
 z49Q==
X-Gm-Message-State: APjAAAWKSExtQSHj6GVLngENTaqBDwRQoyQjLFhaQDlehQ5eSCLq/xIg
 N1gTClDDKhH6OJmeVOj5+hUlcVZEywq6141s3aYzmw==
X-Google-Smtp-Source: APXvYqzyUzaq79gHdWGhOEItiNdQ7zrtdDehwgGY3vVJmJ5cfiFRANBWwPCLuRlEx5DmPwVo7vJqQ2q4bh8ET4ZRPDo=
X-Received: by 2002:a17:906:5407:: with SMTP id
 q7mr3607245ejo.24.1571319510369; 
 Thu, 17 Oct 2019 06:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <EA590716-271A-4F5C-9B36-80260B7F35B6@fb.com>
 <21807.1571306216@dooku.sandelman.ca>
In-Reply-To: <21807.1571306216@dooku.sandelman.ca>
From: Oskar Senft <osk@google.com>
Date: Thu, 17 Oct 2019 09:38:14 -0400
Message-ID: <CABoTLcTWzDmn+up4Qq_h=X+YNty=XyTQqHKRDr6N+5ELY=xOZg@mail.gmail.com>
Subject: Re: x86-power-control
To: Michael Richardson <mcr@sandelman.ca>
Content-Type: multipart/alternative; boundary="0000000000003f533805951b55fd"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000003f533805951b55fd
Content-Type: text/plain; charset="UTF-8"

Hi Michael

Why in a target system wouldn't naming it in DTS be the most reliable and
> most easily accessible mechanism?  I can see that in development being
> able to define
> things helps, but it is not like the production systems would have
> wire-wrap
> where the GPIO pin might change.
>

I totally agree. I was actually experimenting on our platform (TYAN S7106)
to name GPIO pins in the DTS, but I couldn't figure out how to read those
names from userspace.

Here's what I tried in the DTS:

&gpio {
        pin_gpio_d2 {
                gpios = <ASPEED_GPIO(D, 2) GPIO_ACTIVE_HIGH>;
                input;
                line-name = "SYS_PWROK_BUF";
        };
...

However, from what I can tell line-name is actually only relevant when used
together with "gpiohog", which is not what we want.

Did you manage to make this work?

Thanks
Oskar.

--0000000000003f533805951b55fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Michael<div><br></div></div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Why in a=
 target system wouldn&#39;t naming it in DTS be the most reliable and<br>
most easily accessible mechanism?=C2=A0 I can see that in development being=
 able to define<br>
things helps, but it is not like the production systems would have wire-wra=
p<br>
where the GPIO pin might change.<br></blockquote><div><br></div><div>I tota=
lly agree. I was actually experimenting on our platform (TYAN S7106) to nam=
e GPIO pins in the DTS, but I couldn&#39;t figure out how to read those nam=
es from userspace.</div><div><br></div><div>Here&#39;s what I tried in the =
DTS:</div><div><br></div><div><font face=3D"monospace">&amp;gpio { <br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 pin_gpio_d2 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 gpios =3D &lt;ASPEED_GPIO(D, 2) GPIO_ACTIVE_HIGH&g=
t;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 input;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line-name =3D &quot=
;SYS_PWROK_BUF&quot;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br></font></div><di=
v><font face=3D"monospace">...</font></div><div><font face=3D"monospace"><b=
r></font></div><div><font face=3D"arial, sans-serif">However, from what I c=
an tell line-name is actually only relevant when used together with &quot;g=
piohog&quot;, which is not what we want.</font></div><div><br></div><div><f=
ont face=3D"arial, sans-serif">Did you manage to make this work?</font></di=
v><div><font face=3D"arial, sans-serif"><br></font></div><div><font face=3D=
"arial, sans-serif">Thanks</font></div><div><font face=3D"arial, sans-serif=
">Oskar.</font></div><div><font face=3D"arial, sans-serif"></font></div></d=
iv></div>

--0000000000003f533805951b55fd--
