Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB4C9D1D93
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2024 02:48:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XsnTT4Yrgz3cTw
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2024 12:48:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731980922;
	cv=none; b=hIfiGOGPrjJC546YZaowZrHEBDo6GCqPHhqwhadlFsdCKSdFtsTzl/KPyFkaJs1v6dBYj2S29C9ROam49ZakstqeIj3XVKhoFPvikeaL2xb3NfrLqgtPbkhZtPtITDHIgTyZs10DP1JBz2zt150bt4JRzLw5Su80iZ8bL73f/LefTTAwdhBmKJmMUtkwE09FIzEC6kU4UIlghiwdHa5nJPAn05ODY0wrCZr+AHT7zi+efsUawy9b+yMPaK8SSm33tEBdCpVStjJnqBNw1IOK62KLU/WiB/TmXddVbwvLUVozSZBcEHfMmXikdBfCc/Q5YEyIKteXOq3eMSF53pPBxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731980922; c=relaxed/relaxed;
	bh=8U8UwDGXeKDkqdmDQD2AJ6C8adRsvYsEsUh2q0q8beE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iJF2tAH33xKw/tf3SRf2ZxXQv1YizcG0TDEf35K+cT/tl6U6Y/Kn0ti7GsX1ZXWB5Dt1dAUqsH44XO6ZwYLfRmgwqfmoEyCQvdkkzj//X5MQdHXCYGp240xCbaBYDYJ9nyj7NAziJcd/J89G7gkU4RqGgu/pkOGA+GG//886t6hdVMqPjHZHNbh5S6zBhI1oBNGmllXkRBmNlosbikbhEz6jw03/d+anqVnnzvp5E4uFTuSCzEKrywIb4Tlg4Ac5ybqElUomb6QKbZReMpeeRPo4di460JVNii3sRwJK/mslilTFnwFzgzooLU0ZlX8eP7xnZrFpfxckMt2xSoJzrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=uzjToPKK; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=uzjToPKK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XsnTN42xxz2y1W
	for <openbmc@lists.ozlabs.org>; Tue, 19 Nov 2024 12:48:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8U8UwDGXeKDkqdmDQD2AJ6C8adRsvYsEsUh2q0q8beE=; b=uzjToPKKzfDbUOnMQ8BEFtGznv
	HP/d4wX3y4jUF9yLCoXy/fI+gFmjX6TMNsWTRweaxbcGNOgkr+7lVo8hrl226YdeZTsmqdthvjGYv
	sm3Qoh3WHHy4iU9zQbBTSZpJBdWC/qZuf8nkAJOg4iJhhhqH3twZ42e9mmHR3EOgLjyM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tDDLn-00DjVx-O7; Tue, 19 Nov 2024 02:48:19 +0100
Date: Tue, 19 Nov 2024 02:48:19 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joey Lu <a0987203069@gmail.com>
Subject: Re: [PATCH v3 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
Message-ID: <4d44bc93-6a81-4dc8-9f22-a103882f25e1@lunn.ch>
References: <20241118082707.8504-1-a0987203069@gmail.com>
 <20241118082707.8504-4-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118082707.8504-4-a0987203069@gmail.com>
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

> +	if (of_property_read_u32(dev->of_node, "tx-internal-delay-ps", &arg)) {
> +		tx_delay = 0; /* Default value is 0 */
> +	} else {
> +		if (arg <= 2000) {
> +			tx_delay = (arg == 2000) ? 0xF : (arg / PATH_DELAY_DEC);
> +			dev_dbg(dev, "Set Tx path delay to 0x%x\n", tx_delay);

The device tree binding says:

+  tx-internal-delay-ps:
+    enum: [0, 2000]


So only two values are allowed. Yet the C code is

arg / PATH_DELAY_DEC

which seems to allow 16 values?

Please make this consistent.


    Andrew

---
pw-bot: cr
