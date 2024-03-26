Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5D488BFF3
	for <lists+openbmc@lfdr.de>; Tue, 26 Mar 2024 11:54:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BsWDt3TN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3ms53JZVz3vj1
	for <lists+openbmc@lfdr.de>; Tue, 26 Mar 2024 21:54:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BsWDt3TN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=ppighouse@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3mrW4nYtz3vdh
	for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2024 21:54:02 +1100 (AEDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2d23114b19dso79308111fa.3
        for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2024 03:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711450437; x=1712055237; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0HGENTgHIDftOXxHwlhu2u6XlXAs2gFuZUmy1zc3CpM=;
        b=BsWDt3TNhvRXnSwg9HNmYO5Xy4IUH4TYro/7Rs/dtLfpdWIvwz/jFTdZY5nqKgyCx2
         +NKovoNF+8Vh3cMH4EjN142IAiGquv5mO4OnhVVxQW5UfXlAbmdfyNHLSqxo2/PosUK4
         Vn7L8xicEq4ROkKH25asWwk8xj/NoH6V2wnmI+YQ4X78nNecm+4MaLHu3CmJfAR3v49E
         VZ2fLPUrtRHL2AS3Ww7dQHV72XvnK0uZ1DJKhAcuJCij5iR0Eqxxqbi1YIXL4daHJYLk
         0uJLMXZPC8avpKNfiLdnb2mwun4dOvC1m7dRgt27BqUMvGfdAQFnf5SAZdOTeFYgZWdm
         gFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711450437; x=1712055237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0HGENTgHIDftOXxHwlhu2u6XlXAs2gFuZUmy1zc3CpM=;
        b=kTT6+JHdHDdC2/UxFaeG+HBKurGML2jgosnimHn24PYkqj87ivBCDvQUm2c2P+oaTO
         S6nyJMmBgALgkV3RIMl9aCLRSDWs0PLSIBqTenokMB0FEBwP3oK7fd+Zli7qjSwT+W8c
         2e1LNr1aUNU2jTZPSVjZmrXDcmcJJI19POWwmmXRUCgoGbhNcmlToGdrwKhnvM0PP2P6
         SlmIX3WdT2i+ii+pFw1HcrDUCwvpNG7+q7JOZzcafm5MK/jri2ZylkH68L0C6bxf4I5r
         FGhmDVdMVJ1snPVBhwqRDDPdWCR/L5Sw58C0qbjotD7ZSp5WFL7T2gKqHFHhUQPFgZ2V
         J7rw==
X-Forwarded-Encrypted: i=1; AJvYcCWsrInCpK3koDXrGSMIR3nLjwuncxC+EQrdaBv8BWgx3QCL0RgOstzTHTapN2c/Zo9XQpW87bHcqqkU2cGAX3htf5AJRtc81J0=
X-Gm-Message-State: AOJu0YxzGNXka+LDx8bwZTn7pdIm6xMRefMUCKhqsihFYevlg0qY/TEv
	dIjVEThdEEeXQo42AUZHiDuqTH9edhDGGQdaCHu9gDnGRjITymX83zy0tcnmaaVx5/PCz2WIzxu
	NXapXsWP8vI4hJZ9O9b4eQ6qQ0OE=
X-Google-Smtp-Source: AGHT+IFOJ5LoL9n/tqFM+f8lLlrh29jgsD/zBNNKvH+C389u+LLjAAm99YIWeGAiP6ipsApw+fcrq6d4zwzfjKi8GfM=
X-Received: by 2002:a05:6512:1105:b0:515:b9ee:e814 with SMTP id
 l5-20020a056512110500b00515b9eee814mr806639lfg.24.1711450436564; Tue, 26 Mar
 2024 03:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240130090447.198103-1-Kelly_Hung@asus.com> <acd6f49b-b476-4364-8263-06e20a0c599d@kernel.org>
 <TYZPR04MB6596BB61B2D1B9216F06A18E9D222@TYZPR04MB6596.apcprd04.prod.outlook.com>
 <c88558f8-acc1-4b36-b729-bdf1019e81a0@kernel.org> <CAK=2BxtwdRQ4wp14v4Az=dBvUND9ApOyGQqkbaCUgT-ydPhwpw@mail.gmail.com>
 <f2468c04-948c-4c84-9abd-6d2a9c162501@kernel.org>
In-Reply-To: <f2468c04-948c-4c84-9abd-6d2a9c162501@kernel.org>
From: Chia Li Hung <ppighouse@gmail.com>
Date: Tue, 26 Mar 2024 18:53:45 +0800
Message-ID: <CAK=2BxvVZua_NaCdxCKhaS4xB2+=G8FrztxdVt1g6aU3FAC2Rg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: asus: Add ASUS X4TF BMC
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000527cf706148e1b82"
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

--000000000000527cf706148e1b82
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2024=E5=B9=B43=E6=9C=8826=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=884:43=E5=AF=AB=E9=81=93=EF=BC=
=9A

> On 26/03/2024 09:19, Chia Li Hung wrote:
> > Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2024=E5=B9=B43=E6=9C=88=
5=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=883:09=E5=AF=AB=E9=81=93=EF=
=BC=9A
> >
> >> On 05/03/2024 07:30, Kelly Hung(=E6=B4=AA=E5=98=89=E8=8E=89) wrote:
> >>> Hi, Krzysztof,
> >>>
> >>> I have already executed
> >>>  - `git log --oneline -- DIRECTORY_OR_FILE`
> >>>  - do scripts/get_maintainers.pl
> >>> I tried correcting subject prefix and resent on 2/22.
> >>> According this document:
> >> https://github.com/openbmc/docs/blob/master/kernel-development.md.
> >>> "You should feel welcome to cc the OpenBMC list when sending upstream=
,
> >> so other kernel developers can provide input where appropriate."
> >>> So, I also -cc to openbmc@lists.ozlabs.org.
> >>>
> >>
> >> Please respond inline, instead of top-posting, because it makes your
> >> emails hard to follow.
> >>
> >>
> https://elixir.bootlin.com/linux/v6.8-rc7/source/Documentation/process/su=
bmitting-patches.rst#L340
> >>
> >> You still ignored my tag.
> >>
> >>
> > I reply inline using my Gmail account, thanks for your comment.
>
> OK, and what about my tag? Did you read documentation I linked before?
>
> Hi, Krzysztof,
Regarding tags, I released the v6 patch and added Reviewed-by and Acked-by
tags.
Regarding the confidential information, ASUS has signed the CCLA, can we
add confidential information?


> Best regards,
> Krzysztof
>
>

--000000000000527cf706148e1b82
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Krzysztof Kozlowski &lt;<a href=3D"ma=
ilto:krzk@kernel.org">krzk@kernel.org</a>&gt; =E6=96=BC 2024=E5=B9=B43=E6=
=9C=8826=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=884:43=E5=AF=AB=E9=81=
=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
26/03/2024 09:19, Chia Li Hung wrote:<br>
&gt; Krzysztof Kozlowski &lt;<a href=3D"mailto:krzk@kernel.org" target=3D"_=
blank">krzk@kernel.org</a>&gt; =E6=96=BC 2024=E5=B9=B43=E6=9C=885=E6=97=A5 =
=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=883:09=E5=AF=AB=E9=81=93=EF=BC=9A<br>
&gt; <br>
&gt;&gt; On 05/03/2024 07:30, Kelly Hung(=E6=B4=AA=E5=98=89=E8=8E=89) wrote=
:<br>
&gt;&gt;&gt; Hi, Krzysztof,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I have already executed<br>
&gt;&gt;&gt;=C2=A0 - `git log --oneline -- DIRECTORY_OR_FILE`<br>
&gt;&gt;&gt;=C2=A0 - do scripts/<a href=3D"http://get_maintainers.pl" rel=
=3D"noreferrer" target=3D"_blank">get_maintainers.pl</a><br>
&gt;&gt;&gt; I tried correcting subject prefix and resent on 2/22.<br>
&gt;&gt;&gt; According this document:<br>
&gt;&gt; <a href=3D"https://github.com/openbmc/docs/blob/master/kernel-deve=
lopment.md" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc=
/docs/blob/master/kernel-development.md</a>.<br>
&gt;&gt;&gt; &quot;You should feel welcome to cc the OpenBMC list when send=
ing upstream,<br>
&gt;&gt; so other kernel developers can provide input where appropriate.&qu=
ot;<br>
&gt;&gt;&gt; So, I also -cc to <a href=3D"mailto:openbmc@lists.ozlabs.org" =
target=3D"_blank">openbmc@lists.ozlabs.org</a>.<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Please respond inline, instead of top-posting, because it makes yo=
ur<br>
&gt;&gt; emails hard to follow.<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://elixir.bootlin.com/linux/v6.8-rc7/source/Docume=
ntation/process/submitting-patches.rst#L340" rel=3D"noreferrer" target=3D"_=
blank">https://elixir.bootlin.com/linux/v6.8-rc7/source/Documentation/proce=
ss/submitting-patches.rst#L340</a><br>
&gt;&gt;<br>
&gt;&gt; You still ignored my tag.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; I reply inline using my Gmail account, thanks for your comment.<br>
<br>
OK, and what about my tag? Did you read documentation I linked before?<br>
<br></blockquote><div>Hi, Krzysztof,</div><div>Regarding tags, I released t=
he v6 patch and added Reviewed-by and Acked-by tags.</div><div>Regarding th=
e confidential information, ASUS has signed the CCLA, can we add confidenti=
al information?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
Best regards,<br>
Krzysztof<br>
<br>
</blockquote></div></div>

--000000000000527cf706148e1b82--
