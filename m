Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E4C806BB7
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 11:17:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=LBVKtPQm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlYHj66vJz3cX4
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 21:17:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=LBVKtPQm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::229; helo=relay9-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sl0Kb08Gnz30gH
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 23:32:18 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B801FF811;
	Tue,  5 Dec 2023 12:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701779528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DgcnHD3vyBMyp03Zy3XMz8GUwdycjO24GHf/1xFuXTY=;
	b=LBVKtPQmrUQ6Vu0G6IcPAIa8eJoxjxXJkgPJpFKcHVeuiAv6/8G9VGnHA5N8JqYmKhT4TB
	rbS6qBwhmw9YFtJb1d2+jAIzzEgLmCsKG7EwK8FsFnP13KTeVJfi/62NqzRtmHgES/9XHx
	b8Q6znSSChPfEGHvAy3iISOdVQl43UBChfES/DAms5SmpIPq6x9C5AckHcNjiJQ8EtgUz6
	tfH3YL9GyBR3qqMLENJEj1B5/EGrU0T8wOXU34b50N4WTrNYh4OwbP/LrzjiT2YMlGVXZz
	dd3ktMSEwO96aaAwPW709BuHUke59iTw9AoljYR7k17TTOQWvbkwk3J3KbLBmw==
Date: Tue, 5 Dec 2023 13:32:05 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH net-next 09/16] net: mdio: Add Synopsys DW XPCS
 management interface support
Message-ID: <20231205133205.3309ab91@device.home>
In-Reply-To: <20231205103559.9605-10-fancer.lancer@gmail.com>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
	<20231205103559.9605-10-fancer.lancer@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-Mailman-Approved-At: Wed, 06 Dec 2023 21:16:15 +1100
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, Tomer Maimon <tmaimon77@gmail.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Serge,

On Tue,  5 Dec 2023 13:35:30 +0300
Serge Semin <fancer.lancer@gmail.com> wrote:

> Synopsys DesignWare XPCS IP-core can be synthesized with the device CSRs
> being accessible over MCI or APB3 interface instead of the MDIO bus (see
> the CSR_INTERFACE HDL parameter). Thus all the PCS registers can be just
> memory mapped and be a subject of standard MMIO operations of course
> taking into account the way the Clause C45 CSRs mapping is defined. This
> commit is about adding a device driver for the DW XPCS Management
> Interface platform device and registering it in the framework of the
> kernel MDIO subsystem.
> 
> DW XPCS platform device is supposed to be described by the respective
> compatible string "snps,dw-xpcs-mi", CSRs memory space and optional
> peripheral bus clock source. Note depending on the INDIRECT_ACCESS DW XPCS
> IP-core synthesize parameter the memory-mapped reg-space can be
> represented as either directly or indirectly mapped Clause 45 space. In
> the former case the particular address is determined based on the MMD
> device and the registers offset (5 + 16 bits all together) within the
> device reg-space. In the later case there is only 256 lower address bits
> are utilized for the registers mapping. The upper bits are supposed to be
> written into the respective viewport CSR in order to reach the entire C45
> space.

Too bad the mdio-regmap driver can't be re-used here, it would deal
with reg width for you, for example. I guess the main reason would be
the direct vs indirect accesses ?

I do have a comment tough :

[...]

> +static inline ptrdiff_t dw_xpcs_mmio_addr_format(int dev, int reg)
> +{
> +	return FIELD_PREP(0x1f0000, dev) | FIELD_PREP(0xffff, reg);
> +}
> +
> +static inline u16 dw_xpcs_mmio_addr_page(ptrdiff_t csr)
> +{
> +	return FIELD_GET(0x1fff00, csr);
> +}
> +
> +static inline ptrdiff_t dw_xpcs_mmio_addr_offset(ptrdiff_t csr)
> +{
> +	return FIELD_GET(0xff, csr);
> +}

You shouldn't use inline in C files, only in headers.

Maxime
