Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2E19E10E3
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2024 02:44:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2NjV6Bqfz3bVH
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2024 12:43:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733190235;
	cv=none; b=NxjlahJg1I+fZl001w/mzWqU/mFFYHkI0L1mtQ/FH6MklARi3y6ywpE8o+RgzLshSiP58CySOvE7I+j+08Z8+5P7DNoSgrFdSZCGA94Bq9nAdgVMLtolbjCEDLLXNU/js+ERhaITrOJj6Gid6epQFi/LX1s8M/5wU+aIpTsucHmmMzynMtL2KKughQP7sZcHXi8UxAKpKeUTjcCVr7xe2RD/mGsqV3SUZbeE/rzkOq3mFCt0RlkWqCFmRvKD2ay21DSwjOvrFAK0o8v8Y4oWhKEAcRZFoRyJ/6tQCPg0YKPZy6yu+BWntFfyH+65xo1LYMtabiy08jw/tyLO8ZnYWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733190235; c=relaxed/relaxed;
	bh=+2BawypFFndD3SrGkOuaOBklERnQr8M/kRlTiV79YKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GHEyZJJxSa/kISRsI3HJwUORUlZkswgJ7ieCFWrzlbVus2Psqeh2VOkuObPlxP2iSrWoxysf/h6XeQscOmtcPcL4xRlZ8UrPy55TUABNMx7TscSq5Ob7WrhEC+XgMR8oogzA/RFAFzTw/INPTuj8Fi5NNpLzZBhaZ4gVeUvuF0CcKBk5A5fbhlAhykvupVKqFh20NL5sf8wt8UB1RKX44q+CAOCwDbB6yNVY3LWwUaVoMOUV+S769zPtm1x5ZnF30vm2K+1UJNPyZBI6PCmukJvwAFFst7+UVFBFCh/73OPh7+lwEA3lGyQ73cfeWaYWIrnPmyMfc1TRmZeudsTS/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Pe1aDSZh; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Pe1aDSZh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2NjP4x8hz2xk7
	for <openbmc@lists.ozlabs.org>; Tue,  3 Dec 2024 12:43:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+2BawypFFndD3SrGkOuaOBklERnQr8M/kRlTiV79YKA=; b=Pe1aDSZhV4jQUs1b8BbmvYSH21
	YpVo8jw8cVF6cIMafA0FBeyAKLNamFvRU98nDh6kvZOv3mbr/K4blghnVzE2dAEDg8M+iG+L5MPXY
	Ld94wp7cF4STHSj6GVnyCvp6cHRiavTXWt+kUBNb/sv1bjNLUPIhrnANNvuyfKYde40M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tIHwo-00F1En-LE; Tue, 03 Dec 2024 02:43:30 +0100
Date: Tue, 3 Dec 2024 02:43:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joey Lu <a0987203069@gmail.com>
Subject: Re: [PATCH v4 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
Message-ID: <9f2c8532-8e52-439a-b253-ad2ceb07b21b@lunn.ch>
References: <20241202023643.75010-1-a0987203069@gmail.com>
 <20241202023643.75010-4-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202023643.75010-4-a0987203069@gmail.com>
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

> +	/* We support WoL by magic packet, override pmt to make it work! */
> +	plat_dat->pmt = 1;
> +	device_set_wakeup_capable(&pdev->dev, 1);

It seems odd to me that there is no WoL support in this glue
driver. So i assume the core driver is doing it? So why does the core
driver not set pmt and wakeup_capable ?

	Andrew
