Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAE7353C06
	for <lists+openbmc@lfdr.de>; Mon,  5 Apr 2021 08:08:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDKwg2P34z30C5
	for <lists+openbmc@lfdr.de>; Mon,  5 Apr 2021 16:08:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=eWZaiE4/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=shakeebbk@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eWZaiE4/; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDKwR3YPhz2yyK
 for <openbmc@lists.ozlabs.org>; Mon,  5 Apr 2021 16:08:39 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso5331794pjb.3
 for <openbmc@lists.ozlabs.org>; Sun, 04 Apr 2021 23:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jr1SzEdUJq3J+K6b5hBpFXt+DwGimRSzPgnwcPGj02s=;
 b=eWZaiE4/J0yv/A9m9DDOjxhe7yJNZMRjbCqmnC5uK0IMke8f4Ko+bjPiBlocbpZ5lI
 YzjAUWrAfEdtMlyC4lQIbaVYGcZhza4uJvNoyI1pf+VNssHzoI2YIl/HTGqKEwwAfpKd
 lGBjI/lvIy5KpFnvsqD/jT5eHwWIB+zgoJip8KRc32C1ofa9UGHhhTBta+CsPpE42nHz
 QHu3vxamXv2aqGamE1VT3XibZmdBUGggcsSfErmaount0f9aW1h3YBVVPxlASs0XFLD8
 QBxjSZXO8eFftSzroVtc//dscc5LP4td1naZlZwUjuRz253J84rCrmhhmwbUMbD9gkUM
 cUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jr1SzEdUJq3J+K6b5hBpFXt+DwGimRSzPgnwcPGj02s=;
 b=Yp07tkN9epxWZaNcYZKeAQ3igsnxX4ck5B4TDPHv4LJvNy3H/NhqeCUM8NAOEgKrDn
 uav2Yni9lytfTDleuCiACMzVmNAptLkHsl7xZWE8odJGwsqzetAxn58LCPuF8I6s6YD2
 +N1wVgvLLHDmLFjIxm8yXRbd+gY35l5OfVPf8bANPmotHwL2FpXQ4CIM+XZ0tXao8Zrj
 q33gukRitmFoodPscjABt923jt0vbRsQwyfix7EV5Pej1VBdosYCyrKf+znQqS7oJwA7
 QxCQct7dVRQMuMD2sWx/12ZQGROWMStBaVxyQggXwKEmTOdpNEqyiBwaQCsie3KyV9lM
 hlrQ==
X-Gm-Message-State: AOAM532QKzXaqp5VweRNJufXw+G9zuP2U7oPUbK1Fqq/u79wCSwTZ4p4
 6dMzANbIixK0DcKjiKFJ5Xk+l5XKawT4MKAWsfI=
X-Google-Smtp-Source: ABdhPJxEM49YaPedwhHfDXYBNnr4r7KtiOghP6PRlEwuX5LvZgbQ7Hbhy5g27C+KHa95RrqKg6dF8bZeuxPVH48lEK0=
X-Received: by 2002:a17:902:c204:b029:e7:32fd:bc8f with SMTP id
 4-20020a170902c204b02900e732fdbc8fmr22183818pll.43.1617602916816; Sun, 04 Apr
 2021 23:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <CABYu0WivHn9L4hbY0E3k+G_c6RH7bu6NuxwmeSNG90c_A_4Qig@mail.gmail.com>
 <CABYu0WhxPKePtGMGPojguaTJu21hMq4S=j6_5qRz5kPZC4yfFQ@mail.gmail.com>
 <b17f2faf-4c50-4b68-bbad-6d91a7661c61@kaod.org>
 <CABYu0Wi=Y2B0WsKqYd9Fin=Weow28ex6YzBPnKuoQq4cB26n6Q@mail.gmail.com>
 <da335562-6472-d165-8b91-0fcf6c6873f4@kaod.org>
In-Reply-To: <da335562-6472-d165-8b91-0fcf6c6873f4@kaod.org>
From: Shakeeb B K <shakeebbk@gmail.com>
Date: Mon, 5 Apr 2021 11:38:25 +0530
Message-ID: <CABYu0Wj5nCs1hkGGd4860otC53fdzRECq4_+TbesgaW6zOZC2Q@mail.gmail.com>
Subject: Re: [ast2500] aspeed-smc fail with MX25L25635F
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: multipart/alternative; boundary="0000000000003e9e9905bf338776"
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

--0000000000003e9e9905bf338776
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi C=C3=A9dric,

On Fri, Apr 2, 2021 at 12:45 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Hello,
>
> On 4/1/21 5:22 PM, Shakeeb B K wrote:
> > Hi C=C3=A9dric,
> >
> > The part we are using is *MX25L25635F*
> https://www.macronix.com/Lists/Datasheet/Attachments/7414/MX25L25635F,%20=
3V,%20256Mb,%20v1.5.pdf
> <
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.m=
acronix.com%2FLists%2FDatasheet%2FAttachments%2F7414%2FMX25L25635F%2C%25203=
V%2C%2520256Mb%2C%2520v1.5.pdf&data=3D04%7C01%7Cspasha%40nvidia.com%7C4cf89=
d8779c84d638c6f08d8ef7d0919%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C63=
7522667609971209%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMz=
IiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3DhYy5Cpi06y4T0DpFb4%2FDeo2nE=
y5Cn3rf3l%2BEO%2FaPP%2FU%3D&reserved=3D0
> >
> >
> > Attaching the failed boot log - full_boot.log
>
> This was failing in 5.8 already.


> > The patch that fixes the problem - workaround.patch
>
> OK. You are disabling Dual I/O.
>
> > A patch to override read opcode - 001-Debug.patch
> > Failing log with post fixup read opcode update - fail_post_fixup.log
>
> Could you check the SPI wiring on the schematics of your AST2500 dgx boar=
d
> ?
>
> If it is single wired, then I suggest a work around like the one attached=
.


We have MOSI, MISO datalines connected and the workaround is working for us=
.
But I just wanted to check if anybody got dual mode working with
MX25L25635F,
and what would be the right fix for it in spi-nor.

Thanks,
Shakeeb

--0000000000003e9e9905bf338776
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi C=C3=A9dric,</div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 2, 2021 at 12:45 PM C=C3=
=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.org">clg@kaod.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br=
>
<br>
On 4/1/21 5:22 PM, Shakeeb B K wrote:<br>
&gt; Hi=C2=A0C=C3=A9dric,<br>
&gt; <br>
&gt; The part we are using is=C2=A0*MX25L25635F*=C2=A0<a href=3D"https://ww=
w.macronix.com/Lists/Datasheet/Attachments/7414/MX25L25635F,%203V,%20256Mb,=
%20v1.5.pdf" rel=3D"noreferrer" target=3D"_blank">https://www.macronix.com/=
Lists/Datasheet/Attachments/7414/MX25L25635F,%203V,%20256Mb,%20v1.5.pdf</a>=
 &lt;<a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fwww.macronix.com%2FLists%2FDatasheet%2FAttachments%2F7414%2FMX25L2=
5635F%2C%25203V%2C%2520256Mb%2C%2520v1.5.pdf&amp;data=3D04%7C01%7Cspasha%40=
nvidia.com%7C4cf89d8779c84d638c6f08d8ef7d0919%7C43083d15727340c1b7db39efd9c=
cc17a%7C0%7C0%7C637522667609971209%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw=
MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DhYy5C=
pi06y4T0DpFb4%2FDeo2nEy5Cn3rf3l%2BEO%2FaPP%2FU%3D&amp;reserved=3D0" rel=3D"=
noreferrer" target=3D"_blank">https://nam11.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fwww.macronix.com%2FLists%2FDatasheet%2FAttachments%2=
F7414%2FMX25L25635F%2C%25203V%2C%2520256Mb%2C%2520v1.5.pdf&amp;data=3D04%7C=
01%7Cspasha%40nvidia.com%7C4cf89d8779c84d638c6f08d8ef7d0919%7C43083d1572734=
0c1b7db39efd9ccc17a%7C0%7C0%7C637522667609971209%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DhYy5Cpi06y4T0DpFb4%2FDeo2nEy5Cn3rf3l%2BEO%2FaPP%2FU%3D&amp;reserve=
d=3D0</a>&gt;<br>
&gt; <br>
&gt; Attaching the failed boot log - full_boot.log<br>
<br>
This was failing in 5.8 already.=C2=A0</blockquote><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
&gt; The patch that fixes the problem - workaround.patch<br>
<br>
OK. You are disabling Dual I/O.<br>
<br>
&gt; A patch to override read opcode - 001-Debug.patch<br>
&gt; Failing log with post fixup read opcode update - fail_post_fixup.log<b=
r>
<br>
Could you check the SPI wiring on the schematics of your AST2500 dgx board =
?=C2=A0 <br>
<br>
If it is single wired, then I suggest a work around like the one attached.<=
/blockquote><div><br></div><div>We have MOSI, MISO datalines connected and =
the workaround is working for us.</div><div>But I just wanted to check if a=
nybody got dual mode working with MX25L25635F,</div><div>and what would be =
the right fix for it in spi-nor.</div><div><br></div><div>Thanks,</div><div=
>Shakeeb</div></div></div>

--0000000000003e9e9905bf338776--
