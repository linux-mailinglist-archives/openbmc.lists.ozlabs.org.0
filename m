Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DCC9E207F
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2024 15:59:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2kLy6TJPz3c5Y
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2024 01:59:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733237944;
	cv=none; b=l9SfXWmTHJ87o+MdgyP3FM98hrLcaC31wNzw0UkG+KGcl0ypcLR5ePc0nRZhzqYGv3oYrCJqrqKzvNBaDT1se5qZoH3ArxgyaGAomUPXiQU+CDfiBNJjViGhr9Jq1O/omAIJv+bkgqFQ4rWr4A3+gFqjE0Le1BpP+WoBolCCVboB7oBb82GnwGDC4Tj71xR4eMtW3neY8lNl+OocEdobyr5fYpxqkHK+1udiNc3UA2NHHvQk38tXNM7DrUmeknPMATTO5XGde31estK3tAmubsfh0Ox9A1/zV8Spi/VUujNqCoTR5XVq0+q9yY7MkXlRA/4Lrds5izVfpjUDyH7j+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733237944; c=relaxed/relaxed;
	bh=AQfWXnwBtjN4+gVX0bHkzy3HHnT2/jPXP6zHmg2fCvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WSkWLxddanhsjH7U9CrkXxQruHQC9WSuIH/R/5dVyUZSyFp9OQwY5lds3iaoP6VahM4nw3eIP290eG4E8cAGhoPCkdmsQ7MQVyaJEhy+8kyXANDTrLfmJgzgORwjxji69KFKm2aHOwTDOz6bwHoxQQhjDyYVYtB28q36Dh2EvjZuJXEYG1MvCZrGS7jHbxR8BCnRc4vAy4s47INEnP/q7/8LNqxJiGQW4xxG4k9owmPWCPpxEtErG9bxh+NqOJpfUcY0DWSUUR8ID11OTo5YUGYnYKP4bIxNGaRNy7c8ucF4FHEou99taB3YPWrovO5cD4hw4Wl9pXPHJfXB4OffdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=LnB4d1FL; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=LnB4d1FL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2kLv33d4z302f
	for <openbmc@lists.ozlabs.org>; Wed,  4 Dec 2024 01:59:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=AQfWXnwBtjN4+gVX0bHkzy3HHnT2/jPXP6zHmg2fCvs=; b=Ln
	B4d1FLm6hFKT1zzUVBGaUbFqCSIXxlRMFuTgS6FHvoDQDHLEdDcUOJ8gi8ngmraFhNAug/S96vt/i
	t3QOSt5H8yDbjbaPbKmXFEjhTgrH+vleuSIwL0JbIp+/p6Xs3FsMCIm+Nafv2zdnT/daIZdJpICGx
	oZHrT0RltarQVX4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tIUMM-00F6Nb-5j; Tue, 03 Dec 2024 15:58:42 +0100
Date: Tue, 3 Dec 2024 15:58:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joey Lu <a0987203069@gmail.com>
Subject: Re: [PATCH v4 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
Message-ID: <ba09cea2-4cf7-4203-ae98-ea5d8413f69e@lunn.ch>
References: <20241202023643.75010-1-a0987203069@gmail.com>
 <20241202023643.75010-4-a0987203069@gmail.com>
 <9f2c8532-8e52-439a-b253-ad2ceb07b21b@lunn.ch>
 <75eb13d7-b582-4056-b707-706865611706@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75eb13d7-b582-4056-b707-706865611706@gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: ychuang3@nuvoton.com, edumazet@google.com, schung@nuvoton.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, richardcochran@gmail.com, alexandre.torgue@foss.st.com, peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Dec 03, 2024 at 05:12:24PM +0800, Joey Lu wrote:
> Dear Andrew,
> 
> You're correct. In the stmmac_hw_init function within stmmac_main.c, whether
> pmt is true is determined by checking the pmt_remote_wake_up bit in the
> hardware feature register. However, our hardware configuration only supports
> magic packet and not remote wakeup, so it must be overwritten in the glue
> driver.

Please add a comment explaining this. 


I'm not sure why the original code doesn't include magic packet as part
> of pmt.
> 
> source code:
> 
>         stmmac_hw_init() @net/ethernet/stmicro/stmmac/stmmac_main.c
> 
>         priv->plat->enh_desc = priv->dma_cap.enh_desc;
>         priv->plat->pmt = priv->dma_cap.pmt_remote_wake_up &&
>                 !(priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL);
>         priv->hw->pmt = priv->plat->pmt;
> 
> Or modify the condition as follows:
> 
>         priv->plat->pmt = (priv->dma_cap.pmt_remote_wake_up || priv->
> dma_cap.pmt_magic_frame) &&
>                 !(priv->plat->flags & STMMAC_FLAG_USE_PHY_WOL);

Are there other glue drivers which would benefit from this? It is hard
for me to say if you hardware is odd, or if this should be a generic
feature which other glue drivers would use.

	Andrew
