Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CABD44BCDF
	for <lists+openbmc@lfdr.de>; Wed, 10 Nov 2021 09:29:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hpygq6hc8z2yfZ
	for <lists+openbmc@lfdr.de>; Wed, 10 Nov 2021 19:29:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TuB7tlTl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::233;
 helo=mail-oi1-x233.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TuB7tlTl; dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpygS4FPxz2xBg
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 19:29:08 +1100 (AEDT)
Received: by mail-oi1-x233.google.com with SMTP id o83so3889741oif.4
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 00:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f7rHKPXF7IbvrxgZBgwaRfmurIG9HqN9DpJB72wC+bI=;
 b=TuB7tlTlxNHJ06giSMcvKP5BOduliRU9Wes+BVl8jRlSWGR3FOyQqy+C6b/4/JF22I
 xLP1ip3PpAsa5FPNqLzHoXDq9IQlGTO2CQ2v/acPdM3w5ZysyMIyMC8AarTjopkU7Eue
 x7YjTocStBQ45qy16SWD2Fejhl16N3PrMRDNR6q/SGfIFm5vXWXHtaTjQ5F0Hjh8ABnS
 +8TQFzoFcl2LmKr7Uue/nnd1fcfUVsR8DEkDxgnRBbruYHHHs+wh9PZ67QbtQKtMuIYQ
 oehJVgH8VUG0UFomg/6EedRCxpDDMmrKiiY98mlS/mUv1HxTbnHm7lQ6JP/s/qxur8sb
 B2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f7rHKPXF7IbvrxgZBgwaRfmurIG9HqN9DpJB72wC+bI=;
 b=jL3YgD7EoQh8HVgLo9y3tXkHAjE19X4Ukq8rwrZlkNtGDaO9ZDRlOcSZGlSUlVt2+6
 JHeDZ1n89ZDJqzikTRd2y0zzRhoSMWLaOe0yAt7o5upZSxLtSalK9W8CjpsqHXOrIWqC
 Rc0U4nDpc6ElkmFVtP9U/vLQiDVs5rvTCgHpGRqlMQMQb05XCg++xcsmoCr3yCTuH0zU
 mkN7PTX6bEQov8LM0WP9dcUCxWfo5KMPd7Y9sDSaccyhEqXRcJo2/nOBzktYuNWQE/2W
 HPxGMA4grF59AHUexmiDwh5zYhOe7HcwtWi9zeD0lFwgbHT2QqR4Z1n5RepOtLOyApTf
 etfw==
X-Gm-Message-State: AOAM5329ZzLzTv9G+sg/+GOecEOc20sUxsNN8xCDrTFvTkMU3reFuPiQ
 2hE60Q51pehbWSHdQ8oi4t+PIn/Ertws85/VQnaY3Q==
X-Google-Smtp-Source: ABdhPJyaEL5vlz5N6A4nMGJI6OOxAb6rO5+DSFGzls44RzkLp58y9QExK/RBI8PkIc3s+dGBR+D8Ys2jtTo0M+HHy4U=
X-Received: by 2002:a54:4791:: with SMTP id o17mr11897170oic.114.1636532945359; 
 Wed, 10 Nov 2021 00:29:05 -0800 (PST)
MIME-Version: 1.0
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
 <20211028141938.3530-11-lukas.bulwahn@gmail.com>
In-Reply-To: <20211028141938.3530-11-lukas.bulwahn@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Nov 2021 09:28:53 +0100
Message-ID: <CACRpkdakmQinPTHfV7m_Zbwh78k12gf9if4b1xiyEEW004KDCg@mail.gmail.com>
Subject: Re: [PATCH 10/13] arm: nomadik: drop selecting obsolete
 CLKSRC_NOMADIK_MTU_SCHED_CLOCK
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

> Commit 85b6fcadcf66 ("clocksource/drivers/ux500: Drop Ux500 custom
> SCHED_CLOCK") removes a sched_clock workaround and its corresponding
> config CLKSRC_NOMADIK_MTU_SCHED_CLOCK. Since then, selecting
> CLKSRC_NOMADIK_MTU_SCHED_CLOCK in ./arch/arm/mach-nomadik/Kconfig has no
> effect and ./scripts/checkkconfigsymbols.py warns:
>
> CLKSRC_NOMADIK_MTU_SCHED_CLOCK
> Referencing files: arch/arm/mach-nomadik/Kconfig
>
> Simply drop selecting the obsolete CLKSRC_NOMADIK_MTU_SCHED_CLOCK.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Patch applied to my Nomadik tree!

Yours,
Linus Walleij
