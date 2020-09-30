Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5010827E7CF
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 13:44:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1ZCr244RzDqSB
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 21:44:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::136;
 helo=mail-lf1-x136.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=MwxsEC5y; dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1ZBs2SPnzDqQb
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 21:43:06 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id x69so1750580lff.3
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 04:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bhthCX3SkBq1PtP8AAwv4mB6sYp7+xTWcA+NMlU6bgY=;
 b=MwxsEC5yuAVjNoYAg8O0+tXmxfJ6f1LjRBkKcR/jC3St4NOuDRL0F6vybhuMEUgezU
 w0/erK/OXKMVzexWFrNa2n1QX6IZcrFn/SVfatZ3xIzPVNicUIkaD/fdJ2sytA7MiAlA
 BUuzCdzo5by7m17DuOIYJgS9VNu8Fmdg2DqEdLsoJnnyvUovUjv/HwZKZwJd/4o6Txy4
 ioRPf4RGuI+kO5HYa2bS1WYEmTeWORSuDu2oVesQx/n7aKcnzSWhAbtbQhUQxTzFhDuk
 lk9n2YUQKad7Cjjfz+e+/RLpTjT+Pm4g4O99mAGBuJkVX2yIWVUgmO7T4/uRuAk3qCDw
 ALMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bhthCX3SkBq1PtP8AAwv4mB6sYp7+xTWcA+NMlU6bgY=;
 b=Jh9c2nM/ZUA1NesgQf/WcxycrtsmPmFhekrM0GIrQ7waFa970MzuD/JHcZjRVHUlIq
 VKbcg3V3w8IIY8JRT1V4rJdFWEcgLwoKvdwFSklNU93ECWexv+nC3/bsCGokw8SvBpan
 w9JIzpxv20hxtefKtMoN+ZDbsMKIr8WDaSHvcnXAUfgU83bBfI9UmFd7zuPyDYlAIyrA
 1T9pzoukVqtBR8quaEjQGJXZNNIQEurGPA3l07jWlCdIOeDWX8WIBuGu5T2czV9WuCdh
 xwQQd9XwO2N/mZ5RKM19XDJhEWpvTdc78MwtiJD37ukRre9WJ0Qe529YPu1xqR54dCkY
 GVrA==
X-Gm-Message-State: AOAM532XACYCtlZo0CSQJDE6gPsmwLOs6Qe0MzGVVgsYes8+nFIzdb6f
 FbTurZ43diX7CEQCceQTmjQxJNA8vazkpNYX+99tPIHgM7Y=
X-Google-Smtp-Source: ABdhPJx5gM3RYMUyxvLWi0AZqOq2s9yHHVdt6m3TXNUpKt0nuChM98xu80vXORaHmi0YrnNsIgjXs3EhZYB/uUBckBg=
X-Received: by 2002:a19:c002:: with SMTP id q2mr688840lff.372.1601466180345;
 Wed, 30 Sep 2020 04:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <CY4PR04MB1033438E15ECB1EBE2E1D02CB9330@CY4PR04MB1033.namprd04.prod.outlook.com>
In-Reply-To: <CY4PR04MB1033438E15ECB1EBE2E1D02CB9330@CY4PR04MB1033.namprd04.prod.outlook.com>
From: Oskar Senft <osk@google.com>
Date: Wed, 30 Sep 2020 07:42:47 -0400
Message-ID: <CABoTLcQQFTCnyv0xxtHoDNQDYOF3JeBrFah2fFjk1BRG+WB-GQ@mail.gmail.com>
Subject: Re: Human readable POST code messages
To: Brad Chou <bradc@hyvedesignsolutions.com>
Content-Type: multipart/alternative; boundary="000000000000cd219705b08666b4"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000cd219705b08666b4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brad

I had thought about this before. The main issue I found is that the meaning
of the POST code messages are highly dependent on the particular platform
(i.e. BIOS) emitting them, i.e. there's no generic mapping that's always
correct.

Having said that, given that there are only a limited number of BIOS
vendors, it might be possible to generate a few lists and make the BIOS
vendor a config option to select the right mapping.

What's your use case?

Oskar

On Wed, Sep 30, 2020, 7:23 AM Brad Chou <bradc@hyvedesignsolutions.com>
wrote:

> Hi,
>
> Is it possible to implement an interface that decode each post code into =
a
> manful string ?
>
> For example, if code 0x10 is mapped to =E2=80=9CPower-on initialization o=
f the
> host processor=E2=80=9D.
>
> Then, in the
> phosphor-dbus-interfaces/xyz/openbmc_project/State/Boot/PostCode.interfac=
e.yaml,
>
> We have the GetPostCodes method, that can return the post codes =E2=80=9C=
0x10=E2=80=9D.
>
> Can we add another method GetPostCodesWithMessage to return the post code
> 0x10 and its human readable message =E2=80=9CPower-on initialization of t=
he host
> processor=E2=80=9D ?
>
>
>
> Thanks.
>

--000000000000cd219705b08666b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Brad<div dir=3D"auto"><br></div><div dir=3D"auto">I ha=
d thought about this before. The main issue I found is that the meaning of =
the POST code messages are highly dependent on the particular platform (i.e=
. BIOS) emitting them, i.e. there&#39;s no generic mapping that&#39;s alway=
s correct.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Having said t=
hat, given that there are only a limited number of BIOS vendors, it might b=
e possible to generate a few lists and make the BIOS vendor a config option=
 to select the right mapping.</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">What&#39;s your use case?</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Oskar</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Sep 30, 2020, 7:23 AM Brad Chou &lt;<a href=3D=
"mailto:bradc@hyvedesignsolutions.com">bradc@hyvedesignsolutions.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"m_5530482257281480216WordSection1">
<p class=3D"MsoNormal">Hi,<u></u><u></u></p>
<p class=3D"MsoNormal">Is it possible to implement an interface that decode=
 each post code into a manful string ?<u></u><u></u></p>
<p class=3D"MsoNormal">For example, if code 0x10 is mapped to =E2=80=9CPowe=
r-on initialization of the host processor=E2=80=9D.<u></u><u></u></p>
<p class=3D"MsoNormal">Then, in the=C2=A0 phosphor-dbus-interfaces/xyz/open=
bmc_project/State/Boot/PostCode.interface.yaml,<u></u><u></u></p>
<p class=3D"MsoNormal">We have the GetPostCodes method, that can return the=
 post codes =E2=80=9C0x10=E2=80=9D.<u></u><u></u></p>
<p class=3D"MsoNormal">Can we add another method GetPostCodesWithMessage to=
 return the post code 0x10 and its human readable message =E2=80=9CPower-on=
 initialization of the host processor=E2=80=9D ?<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks.<u></u><u></u></p>
</div>
</div>

</blockquote></div>

--000000000000cd219705b08666b4--
