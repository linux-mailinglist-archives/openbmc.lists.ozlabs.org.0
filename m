Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E78576DB4F3
	for <lists+openbmc@lfdr.de>; Fri,  7 Apr 2023 22:13:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PtV0x5vS6z3fV9
	for <lists+openbmc@lfdr.de>; Sat,  8 Apr 2023 06:13:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=pGNPeC+E;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com; envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=pGNPeC+E;
	dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PtV0P0ShJz3cMy
	for <openbmc@lists.ozlabs.org>; Sat,  8 Apr 2023 06:12:35 +1000 (AEST)
Received: by mail-qk1-x72b.google.com with SMTP id u4so7923751qkp.11
        for <openbmc@lists.ozlabs.org>; Fri, 07 Apr 2023 13:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680898352;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Eaj08h5/VPT7ZJh1h6x1PCJNwyum9dRLnvi8gdhk/No=;
        b=pGNPeC+Ei2Z+6v8D5MuPCcnKxLe9GwL6LdflnFNVyUp6GTU3IYP3cYW3/BZsjaWUO8
         16GJNMGDyf5LHVEXIiTISAsFKwuZVR501Uv/GjlTHTlwUvOB5CP5GljrxiLxiIOph/8+
         UdEtxNrZRsTWu1kKXNBDzvCjlePhOI9ZhQDrso8qE45cOPRNblDvbKnWT5HrF6ylUKPw
         yk/bLJFGnZVS7uAJhPdi1Tu5re0ko9SkCSOOfGC/DzgzlqQAk834NxTyIZoGExPbY8ea
         sLaJMeyqGmNNbMJs/YmzNSOneX6PBS1sS+RoLkYxWkFuQ/xIgnNMIPDDfuldxDuhvsI0
         iuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680898352;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eaj08h5/VPT7ZJh1h6x1PCJNwyum9dRLnvi8gdhk/No=;
        b=eBLSdQrbvFCaR0hzpWSQoJl2jEYKws/sXTP0VF/eTWkNRaRR11jD27i9dQS3tXLxHc
         jU9l5KIAfJ6HjS5RzLJoc1+jFc0iL1OIEbY1jmD8ubW/gsfHpZeU4wTH3LQZohwEaVDe
         8SaU8g6gZfOYyMdW218W+quyTStaDG/Ta+WLAjNgeEphKt1H8XJ0ztAlBwtD+1nwOvVI
         6nBbepHvrfpz+5YYi24G7xy7/A+G2hPLmJrNuWhGttt46f3eHXaKRdd1OJK6fNWYEnH1
         BbPpej2HiqSQUtPHYMarYqQ9ZJJPscXh/KqgGLTKgRlnkUXWZnXSmPBldaacJI4dzcSW
         B1/A==
X-Gm-Message-State: AAQBX9fmHJVvC/eIMCfS5iD/YcsS+wAwroPrm24JT/ww4b8HCkJeYQq5
	ve4ZupT8mcRW8Pfo1sKl9BtxF0w2oAfkWx141sTPGomofC/e8hIR11c=
X-Google-Smtp-Source: AKy350Ybpz3ZYjfyOJ2YYAnX2XYJ70MMqrnTyrU8sblPnJNQpYQBDsVoAI9A0+NkHrF8Hvj7mtSFMMsD5W4tyklNcB0=
X-Received: by 2002:a05:620a:4048:b0:74a:28c4:64ea with SMTP id
 i8-20020a05620a404800b0074a28c464eamr25551qko.6.1680898352635; Fri, 07 Apr
 2023 13:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <ZDBqT-V-nM0ipaMq@heinlein.vulture-banana.ts.net> <CAPnigKnU_xma-GOyB0SGpaEOeVX-YhVMun+QpQyWL6dCrZwMZw@mail.gmail.com>
In-Reply-To: <CAPnigKnU_xma-GOyB0SGpaEOeVX-YhVMun+QpQyWL6dCrZwMZw@mail.gmail.com>
From: William Kennington <wak@google.com>
Date: Fri, 7 Apr 2023 13:12:21 -0700
Message-ID: <CAPnigK=e0b7pFX5jYujSay-D9N-tsr0ttRhCuxBv67Z77r7kaw@mail.gmail.com>
Subject: Re: OpenBMC kernel and CONFIG_PREEMPT
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="00000000000036bdf505f8c4a579"
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000036bdf505f8c4a579
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I just looked again, AFAICT it was never enabled on aspeed or npcm7xx, just
the new 8xx part. Hopefully someone else with aspeed chips will confirm
from their actual `.config`

On Fri, Apr 7, 2023 at 1:05=E2=80=AFPM William Kennington <wak@google.com> =
wrote:

> It's interesting because I think it has a bigger impact on the 8xx chip
> than the 7xx chip. AFAIK I was indirectly comparing this and it seems lik=
e
> it didn't make a huge difference for us on our older BMCs. We have it
> disabled on our 5.15 configs, but used it in 5.10. I don't think we notic=
ed
> a meaningful difference when porting forward. Probably you need a certain
> amount of startup services trying to steal time from each other.
>
> On Fri, Apr 7, 2023 at 12:10=E2=80=AFPM Patrick Williams <patrick@stwcx.x=
yz>
> wrote:
>
>> Joel,
>>
>> Would you mind looking at this commit[1]?  Nuvoton seems to have a lot
>> of data that suggests that disabling CONFIG_PREEMPT leads to
>> significantly better performance.  The boot time is almost 50% faster.
>>
>> I'm surprised that:
>>
>>     1. CONFIG_PREEMPT really results in that worse of performance.
>>     2. The Nuvoton chip is special from any other ARM variant in this
>>        regard.
>>
>> Should we disable this across the board on all our platforms?
>>
>> 1.
>> https://github.com/openbmc/openbmc/commit/52ec37dd0b8776ce7f43e65e0be578=
c3606340b7
>> --
>> Patrick Williams
>>
>

--00000000000036bdf505f8c4a579
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I just looked again, AFAICT it was never enabled on aspeed=
 or npcm7xx, just the new 8xx part. Hopefully someone else with aspeed chip=
s will confirm from their actual `.config`=C2=A0<br></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 7, 2023 at =
1:05=E2=80=AFPM William Kennington &lt;<a href=3D"mailto:wak@google.com">wa=
k@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr">It&#39;s interesting because I think it has a =
bigger impact on the 8xx chip than the 7xx chip. AFAIK I was indirectly com=
paring this and it seems like it didn&#39;t make a huge difference for us o=
n our older BMCs. We have it disabled on our 5.15 configs, but used it in 5=
.10. I don&#39;t think we noticed a meaningful difference when porting forw=
ard. Probably you need a certain amount of startup services trying to steal=
 time from each other.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Fri, Apr 7, 2023 at 12:10=E2=80=AFPM Patrick Willi=
ams &lt;<a href=3D"mailto:patrick@stwcx.xyz" target=3D"_blank">patrick@stwc=
x.xyz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Joel,<br>
<br>
Would you mind looking at this commit[1]?=C2=A0 Nuvoton seems to have a lot=
<br>
of data that suggests that disabling CONFIG_PREEMPT leads to<br>
significantly better performance.=C2=A0 The boot time is almost 50% faster.=
<br>
<br>
I&#39;m surprised that:<br>
<br>
=C2=A0 =C2=A0 1. CONFIG_PREEMPT really results in that worse of performance=
.<br>
=C2=A0 =C2=A0 2. The Nuvoton chip is special from any other ARM variant in =
this<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0regard.<br>
<br>
Should we disable this across the board on all our platforms?<br>
<br>
1. <a href=3D"https://github.com/openbmc/openbmc/commit/52ec37dd0b8776ce7f4=
3e65e0be578c3606340b7" rel=3D"noreferrer" target=3D"_blank">https://github.=
com/openbmc/openbmc/commit/52ec37dd0b8776ce7f43e65e0be578c3606340b7</a><br>
-- <br>
Patrick Williams<br>
</blockquote></div>
</blockquote></div>

--00000000000036bdf505f8c4a579--
