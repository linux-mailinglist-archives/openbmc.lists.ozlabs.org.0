Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B42115308D1
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 07:33:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L65bB3nWZz3blp
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 15:33:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Nnt4/klu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2c;
 helo=mail-vs1-xe2c.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Nnt4/klu; dkim-atps=neutral
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L53VD2pf0z308m
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 22:55:32 +1000 (AEST)
Received: by mail-vs1-xe2c.google.com with SMTP id m2so10693556vsr.8
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 05:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=H2xHMxkjcpE6Uaeb37HMcK9VGfIbnF/CTq+aAJwqeQA=;
 b=Nnt4/kluIb1bMHit+sR8kK3TADuPbS8W/h1yW7D9r+2OBn3yfQCIggFM29OUdOW99C
 Qni+kPF678aDYKJm1lVt++Mh7skT+N5bh1KrXLt3I8vl9tFZCQvJ3J7JT5S1hBsb51//
 bACnQz5K00WnqWxQ340RANSJ0kRukutfbqi4rxWT7d6ARQUntk6ya1N5THcNYto39pKx
 hUnDK5/ABzwIO7szi1+3+5IZJQUkVAuJme1+G6ysAqAjC/CH1TsQbCdP7/MSCD1W/yJW
 muxuYwMw+hC0wru1fZVqaPSMEsr7cbiO2/3oIXwil0sH/Y7VsTfdWShdUNpVTS0SJHkI
 /dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=H2xHMxkjcpE6Uaeb37HMcK9VGfIbnF/CTq+aAJwqeQA=;
 b=qMddwpu6aWmvAutet6N+8DJE8JDAEjN7X/Sj5szRuOve2oi1TomnjnImrEQ1czm92A
 dxI5diDnNKF0QQyMAT1v83/tHVWznaAN6rcVctkB8IYtO0IoLN2Cyc0re2xkPxZz1/Tj
 mofi5MfMcT8HkJdKhh5TWXTNwnVSsRKTqPkFBWAT+CcEWq7aJRH3wVZim3VBx4NMu217
 lDBxcpZSxs//hCcva1dmoTM2RQzQphhQNhvnAnyDoPTJs+ihRBQsNxZuQMIdTZeUaz+3
 6RNmxQ4KZiGhNK9kSdIIm67QEUeg8AgkI74ru6WGsD0OYriCoMdtySaxaJSwW08GagdW
 Iv9w==
X-Gm-Message-State: AOAM533THB4tQUeRTmr7sK30Zq+kjoWkzEATMtWG7Y9klldmXdqlIWe3
 pfok1IBXj/oAgAu25nAE+v2j49QqQDlT870f0A==
X-Google-Smtp-Source: ABdhPJzQ2VfCqFP9LhoWMNuMbL7j9f/7je/mD/CUsRkDGjmqTFXaaGolpNH0JgmofFJ7a1BERDEpL2iUuEg6O6L3Sno=
X-Received: by 2002:a67:d88c:0:b0:337:9a25:36c3 with SMTP id
 f12-20020a67d88c000000b003379a2536c3mr813357vsj.84.1653137729800; Sat, 21 May
 2022 05:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220517101142.28421-1-warp5tw@gmail.com>
 <20220517101142.28421-5-warp5tw@gmail.com>
 <Yoh+CgMPJM/Qp2V+@shikoro>
In-Reply-To: <Yoh+CgMPJM/Qp2V+@shikoro>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Sat, 21 May 2022 20:55:17 +0800
Message-ID: <CACD3sJYdcCUuWY3oZTgowsk5ayQicu+50M996v3maAs_67JtDw@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] i2c: npcm: Fix timeout calculation
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
=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=881:52=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, May 17, 2022 at 06:11:36PM +0800, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > Use adap.timeout for timeout calculation instead of hard-coded
> > value of 35ms.
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>
> Applied to for-next, thanks!
>
> I dropped the Reported-by tag, doesn't look like test robot found this
> issue.
>

Best Regards,
Tyrone
