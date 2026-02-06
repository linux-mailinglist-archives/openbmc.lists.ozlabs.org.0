Return-Path: <openbmc+bounces-1329-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JyfDNYPiWnG1wQAu9opvQ
	(envelope-from <openbmc+bounces-1329-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Sun, 08 Feb 2026 23:36:06 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1DD10A785
	for <lists+openbmc@lfdr.de>; Sun, 08 Feb 2026 23:36:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8N2n2GG0z2xqf;
	Mon, 09 Feb 2026 09:36:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770371634;
	cv=none; b=HNWntstnMf2WHULxXcDwVGHn4xrvStEeXD0XrbFPCQwU8iPu94osOc4Rwk8HdMGbAuiZ6EtkB2HmNqsQEVsxNk2lI8LwGCI4Xl/0P11e9ciouGav5Ij2QuEfwi5JwJtKVC9TpRrI+HMOZVY54hiIlPEkOs4oGn10rLeVaxT7YTfDIgI6+2MvSFO+Km3BpjriR3xYr4GaOKEmI5td+jD4olVLOOAxQhsGQh44pnJAY3B+rcAWV5OXcTLyu0tq2uvJNDbdwOaU3oQ27tGYPCAh5jg3tm7SMMi2XM2eIYvoo3tSq+e9C/bZxkafRud8iww8yhXSxcjmrISOl8pXhhJEJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770371634; c=relaxed/relaxed;
	bh=qpEDLnYj95OpOlLlWla7+a1PBaolL4JOvRD2mY4U/kc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=REJ0f4waTWTnczUxFjl3GMrnQpgC/DmJfsQZ6VppYYR8okS31gYRkzXY8llq9/yyXpRRQ6GzsgMyBuNVU+gxH1zAMDiz6/d4BNbmUqqstEY01YODx985gSWKmTq+FO2tOwoQasWaRR5sxDXRCttscj1Sm1m7K5vGik5mXnTaMHDwKgHsyu2uqmqeJHeLd5620OCAS4uctVzoeQg+XX8CHaIfXeL/wUA9aJaDZiPeh065vJRl7G5EXAWK0TYYFQtOa+p0fj22mdP0gZqNGFYjwzip8aKWXBoeDEoWmmFuoNctnP8U4EypOtBOv1ljBH4SxmMDzD7brPEovgM+yEl5iw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O1MC7ewU; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O1MC7ewU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6qDK3xvNz2xJ5
	for <openbmc@lists.ozlabs.org>; Fri, 06 Feb 2026 20:53:52 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2a947d01939so10303405ad.0
        for <openbmc@lists.ozlabs.org>; Fri, 06 Feb 2026 01:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770371629; x=1770976429; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qpEDLnYj95OpOlLlWla7+a1PBaolL4JOvRD2mY4U/kc=;
        b=O1MC7ewUiDLFPiv+dfstLXUrdd07MRNkY7fMo/doHCgXdTI1YDoN42dDm+GseqeIAe
         5y3BRhFK00mSPHcob7CqK9ygCVmDvm0i8A4fLU7kBVT+TjGUW0sEN5csZ35Y1wKRNKlK
         ElB3TdSMgnCU8/7mU7wM+uNXh1u9qYuoCsynoGkQ+DKckNW01XyTSse5Cn4wwNGE9J3d
         JepTQJnzUCwBIlMGnuNsYLBwWZhegOuAn5yP8Sg8+el5bogfXD8znv3HFA6l3AxyXhzD
         /MZ48nIRPITvRcV0YTgQL20XKn7N3/tirbkuqwfSFsYcjF5dnXpzAinnSmwwo54CjzUB
         zD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770371629; x=1770976429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qpEDLnYj95OpOlLlWla7+a1PBaolL4JOvRD2mY4U/kc=;
        b=GqIftFu+10PQ/Knzp9ctudFJKSpJPxegYXbLfsp9mcpMUZbt4l3J0vL9psjVzXM/WX
         Ylz5ivYPmEXtxPHocLfgAjCwEDithzjz6q2s0wpRRD9DY0MLclDpfFSOIbttcrAo3M/a
         HYk7bCGVP/ENt4oHcJThnSTZpSDyKgY4Tac8f35EEaLUSS2KZwZhOd/LrJcqEoxD3RiO
         YdUlQI6YL3xlHg7dPY9SOT1ZDV6eLpU5lhQK4co3w9oIt29ed1DZORC99Pxzk5zMkOrD
         S7zV/7z+845V+1hOORk6PDKmRsrWXnCrRw1TvqRkDiIjsJiasCei9XR/6uh/XhHBT9SY
         n7cg==
X-Forwarded-Encrypted: i=1; AJvYcCVaqogVj3Q84hJvC8XUqwpWlVKpzKfSX3KUw3NTw3kXbZX29bVrkASmZKPGo0VF8RkDP/4eXiKu@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwGq+57WIIn6+ThSTyyzdTxk+Wi81gqXCeV2B++I1jvteO7tsrl
	cSnnoZdqFjJ3yunmjC8m1kOu6Rmy19LWWKPs7WWorTUtZNDi2zs9C0Ub
X-Gm-Gg: AZuq6aKBVTT5x1UplYAX0Ok123evAXmohLcji5SiXU3Fkhm69cA2i7zL37Hfwp13IjJ
	kbNeoqtY7gvB8A+48LyycbLDGaR80JUFKqpZX9dHvfnj+Kek71LkK/3sXweNLvSpol5ICAo1O+1
	Y93ZMIVpJgzz+EKQy/ms6eJGysgzXGQ9ntVypBzxJw9ERIussrbDZsavh3qdcedmxQfrMJ5XgUF
	T4OM8xAbtbpl403BOWigKwy7iig4n5huebTMYQfGzUPveVkbGTSJ5hhB63xODhJizPJDqSk0H7S
	0qmntn85zJFrJzKL2hjflc/wxs6iZ+j1d9jF9xA+84D3FegF367vgsMsQv7ElMQaWTPOtOql7jO
	p9o58ijU0I5qKrb2OwXKoNk66oZHpEYgJB54Nw1IxnwnMw7fNNX2SRbeAsmOwrgzQyxmj+h5cv4
	YNOcOl1+FCH/zdWpnducSmkY1/opxfpgpOatQu7LgaF7gtkExdZxBOIQlEu0BneO+y
X-Received: by 2002:a17:902:cf4c:b0:295:592f:94a3 with SMTP id d9443c01a7336-2a9519a19e0mr23066635ad.48.1770371628931;
        Fri, 06 Feb 2026 01:53:48 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9521b9761sm19141145ad.48.2026.02.06.01.53.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 01:53:48 -0800 (PST)
Message-ID: <4281a709-04a4-4b9f-b511-bff0a332f9bd@gmail.com>
Date: Fri, 6 Feb 2026 17:53:42 +0800
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v11 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew@lunn.ch>
References: <20260205014006.735408-1-a0987203069@gmail.com>
 <20260205014006.735408-4-a0987203069@gmail.com>
 <aYRlKk-cCIhqGWX7@shell.armlinux.org.uk>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <aYRlKk-cCIhqGWX7@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.30 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[60];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1329-lists,openbmc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:richardcochran@gmail.com,m:alexandre.torgue@foss.st.com,m:joabreu@synopsys.com,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:peppe.cavallaro@st.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,openbmc@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,openbmc@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,synopsys.com,nuvoton.com,st.com,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[openbmc,netdev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AA1DD10A785
X-Rspamd-Action: no action


On 2/5/2026 5:38 PM, Russell King (Oracle) wrote:
> Hi,
>
> On Thu, Feb 05, 2026 at 09:40:05AM +0800, Joey Lu wrote:
>> +
>> +struct nvt_priv_data {
>> +	struct platform_device *pdev;
> This looks to me like it's write-only, does it serve a useful purpose?
>
>> +	struct regmap *regmap;
> This doesn't seem to be used outside of nvt_gmac_setup().
>
>> +};
> Given the above two comments, do you actually need struct nvt_priv_data ?
You are right. I'll drop it in the next revision.
>
>> +
>> +static struct nvt_priv_data *
>> +nvt_gmac_setup(struct platform_device *pdev, struct plat_stmmacenet_data *plat)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct nvt_priv_data *bsp_priv;
>> +	phy_interface_t phy_mode;
>> +	u32 macid, arg, reg;
>> +	u32 tx_delay_step;
>> +	u32 rx_delay_step;
>> +	u32 miscr;
>> +
>> +	bsp_priv = devm_kzalloc(dev, sizeof(*bsp_priv), GFP_KERNEL);
>> +	if (!bsp_priv)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	bsp_priv->regmap =
>> +		syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys", 1, &macid);
>> +	if (IS_ERR(bsp_priv->regmap))
>> +		return ERR_PTR(dev_err_probe(dev, PTR_ERR(bsp_priv->regmap),
>> +				     "Failed to get sys register\n"));
>> +	if (macid > 1) {
>> +		dev_err(dev, "Invalid sys arguments\n");
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>> +	if (of_property_read_u32(dev->of_node, "tx-internal-delay-ps", &arg)) {
>> +		tx_delay_step = 0;
>> +	} else {
>> +		if (arg <= 2000) {
>> +			tx_delay_step = (arg == 2000) ? 0xf : (arg / NVT_PATH_DELAY_STEP);
>> +			dev_dbg(dev, "Set Tx path delay to 0x%x\n", tx_delay_step);
>> +		} else {
>> +			dev_err(dev, "Invalid Tx path delay argument.\n");
>> +			return ERR_PTR(-EINVAL);
>> +		}
>> +	}
>> +	if (of_property_read_u32(dev->of_node, "rx-internal-delay-ps", &arg)) {
>> +		rx_delay_step = 0;
>> +	} else {
>> +		if (arg <= 2000) {
>> +			rx_delay_step = (arg == 2000) ? 0xf : (arg / NVT_PATH_DELAY_STEP);
>> +			dev_dbg(dev, "Set Rx path delay to 0x%x\n", rx_delay_step);
>> +		} else {
>> +			dev_err(dev, "Invalid Rx path delay argument.\n");
>> +			return ERR_PTR(-EINVAL);
>> +		}
>> +	}
> Each of these could be moved into a separate function:
>
> static int nvt_gmac_get_delay(struct device *dev, const char *property)
> {
> 	u32 arg;
>
> 	if (of_property_read_u32(dev->of_node, property, &arg))
> 		return 0;
>
> 	if (arg > 2000) {
> 		dev_err(dev, "Invalid %s argument.\n", property);
> 		return -EINVAL;
> 	}
>
> 	if (arg == 2000)
> 		return 15;
>
> 	return arg / NVT_PATH_DELAY_STEP;
> }
>
> then:
> 	int ret;
>
> 	ret = nvt_gmac_get_delay(dev, "tx-internal-delay-ps");
> 	if (ret < 0)
> 		return ERR_PTR(ret);
>
> 	tx_delay = ret;
>
> 	ret = nvt_gmac_get_delay(dev, "rx-internal-delay-ps");
> 	if (ret < 0)
> 		return ERR_PTR(ret);
>
> 	rx_delay = ret;
I'll update the code according to your suggestions.
>> +
>> +	miscr = (macid == 0) ? NVT_REG_SYS_GMAC0MISCR : NVT_REG_SYS_GMAC1MISCR;
>> +	regmap_read(bsp_priv->regmap, miscr, &reg);
>> +	reg &= ~(NVT_TX_DELAY_MASK | NVT_RX_DELAY_MASK);
>> +
>> +	if (of_get_phy_mode(pdev->dev.of_node, &phy_mode)) {
>> +		dev_err(dev, "missing phy mode property\n");
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>> +	switch (phy_mode) {
>> +	case PHY_INTERFACE_MODE_RGMII:
>> +	case PHY_INTERFACE_MODE_RGMII_ID:
>> +	case PHY_INTERFACE_MODE_RGMII_RXID:
>> +	case PHY_INTERFACE_MODE_RGMII_TXID:
>> +		reg &= ~NVT_MISCR_RMII;
>> +		break;
>> +	case PHY_INTERFACE_MODE_RMII:
>> +		reg |= NVT_MISCR_RMII;
>> +		break;
>> +	default:
>> +		dev_err(dev, "Unsupported phy-mode (%d)\n", phy_mode);
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>> +	if (!(reg & NVT_MISCR_RMII)) {
>> +		reg |= FIELD_PREP(NVT_TX_DELAY_MASK, tx_delay_step);
>> +		reg |= FIELD_PREP(NVT_RX_DELAY_MASK, rx_delay_step);
> You can move this inside the switch above under the RGMII case. Theses
> delays are, after all, only for RGMII.
Got it. I'll move them into the RGMII case.
>> +	}
>> +
>> +	regmap_write(bsp_priv->regmap, miscr, reg);
> Consider:
>
> 	regmap_update_bits(bsp_priv->regmap, miscr,
> 			   NVT_TX_DELAY_MASK | NVT_RX_DELAY_MASK |
> 			   NVT_MISCR_RMII, reg);
>
>> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
>> +	if (IS_ERR(plat_dat))
>> +		return PTR_ERR(plat_dat);
>> +
>> +	/* Nuvoton DWMAC configs */
>> +	plat_dat->core_type = DWMAC_CORE_GMAC;
> Is the hardware not compatible with any of the compatible types that
> devm_stmmac_probe_config_dt() will automatically set this for you?
> Which version of the core do you have?
>
>> +	plat_dat->tx_fifo_size = 2048;
>> +	plat_dat->rx_fifo_size = 4096;
> There are tx-fifo-depth / rx-fifo-depth properties that can be used to
> describe these in DT.
>
>> +	plat_dat->multicast_filter_bins = 0;
>> +	plat_dat->unicast_filter_entries = 8;
> If this core is v3.50, v3.70 or v3.72, then there are
> snps,multicast-filter-bins and snps,perfect-filter-entries which
> can be used to describe both of these.
>
> Thanks.

Thanks for the feedback.

This GMAC is based on v3.73a. While this specific revision isn’t 
explicitly documented in the current DT binding YAML, the relevant FIFO 
sizing and filter capabilities match the behavior introduced in earlier 
v3.70+ cores.

Given that, I agree it makes sense to describe these parameters using 
the existing DT properties.

I will update the DT and driver accordingly in the next revision.

Joey

>

