Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 892067FFFA1
	for <lists+openbmc@lfdr.de>; Fri,  1 Dec 2023 00:42:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ZDiYNDVj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShCQs09vNz3dC0
	for <lists+openbmc@lfdr.de>; Fri,  1 Dec 2023 10:42:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ZDiYNDVj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1095 seconds by postgrey-1.37 at boromir; Fri, 01 Dec 2023 07:53:19 AEDT
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sh7gz1bf2z3cT8
	for <openbmc@lists.ozlabs.org>; Fri,  1 Dec 2023 07:53:18 +1100 (AEDT)
Received: from relay1-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::221])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 7828AE4DAF
	for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2023 20:35:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4FFB8240006;
	Thu, 30 Nov 2023 20:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701376488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IzQ3On710hTv4xHUxSRSe52ROEYKFUSjwFd+FRw9ZWo=;
	b=ZDiYNDVjFXSdd+LTZVKANyqlnEkTWiTR8yc/VLuFsekCuu17tQQuKYpOMDajW5APgyyZgn
	K/c4zgpvDVG+cc2AUL7Bo/kTCLhhz+QBP1BknOrBANFqUrIU9nnWBdMTcyHg44TN4JAuCU
	1L+grucTiVpIrmCYvcsvxcBaFj0opmJp6PWECQ0NsgXWyKBlp2eMcWvfnj2uuYgatUS1wI
	bQIhD6vcX0DlHmnQNKoXgzm4ogPNiRCBhbtPqU5k2scwA3MTTyGvgf8E3jSLWwnf9uqbiM
	aHV/8bpcShrEg/vqzSLYKYmJ4+jHTjP5zGv3rKUmt7UINkA+DanGsptTm8CfSw==
Date: Thu, 30 Nov 2023 21:34:41 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v1 2/2] net: stmmac: Add NPCM support
Message-ID: <20231130213441.032a661c@device.home>
In-Reply-To: <xvy2coamb6cl3wcbkl32f6w7kksoxfocyd63t7k7bz4pne2gyx@lktivhqovy7p>
References: <20231121151733.2015384-1-tmaimon77@gmail.com>
	<20231121151733.2015384-3-tmaimon77@gmail.com>
	<6aeb28f5-04c2-4723-9da2-d168025c307c@lunn.ch>
	<CAP6Zq1j0kyrg+uxkXH-HYqHz0Z4NwWRUGzprius=BPC9+WfKFQ@mail.gmail.com>
	<9ad42fef-b210-496a-aafc-eb2a7416c4df@lunn.ch>
	<CAP6Zq1jw9uLP_FQGR8=p3Y2NTP6XcNtzkJQ0dm3+xVNE1SpsVg@mail.gmail.com>
	<CAP6Zq1ijfMSPjk1vPwDM2B+r_vAH3DShhSu_jr8xJyUkTQY89w@mail.gmail.com>
	<a551aefa-777d-4fd3-b1a5-086dc3e62646@lunn.ch>
	<CAP6Zq1jVO5y3ySeGNE5-=XWV6Djay5MhGxXCZb9y91q=EA71Vg@mail.gmail.com>
	<25d0c091-3dce-4d62-a112-c82106809c65@lunn.ch>
	<xvy2coamb6cl3wcbkl32f6w7kksoxfocyd63t7k7bz4pne2gyx@lktivhqovy7p>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-Mailman-Approved-At: Fri, 01 Dec 2023 10:39:58 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>, krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, joabreu@synopsys.com, tali.perry1@gmail.com, edumazet@google.com, robh+dt@kernel.org, joel@jms.id.au, mcoquelin.stm32@gmail.com, j.neuschaefer@gmx.net, peppe.cavallaro@st.com, netdev@vger.kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

On Thu, 30 Nov 2023 22:59:32 +0300
Serge Semin <fancer.lancer@gmail.com> wrote:

> On Thu, Nov 30, 2023 at 06:26:13PM +0100, Andrew Lunn wrote:
> > > I will check with the xpcs maintainer how can we add indirect access
> > > to the xpcs module.  
> > 
> > https://elixir.bootlin.com/linux/latest/source/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c#L449
> > 
> > It creates a regmap for the memory range. On top of that it creates an
> > MDIO bus. You can then access the PCS in the normal way.  
> 
> Actually Synopsys DW XPCS can be synthesized with two types of the CSR
> interfaces:
> 1. MDIO: device looks as a normal MDIO device. This option is currently
>    supported by the STMMAC MDIO driver.
> 2. MCI/APB3: device MMD CSRs are directly (all CSRs are visible) or
>    indirectly (paged-base access) accessible over the system memory bus.
> 
> In addition to the above XPCS device can be equipped with separate
> clock sources (at least to feed the MCI or APB3 interface) and may
> have dedicated IRQ line to signal various events like link
> establishing, failures, etc. From that perspective XPCS in both cases
> looks as a normal platform device for which would be better to have a
> special DT-node defined with all those resources supplied. Then the
> XPCS DT-node could be passed to the DW MAC DT-node via the already
> standardized "pcs-handle" DT-property.

To my understanding, this should work, there's another PCS that works
this way : 
https://elixir.bootlin.com/linux/v6.7-rc3/source/drivers/net/pcs/pcs-rzn1-miic.c

Are you still able to use the mdio-regmap glue that Andrew mentioned,
to avoid the duplication between the mdio and mmio register accesses ?

Maxime
