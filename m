Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8BB544CF3
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 15:03:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJkmB6HqYz3bqW
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 23:03:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IVDzHPmL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com; envelope-from=warp5tw@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IVDzHPmL;
	dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJklm3G6Wz3bmK
	for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2022 23:02:44 +1000 (AEST)
Received: by mail-yb1-xb32.google.com with SMTP id x187so14093146ybe.2
        for <openbmc@lists.ozlabs.org>; Thu, 09 Jun 2022 06:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Gepr+P/b1NDSmcOnfY4R8HvcHSNLzUy+z/OdcbwQQN0=;
        b=IVDzHPmLeelA9KNfGflsoBU8djymr45P8BxesF2r7710KLlLMckE4z+3I6W4224ev3
         37oiqivW+s7XbwUGnNyMeBS94wdkeZNbfdy0yAiKVOzj8EeQBKDc8A9XoDnGlYyFFS3s
         TWR1sNbw+IYPMT1NUZ7B2GCHAToHwtQKHmnUfZziuUZKYPamevhwYPC+G0ZuirPzJgWY
         2qb4bjxZCyRnS5rUUpGN2wFgE7sj+q0DbYiXxJQ4+2SnlXlF5px58u6RogmEP7ve5aK7
         c2v4exBQWteJgnPXJz24OPgNQ/YLMdY+ZAUHD1qzc6BVsb9JNfqb1/uOY+kgZSwIYyy7
         nwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=Gepr+P/b1NDSmcOnfY4R8HvcHSNLzUy+z/OdcbwQQN0=;
        b=sOmfJauPTDhHG6+0BdsgxytCMK/tCNX75UG1+vc3cpWx+2U85VgG1dKjWcqVg72jgH
         0iy2xf1EmkR6r1lu6S/X31wCVEO2S3qJi2ibhWkcDP9NKxv36S37ORLYj5kIQhWHxGVO
         mSFFa+98Fe5Iz9W9sjxyQgp0GO7hwqWoEYE8Bv8B4p4wj/mhlPshxeAZNMuQ0WGPqdpD
         TCXwf1LJbbD1QLh7rWkirfZcdTg+Pp78CkNuRN6TPcpoHvzDPiY6SBfLnCbKJ5oEKQg9
         7otWua3xDUW1q/81GUWn7+JQ7M6lJ//niyqiz2IaWyQQu2oj/4f1s3XnwAbNRgvdyA8o
         8usw==
X-Gm-Message-State: AOAM530bKwAu/CbQdpSQUOT/LDoswN/tYSuYxKEtqSJyPh7u/sfM73Ad
	YZa4ly39+717IR4wFAz9YbKHDnO7ybTSvUY16A==
X-Google-Smtp-Source: ABdhPJxkAym7gxT7hPdNdLCg2YPutDnEzJH3BrutiJIqKRXSsLIjivw3RXkwmtR3hh4ND4ddrYQYBEvYVhJpwSM9d3c=
X-Received: by 2002:a25:d03:0:b0:664:37a2:4d03 with SMTP id
 3-20020a250d03000000b0066437a24d03mr2409941ybn.308.1654779760779; Thu, 09 Jun
 2022 06:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220525032341.3182-1-warp5tw@gmail.com> <20220525032341.3182-4-warp5tw@gmail.com>
 <YqEAnMTaHTbIDQq+@kunai>
In-Reply-To: <YqEAnMTaHTbIDQq+@kunai>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Thu, 9 Jun 2022 21:02:30 +0800
Message-ID: <CACD3sJaDMWbB=akrbAS0hJ=Qwdy4oqDvNE9yVPBthLhyzou+fg@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] i2c: npcm: Correct slave role behavior
To: Wolfram Sang <wsa@kernel.org>, Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com, 
	tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, 
	yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, andriy.shevchenko@linux.intel.com, 
	jarkko.nikula@linux.intel.com, semen.protsenko@linaro.org, jsd@semihalf.com, 
	sven@svenpeter.dev, lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de, 
	tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, 
	KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
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

Your previous suggestion about this commit is highly appreciated.

Thank you.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=889=E6=97=A5 =
=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=884:03=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, May 25, 2022 at 11:23:39AM +0800, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > Correct the slave transaction logic to be compatible with the generic
> > slave backend driver.
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>
> Much easier to review this way! Applied to for-next, thank you!
>

Best Regards,
Tyrone
