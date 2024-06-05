Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CB48FD451
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2024 19:49:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q6XGPEKJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvZhc0Gc3z3brC
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2024 03:49:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q6XGPEKJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvZh30gPnz30St
	for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2024 03:48:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 31FEACE1838;
	Wed,  5 Jun 2024 17:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E54DC2BD11;
	Wed,  5 Jun 2024 17:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717609705;
	bh=enupfRHuA/sUxcPvYiVVg7oNNALRyFrXlotRKy7IvuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q6XGPEKJV+EC0QMabsGEV9vd0/gyTkTUfF+TAEXj9Jy82MgO8X2lzIXWqIRAyBC86
	 p4XFyPX0I/WfDCqM65cOTJJ9NtKpl/hvtdUdsUpBcVVWkFc3jG6Q8rAEkBNStkNJs5
	 EeMBLlqRH+zZaZrNfQwk35LbS5N95a8bjDH9lzLQvjv7h1K8dVURxuxRCT3CuS5mlI
	 wnRXZtwm4GPtEcZMOi8f5BwtzvNtu9FnvxuB9E0f0+/V3OOEXYLQmrnZIKL2mBm75A
	 Cuee7zNrJx1tzlb/W2d4QWFOgOXgEjONB2UVOHmux2fi2SBrWeUwLfey2ouK6lGMGA
	 PlcBGDPnUqH0w==
Date: Wed, 5 Jun 2024 18:48:17 +0100
From: Simon Horman <horms@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH net-next v2 07/10] net: pcs: xpcs: Add Synopsys DW xPCS
 platform device driver
Message-ID: <20240605174817.GQ791188@kernel.org>
References: <20240602143636.5839-1-fancer.lancer@gmail.com>
 <20240602143636.5839-8-fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240602143636.5839-8-fancer.lancer@gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sagar Cheluvegowda <quic_scheluve@quicinc.com>, Florian Fainelli <f.fainelli@gmail.com>, openbmc@lists.ozlabs.org, Russell King <linux@armlinux.org.uk>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Jose Abreu <joabreu@synopsys.com>, Abhishek Chauhan <quic_abchauha@quicinc.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Jun 02, 2024 at 05:36:21PM +0300, Serge Semin wrote:

...

> diff --git a/drivers/net/pcs/pcs-xpcs-plat.c b/drivers/net/pcs/pcs-xpcs-plat.c

...

> +const struct dev_pm_ops xpcs_plat_pm_ops = {
> +	SET_RUNTIME_PM_OPS(xpcs_plat_pm_runtime_suspend,
> +			   xpcs_plat_pm_runtime_resume,
> +			   NULL)
> +};

nit: xpcs_plat_pm_ops only seems to be used in this file.
     If so it should probably be static.

     Flagged by Sparse.

...

> +static struct platform_driver xpcs_plat_driver = {
> +	.probe = xpcs_plat_probe,
> +	.driver = {
> +		.name = "dwxpcs",
> +		.pm = &xpcs_plat_pm_ops,
> +		.of_match_table = xpcs_of_ids,
> +	},
> +};
> +module_platform_driver(xpcs_plat_driver);

...
