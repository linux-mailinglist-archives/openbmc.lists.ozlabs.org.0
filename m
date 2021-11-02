Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF3D4428F5
	for <lists+openbmc@lfdr.de>; Tue,  2 Nov 2021 08:55:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk2Jc4tLjz2yHB
	for <lists+openbmc@lfdr.de>; Tue,  2 Nov 2021 18:55:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hi+WlcUu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2e;
 helo=mail-yb1-xb2e.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hi+WlcUu; dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk2JF2dHhz2xDM
 for <openbmc@lists.ozlabs.org>; Tue,  2 Nov 2021 18:55:23 +1100 (AEDT)
Received: by mail-yb1-xb2e.google.com with SMTP id v64so44477279ybi.5
 for <openbmc@lists.ozlabs.org>; Tue, 02 Nov 2021 00:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IYt4XdhIV9mCaGivgxKhV13JsWC7QyPYPD/Uf0f0VIs=;
 b=hi+WlcUukqlLODfpjwW2VnRDHE+wHoBCu0sK/EMuhpL+IaT1POHTsscxNKlv74QBwj
 tNLpz/ca1nZ/tivSKZGvUUtk22P4h61lKWrGLhjjevFOf7qfOdHUbpSeSgkOw7YSLxFg
 hzdDcpHnvUVDY62fxsF7w+DzhZSgxmA0V8qx7PQIo2X+1o0kiyi8jq2PPuHSAWQVnQZt
 bLfXJmkiWh3sg6fZbxvSTnNNs3LQ484HCKq3N2QQ4Zxtc/3d4tSd7U6IJbb3YUVQbCCa
 MMe16MR2nUVK9xkT5V+qQg2bKNTCdfN0HMqXYFpEO5oWHLsa9zmeRSxNjNSeljAlkQh4
 gMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IYt4XdhIV9mCaGivgxKhV13JsWC7QyPYPD/Uf0f0VIs=;
 b=2tVmnil6iE7vHoymL9imeDtvtqxxBmcuXrxzevKboO2dMV3MLNh5wMCagTXff3CaLX
 YP5UoiawbpwTSenoel2x9ZVcmEZfgwzqiSf9e+fe1PWv8tTYNpNV1RoXRp10F2qGO8U9
 1Dt6gwW3I2RPJh+K/0852cn316c8o1S41WgLo+/NrASqBQHq4Gbn/fzXRBc4wcEY4TFm
 58dfc2cyZCA2TE0dHLZanl0ddoxgwHqxLKiWR5AalXRmFFv8PBJWzFIqJLvGQcLxZYC9
 ryeo6iX7kMFVczTij5cQnZnY1JjPHXlOhp4v3kCTgUVZPdZDr8vvl2RJop+vR/jq5hh5
 Eqjw==
X-Gm-Message-State: AOAM531F93LI0yENLA0Bv0p2+VVAx24RphWi233SNPW4Kpx+GJaQRA5H
 Q56pRMSslhhls++xnj7s1sXdUGxXNxb1ux9pAZk=
X-Google-Smtp-Source: ABdhPJzK6cSMn+HDFhuBPyz0xbsXJXCQ7kZL8KTzlfKBDhHdacY3bQgOuecjIM+xrmFVCFk7Ozss13UuugxdEB6hZ8w=
X-Received: by 2002:a25:a268:: with SMTP id b95mr36582994ybi.35.1635839719820; 
 Tue, 02 Nov 2021 00:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
 <20211028141938.3530-4-lukas.bulwahn@gmail.com>
 <CAK8P3a3+-J6XbUmzWs7ATN7z53GomZSj6vq3n5R709=iL45RrA@mail.gmail.com>
In-Reply-To: <CAK8P3a3+-J6XbUmzWs7ATN7z53GomZSj6vq3n5R709=iL45RrA@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 2 Nov 2021 08:55:09 +0100
Message-ID: <CAKXUXMwBsDY_onmEztvrfS6Q3k_0YH8gQGLm9zcM2Ge--kcG6A@mail.gmail.com>
Subject: Re: [PATCH 03/13] arm: Kconfig.debug: drop reference to removed
 ARCH_MSM
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: Linus Walleij <linusw@kernel.org>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Sekhar Nori <nsekhar@ti.com>,
 Russell King <linux@armlinux.org.uk>, Tali Perry <tali.perry1@gmail.com>,
 Krzysztof Halasa <khalasa@piap.pl>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Patrick Venture <venture@google.com>, Imre Kaloz <kaloz@openwrt.org>,
 Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 28, 2021 at 4:42 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Oct 28, 2021 at 4:19 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > Commit c0c89fafa289 ("ARM: Remove mach-msm and associated ARM architecture
> > code") removes the definition of the config ARCH_MSM. Since then, the
> > reference to ARCH_MSM in the dependencies of UNCOMPRESS_INCLUDE in
> > Kconfig.debug is dead.
> >
> > Fortunately, ./scripts/checkkconfigsymbols.py warns:
> >
> > ARCH_MSM
> > Referencing files: arch/arm/Kconfig.debug
> >
> > Drop the dependency on this removed config.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> >  arch/arm/Kconfig.debug | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
> > index 83484564b1d9..87aa6e92ee6e 100644
> > --- a/arch/arm/Kconfig.debug
> > +++ b/arch/arm/Kconfig.debug
> > @@ -1886,7 +1886,7 @@ config DEBUG_UNCOMPRESS
> >
> >  config UNCOMPRESS_INCLUDE
> >         string
> > -       default "debug/uncompress.h" if ARCH_MULTIPLATFORM || ARCH_MSM || \
> > +       default "debug/uncompress.h" if ARCH_MULTIPLATFORM || \
> >                                         PLAT_SAMSUNG || ARM_SINGLE_ARMV7M
>
> The PLAT_SAMSUNG reference is also misplaced here, I think you just want
> ARCH_S3C24XX instead, since the other samsung ones already require
> ARCH_MULTIPLATFORM.
>

Agree. I can clean up (or better stated: optimize) the dependencies
further in such a way. But that config dependency optimization goes
beyond just removing dead symbols and deserves to be its own patch.
Patch will follow later this week.

Lukas
