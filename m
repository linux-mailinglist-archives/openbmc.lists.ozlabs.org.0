Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E08365308CE
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 07:32:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L65Yp61gXz2y8Q
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 15:32:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gUz5LdAE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a36;
 helo=mail-vk1-xa36.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gUz5LdAE; dkim-atps=neutral
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [IPv6:2607:f8b0:4864:20::a36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L534N6Wtkz2yhd
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 22:36:34 +1000 (AEST)
Received: by mail-vk1-xa36.google.com with SMTP id bs5so5193200vkb.4
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 05:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=88aWhuqLs48EjscpwDp8i6PCYgkUo8462NUVXo2FVNA=;
 b=gUz5LdAEB5GxPpTjh1e8cjpjIMcrQpFsYNFNVGK/BPs9nt34cI8exCnEEZ0o1WMZee
 NI9JISZwwxqCJJfphAhwkxrcNyEFmuPHazmMcTWaKXs46ziSwGLgkwKoRdFfsZjfGJhV
 DwRmE4ispD/0SbCLONa7xQWSuS8nPeioFkLaucUZJrtKSf8n+Mf78bQ0yuaaAFPLwVUT
 BOQNxNjCGJv/ediiRTnsaZVxABohBoI/JoSfXXA3LmBqM+lv8pJJZfb6tXQ8rERKuTVE
 55QiOLT0vwwraKtz93jSzeQGofeCM0AJXP7LwEXnrcVpFF9nfyCkeQFguZDUObMfc7w2
 FVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=88aWhuqLs48EjscpwDp8i6PCYgkUo8462NUVXo2FVNA=;
 b=aIfa0U97nUQD/vttcwSmYBW+XoIx0lKG7+n4pEV/dKE9n/EBOzP0X7wlvNPjN+Gog1
 rbHTqJuvfV8TYsCWY2iE0WBUOrriQt7jZNc7laUeZNZcf02XE5wcZK7JHDjvNNJEUiau
 c3KV53hkqfnoxdTnwmm3DBWbmLbF6NeZPXZqtLTc2yF7lictRdZ2nW9APX2QzSU/RGG1
 NJZUws0mdS99Q49mQYdJTSt/hQBU4hVw0NbbAd4J+pPrQoV1365JLA5ZBQJf3OV21vxC
 DXah28ILgjthAXIYt78yIp0KRdy7Jzv/SbpLu9Yy42DT4P7pZDB/g5Eku39CGnn+ENW/
 +Hfg==
X-Gm-Message-State: AOAM530YtMxtGZd/Kd7ruoCm5Csxtnr08aNmSyKkMIOecTiP6JW/v8Nr
 UFWeimAbGwPdXv5KlzNmPhbEuwRvsMH8dsxm1w==
X-Google-Smtp-Source: ABdhPJyKo2dgiaE4q9V+2eJn02CIy5nUblJlWy/nu1zDZs6GmSd3FvSRN3TranOng2H4DBrLGGjHIZvth/2ZQBBIKng=
X-Received: by 2002:a05:6122:8c5:b0:357:8a48:5239 with SMTP id
 5-20020a05612208c500b003578a485239mr162784vkg.5.1653136589971; Sat, 21 May
 2022 05:36:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220517101142.28421-1-warp5tw@gmail.com>
 <20220517101142.28421-3-warp5tw@gmail.com>
 <Yoh9yL1FO7aXme69@shikoro>
In-Reply-To: <Yoh9yL1FO7aXme69@shikoro>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Sat, 21 May 2022 20:36:18 +0800
Message-ID: <CACD3sJYuPJM5NCrD85gnBe=JEvfsfyjZN18prDwY043GqHAj+w@mail.gmail.com>
Subject: Re: [PATCH v5 02/10] i2c: npcm: Change the way of getting GCR regmap
To: Wolfram Sang <wsa@kernel.org>, Tyrone Ting <warp5tw@gmail.com>,
 avifishman70@gmail.com, 
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, 
 yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, andriy.shevchenko@linux.intel.com, 
 jarkko.nikula@linux.intel.com, semen.protsenko@linaro.org, rafal@milecki.pl, 
 sven@svenpeter.dev, jsd@semihalf.com, jie.deng@intel.com, 
 lukas.bulwahn@gmail.com, arnd@arndb.de, olof@lixom.net, 
 tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, 
 KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
 openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 23 May 2022 15:30:44 +1000
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Wolfram:

Got it and thank you for your review.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=8821=E6=97=A5 =
=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=881:51=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, May 17, 2022 at 06:11:34PM +0800, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > Change the way of getting NPCM system manager reigster (GCR)
> > and still maintain the old mechanism as a fallback if getting
> > nuvoton,sys-mgr fails while working with the legacy devicetree
> > file.
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>
> Applied to for-next, thanks!
>
> I dropped the Fixes tag, doesn't look like a bugfix to me.
>

Best Regards,
Tyrone
