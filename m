Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2E74A3323
	for <lists+openbmc@lfdr.de>; Sun, 30 Jan 2022 02:51:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmZ0k5d0Yz30Q9
	for <lists+openbmc@lfdr.de>; Sun, 30 Jan 2022 12:51:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GADiTDv7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2b;
 helo=mail-yb1-xb2b.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=GADiTDv7; dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmZ0M0gSfz2yJw
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jan 2022 12:50:40 +1100 (AEDT)
Received: by mail-yb1-xb2b.google.com with SMTP id j2so16605524ybu.0
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jan 2022 17:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cOgmiwyZjjoa2KmLRsDTQqtndRZfyO2tlSE6rtX52CU=;
 b=GADiTDv7bceiPCwC+8hOAL00PLZrvQ/NahQ4u3SQKW0IofAB42JoU9oJ3i4k8yP/cp
 UjoRe65Avw+T69+se7Xe3/T5HR0x5fGM5jN9j2VIg2nfqNWfOJgXNdoYOGoIxLr+Dvlt
 qTZsrnlyTzDRqqjtdeDyI/43LOynZlOlP1zGPwobeeizWVr60PoEt3AOzFIxnSQ386/e
 adSPWi4aNGjS3jwDBoSg1yEkA2l/zIlQfX2A8054bUYTcPddM02VKecZyRnIkwkGtx9S
 gL3TiVRghBTDZdaqr+B0P+LvVcSj+LfCrUvGtO1Ck3qqfZ9agqjJxCJ6d4W+Y5JM/NAf
 IDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cOgmiwyZjjoa2KmLRsDTQqtndRZfyO2tlSE6rtX52CU=;
 b=svzRUlwgc8nEdma5Tjm4LqVFg1nmZVu/pkCb2AChmSBqvLS/f4hyeCzxTtylkssblL
 JfGJVwWnnoOjtFQU4WvbyXGP/tVsZlV/n0wYs72htT9+Mvn9raQhfoePCvCGywBeHWOI
 WYpgEu2v3AZt4HfhWPbzdQg83yL/JUQzctZ2r3xFFNOpYuSjpgJbsciTsXIshi+uJ5gp
 4gpf4z38paUExSvmqwav4J2oyX18j45IA+e30EXR+nYYLV4UInu8OsJaIrlPodQuN4Yu
 hqZLOYG3A1TGNuvNnXEPuyYr/t2sb2DuJt2UbGGCs70BTrSsw2KRJVYaIZRuSLArnTmX
 CIKA==
X-Gm-Message-State: AOAM530G1SEhZ0TG7l8PX33xIA0pktJQF0nECxHbWi2zF7iro8gep6nD
 /zUOTn0DBzg5ljxwpKGHAiwgTRq3zMZvL4wV+T61bg==
X-Google-Smtp-Source: ABdhPJwsUgbHQxzZC2X5NxV1xXcoZwY26kEaYR+fnCssyr4T9BhV55Xyz53hohkukDK6ALvgU8mEZhuGi8OOBHFFBJo=
X-Received: by 2002:a05:6902:124a:: with SMTP id
 t10mr20359327ybu.634.1643507436695; 
 Sat, 29 Jan 2022 17:50:36 -0800 (PST)
MIME-Version: 1.0
References: <20220129115228.2257310-1-j.neuschaefer@gmx.net>
In-Reply-To: <20220129115228.2257310-1-j.neuschaefer@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 30 Jan 2022 02:50:25 +0100
Message-ID: <CACRpkdYEigGHkoGfBg15tFXadgpXUAjDOnw7ePXhmvHJqPEJXw@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Nuvoton WPCM450 pinctrl and GPIO driver
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, linux-gpio@vger.kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Jan 29, 2022 at 12:57 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> This is version 5 of the WPCM450 pinctrl/GPIO driver patchset.

I haven't had time to look in detail but the kernel robot is complaining
about patch 5...

> I was originally just going to rebase the patchset on top of v5.17-rc1,
> but while testing, I found that the IRQ handling code violated locking
> rules, specifically that it used spin locks (which can sleep on RT kernel=
s)
> in IRQ contexts. So I made a few changes to fix that, mainly switching
> to raw spin locks.

Which patches do you expect to be applied to the pin control tree?

Yours,
Linus Walleij
