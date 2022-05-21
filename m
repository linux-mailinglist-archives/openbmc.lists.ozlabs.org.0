Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEE852FCD2
	for <lists+openbmc@lfdr.de>; Sat, 21 May 2022 15:22:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L545h1l4Nz3bmQ
	for <lists+openbmc@lfdr.de>; Sat, 21 May 2022 23:22:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mKHk4Rof;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2a;
 helo=mail-vs1-xe2a.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=mKHk4Rof; dkim-atps=neutral
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L545H0xZNz3bks
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 23:22:26 +1000 (AEST)
Received: by mail-vs1-xe2a.google.com with SMTP id z6so10608108vsp.0
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 06:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=k83DVcIcffNjBmT+wlu9VAh4wJXwqJzexEQvALMCO7A=;
 b=mKHk4RofXhQK4eLxHsDk3reXwyjiqEQbNfsXRsKBcRxL7PGJHEfGWrQ8bhweXz4jxG
 uq+3+8pHy4BRpHyRFeRtZ0gukNg7qQ6O7sILCCMt58U483zdPWBKHp+ueWMB3r3hNIVi
 8VsP5a0g5Tevkx/KXwAhUwOCsSamPX0ltozwWgemNIDUlnehLD9A6Z+MOLWODO4kxKqN
 +yLwWy1K675pz86c3DP780FZwasgG0lUh6T6jv871cdhEKFR5Xo8rVwjmyORMiBikx/7
 2ANja/zRSj6Y1f9ToeFivDSqScWMwSO+nI23R3B4z5xaT/XlIDwp0Bbx7CrAs3KZ8z0G
 i4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=k83DVcIcffNjBmT+wlu9VAh4wJXwqJzexEQvALMCO7A=;
 b=Y1c5eogCy9BsLyNX4OfZd4Nro9zfsI4Fcy7fFf4JU7DQJsV0A66ZvTTkOmAz47hp/z
 7/oCb7DXPfc+c5SAnIMG1ChP5RsEKZhhNRetMnzfYkm+TzuZ9jiZNoX/n4h+3mGWevvT
 IvH1jsUuoy9+utFyYZZLRRhWXqlHGKFVBMH4E4ZqoHwwwBaI0d9epPZMUnNdR8xhGclK
 bzWuySMlS+sMpgb1AmfLhfPCVg/ewcqTVJHnDQBiL+Sxl1VwBxasL+r9rSVsAmkUQqJL
 /IH+wrWtc/lcV5L3GFWFV9kD+Cfa4G8SFQbD0nS0Xtu2gvDgksbLfZzxv/8JuhcJq+Pv
 IQ0g==
X-Gm-Message-State: AOAM5336CZCL9frM0kqp9NxLVO/zz8/P5q2u7xPUpiRGbbaJE0TcZYWW
 yXP9vB7wiDk0aXnzsnyED+T57VXldhUFsl+VVQ==
X-Google-Smtp-Source: ABdhPJwdtT3lmW5L/ar4Qia93oyUEeZtSo6Wvd80aKSyRZZ7LHnsu45ANLywj2/NuRH/cy3ZSEbxXTtiwQ9Y6ncBtno=
X-Received: by 2002:a67:cc02:0:b0:335:c5ac:96d7 with SMTP id
 q2-20020a67cc02000000b00335c5ac96d7mr5905980vsl.50.1653139342676; Sat, 21 May
 2022 06:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220517101142.28421-1-warp5tw@gmail.com>
 <20220517101142.28421-11-warp5tw@gmail.com>
 <YoiAmI2wZz2Bkcm1@shikoro>
In-Reply-To: <YoiAmI2wZz2Bkcm1@shikoro>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Sat, 21 May 2022 21:22:11 +0800
Message-ID: <CACD3sJb3ZBsZF=qtbvSikxUU8C-BLChZeHL2mG5JXKkx3QNWyw@mail.gmail.com>
Subject: Re: [PATCH v5 10/10] i2c: npcm: Capitalize the one-line comment
To: Wolfram Sang <wsa@kernel.org>, Tyrone Ting <warp5tw@gmail.com>,
 avifishman70@gmail.com, 
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, 
 yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, andriy.shevchenko@linux.intel.com, 
 jarkko.nikula@linux.intel.com, semen.protsenko@linaro.org, rafal@milecki.pl, 
 sven@svenpeter.dev, jsd@semihalf.com, lukas.bulwahn@gmail.com, arnd@arndb.de, 
 olof@lixom.net, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, 
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com, 
 kfting@nuvoton.com, openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Wolfram:

Got it and thank you for your help.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=8821=E6=97=A5 =
=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=882:03=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, May 17, 2022 at 06:11:42PM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Make the one-line comments capital in the driver to get the comment sty=
le
> > consistent.
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>
> Needs to wait until comments to patches 8+9 are addressed.
>

Best Regards,
Tyrone
