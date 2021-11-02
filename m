Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BCF442882
	for <lists+openbmc@lfdr.de>; Tue,  2 Nov 2021 08:32:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk1nY3VWyz2xrP
	for <lists+openbmc@lfdr.de>; Tue,  2 Nov 2021 18:32:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Bvf2fbUN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2c;
 helo=mail-yb1-xb2c.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Bvf2fbUN; dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk1n8284Gz2x9c
 for <openbmc@lists.ozlabs.org>; Tue,  2 Nov 2021 18:31:54 +1100 (AEDT)
Received: by mail-yb1-xb2c.google.com with SMTP id o12so50876502ybk.1
 for <openbmc@lists.ozlabs.org>; Tue, 02 Nov 2021 00:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OluhKtBimmP7E/0/GgG/7vGECz49HSub0BngF4v6Qkk=;
 b=Bvf2fbUNYYZs+yDoofQfIvShNimuZiQJy/Zp9hrH0CGU5n80NwA+7lS4xFoh0aRwPr
 98I/K3k/I6QiAluHUcR1ANMi4gmbQ6FkS2BuJEEBcGZJibMDly8GvavxbysCb/E3DEIu
 1k4jSu2ljyTm6S8gRdiSlJv/d/j37volSZzDeRiMvUyXJ9c0xSQPPgv3juozIUVuuc5w
 GvS68SPhYtUTmL4r6wrh9dGuWad9mhGJzRq94FOmyMsthjYY45dFHbbPidjbsntO+my0
 VgG1ARPTQdmlY9OXrXAU8qdB/wANbnxZGzVxc46++kzxevRN1e+DtE8Aqh++Z6oGkFDA
 uEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OluhKtBimmP7E/0/GgG/7vGECz49HSub0BngF4v6Qkk=;
 b=rg9UHaez+BlSjpwZMoRTa1nOMwLi3S2XF/OGHRPnaKe7MHNABLPMbKxgwo2xFK0mds
 KDH64Q99bU38QYABZ2EcM3iROCdQOWiG3ABBEC5rpITenFeNmJUnGjXcErfH7G7GaE/N
 jaUKga+0PYvQngzO+ZhnCG5uJkcQsPo5yhSsW6rb0GouNo2IYnLYmTC9z58Ino0f+DbE
 BUMgAiOtefWfyHV+CPRNiOKQPpiriEI3yX8cwUQ2zLJcGp1so6qLx9RG76d0EGZrT7Re
 F7YKlcEgjm5bSEJFD0clp6honc8XDIqrj0YUoyG9tvU3Vq7ebFRhKQFIBrFPMiGtjG47
 p17w==
X-Gm-Message-State: AOAM532HNzOFS8jv9uVozlSUwRO9lbEF02rX6GhJwZz0/Wz09HKJNIOe
 zzTeS0MbOFGFJE0ZWem1WBLNGGcBT0a9yUC5ODQ=
X-Google-Smtp-Source: ABdhPJyv6KqPsjyT+qQxOopmtsEESwOY6fY2G6+8d+IXWs3OLmtof/rN/ulyY0nAtjzJEMlBgpC9RIU9jr4hfZlhPYA=
X-Received: by 2002:a25:34d5:: with SMTP id
 b204mr26987557yba.154.1635838310937; 
 Tue, 02 Nov 2021 00:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
 <20211028141938.3530-12-lukas.bulwahn@gmail.com>
 <CAK8P3a0Nq9hLbGiPCQTjVTiGFPR9-tdhN8Tf06Q=cWTgMK78yw@mail.gmail.com>
 <CACPK8XfiN5qziPHLU6J=bC34mcjz+ix7jjSX=xk9zsr7+vyTdw@mail.gmail.com>
In-Reply-To: <CACPK8XfiN5qziPHLU6J=bC34mcjz+ix7jjSX=xk9zsr7+vyTdw@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 2 Nov 2021 08:31:40 +0100
Message-ID: <CAKXUXMyrhrM2o-OEW_qTTKjfKgxt-Z6Nt69geU80AoFnM1OuMA@mail.gmail.com>
Subject: Re: [PATCH 11/13] arm: npcm: drop selecting non-existing
 ARM_ERRATA_794072
To: Joel Stanley <joel@jms.id.au>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Sekhar Nori <nsekhar@ti.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Krzysztof Halasa <khalasa@piap.pl>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linus Walleij <linusw@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Imre Kaloz <kaloz@openwrt.org>, Shawn Guo <shawnguo@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Oct 29, 2021 at 8:36 AM Joel Stanley <joel@jms.id.au> wrote:
>
> On Thu, 28 Oct 2021 at 14:57, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Thu, Oct 28, 2021 at 4:19 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> > >
> > > There is no and never was a Kconfig for ARM_ERRATA_794072 in the kernel
> > > tree. So, there is no need to select ARM_ERRATA_794072 in
> > > ./arch/arm/mach-npcm/Kconfig.
> > >
> > > Simply drop selecting the non-existing ARM_ERRATA_794072.
> > >
> > > This issue was discovered with ./scripts/checkkconfigsymbols.py.
> > >
> > > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > > ---
> >
> > Could this be a typo? Maybe we need to enable a different errata workaround
> > here, or maybe that code is actually needed and has to get sent.
>
> Doing some searching, u-boot had a workaround for something called
> ARM_ERRATA_794072.
>
> https://github.com/u-boot/u-boot/commit/f71cbfe3ca5d2ad20159871700e8e248c8818ba8
>
> Lore has the review history for that patch:
>
> https://lore.kernel.org/all/6be32e0b5b454ed7b609317266a8e798@BLUPR03MB358.namprd03.prod.outlook.com/
>
> It looks like it's the same workaround as ARM_ERRATA_742230, which the
> kernel does implement.
>
> It would be good to hear from the Nuvoton people, or an Arm person.
>

I will happily update the patch to select ARM_ERRATA_742230 instead of
the dead non-existing ARM_ERRATA_794072.

In contrast to the current patch that basically only cleans up "dead
config" and has no effective functional change, the new patch would
change the behaviour. I cannot test this patch (beyond some basic
compile test) on the hardware; so, we certainly need someone to have
that hardware, knows how to test it or confirm otherwise that we
should select the ARM_ERRATA_742230 fix for this hardware.

The current patch should be subsumed by the new patch; the submission
of the new patch is deferred until that person shows up. Let's see.

Lukas
