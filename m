Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FAEA0FE98
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2025 03:17:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXCSg1wSJz3dVl
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2025 13:17:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736821039;
	cv=none; b=aOKadFY97p4Zcst0ylGnLclqrEX0wl2b58Ty23Ngr3ygDYkvqxGETJ5MEOyHAowToVb0P5wLHvgBgdCXOeGOtf1rAvAoki+6cH63dRxA6gLGil/K4eAudR+falHUS3AwIBcHk57D+5Onc2E1ddoNE+Z4UTKvmQIfnh2EKmDAsDEf3R4Gs61r9TzTfkA/m57K7mSS4Ah0pFs4kqmF0mMPj44OvNqL2isP51rxmKUl/Fd6se4HqWENH/gaMMl7MW0SjpVn4F1sMBgnGY3c9WZps4WFWgOxgAL0X00aoWfTPD0dyyJc1FUmdNs6imtSD3qmHLQguJ/erZpERy+3kcmVPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736821039; c=relaxed/relaxed;
	bh=P1SIEN3E6aqrThhxwat3Nx/SdisRq4J3tMD+nuJgrUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eDpHjyNg8iFTeRQ1ofJs4UyTFMefZ+Oj/N2jTQDgS86qYRXH9HVxGrf2Q7/anV5WC6t20bLbcBi/097uYN3cA4l3O9tE8OWtDUI/7vw2ZrvV9BPREabXlYXiAEON0K66PJJ7b7heHSDi5l3Nl4fqpToJIIzCo13LVtJpDx/ZQEoquHCNCn3s4woVYtOo1i5CppfS9oAn6blLOuXrziO4u40Wi8DrS2NXX1GDWU1a+lcSwZS0rPXTPj/qRqs6uRRRd63jEOqOwCnXFgRulwwd/VICPSKbfgjfeZnrZTlBg3YehKRR07+5VwY7mFXEdd0QjGOmhP5AHyKYjxIoGpfXeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=ig1VG/Jv; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=ig1VG/Jv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXCSZ4zvrz3dBG
	for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2025 13:17:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=P1SIEN3E6aqrThhxwat3Nx/SdisRq4J3tMD+nuJgrUc=; b=ig1VG/JvMUnpVn3G1nBjH7GmvJ
	zoLv1nz0dIwYHbMWp7Z9UvXr/HpAd2Ze/y9+Di+8jRDXjo+sLl4ShiK2e81vMUX8yZE8X4V4rQ0NH
	C6ShuctKHa25uulz+afqGQTrob6TnSSLEQForwvpbl8KGrFEgSKsrhevMK0toA77jBts=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tXWUD-004Im6-Bo; Tue, 14 Jan 2025 03:16:57 +0100
Date: Tue, 14 Jan 2025 03:16:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: [PATCH net-next v7 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
Message-ID: <e7041d36-9bc7-482a-877d-6d8f549c0ada@lunn.ch>
References: <20250113055434.3377508-1-a0987203069@gmail.com>
 <20250113055434.3377508-4-a0987203069@gmail.com>
 <a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de>
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
Cc: alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, edumazet@google.com, schung@nuvoton.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, richardcochran@gmail.com, ychuang3@nuvoton.com, peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Joey Lu <a0987203069@gmail.com>, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> > +#define NVT_MISCR_RMII          BIT(0)
> > +
> > +/* 2000ps is mapped to 0x0 ~ 0xF */
> 
> Excuse my ignorance: What is ps?

picoseconds. An RGMII link needs a 2ns delay between the clock line
and the data lines. Some MACs allow you to tune the delay they can
insert, in this case in steps of 2ns / 16.

> > +#define NVT_PATH_DELAY_DEC      134
> > +#define NVT_TX_DELAY_MASK       GENMASK(19, 16)
> > +#define NVT_RX_DELAY_MASK       GENMASK(23, 20)
> > +
> > +struct nvt_priv_data {
> > +	struct platform_device *pdev;
> > +	struct regmap *regmap;
> > +};
> > +
> > +static struct nvt_priv_data *
> > +nvt_gmac_setup(struct platform_device *pdev, struct plat_stmmacenet_data *plat)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct nvt_priv_data *bsp_priv;
> > +	phy_interface_t phy_mode;
> > +	u32 tx_delay, rx_delay;
> 
> Please append the unit to the variable name.

Which is trick, because they are in units of 2000/16 of a picosecond.

	Andrew
