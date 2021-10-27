Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2915E43D7A5
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 01:38:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HflWh0hktz2xRq
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 10:38:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=szdwwfqG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::132;
 helo=mail-il1-x132.google.com; envelope-from=johnwedig@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=szdwwfqG; dkim-atps=neutral
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HflWG60Fkz2xBw
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 10:38:34 +1100 (AEDT)
Received: by mail-il1-x132.google.com with SMTP id i26so4761917ila.12
 for <openbmc@lists.ozlabs.org>; Wed, 27 Oct 2021 16:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SXnbR3+pmIm50uc2RjaTDPuaMQXUti4WKt/b+WPgEcU=;
 b=szdwwfqGo+nNjp3DTTpEublz30CK+WQJZaW1GOCEmcnyXXZG2xU9vnHY78ZGMwIBzk
 ElifwS/KneMecWxTWtbmoN8Agkh85U9rMpNdlweHk5lkmP/cx7gNNGmBWR3OM7dyYLNI
 0NC7Z6x3vWzDG2d8pkKyY3LMXxQNUKEXd1ARM4NlCblAAIOozVm07SXMgiFzRuaWwrFL
 g0Wa69xZGiDUDpGzdW+SJT3AhX9l0PI8M594QH+Silz2m6I/trRV9BzikCP3QTZF61Rn
 MiX2S2oucOJBcNHALWKfggaH8+OoIlAyYwz8yZbYjhND8MysVMYjpDYOQ9iY4BiZwBGF
 lC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SXnbR3+pmIm50uc2RjaTDPuaMQXUti4WKt/b+WPgEcU=;
 b=vhG7OSDrS4mCxmQHAFfEkKPSBQumLB4US8oD4dx3bfzAEyPBdYjcSG7UeceAfUDCi5
 ivStJR+9iPnmp+I++znyYOZN0jPIm3y6vHQsrJ2Dx6zPsLOzamE8OLjkX5SM7BB5soZr
 TBWiT0jKgi/umevthqFtD9zaNhCJA1MD+iugdTKOFzDJH1vQmAWplsj6jxNpc54nsVdv
 YdBhhfdnvwjeuS0P/gnWMnLUjiaytevxhdpyLxjh4D9Jplfx8zTPLciqUxdeLg+mJTvU
 3C4bg0xOJpwCx6s3SB31sQLHb3q5rD4Mi8yP/CzwPOVlHvc3NyP8XULk0YPP3qSwJo3P
 oGmg==
X-Gm-Message-State: AOAM532BqpeAof5mdNjQHtIUKaScNdYqlVO58meV+yyZItEUWZ03+/H0
 NuihBDZTaUj/Ai+7brV/2ZxOa830g81A0Rj/T5bmlw==
X-Google-Smtp-Source: ABdhPJypVdGw99UYasgyPrV7Y8v+aurJVisIm7cye+KXlL5E+mRCTbfEKbgtNinto94Y6eYP8HpI0ooY2W8mul1d5HA=
X-Received: by 2002:a05:6e02:1541:: with SMTP id
 j1mr648509ilu.294.1635377910927; 
 Wed, 27 Oct 2021 16:38:30 -0700 (PDT)
MIME-Version: 1.0
References: <CACejXs+LALZsTbVazgLjOP-K2d89sgTT0jVLpTKiFECfZdcYjQ@mail.gmail.com>
 <YXlbNoBeD/yE/bg/@heinlein>
In-Reply-To: <YXlbNoBeD/yE/bg/@heinlein>
From: John Wedig <johnwedig@google.com>
Date: Wed, 27 Oct 2021 16:38:15 -0700
Message-ID: <CACejXsJK1+D+HqxZGgrfeEtVVwY6bQ_HzSTUuR3F_9YAgZPV+Q@mail.gmail.com>
Subject: Re: eStoraged repo
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="00000000000074959705cf5e1752"
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
Cc: Brandon Kim <brandonkim@google.com>, John Broadbent <jebr@google.com>,
 bradleyb@fuzziesquirrel.com, openbmc@lists.ozlabs.org,
 William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000074959705cf5e1752
Content-Type: text/plain; charset="UTF-8"

Hi Patrick,

William and Brandon (CC'd on this email) have agreed to be the initial
maintainers for this new repo. Let me know if you have any other questions.

Thank you,
John


On Wed, Oct 27, 2021 at 6:59 AM Patrick Williams <patrick@stwcx.xyz> wrote:

> On Tue, Oct 26, 2021 at 12:49:26PM -0700, John Wedig wrote:
>
> Hello John,
>
> > Now that the eStoraged
> > <https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/46573> design doc
> is
> > reviewed and merged, can you create a new repo for this? Or what's the
> > next step?
>
> Yep, now that we have an agreed-to design I think it is reasonable to get
> a repo
> made for it.  Do you have someone in mind that could be the initial
> maintainer
> of it?  Since you're new to the project, I'd like to have someone shadow
> you
> initially, with the intention that after the initial bulk of development
> is done
> you'd take over as the primary maintainer.
>
> You could start with someone at Google who has been maintainer on a few
> repositories already or someone from the TOF (or it doesn't have to be
> someone
> at Google if there is interest from someone else in the community).
>
> --
> Patrick Williams
>

--00000000000074959705cf5e1752
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Patrick,<div><br></div><div>William and Brandon (C=
C&#39;d on this email) have agreed to be the initial maintainers for this n=
ew repo. Let me know if you have any other=C2=A0questions.</div><div><br></=
div><div>Thank you,</div><div>John</div><div><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 27, 2021=
 at 6:59 AM Patrick Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz">patri=
ck@stwcx.xyz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Tue, Oct 26, 2021 at 12:49:26PM -0700, John Wedig wrote:<br>
<br>
Hello John,<br>
<br>
&gt; Now that the eStoraged<br>
&gt; &lt;<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/465=
73" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-project.xyz=
/c/openbmc/docs/+/46573</a>&gt; design doc is<br>
&gt; reviewed and merged, can you create a new repo for this? Or what&#39;s=
 the<br>
&gt; next step?<br>
<br>
Yep, now that we have an agreed-to design I think it is reasonable to get a=
 repo<br>
made for it.=C2=A0 Do you have someone in mind that could be the initial ma=
intainer<br>
of it?=C2=A0 Since you&#39;re new to the project, I&#39;d like to have some=
one shadow you<br>
initially, with the intention that after the initial bulk of development is=
 done<br>
you&#39;d take over as the primary maintainer.<br>
<br>
You could start with someone at Google who has been maintainer on a few<br>
repositories already or someone from the TOF (or it doesn&#39;t have to be =
someone<br>
at Google if there is interest from someone else in the community).<br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div>

--00000000000074959705cf5e1752--
