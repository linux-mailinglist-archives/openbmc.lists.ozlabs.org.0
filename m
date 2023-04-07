Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8FA6DB4B0
	for <lists+openbmc@lfdr.de>; Fri,  7 Apr 2023 22:06:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PtTsB6mqWz3fSf
	for <lists+openbmc@lfdr.de>; Sat,  8 Apr 2023 06:06:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=U/MHskmo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::733; helo=mail-qk1-x733.google.com; envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=U/MHskmo;
	dkim-atps=neutral
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PtTrf1k5Bz3fTf
	for <openbmc@lists.ozlabs.org>; Sat,  8 Apr 2023 06:05:52 +1000 (AEST)
Received: by mail-qk1-x733.google.com with SMTP id de37so14485394qkb.7
        for <openbmc@lists.ozlabs.org>; Fri, 07 Apr 2023 13:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680897948;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tvuj75/5YLITjmlpCadYGGXZjTW7rH4gHO+p1Bf9H38=;
        b=U/MHskmoHpP6yRYghE2IuRejVbdy2n4MjAhHv+FveD9AeN67HEE+/mpEmDIe6NcUdy
         NMQIdeEjZ1+IXDfSmDigq7q+PIFu7YSlzDxGGoUXa9DO7cBFbV1txzraIBOfS56dpxnz
         vHfuttrVXOzRVte+eqdmYxdfsVOl5ETsEzEptRnvYNFqRa6lpXgep/DsaB4PC0w93pPD
         cmy907Nl8RJevN25wn+j5OBOggVgvs/0WJ/UH7iW0f/v+bQdXxBHva1BW95IwTG/w6nY
         p0FYBvoEAeliiZrts/YTXmbXT2ZpGEq75chJt5wsSHFA4PAQyJ29901/h9YZWjhSkv/U
         oE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680897948;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tvuj75/5YLITjmlpCadYGGXZjTW7rH4gHO+p1Bf9H38=;
        b=x4gkn/SVc/rbFL999bpxRKPdMucC5T4bFTT0i6Sh7xgoBpcg6vHe1jbft8/2mnr01U
         9tI1OXz93kK0ybTk61O1xsXN3Hn/2BcE3s1C3vWG6Efd5PjKpmearoEkeOPdxvyjglo2
         HCZmmrI0qH6ME4unaiVNAIFpRiPv4F0yZsEAxG+L5bywkw1eMsDbj7hSRskzj7d31W+S
         r6tTZNq0gVvr9T15iswlnx7GIKQKedwh6XAKh54h9VZLSe58AafCCFtdyrmOe5hPw3cq
         LkEgJBVsANYEU2Qhlvn+4HlnhsY7u55dkegti8Z62rZUByzzqu/pu+66pq/wlYSpCZna
         RjqQ==
X-Gm-Message-State: AAQBX9d9BxaPbsBeqz7nmR+wOdA6hoAgwUjaim4bj8IuQK3qqeJFSkZJ
	tgc6HUan+D5YocK6TcJWdk4f7+lvgQrEnEUbMR3bzQ==
X-Google-Smtp-Source: AKy350YpR8bN3yhFzHGaH4FsO8bQs0eBX7xC/bbR/Lq9r6hBkiJImOG1PKIA6Uz31Bi4ZDjjmnuK632XmQzyDlmfV+s=
X-Received: by 2002:a05:620a:2905:b0:746:96c2:e458 with SMTP id
 m5-20020a05620a290500b0074696c2e458mr920805qkp.4.1680897948351; Fri, 07 Apr
 2023 13:05:48 -0700 (PDT)
MIME-Version: 1.0
References: <ZDBqT-V-nM0ipaMq@heinlein.vulture-banana.ts.net>
In-Reply-To: <ZDBqT-V-nM0ipaMq@heinlein.vulture-banana.ts.net>
From: William Kennington <wak@google.com>
Date: Fri, 7 Apr 2023 13:05:37 -0700
Message-ID: <CAPnigKnU_xma-GOyB0SGpaEOeVX-YhVMun+QpQyWL6dCrZwMZw@mail.gmail.com>
Subject: Re: OpenBMC kernel and CONFIG_PREEMPT
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="0000000000001de44d05f8c48dc6"
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

--0000000000001de44d05f8c48dc6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's interesting because I think it has a bigger impact on the 8xx chip
than the 7xx chip. AFAIK I was indirectly comparing this and it seems like
it didn't make a huge difference for us on our older BMCs. We have it
disabled on our 5.15 configs, but used it in 5.10. I don't think we noticed
a meaningful difference when porting forward. Probably you need a certain
amount of startup services trying to steal time from each other.

On Fri, Apr 7, 2023 at 12:10=E2=80=AFPM Patrick Williams <patrick@stwcx.xyz=
> wrote:

> Joel,
>
> Would you mind looking at this commit[1]?  Nuvoton seems to have a lot
> of data that suggests that disabling CONFIG_PREEMPT leads to
> significantly better performance.  The boot time is almost 50% faster.
>
> I'm surprised that:
>
>     1. CONFIG_PREEMPT really results in that worse of performance.
>     2. The Nuvoton chip is special from any other ARM variant in this
>        regard.
>
> Should we disable this across the board on all our platforms?
>
> 1.
> https://github.com/openbmc/openbmc/commit/52ec37dd0b8776ce7f43e65e0be578c=
3606340b7
> --
> Patrick Williams
>

--0000000000001de44d05f8c48dc6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It&#39;s interesting because I think it has a bigger impac=
t on the 8xx chip than the 7xx chip. AFAIK I was indirectly comparing this =
and it seems like it didn&#39;t make a huge difference for us on our older =
BMCs. We have it disabled on our 5.15 configs, but used it in 5.10. I don&#=
39;t think we noticed a meaningful difference when porting forward. Probabl=
y you need a certain amount of startup services trying to steal time from e=
ach other.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Fri, Apr 7, 2023 at 12:10=E2=80=AFPM Patrick Williams &lt;<a h=
ref=3D"mailto:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Joel,<br>
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

--0000000000001de44d05f8c48dc6--
