Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEEB4CD536
	for <lists+openbmc@lfdr.de>; Fri,  4 Mar 2022 14:33:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K981p3sM1z30Gj
	for <lists+openbmc@lfdr.de>; Sat,  5 Mar 2022 00:33:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mQn0dY66;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a29;
 helo=mail-vk1-xa29.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=mQn0dY66; dkim-atps=neutral
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [IPv6:2607:f8b0:4864:20::a29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K981P5Z2Tz2ybK
 for <openbmc@lists.ozlabs.org>; Sat,  5 Mar 2022 00:32:57 +1100 (AEDT)
Received: by mail-vk1-xa29.google.com with SMTP id s195so2316555vkb.10
 for <openbmc@lists.ozlabs.org>; Fri, 04 Mar 2022 05:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=T+kHmAz6l1ndX6TQI2u7iZIHW4bnnzxuzo8+CeI4d4I=;
 b=mQn0dY66Sf/voiE8UVxt/qYi1q4GXq26jWUXpsn+zV+zBbr4CuXLOb44C/wPuZuLwy
 nld+brL688EFhpmUmXFRwiMcODuMa2EhgyJN5W7LrL/E5Jz3j/h5gLaOwOyGRLMFepXG
 PBpfEcs3sW/mAsIagdMiAAeTPPDhiQZzQlS62MYE+TaW1peTGjY/ukQIK/NyynXNFTAS
 o/aZQ2Fj05+ZDfft1x1NsexBnlEU87vgwoxTAxrTzj3gZ6hZr1qcu0+VajEJHjgsNimB
 lQkaQ7KqYEy16I3+8kf4MAznIjqTbkH/pw17cBwxwoKpLhJleJlrZvqVNTEGCc3lO09n
 gP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=T+kHmAz6l1ndX6TQI2u7iZIHW4bnnzxuzo8+CeI4d4I=;
 b=qdgWhtzivXfMcResza77l89evYKcUET8VpYahzAYhnGMjPqc0csx/ef3vJUxzZ/5x/
 haICTYdPzyWEsg7fYCvUCaxcY65cDQ+16b4weEPvR8JTYgrhm4T5MRIp4Mzn/FzpNakw
 0xNjiO2S0x48e9ueQebRZxTaQGbUgSemQjCDNgBLw+FKS+Vicl+v+8xJ3FIveCKAYoPi
 pjIlzMXQ18YpUJlo4oEc0Q852T/v9x8/ySe4aFdyDhrvQJuCGZ5iIXMgd5mRhqJh8VdM
 sqQuBJOhYuThM6dxyDv69mSRUbZ+d2FdZqAFrAR4BcwzD+UCwMwsyUX71cuj1QEST4Ik
 tZcg==
X-Gm-Message-State: AOAM531vT8S8gFdANY0y+r4CHSfFRFhGvM90Syj/xV6QrSYlA9+Abclq
 Tm9zlAlwvcSEoxf7DQKh9KeKecNLsHNdUqzbUA==
X-Google-Smtp-Source: ABdhPJzrXfMN69JWz+3WZFtQeyrKlatWN68na8i/a78IpFoNMNcCPSAwbeerj3SgWmN0re+5ewOvBiF6g2pyEunlW58=
X-Received: by 2002:a1f:3f0c:0:b0:336:e97a:7a33 with SMTP id
 m12-20020a1f3f0c000000b00336e97a7a33mr2895599vka.11.1646400774849; Fri, 04
 Mar 2022 05:32:54 -0800 (PST)
MIME-Version: 1.0
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-5-warp5tw@gmail.com>
 <d4f6fc91-ad07-7d4b-9c87-ec556ef26ff7@canonical.com>
In-Reply-To: <d4f6fc91-ad07-7d4b-9c87-ec556ef26ff7@canonical.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 4 Mar 2022 21:32:42 +0800
Message-ID: <CACD3sJbZfKYcZ=a8MgRohWt+Md_501Pr8c2UQP4tMK4D+=Ec-Q@mail.gmail.com>
Subject: Re: [PATCH v3 04/11] i2c: npcm: Change the way of getting GCR regmap
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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
 linux-i2c@vger.kernel.org, benjaminfair@google.com, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, bence98@sch.bme.hu, arnd@arndb.de, sven@svenpeter.dev,
 robh+dt@kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com,
 semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com,
 venture@google.com, yangyicong@hisilicon.com, linux-kernel@vger.kernel.org,
 wsa@kernel.org, kfting@nuvoton.com, tali.perry@nuvoton.com, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof:

Thank you for your review.

Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> =E6=96=BC 2022=E5=
=B9=B43=E6=9C=883=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:38=E5=AF=
=AB=E9=81=93=EF=BC=9A
>
> On 03/03/2022 09:31, Tyrone Ting wrote:
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
> > ---
> >  drivers/i2c/busses/i2c-npcm7xx.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
>
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>
>
> Best regards,
> Krzysztof

Best regards,
Tyrone
