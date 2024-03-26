Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9867688BC29
	for <lists+openbmc@lfdr.de>; Tue, 26 Mar 2024 09:19:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bRqU+AEP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3jQR2f3yz3dSr
	for <lists+openbmc@lfdr.de>; Tue, 26 Mar 2024 19:19:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bRqU+AEP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=ppighouse@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3jPw31jlz3bmy
	for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2024 19:19:15 +1100 (AEDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a46de423039so298854466b.0
        for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2024 01:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711441152; x=1712045952; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7jALFLKft/yRrYyVRO6nj0/nfRgesMSV+eZNvD6ImtY=;
        b=bRqU+AEP1/Xow8AVvN6L/d/oKdiolPRzFKBAM5rtOw5ODTQQ1LYLpL19EuFh05NgcZ
         K8Xb5jGHlZK0kQ0VuqVpOOKlOZFPrAlsJnIaDF/UkUH4ih5qKXh7wGg1HO9bAgb8h0dq
         Z7KttKwNc9pw2I3tZxhgiC69VzIq/mHvCcdSPsVsF8CCiw/M8uO03up/gnjWe/jKILjD
         R6JMOTB2sNVFWtn7lX7m4GFDO40JZ0GkpZfM7FdUGNbj0iyMIKr9lVjKN52Q8VlCFAfR
         +b6rsKZWJCkAWByfQxcWYabPg6vDCbxoffocBgB9PA29lQ0L2f/VQyafIQIHW3Bn7bKo
         v15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711441152; x=1712045952;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7jALFLKft/yRrYyVRO6nj0/nfRgesMSV+eZNvD6ImtY=;
        b=lJZP8dC+jMNuGfDad19hnoOdelpewj5HbqeWjw6TQFdFroUQU6pS/NuY/WeytTcPTk
         RNYuawX1Yvhx7G6vyBNeR1SbHEfFcanmSOmTYx4pxBOUrLc+xWez+OMW+4IeQU9FCYyM
         lX4vXJy3uxW6ayr23xxMTyi0hEUsmPEWlATKkiHwh2hMm8IRJfnXQlUyuCecIRcu7s6A
         yFptfLnEP4dVZ5QtcEfs6N1chiU2H2FrvOk2qIYpBuRhpA3wGZiWDbylMyDYdAuk6m3m
         dl/b+jO/C7fDA6LghNNy8FAPRTs7chZfFo6rYEx7AOsSwVzdhXBZ6rwDH0d+Ek0w8Nve
         F5vw==
X-Forwarded-Encrypted: i=1; AJvYcCWHaekjAvfrAVKa+xdh1SuWRx/qNN1LbKDbZdpiK0fTD5TEDSVePjB9c2KC1gHc/PdJhPhaPtwBMRJT85nZjkcEa0v/4Mh8xks=
X-Gm-Message-State: AOJu0Yy942COPdrQ0L9Tvi8DmpfjxzzJQFhsnvb3jKAFeD29mqKm/BSe
	V5PupVhjYatNxvUQl32QV1I7eX0pO7+xslwplf+D23T1tlTJK1S76Xa7SJEMwcVdlYwPWAYmW1p
	i6yefZqgs6AxhBBamzprdphHrYFQ=
X-Google-Smtp-Source: AGHT+IHCqwOZ+bilo3xVXsMu6K+zt8U0uyFNom2Hc7sRofrsTXPGHzMPSceC9Cu2Y/xyfJ4n/7p/YdNvlw8HzxGIUKQ=
X-Received: by 2002:a50:c311:0:b0:56c:1bf7:164e with SMTP id
 a17-20020a50c311000000b0056c1bf7164emr3424480edb.28.1711441151931; Tue, 26
 Mar 2024 01:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240130090447.198103-1-Kelly_Hung@asus.com> <acd6f49b-b476-4364-8263-06e20a0c599d@kernel.org>
 <TYZPR04MB6596BB61B2D1B9216F06A18E9D222@TYZPR04MB6596.apcprd04.prod.outlook.com>
 <c88558f8-acc1-4b36-b729-bdf1019e81a0@kernel.org>
In-Reply-To: <c88558f8-acc1-4b36-b729-bdf1019e81a0@kernel.org>
From: Chia Li Hung <ppighouse@gmail.com>
Date: Tue, 26 Mar 2024 16:19:00 +0800
Message-ID: <CAK=2BxtwdRQ4wp14v4Az=dBvUND9ApOyGQqkbaCUgT-ydPhwpw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: asus: Add ASUS X4TF BMC
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000ea408606148bf1de"
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
Cc: =?UTF-8?B?QWxsZW5ZWSBIc3Uo6Kix5bm85bKzKQ==?= <AllenYY_Hsu@asus.com>, =?UTF-8?B?S2VsbHkgSHVuZyjmtKrlmInojokp?= <Kelly_Hung@asus.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000ea408606148bf1de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2024=E5=B9=B43=E6=9C=885=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=883:09=E5=AF=AB=E9=81=93=EF=BC=9A

> On 05/03/2024 07:30, Kelly Hung(=E6=B4=AA=E5=98=89=E8=8E=89) wrote:
> > Hi, Krzysztof,
> >
> > I have already executed
> >  - `git log --oneline -- DIRECTORY_OR_FILE`
> >  - do scripts/get_maintainers.pl
> > I tried correcting subject prefix and resent on 2/22.
> > According this document:
> https://github.com/openbmc/docs/blob/master/kernel-development.md.
> > "You should feel welcome to cc the OpenBMC list when sending upstream,
> so other kernel developers can provide input where appropriate."
> > So, I also -cc to openbmc@lists.ozlabs.org.
> >
>
> Please respond inline, instead of top-posting, because it makes your
> emails hard to follow.
>
> https://elixir.bootlin.com/linux/v6.8-rc7/source/Documentation/process/su=
bmitting-patches.rst#L340
>
> You still ignored my tag.
>
>
I reply inline using my Gmail account, thanks for your comment.

>
> >
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > This email and any attachments to it contain confidential information
> and are intended solely for the use of the individual to whom it is
> addressed. If you are not the
>
> Maybe I am the intended recipient of your message, maybe not. I don't
> want to have any legal questions regarding upstream, public
> collaboration, thus I will just remove your messages.
>
> Please talk with your IT that such disclaimers in open-source are not
> desired (and maybe even harmful).
>
> If you do not understand why, please also see:
> https://www.youtube.com/live/fMeH7wqOwXA?si=3DGY7igfbda6vnjXlJ&t=3D835
>
> Best regards,
> Krzysztof
>
>
I reply using my Gmail account so no more confidential information.

Best Regards,
Kelly

--000000000000ea408606148bf1de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Krzysztof Kozlowski &lt;<a href=3D"ma=
ilto:krzk@kernel.org">krzk@kernel.org</a>&gt; =E6=96=BC 2024=E5=B9=B43=E6=
=9C=885=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=883:09=E5=AF=AB=E9=81=
=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
05/03/2024 07:30, Kelly Hung(=E6=B4=AA=E5=98=89=E8=8E=89) wrote:<br>
&gt; Hi, Krzysztof,<br>
&gt; <br>
&gt; I have already executed<br>
&gt;=C2=A0 - `git log --oneline -- DIRECTORY_OR_FILE`<br>
&gt;=C2=A0 - do scripts/<a href=3D"http://get_maintainers.pl" rel=3D"norefe=
rrer" target=3D"_blank">get_maintainers.pl</a><br>
&gt; I tried correcting subject prefix and resent on 2/22.<br>
&gt; According this document: <a href=3D"https://github.com/openbmc/docs/bl=
ob/master/kernel-development.md" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/openbmc/docs/blob/master/kernel-development.md</a>.<br>
&gt; &quot;You should feel welcome to cc the OpenBMC list when sending upst=
ream, so other kernel developers can provide input where appropriate.&quot;=
<br>
&gt; So, I also -cc to <a href=3D"mailto:openbmc@lists.ozlabs.org" target=
=3D"_blank">openbmc@lists.ozlabs.org</a>.<br>
&gt; <br>
<br>
Please respond inline, instead of top-posting, because it makes your<br>
emails hard to follow.<br>
<a href=3D"https://elixir.bootlin.com/linux/v6.8-rc7/source/Documentation/p=
rocess/submitting-patches.rst#L340" rel=3D"noreferrer" target=3D"_blank">ht=
tps://elixir.bootlin.com/linux/v6.8-rc7/source/Documentation/process/submit=
ting-patches.rst#L340</a><br>
<br>
You still ignored my tag.<br>
<br></blockquote><div><br></div><div>I reply inline using my Gmail account,=
 thanks for your comment.=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; This email and any attachments to it contain confidential information =
and are intended solely for the use of the individual to whom it is address=
ed. If you are not the <br>
<br>
Maybe I am the intended recipient of your message, maybe not. I don&#39;t<b=
r>
want to have any legal questions regarding upstream, public<br>
collaboration, thus I will just remove your messages.<br>
<br>
Please talk with your IT that such disclaimers in open-source are not<br>
desired (and maybe even harmful).<br>
<br>
If you do not understand why, please also see:<br>
<a href=3D"https://www.youtube.com/live/fMeH7wqOwXA?si=3DGY7igfbda6vnjXlJ&a=
mp;t=3D835" rel=3D"noreferrer" target=3D"_blank">https://www.youtube.com/li=
ve/fMeH7wqOwXA?si=3DGY7igfbda6vnjXlJ&amp;t=3D835</a><br>
<br>
Best regards,<br>
Krzysztof<br>
<br></blockquote><div><br></div><div>I reply using my Gmail account so no m=
ore confidential information.</div><div><br></div><div>Best Regards,</div><=
div>Kelly</div></div></div>

--000000000000ea408606148bf1de--
