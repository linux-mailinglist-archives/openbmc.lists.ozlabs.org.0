Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0C043F751
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 08:36:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgXlJ3ZLZz2yS3
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 17:36:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=QXSVikla;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=QXSVikla; dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgXkw3xqQz2y7M
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 17:36:23 +1100 (AEDT)
Received: by mail-qk1-x72c.google.com with SMTP id bm16so8334705qkb.11
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 23:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LEILQQUesMLhwBV9VT8SbrMsd7pCCV240pHTJH2Qsog=;
 b=QXSViklaM4teVWomsS6nozIFsVAusS+qiaF6O6FPcwppPbquWn9haZBHBXZHRPe9H9
 CAfcJpRnxjo9Bo72NsgpeacT9Gs2yQKGGmq7Ghk7f8n4MiEInB/dfxccL/Hs8k6k7+vu
 D6NxYtVzEX5+K7GpE5cJI4K6Hl1aQKeXN/Ug8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LEILQQUesMLhwBV9VT8SbrMsd7pCCV240pHTJH2Qsog=;
 b=kkUTpcBl13yXJz35GWssURSBJaliUWafJ80myHH+TokeVksh30hRCS1HMTV3DahkAA
 3zXSNakra/HGCVDsf7xpDgTS5k8O841dnhrhr42zwHIcMw731QVRQj4wCvO1Fo1J0Ail
 st698VU43FOo5UUp5czl8eJ68ih3WhK2RmBER2oXPnt8b2R0VAybBOEtof3L4lA0L5R8
 p18pfPXF9xL1mYL35H15zTlYB3oF7JCSsPxAmha6OZ0GAdM+HsNpN3OppN5I3WCSLhjq
 OzNa+cDYqEsqYLtmwZjNp+/gZWdyBh0ECj/Ntf/voOdBQ2sbFK1661zLQpMWQM8b1xVC
 ffiw==
X-Gm-Message-State: AOAM531RTbXSPJDbEyVSvTWP0CpgXord+wt/Q/IOGbrC5Gx+AXlraIL1
 bagrbik/ujoGk3B636vJNgWzbZdaTaJEZgON8Vw=
X-Google-Smtp-Source: ABdhPJw+DYkn9qbJPDwLbtukPFCsVeNOpMOGwR9WpQvTJfSN3aB1GiBugZUngVxGSoZiaEgDJPquEP13D4o2XPpJ450=
X-Received: by 2002:a05:620a:440f:: with SMTP id
 v15mr7337283qkp.381.1635489380025; 
 Thu, 28 Oct 2021 23:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
 <20211028141938.3530-12-lukas.bulwahn@gmail.com>
 <CAK8P3a0Nq9hLbGiPCQTjVTiGFPR9-tdhN8Tf06Q=cWTgMK78yw@mail.gmail.com>
In-Reply-To: <CAK8P3a0Nq9hLbGiPCQTjVTiGFPR9-tdhN8Tf06Q=cWTgMK78yw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 29 Oct 2021 06:36:08 +0000
Message-ID: <CACPK8XfiN5qziPHLU6J=bC34mcjz+ix7jjSX=xk9zsr7+vyTdw@mail.gmail.com>
Subject: Re: [PATCH 11/13] arm: npcm: drop selecting non-existing
 ARM_ERRATA_794072
To: Arnd Bergmann <arnd@arndb.de>, Tomer Maimon <tmaimon77@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>
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
Cc: Linus Walleij <linusw@kernel.org>, kernel-janitors@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Dinh Nguyen <dinguyen@kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sekhar Nori <nsekhar@ti.com>,
 Russell King <linux@armlinux.org.uk>, Tali Perry <tali.perry1@gmail.com>,
 Krzysztof Halasa <khalasa@piap.pl>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Patrick Venture <venture@google.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Imre Kaloz <kaloz@openwrt.org>, Fabio Estevam <festevam@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 28 Oct 2021 at 14:57, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Oct 28, 2021 at 4:19 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > There is no and never was a Kconfig for ARM_ERRATA_794072 in the kernel
> > tree. So, there is no need to select ARM_ERRATA_794072 in
> > ./arch/arm/mach-npcm/Kconfig.
> >
> > Simply drop selecting the non-existing ARM_ERRATA_794072.
> >
> > This issue was discovered with ./scripts/checkkconfigsymbols.py.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
>
> Could this be a typo? Maybe we need to enable a different errata workaround
> here, or maybe that code is actually needed and has to get sent.

Doing some searching, u-boot had a workaround for something called
ARM_ERRATA_794072.

https://github.com/u-boot/u-boot/commit/f71cbfe3ca5d2ad20159871700e8e248c8818ba8

Lore has the review history for that patch:

https://lore.kernel.org/all/6be32e0b5b454ed7b609317266a8e798@BLUPR03MB358.namprd03.prod.outlook.com/

It looks like it's the same workaround as ARM_ERRATA_742230, which the
kernel does implement.

It would be good to hear from the Nuvoton people, or an Arm person.

Cheers,

Joel
