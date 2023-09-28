Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 016247B205C
	for <lists+openbmc@lfdr.de>; Thu, 28 Sep 2023 17:05:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=iVn3Gzb7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxGxB6Qn3z3cLx
	for <lists+openbmc@lfdr.de>; Fri, 29 Sep 2023 01:05:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=iVn3Gzb7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=zhangjian.3032@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxGwY1ww4z3c5Y
	for <openbmc@lists.ozlabs.org>; Fri, 29 Sep 2023 01:04:27 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-578cc95db68so7109145a12.1
        for <openbmc@lists.ozlabs.org>; Thu, 28 Sep 2023 08:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1695913464; x=1696518264; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hy+mCITxqUKHaf6v9YLMzBge8DV4xA0bJDOMHOLkflo=;
        b=iVn3Gzb7ykKf6YEyWb0hSyVWpC1wdpjxAzUSjlC3Me35Mtg4eoq75ZZzYmIjaMeCFe
         umaL1oA1AG8oVcRFNd+llMM92xHgFKHqoUR98rsDLlIKN5mBrBe79qNsnjKFTk9BPnDG
         T49VU/VXfVd9fWb3P+UmkqdJdbND6bMk7OlM/j6gP1KDhAahV07dV7IpakIEMt+Wys5n
         zA3AbFot7l5Z93DW6EuuHnQFOMiIUL6/W8geJ6RvcLJY4lTJNGP3YNY6W1Oei6aSu6Vp
         6ENdeSvFQnyBN7pJxfCmRX0GtTWELlhdeQEDgbIib6dUOtI0sHIHsZ2in3xOWyeRaMb2
         MCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695913464; x=1696518264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hy+mCITxqUKHaf6v9YLMzBge8DV4xA0bJDOMHOLkflo=;
        b=LHvRDYdpWScO3VPxw/eAKSO0/ogNTnoKQfGQiFkPmghO8z2kQk3g1ve/KHO+IXZWNM
         HZLxPtGXc9xlelWUO1Euv1QcfvcT+Pv2i4Lk7J1yb/JBp9zT8IzJVw6nIRnsON6I58Za
         Yjq7SGPK+DJ85iRYMPNLZ+RVR1nSJVAUd295IVE8bXErodg1xqGK0GrYcLlJ3wKppmis
         iQiRkoFIwxm1H9bGhx46TMjXSE9AJGY/wemkiZtAYcH4jUT9zdoD8p3XkjuFMEN7Oig7
         fnyQYCVwOr1VnFIWY3sIgus3sgtcvKHLGSyT2b80vFlNdUOAPaWsZefTiXvP+e0YtyjP
         DTmQ==
X-Gm-Message-State: AOJu0YxwVOdP+kwYgs1E263yQw0CUza5epYNueTdlGvEvBE7BmGgrDCy
	oJBcZ7x+gbou7ps/g70ulYOKpOXfdkrSg5EyYYhZoQ==
X-Google-Smtp-Source: AGHT+IGHZkvDaSolxNVreDEYNnlm23eWGgLmXan2kef32Ucxd9qRSqygmSfVuYx7BSqrMRHdwnd8QSHBn0FnGfA1Tg4=
X-Received: by 2002:a17:90a:b28b:b0:273:ed60:ad52 with SMTP id
 c11-20020a17090ab28b00b00273ed60ad52mr1367512pjr.37.1695913464408; Thu, 28
 Sep 2023 08:04:24 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 28 Sep 2023 11:04:23 -0400
From: Jian Zhang <zhangjian.3032@bytedance.com>
Mime-Version: 1.0
References: <20230927154244.3774670-1-zhangjian.3032@bytedance.com> <20230928145128.tjflbgvena4apivs@zenone.zhora.eu>
In-Reply-To: <20230928145128.tjflbgvena4apivs@zenone.zhora.eu>
Date: Thu, 28 Sep 2023 11:04:23 -0400
Message-ID: <CA+J-oUsgZuFmKor_thfehf2T8Y9T4NHcDp713YHyZC=fQvvZgA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2] i2c: aspeed: Fix i2c bus hang in slave read
To: Andi Shyti <andi.shyti@kernel.org>
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
Cc: "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, andrew@aj.id.au, "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>, yulei.sh@bytedance.com, open list <linux-kernel@vger.kernel.org>, Tommy Huang <tommy_huang@aspeedtech.com>, Wolfram Sang <wsa@kernel.org>, brendan.higgins@linux.dev, "open list:ARM/ASPEED I2C DRIVER" <linux-i2c@vger.kernel.org>, joel@jms.id.au, zhangjian3032@gmail.com, "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>, xiexinnan@bytedance.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> From: "Andi Shyti"<andi.shyti@kernel.org>
> Date:=C2=A0 Thu, Sep 28, 2023, 22:51
> Subject:=C2=A0 [External] Re: [PATCH v2] i2c: aspeed: Fix i2c bus hang in=
 slave read
> To: "Jian Zhang"<zhangjian.3032@bytedance.com>
> Cc: <brendan.higgins@linux.dev>, <benh@kernel.crashing.org>, <joel@jms.id=
.au>, <andrew@aj.id.au>, <zhangjian3032@gmail.com>, <yulei.sh@bytedance.com=
>, <xiexinnan@bytedance.com>, "Tommy Huang"<tommy_huang@aspeedtech.com>, "W=
olfram Sang"<wsa@kernel.org>, "open list:ARM/ASPEED I2C DRIVER"<linux-i2c@v=
ger.kernel.org>, "moderated list:ARM/ASPEED I2C DRIVER"<openbmc@lists.ozlab=
s.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT"<linux-arm-kernel@lists.=
infradead.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT"<linux-aspeed@li=
sts.ozlabs.org>, "open list"<linux-kernel@vger.kernel.org>
> Hi Jian,
>
> On Wed, Sep 27, 2023 at 11:42:43PM +0800, Jian Zhang wrote:
> > When the `CONFIG_I2C_SLAVE` option is enabled and the device operates
> > as a slave, a situation arises where the master sends a START signal
> > without the accompanying STOP signal. This action results in a
> > persistent I2C bus timeout. The core issue stems from the fact that
> > the i2c controller remains in a slave read state without a timeout
> > mechanism. As a consequence, the bus perpetually experiences timeouts.
> >
> > In this case, the i2c bus will be reset, but the slave_state reset is
> > missing.
> >
> > Fixes: fee465150b45 ("i2c: aspeed: Reset the i2c controller when timeou=
t occurs")
> > Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
>
> Why I'm failing to find your v1 patch? And where is the
> changelog?
Sorry, something was missing,
v2:
* remove the i2c slave reset and only move the `bus->slave_state =3D
ASPEED_I2C_SLAVE_INACTIVE` to the aspeed_i2c_init

[0]: https://lore.kernel.org/linux-arm-kernel/20230810072155.3726352-1-zhan=
gjian.3032@bytedance.com/T/
Jian
>
> Andi
