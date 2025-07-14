Return-Path: <openbmc+bounces-337-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C0AB04119
	for <lists+openbmc@lfdr.de>; Mon, 14 Jul 2025 16:12:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bgklg4Tj3z3btR;
	Tue, 15 Jul 2025 00:11:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752502319;
	cv=none; b=eMo1nulrx9D57wkTRl0dMjWOFo/B/z5MMZQEvWMH+ve/RbhGZCTKSgkfNWXVVOdyo+AtKrMf2gedN7hCtMjmZYjQc+acAKO+UAl8aN0nUlHdggvFD+yBRAaGsH3BIpMafXG9W+mHb71Kjd7bDMXxEpExHukf3KjZoNkwQCKzUKxiFodoimVjzsatceZCFMsehpnPYH9kIQhf2fwsbjkpYOV3aMownK6/rJSC+IRfAu9+pj4v6HgTNPtijsWuPf9U0ju5i7C/4bo8Jqcz53Zzpzh0ri3xq6j0XtO82ZsEHeB+tF4NlpzBTjyc43+IEPaLbSsRwT7a4fogUP6ZNNvf3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752502319; c=relaxed/relaxed;
	bh=TmleEhhVyOMAvmKR4twAxGwgQhrNxQ2pccvF+Yutx3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljRqKPLwRWGnq+YMK4whs+aCzJg5FO1sKH/AswZ9Obb9YPv4rEDV7fLhfhaCzrL9w/5tpzigilZjY1RgZA8FVPH/3kC/o+7ABiqC3yC5iscoI7lOiscmRP/cILMS6qIuxKCWTRoTw7baEft8jLAY5LyusfjIQTFv6/C/ROTaTg9pZbWusRNDTC0QE/JYj0pZBK4jXqjGIbzz0soDy9TOBV5Loyl5Df8ApHZXoP04bi0v3cVfYfa1SWJt7OPkRrcGiz3s8omn04bjslBDE6FPNxRZw7Bg9txggh6Bl7MOA1CbvDbVJ5pJU1rrGAI8O2HtkLqNxNQecJWOVlEBPSYRrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=UtBS/0ch; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=UtBS/0ch;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
X-Greylist: delayed 1106 seconds by postgrey-1.37 at boromir; Tue, 15 Jul 2025 00:11:56 AEST
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bgklc5TD3z3bqQ
	for <openbmc@lists.ozlabs.org>; Tue, 15 Jul 2025 00:11:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=TmleEhhVyOMAvmKR4twAxGwgQhrNxQ2pccvF+Yutx3I=; b=UtBS/0chb+ZDH8y8RqGl2m7yeO
	uals07ZFQCEyENbaG0hmUouu0k1MOEE9tuQ9w1lbvRnHxN74m9jAD9TNxN09YNLhBuTiKXM5sIOh9
	s1IxAtvFuAVBtBbbzIWwXNkjBPu4ny0UXVcqerQIexBZ074ZoGLlgNjKIIDz3x+03Sko=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ubJcB-001SqZ-ID; Mon, 14 Jul 2025 15:53:07 +0200
Date: Mon, 14 Jul 2025 15:53:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Marvin Lin <milkfafa@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
	KWLIU@nuvoton.com, tmaimon77@gmail.com, kflin@nuvoton.com
Subject: Re: [PATCH] net: stmmac: Add NCSI support
Message-ID: <5b01bd9c-252c-41ac-adaa-dddda8ffd06b@lunn.ch>
References: <20250714053527.767380-1-milkfafa@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714053527.767380-1-milkfafa@gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> -	ret = stmmac_reset(priv, priv->ioaddr);
> -	if (ret) {
> -		netdev_err(priv->dev, "Failed to reset the dma\n");
> -		return ret;
> +	if (!priv->plat->use_ncsi) {
> +		ret = stmmac_reset(priv, priv->ioaddr);
> +		if (ret) {
> +			netdev_err(priv->dev, "Failed to reset the dma\n");
> +			return ret;
> +		}
>  	}

Please break this patch up into a series and include good commit
messages. You can then explain why this change is safe.

>  	/* DMA Configuration */
> @@ -3643,6 +3646,14 @@ static void stmmac_hw_teardown(struct net_device *dev)
>  	clk_disable_unprepare(priv->plat->clk_ptp_ref);
>  }
>  
> +static void stmmac_ncsi_handler(struct ncsi_dev *nd)
> +{
> +	if (unlikely(nd->state != ncsi_dev_state_functional))
> +		return;
> +
> +	netdev_info(nd->dev, "NCSI interface %s\n", nd->link_up ? "up" : "down");

Please don't spam the kernel log. Only do prints if something goes
wrong.

> +}
> +
>  static void stmmac_free_irq(struct net_device *dev,
>  			    enum request_irq_err irq_err, int irq_idx)
>  {
> @@ -4046,14 +4057,16 @@ static int __stmmac_open(struct net_device *dev,
>  	if (ret < 0)
>  		return ret;
>  
> -	if ((!priv->hw->xpcs ||
> -	     xpcs_get_an_mode(priv->hw->xpcs, mode) != DW_AN_C73)) {
> -		ret = stmmac_init_phy(dev);
> -		if (ret) {
> -			netdev_err(priv->dev,
> -				   "%s: Cannot attach to PHY (error: %d)\n",
> -				   __func__, ret);
> -			goto init_phy_error;
> +	if (!priv->plat->use_ncsi) {
> +		if ((!priv->hw->xpcs ||

My understanding of NCSI is that you have an additional RGMII like
port feeding into the MAC. The MAC still has all its media machinery,
a PCS, PHY etc. Something needs to drive that PCS and PHY. So it would
be good to explain in the commit message why you are removing all
this.

	Andrew

