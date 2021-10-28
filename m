Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8FF43E549
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 17:36:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg8mY42bxz2yn0
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 02:36:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=U/Fj/4zS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk
 (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk;
 envelope-from=linux+openbmc=lists.ozlabs.org@armlinux.org.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256
 header.s=pandora-2019 header.b=U/Fj/4zS; 
 dkim-atps=neutral
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg8m76KRKz2xrC
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 02:36:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=obEVRh2SUyKsH6wuRZ+MmeBmZXXQKS44Jmrm2Q2wynI=; b=U/Fj/4zSFAfu3ihra5R0kzvttB
 XGcVAR8aLmLHPrjVzDXTsP7lZZEKYxdFievSQRbR5RMKbt8Yu/ZRuc8yYbAUBEzr/7oTN79aMIKXK
 rPEXXE09QDGjMZ1BM9zhfBnfKmg8nY00Zqzrm9m6lIDjIyymDCD0q0pwEEukI8ghiWm2zZy/HuIZT
 boGw9j9RAMlBkz00H0+8QIGhaKxLDDPF2XJildRKicdgzYTY7PXIMkiix1AsCt8eMN4ajOM5gGuEI
 JCbxWGa6C6y5Y2qPSHILdWzOXHAlaZaxtDy5TB7jIv/SkQFgurik7tg5FNImCmARI0g4Gu3MR5p9r
 gDq03WsA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55356)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1mg7RQ-0007ix-SD; Thu, 28 Oct 2021 16:35:44 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1mg7RM-0000Rz-JC; Thu, 28 Oct 2021 16:35:40 +0100
Date: Thu, 28 Oct 2021 16:35:40 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 04/13] arm: drop an obsolete ifdef with the removed
 config PCI_HOST_ITE8152
Message-ID: <YXrDTMLBAy0Ftai/@shell.armlinux.org.uk>
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
 <20211028141938.3530-5-lukas.bulwahn@gmail.com>
 <CAK8P3a2LhGWer=GXMW_KT-8=nqBeS0xhu6si7Z57WAF0wE_TUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2LhGWer=GXMW_KT-8=nqBeS0xhu6si7Z57WAF0wE_TUA@mail.gmail.com>
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
 Tomer Maimon <tmaimon77@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Sekhar Nori <nsekhar@ti.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Krzysztof Halasa <khalasa@piap.pl>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Patrick Venture <venture@google.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Imre Kaloz <kaloz@openwrt.org>, Fabio Estevam <festevam@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 28, 2021 at 04:46:38PM +0200, Arnd Bergmann wrote:
> On Thu, Oct 28, 2021 at 4:19 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > Commit 6da5238fa384 ("ARM: 8993/1: remove it8152 PCI controller driver")
> > removes the config PCI_HOST_ITE8152, but left a dangling obsolete ifndef
> > in ./arch/arm/kernel/bios32.c.
> >
> > Hence, ./scripts/checkkconfigsymbols.py warns:
> >
> > PCI_HOST_ITE8152
> > Referencing files: arch/arm/kernel/bios32.c
> >
> > Remove this obsolete ifndef.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> 
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> 
> I wonder if we should just remove this function and use the
> (non-empty) default version instead.
> 
> 96c5590058d7 ("PCI: Pull PCI 'latency timer' setup up into the core")
> introduced that generic version, and I suspect the arm version
> was left out by mistake, but it's not clear from that patch.

That was because PCI_HOST_ITE8152 needed something different from the
"do nothing" default (setting the PCI latency timer to default to 64
as the new generic code did.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
