Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AA144BCD6
	for <lists+openbmc@lfdr.de>; Wed, 10 Nov 2021 09:27:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hpydw3yHQz2ybB
	for <lists+openbmc@lfdr.de>; Wed, 10 Nov 2021 19:27:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HQOFMTYJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::236;
 helo=mail-oi1-x236.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HQOFMTYJ; dkim-atps=neutral
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpydX66yqz2yNC
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 19:27:26 +1100 (AEDT)
Received: by mail-oi1-x236.google.com with SMTP id s139so3806811oie.13
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 00:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wjabyqMriLlEDs0oghOnUdNbhq1Wnfi0um3A6ApanhQ=;
 b=HQOFMTYJ1V/jOeYgrLDR858/DdP3Vy1c/cct+8fLcNBkXEdEq4sc92loWTLjeuONPg
 x47uvloqdX08ZQmEbi3QxrYFYH59xFKmkT2fTFowIYf2/12sp30shdW1IuBO1eBef6El
 YdXTLEbzyYwM3jxajCkH3QibZLkAqs/6pisx3Z1MLcvfheLY1jQ61jeVD7bRjD7SZAD7
 wtR1DJP0T4PDltZ2aR9tz0t00HGa4/OZkLoNUJr5r6vb134jJtJGd1jV3L/isudr8rv6
 WM2rj8sdDkizTeDk9vcZTq+lARV6Y47ubXMpY0KSaPx2FYnLfmtlp1IciHLt5PksPAhc
 bfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wjabyqMriLlEDs0oghOnUdNbhq1Wnfi0um3A6ApanhQ=;
 b=nqs1CpsHR0FPDjs8ooPHnzlzWzvGr0ZL1tnfpMahsff0jSTLa5mEsQIxPKr645wzHE
 XXNd5KAqKdrCMY0tPiNdvz4Bvu6ei/4c8cQo8iIfP6P+FnYwbCuA1WSY+8v0X2i8JvK6
 mYty3j+oa38KwdNIpQZEKq82Vi45yX4JOEf9oP7qOlc/8Ub0J1jCE99I5CekdzCqNDvS
 M+Y0S2Q+wTklp0fVg0AjbTZy14lAJZa0bskfv8H4oDfRfnNJVBACV1qgoBAm11U518Uf
 q+CtqQkX0dw1ZLVkLZe8DGEulFQVNVzf5UaxIsIz9YiAdVERgvSBG5Ix7g1KWxpmhcOq
 qApg==
X-Gm-Message-State: AOAM5322f+5yF2OtUkRIofODb+KriXStFPQ0Cg/19MgT9eG+iz2GDNGA
 G5g0VpJp2wE0l/7PBPb5WfwvURMr4qfbg88JunE0GA==
X-Google-Smtp-Source: ABdhPJyH1LONHLtwhuZMcEBp+Yg0krY6vZeudqTwP0iP/LrQGnLZpNokAje6id0/RVcqCXpcn5QWiO0vgqMwvF5aEME=
X-Received: by 2002:aca:120f:: with SMTP id 15mr11009740ois.132.1636532843343; 
 Wed, 10 Nov 2021 00:27:23 -0800 (PST)
MIME-Version: 1.0
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
 <20211028141938.3530-7-lukas.bulwahn@gmail.com>
In-Reply-To: <20211028141938.3530-7-lukas.bulwahn@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Nov 2021 09:27:12 +0100
Message-ID: <CACRpkdZa2Y3yUteqQp9br65dj248WpGfwpf-ZZ5=PXambiwEcw@mail.gmail.com>
Subject: Re: [PATCH 06/13] arm: ixp4xx: remove dead configs CPU_IXP43X and
 CPU_IXP46X
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, kernel-janitors@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Sekhar Nori <nsekhar@ti.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Krzysztof Halasa <khalasa@piap.pl>, linux-arm-kernel@lists.infradead.org,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Imre Kaloz <kaloz@openwrt.org>, Shawn Guo <shawnguo@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 28, 2021 at 4:20 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit 73d04ca5f4ac ("ARM: ixp4xx: Delete Intel reference design
> boardfiles") removes the definition of the configs MACH_IXDP465 and
> MACH_KIXRP435, but misses to remove the configs CPU_IXP43X and CPU_IXP46X
> that depend on those removed configs, and hence are dead now.
>
> Fortunately, ./scripts/checkkconfigsymbols.py warns:
>
> MACH_IXDP465
> Referencing files: arch/arm/mach-ixp4xx/Kconfig
>
> MACH_KIXRP435
> Referencing files: arch/arm/mach-ixp4xx/Kconfig
>
> Remove the dead configs CPU_IXP43X and CPU_IXP46X.
>
> A further quick grep for the name of those two symbols did not show any
> use of the two config symbols; so, there are no further clean-up activities
> beyond this config removal needed.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Patch applied to my IXP4xx tree!

Yours,
Linus Walleij
