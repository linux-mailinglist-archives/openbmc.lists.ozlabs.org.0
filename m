Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE215308D4
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 07:35:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L65dG3MmZz3bgC
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 15:35:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dLYTDccX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2f;
 helo=mail-vs1-xe2f.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=dLYTDccX; dkim-atps=neutral
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L53cL6Klhz3bkg
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 23:00:49 +1000 (AEST)
Received: by mail-vs1-xe2f.google.com with SMTP id h5so2732527vsq.5
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 06:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UiYBOOmE3B2tSMcIdam7Gz2hPUtw38sVw9m7ntvwfEA=;
 b=dLYTDccXOF5vdOcM3oYWeoDuEOe54vEE4MBQ4R2N4kJ0igBgtDxgjrcTmNno4/JYpU
 GCcDVEj5y1Xd0mFpJDTzwQCRcc0Fun+V4xGU8tybudQaPobtD5MQSknBJG47m9O4JNdY
 RNonrsVcOwvBn7VZuvbazM4jE5m7PTDXznBFyXxXo4Brvh0SfIDMeXLIqfMo9OKuUctn
 ksOd1CzhjJgaHIjm0ignljw8gatzaoNQmF8dL4/dPq+gSRntJCICTh3IOA9G5vElMjHR
 3jNsWJNJxDPlHyHne+ed8UIlgrT9eGAj2yIfLGO9hj900vbevMKLkh6CsUxU5SXc5GZ8
 ZXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UiYBOOmE3B2tSMcIdam7Gz2hPUtw38sVw9m7ntvwfEA=;
 b=TI0Zftt5bUrRBcPY43Lb/ZkL1XKgNcTjBtQpDR2NLcVchq5Wn7G7Tj0CHvTeMvcDTo
 UszQDnBUwlnXKoXLiyqnKJkfAw6q9iOBVFi9kVo7qpaE7Op+3mdktr1SGcbErPYvTnSa
 38K956hcPo0HCUxtKh/54iycB0JLquTQYldYa0FD5qGvWlSEkn7os3sIMDveom5bI4rE
 9fUYBbtJVuzGgZN3eko4z4RFd5d/MHDExhwTu/D6dMlfyhrz8t+CsMEdx7RusZDS64LN
 UOVQtvD944Hd2ez5Lhwrsu04maGBHFnmW5dljk6mjC6fJkOXYpo/ZJ1mjVxhgV6NHpiU
 bskg==
X-Gm-Message-State: AOAM531tIFp+iZnOPgTzKWqT9MBgi+e7Aoy+7nirG8w4RoJlHFg5vQxY
 b7mWVbeEw9XBAJAi+I0b+Yc8UtvKXUFAWcp+6w==
X-Google-Smtp-Source: ABdhPJwsVewjsXSGmqYnvos4AOWRr7OMnGYmuogma9c6Tmg7y3vgxiG6y6zNx3QmQQ8Cb58ZOP81bncQx7cAkIryqDk=
X-Received: by 2002:a67:d88c:0:b0:337:9a25:36c3 with SMTP id
 f12-20020a67d88c000000b003379a2536c3mr818585vsj.84.1653138046685; Sat, 21 May
 2022 06:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220517101142.28421-1-warp5tw@gmail.com>
 <20220517101142.28421-8-warp5tw@gmail.com>
 <Yoh+YZestxT7oG8B@shikoro>
In-Reply-To: <Yoh+YZestxT7oG8B@shikoro>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Sat, 21 May 2022 21:00:35 +0800
Message-ID: <CACD3sJbcOdCED24Fno-jd1z0T21KuJ_hTWNQcSHqhbxaZZaXwA@mail.gmail.com>
Subject: Re: [PATCH v5 07/10] i2c: npcm: Handle spurious interrupts
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
Cc: jie.deng@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Wolfram:

Thank you for your review.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=8821=E6=97=A5 =
=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=881:53=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, May 17, 2022 at 06:11:39PM +0800, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > On some platforms in rare cases (1 to 100,000 transactions),
> > the i2c gets a spurious interrupt which means that we enter an interrup=
t
> > but in the interrupt handler we don't find any status bit that points t=
o
> > the reason we got this interrupt.
> >
> > This may be a case of a rare HW issue or signal integrity issue that is
> > still under investigation.
> >
> > In order to overcome this we are doing the following:
> > 1. Disable incoming interrupts in master mode only when slave mode is n=
ot
> >    enabled.
> > 2. Clear end of busy (EOB) after every interrupt.
> > 3. Clear other status bits (just in case since we found them cleared)
> > 4. Return correct status during the interrupt that will finish the
> >    transaction.
> >
> > On next xmit transaction if the bus is still busy the master will issue=
 a
> > recovery process before issuing the new transaction.
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>
> Applied to for-next, thanks!
>

Best Regards,
Tyrone
