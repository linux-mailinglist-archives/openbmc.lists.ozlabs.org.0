Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0392522904
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 03:34:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KycsN4CKHz3bmR
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 11:34:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cvhcSZYU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2a;
 helo=mail-vk1-xa2a.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=cvhcSZYU; dkim-atps=neutral
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kycrw6gvCz2y7V
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2022 11:34:24 +1000 (AEST)
Received: by mail-vk1-xa2a.google.com with SMTP id h144so461513vkh.3
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 18:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hUbRV+sAgUiSy2bUpARcOgCdPqjZDpreSWj6clywayk=;
 b=cvhcSZYUE8WppwVWg0K4i5OGAupu2BbFv5EGZXMWzpyT92xjLPbdPc1UlmdsYKkABF
 lSqmnsumW5ssSuqP8HBrh6tPngZ1sbcKIk55pFFSByEsnVM4Af3DQbTOyTwytZTC1iko
 L7lotJWsXyi7iUilU9qlKRgjLNIInmcPwFm6uLDBWQDEKcgzrY+5ibXsuEatjHkh9Izg
 Q791RaPG5meZIxhnwOBKEp1j5Alx9xIT1BclmVWMaAtso/Kt3cdks6c4dA0tzjGuTf36
 VEPuwOq2f5EsBS0qfj/JhqEoUxzS2nE1T8C+xOP1x7dGf37VexSP/HBNMPY5MlY+T1iC
 9ujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hUbRV+sAgUiSy2bUpARcOgCdPqjZDpreSWj6clywayk=;
 b=MOY8a4BjK5TpSm/u8c9e3f+MWEAUg4zjcb3zW0fUVQJk7HYqYcMG84beuKXEKcFArT
 6gFnfoNAmv0ICvOia7fKL4pMWkDYNGQj3DIqJzQZ70TXUBp4d8P0utym0A4L0zVYK2Us
 /ndac+/8r0VeCQwhUABW9hZrKcpssYxDimT+1+I5FenUNzWGqvg4W9WmY3ojuPaNwWOh
 4SjwXNAthSLbhhKyd/V2JkUKHUaI0Bs6YdRw0U6ADOFTEVNodF49T4Kv05OnKY37XOm3
 zxRZ4tGH9tdpHZc6sjPu/kpq+iHjQQGcGu2hmcqPwHVi8xIFmP/OsXAi4C44LI6EgSUb
 e8cQ==
X-Gm-Message-State: AOAM533j0Jq3Wbbbscc4H0ozLGcDmc11GdABz3d/NVo5qrdZGeHiLcl5
 9Q4DpwD/kNVi8+3KR3Jcyqj8I4T1a620TKxrtg==
X-Google-Smtp-Source: ABdhPJy1LvIQrZzYr0kMhSSq0YcMODrI0B+H/NSEPuNclCK78Buj4unTd+AwI3LvbBD9ZUZI7/QEyyzgDsuIgF5A4y8=
X-Received: by 2002:a1f:91cb:0:b0:34e:10c8:cf1c with SMTP id
 t194-20020a1f91cb000000b0034e10c8cf1cmr13428181vkd.31.1652232860533; Tue, 10
 May 2022 18:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220510091654.8498-1-warp5tw@gmail.com>
 <20220510091654.8498-3-warp5tw@gmail.com>
 <Yno5mJMi/3dZyjNz@smile.fi.intel.com>
In-Reply-To: <Yno5mJMi/3dZyjNz@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Wed, 11 May 2022 09:34:08 +0800
Message-ID: <CACD3sJYgb-kkTLFwCi16WotYTC3vN8ZReeuPf4=r7CT1-6CX6w@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] i2c: npcm: Change the way of getting GCR regmap
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com,
 jsd@semihalf.com, benjaminfair@google.com, krzysztof.kozlowski@canonical.com,
 openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, lukas.bulwahn@gmail.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, arnd@arndb.de, sven@svenpeter.dev,
 robh+dt@kernel.org, Avi.Fishman@nuvoton.com, semen.protsenko@linaro.org,
 jie.deng@intel.com, avifishman70@gmail.com, venture@google.com,
 linux-kernel@vger.kernel.org, wsa@kernel.org, kfting@nuvoton.com,
 tali.perry@nuvoton.com, jarkko.nikula@linux.intel.com, olof@lixom.net,
 linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andy:

Thank you for your comment and it will be addressed.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2022=E5=B9=B4=
5=E6=9C=8810=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:08=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Tue, May 10, 2022 at 05:16:47PM +0800, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > Change the way of getting NPCM system manager reigster (GCR)
> > and still maintain the old mechanism as a fallback if getting
> > nuvoton,sys-mgr fails while working with the legacy devicetree
> > file.
>
> ...
>
> > @@ -2236,6 +2236,7 @@ static int npcm_i2c_probe_bus(struct platform_dev=
ice *pdev)
> >       static struct regmap *clk_regmap;
> >       int irq;
> >       int ret;
> > +     struct device_node *np =3D pdev->dev.of_node;
>
> Can we keep "longer line first" order?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Best Regards,
Tyrone
