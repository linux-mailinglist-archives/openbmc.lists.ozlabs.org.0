Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B610688BC1A
	for <lists+openbmc@lfdr.de>; Tue, 26 Mar 2024 09:15:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b87qHKjh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3jKd5r4bz3dWQ
	for <lists+openbmc@lfdr.de>; Tue, 26 Mar 2024 19:15:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b87qHKjh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=ppighouse@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3jK33hTDz301T
	for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2024 19:15:03 +1100 (AEDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a4a387ff7acso208811866b.2
        for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2024 01:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711440899; x=1712045699; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FvvsWMJ8Sy5TBTu60m8AlO23kK0HGToTW1VdyjleQcw=;
        b=b87qHKjhjk75mZ5yBCEA6/3ZKP9W491AJbGnfbVOR2Rm4SkOQ6FXl5ubifu1EY3nyL
         PuwQYzR7ho5AU8LBoNyWgugmzX35NnZoAaQ9wtAHwoOrk01u5gg+WwaayCFZzdbRbhks
         Ei4ol4EbQOfbY5eUqatRoKOLpP949bCLwDMyTMSrcogZxdk6L01UL+nlHEEWhPfzwOmZ
         9XeeEizDqKNFEPqzCXvEha2dwpu3B7yKMvzalB7cUQFZLO1rX06cJA6b2MUpoIS9HbIN
         Lhep2N/sEpR8DthKhRAvHVQgihDwr+3yBCFnTAeKRrj6TGU8u9X9KtHn/odcNT2nrPxi
         G/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711440899; x=1712045699;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FvvsWMJ8Sy5TBTu60m8AlO23kK0HGToTW1VdyjleQcw=;
        b=iC0rNKnQwwoUNScXMfqoqMcBSB7l4PF/sz0SlYriU22AUhf+kgr7kogEGCLccPWmHD
         J1nAWO+QkEzzZce0GMU/vJv7nu0RBCxtRqwxH/lKFv+H9tTfSDIanSu98UQQ82YMxNOD
         WftlyIVw8xrPcExaIa7aNLBeHG/ScW9Zl34tf8E6aR+B35V3XiEZ43IB6kCfc3MXaXlt
         ey9zi6lEeFe0T0Wvp0jwQi9BMt01huZSZb+qUNIvk8rYnu+rAtxwJ9JmxU6JLv/j4opm
         8eGUrULcJJjd1jeKcTp5+CIfZnbI/7RZ4KrZGUqzUWOx04khVHrKg7VsNelyOUDdBs3d
         YJDA==
X-Forwarded-Encrypted: i=1; AJvYcCWHdCKNP3deL36NC7yZKAT6Mt/i9bJ1Us2kj7dKw4cmmLjLsDmKMaXUIa+zNQRRgSSIvnx2kSU8qAU6+xGDlMBpjHZIWNVzSKY=
X-Gm-Message-State: AOJu0Yw1VnoA4m9ifXO1eJv1MmiwA321ZHpgMn7DAB9mePr7ZoRTmlIX
	UnlxvSqwCDMg3sX5HVof5XEEcDObMqYjiO2oklA1v9OaCCOEZ/rfcGYSGQpG39B0pAkt8bYesWQ
	zF92Z1qTsIzW7XrBLmwcnHVSW6wA=
X-Google-Smtp-Source: AGHT+IErmDyXymE55PMBoen/HzZ+0q8i3lVHc+5M/It61pqQLq/aUS/amwa9BfYcR/8gosYSby1gzmqpzeSyyB/ME/k=
X-Received: by 2002:a17:906:4152:b0:a46:a9ad:837c with SMTP id
 l18-20020a170906415200b00a46a9ad837cmr295171ejk.49.1711440899324; Tue, 26 Mar
 2024 01:14:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240130085652.198010-1-Kelly_Hung@asus.com> <20240130085652.198010-2-Kelly_Hung@asus.com>
 <3edf1a47-9f73-4e99-98ea-182248102346@linaro.org> <TYZPR04MB659655F98C755C9DE55FD4AB9D232@TYZPR04MB6596.apcprd04.prod.outlook.com>
 <d2426e1f-a09c-466f-a490-40fb7daf406c@linaro.org>
In-Reply-To: <d2426e1f-a09c-466f-a490-40fb7daf406c@linaro.org>
From: Chia Li Hung <ppighouse@gmail.com>
Date: Tue, 26 Mar 2024 16:14:47 +0800
Message-ID: <CAK=2BxsqOrOEozoqf49rZ9GFAi8Z4zpsYymB5ug3D7jBtdUSjQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: asus: Add ASUS X4TF BMC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000dbc65d06148be235"
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
Cc: =?UTF-8?B?QWxsZW5ZWSBIc3Uo6Kix5bm85bKzKQ==?= <AllenYY_Hsu@asus.com>, =?UTF-8?B?S2VsbHkgSHVuZyjmtKrlmInojokp?= <Kelly_Hung@asus.com>, "joel@jms.id.au" <joel@jms.id.au>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000dbc65d06148be235
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> =E6=96=BC 2024=E5=B9=
=B43=E6=9C=884=E6=97=A5 =E9=80=B1=E4=B8=80
=E4=B8=8B=E5=8D=887:23=E5=AF=AB=E9=81=93=EF=BC=9A

> On 04/03/2024 11:45, Kelly Hung(=E6=B4=AA=E5=98=89=E8=8E=89) wrote:
> > Hi, Krzysztof,
> >
> > Thanks for review, I notice there were a lot of errors. I've corrected
> them and done a schema and patch check, then resend the patch on 2/22.
>
> And what happened with my other messages? Why you were not replying to
> them? Why only some parts were implemented?
>
> Best regards,
> Krzysztof
>
>
Hi, Krzysztof,
I repllied to all emails using my Gamil account again.
Thanks for your comment.

Best Regards
Kelly

--000000000000dbc65d06148be235
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Krzysztof Kozlowski &lt;<a href=3D"ma=
ilto:krzysztof.kozlowski@linaro.org">krzysztof.kozlowski@linaro.org</a>&gt;=
 =E6=96=BC 2024=E5=B9=B43=E6=9C=884=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=
=E5=8D=887:23=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On 04/03/2024 11:45, Kelly Hung(=E6=B4=AA=E5=98=89=
=E8=8E=89) wrote:<br>
&gt; Hi, Krzysztof,<br>
&gt; <br>
&gt; Thanks for review, I notice there were a lot of errors. I&#39;ve corre=
cted them and done a schema and patch check, then resend the patch on 2/22.=
<br>
<br>
And what happened with my other messages? Why you were not replying to<br>
them? Why only some parts were implemented?<br>
<br>
Best regards,<br>
Krzysztof<br>
<br></blockquote><div><br></div><div>Hi, Krzysztof,</div><div>I repllied to=
 all emails using my Gamil account again.</div><div>Thanks for your comment=
.</div><div><br></div><div>Best Regards</div><div>Kelly</div><div>=C2=A0</d=
iv></div></div>

--000000000000dbc65d06148be235--
