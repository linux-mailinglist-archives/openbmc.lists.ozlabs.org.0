Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD67A9C8135
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2024 03:57:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XplDL65HPz3blg
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2024 13:56:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731553007;
	cv=none; b=hcVzcDKUFfzb1BmxTsjPItvNSIyxWWJAeL+pV/lEhUEEaWF86z2Du1f+7v3fXeBqhU1DZMcI6ePJbkLkCYI1ARDKMyye/L8q9JHAzvbv9w+24/YdpQKM8YCYKadAkUHNH6xbePvLnMIXzN8xC4HiOZMQmSFwGWiFZV+CEyy1Q165tmq9d2GWwCOZFJV4TI+6Pmsd2LMjLca+p3pOc9BAAdnKcDMCu/W4XK4D6eRd5izuQhB+b8Uc2gJ8wA6TWyGq1WE9h9pX67zZecf0NNb2LLyeWqinay1QOc8bzJ06il9jq4y3HEtj3wyAg676DAJNNxGQCpFJ1JbOQViUJUg9eA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731553007; c=relaxed/relaxed;
	bh=JJq+FCylc0jmdKMgnYo/ob9xvCnB0F5KgIKVz3m2Nfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jfs0Wi3+VvvOjofhyUANXrabJLY3+YqyX8emx0stb1XLw/s5A2oysPBh/wsUVcYHzqKNpZ9aKwScaPITL9baqXgjerWzMl4A3/KADbOxfuAp1wL23eIkV7JE4piC6//shzNEMxtyZA5SdOJqYSRAICjfGIqP5z+T4U6xJ/DcaYgR86YxLabsMnHr6tbWzzD53Jcfpy86cuxz26eOS/SW2oddAYyJpVpzzZ0iUqpkq33EBYh91Sb+rC+lzDCN7NVIhO7XIK/3AAhOwpXu4FvkG6SfKUXg+oxOp9vVf27fblea5cpeltzmR8IqDiZqOoqRuYnHCl/eXrz7J7iz9QU5XA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=rXHBOzef; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=rXHBOzef;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XplDF1m2xz2xyG
	for <openbmc@lists.ozlabs.org>; Thu, 14 Nov 2024 13:56:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=JJq+FCylc0jmdKMgnYo/ob9xvCnB0F5KgIKVz3m2Nfs=; b=rXHBOzefIqgQ8x33CXqamAs/rK
	nzL1Spdpkwe3YloUQNFyv7UIdHE4tWNPm7JLtHn0sNJgC1M2Cug/DVCLmcVedA9kiJoboJ9v1Ski4
	4+eI6HBVUo72sS9vIr6cyhHIOd8tVnFRxjPAXkiP9GXLB2s3QwLLF7SMzoUf1wDK4nfA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tBQ1x-00DEnU-TW; Thu, 14 Nov 2024 03:56:25 +0100
Date: Thu, 14 Nov 2024 03:56:25 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joey Lu <a0987203069@gmail.com>
Subject: Re: [PATCH v2 3/3] net: stmmac: dwmac-nuvoton: Add dwmac support for
 MA35 family
Message-ID: <b7fb59a9-989e-42b9-ac72-71f353854812@lunn.ch>
References: <20241113051857.12732-1-a0987203069@gmail.com>
 <20241113051857.12732-4-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113051857.12732-4-a0987203069@gmail.com>
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, netdev@vger.kernel.org, richardcochran@gmail.com, ychuang3@nuvoton.com, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com, linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com, schung@nuvoton.com, kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net, yclu4@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> +	if (of_property_read_u32(dev->of_node, "tx-internal-delay-ps", &arg)) {
> +		tx_delay = 0; /* Default value is 0 */
> +	} else {
> +		if (arg > 0 && arg <= 2000) {
> +			tx_delay = (arg == 2000) ? 0xF : (arg / PATHDLY_DEC);
> +			dev_dbg(dev, "Set Tx path delay to 0x%x\n", tx_delay);
> +		} else {
> +			tx_delay = 0;
> +			dev_err(dev, "Invalid Tx path delay argument. Setting to default.\n");
> +		}
> +	}

The device tree binding says that only [0, 2000] are valid. You should
enforce this here, return -EINVAL of any other value.

	Andrew
