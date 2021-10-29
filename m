Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D97843F6DA
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 07:53:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgWnw3TX8z2yNT
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 16:53:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YOSdiYDP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2b;
 helo=mail-yb1-xb2b.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YOSdiYDP; dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgWnT2tDxz2xZL
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 16:53:32 +1100 (AEDT)
Received: by mail-yb1-xb2b.google.com with SMTP id o12so21585940ybk.1
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 22:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/vSuXsboymS/IgpBF9knJfz3TVx/mAj7z1ArPgdizjI=;
 b=YOSdiYDPna3naFx1R6UjtVwYbyaJDrQD0isSgwS7yDBmHs8l0633OLtBLdGZdil/TM
 6dWhEg7S0NjtqvwZYX7tJ6kmufifUyEsCBZ3T5NR6r+lTFF+4YliqgbNqpSYGLFCPnIc
 63kQo9ZVCpGhOJjvhO4+XCfmV8oIjS0MhJ7SHonzwa5B91APGzuLAsLw+N10yC/YeEnv
 JMyp971+Be/WEYtK8PtAvDll0XWvtwa4gwXp0UNxF8c+NEPJIOFSKqKgAOtNeodTVA0U
 MaGNfijGHoFgsMdltgUJvbJD8HBBdw6PQk5VbLk1vRdZj7p6+jciFWsA8ca+MsMwbuqX
 ojrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/vSuXsboymS/IgpBF9knJfz3TVx/mAj7z1ArPgdizjI=;
 b=hMK1M8cmQroICYESEdMmRGlWNjDm3V82qTwy3uzHtVIgpT1AhlkhSjHw3K/dqHfSVc
 yXp0ycMuRP9w5bM49y6SKobzl02r5P0+6Ho7fscygb7DZznXzXiMDJrTPNYPeHSbYDvi
 od7S54zTWB6Z9GZGxeU0U04oef0/6R9iAJZq9JiVJiznvjbM4zN+0AraboeF8bGvMPO/
 kG+nJ0jYcOhrm72jDo+eIH1YV/LEjD3HHmLy7H+/D29nuF/MWUKLUGJp1BtlSmaeVpX7
 EKdMsgMf1TYQ4mYbpSKk8W5LsttiL335bJdctsnkyiF9Z4eZOO7Frt0hWi63m75kCHW/
 mfaA==
X-Gm-Message-State: AOAM530lE1ifn0DEg4ddl3Ts3n24BdFGHa5oY0TJ2KlK/VBNmTacw6Lb
 RWzkA8tBX+dp9MzZHmZahEVUFN8io9AxtaXob/Q=
X-Google-Smtp-Source: ABdhPJyaDlFoQq08g4YGXVSCxLxGN/EmlAplDZR3KAUzA0+ijsxzW6j44WCrZVqFPjLqsiVYlKPnbzBLVnyA+o64mDI=
X-Received: by 2002:a25:3787:: with SMTP id e129mr9141363yba.91.1635486809154; 
 Thu, 28 Oct 2021 22:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
 <20211028141938.3530-5-lukas.bulwahn@gmail.com>
 <CAK8P3a2LhGWer=GXMW_KT-8=nqBeS0xhu6si7Z57WAF0wE_TUA@mail.gmail.com>
 <YXrDTMLBAy0Ftai/@shell.armlinux.org.uk>
In-Reply-To: <YXrDTMLBAy0Ftai/@shell.armlinux.org.uk>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 29 Oct 2021 07:53:17 +0200
Message-ID: <CAKXUXMzqqtM02wJrb+ONVdmS3j+YRej4Fd34Pc5M3ex871ONtQ@mail.gmail.com>
Subject: Re: [PATCH 04/13] arm: drop an obsolete ifdef with the removed config
 PCI_HOST_ITE8152
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
 Tomer Maimon <tmaimon77@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Sekhar Nori <nsekhar@ti.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Krzysztof Halasa <khalasa@piap.pl>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Patrick Venture <venture@google.com>, Imre Kaloz <kaloz@openwrt.org>,
 Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 28, 2021 at 5:35 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Thu, Oct 28, 2021 at 04:46:38PM +0200, Arnd Bergmann wrote:
> > On Thu, Oct 28, 2021 at 4:19 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> > >
> > > Commit 6da5238fa384 ("ARM: 8993/1: remove it8152 PCI controller driver")
> > > removes the config PCI_HOST_ITE8152, but left a dangling obsolete ifndef
> > > in ./arch/arm/kernel/bios32.c.
> > >
> > > Hence, ./scripts/checkkconfigsymbols.py warns:
> > >
> > > PCI_HOST_ITE8152
> > > Referencing files: arch/arm/kernel/bios32.c
> > >
> > > Remove this obsolete ifndef.
> > >
> > > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> >
> > Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> >
> > I wonder if we should just remove this function and use the
> > (non-empty) default version instead.
> >
> > 96c5590058d7 ("PCI: Pull PCI 'latency timer' setup up into the core")
> > introduced that generic version, and I suspect the arm version
> > was left out by mistake, but it's not clear from that patch.
>
> That was because PCI_HOST_ITE8152 needed something different from the
> "do nothing" default (setting the PCI latency timer to default to 64
> as the new generic code did.)
>

So, can we just drop the empty pcibios_set_master() function in
bios32.c and the pci handling will now (after the removal of
PCI_HOST_ITE8152) just do The Right Thing(TM)?

If you can confirm that, I will send an updated patch here.

Thanks,

Lukas
