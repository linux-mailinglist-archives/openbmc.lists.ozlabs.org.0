Return-Path: <openbmc+bounces-1362-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDQTHl0KjWmLyAAAu9opvQ
	(envelope-from <openbmc+bounces-1362-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Thu, 12 Feb 2026 00:01:49 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79192128351
	for <lists+openbmc@lfdr.de>; Thu, 12 Feb 2026 00:01:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fBDT509fTz2xnZ;
	Thu, 12 Feb 2026 10:01:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770803553;
	cv=none; b=kO53ZDzM6D2su3rKYqpjRoixCSciP/dZ0YzuZcfS50xJ3DVcJh1Sk2cc/iJWDErZe178LLw+LLmT8KhderHrz3zfDjB75KO+W1iGJ/APmQHbvAk3WssLNSH9z/wd3gNi6ZcD6b0mibBfNoN/8uJ8YsgHJR1cjOHar6Ypjl2Hcn0QaJWqEr9MDAiGVewnqhY4WKHHeg9D8yh2BgWQN0bPDS29LZvE9ZY9hKIwNZrYggSSGS0IqLL5jAPH/egmFRLG7Wiqc5pJFRVKkwcCzoTzSHosLRMBvwLTC3WKsMItAUqs0+5xzGv1IjesE950g5nUCNtxVo8hJs4NooaEguUdrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770803553; c=relaxed/relaxed;
	bh=WlA/0DQhAaLzc62fU7hn+N6h+vP5jTvtak8QscuPTcs=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=ZyFMY2Sz3yr6iIjuv/QcX72dCkF3zVnHIHqaFHPGBerHTU2xU3XVsQgVTFm7Jdd2l5/WGo9f/lFTSVZIXMHrdrqs1d61GLukuY8cIPq1xaE6Q5ao3PaXzEjEjiQM4gU2r89ROCISgegze8/iYSGS64+mYRIQ1hOH7j6CFQUB0RkEUM5e1D6DKvoL6XfQZua9+LtSGdhEZjHY83Arp46XwY5vAUYlalYFzsN5fps/G6QpUFToT1Y1+E1iEd15EDlGL7DyzgxAoK9xaPcG+kTB3kXsUWrekT/wtszrhbBwCnPEoVbCYhIxxGh8g+7LS7afijgU4pKdp3lVFgEuMsSA5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fZbsw70X; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fZbsw70X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9tyS0pTQz2xlM
	for <openbmc@lists.ozlabs.org>; Wed, 11 Feb 2026 20:52:30 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2a90055b9e9so27924865ad.1
        for <openbmc@lists.ozlabs.org>; Wed, 11 Feb 2026 01:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770803548; x=1771408348; darn=lists.ozlabs.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WlA/0DQhAaLzc62fU7hn+N6h+vP5jTvtak8QscuPTcs=;
        b=fZbsw70XiQW9DfKp+KhogXHk26Q6I3ZkzdN/6Uvl5myJevJmqDgQWZEmUIeMk2jVxC
         zV4lIhN+u8iflIawm4swl1e+qTMPXFurceI3eiNeFGyAeYum40oVJCYdZL4KiJMZ3PFC
         qurwuvtnXmeC4ijejvpF5bfp3JKPXZ0C5nEPTVfntqdTOuZ+ZrVaBdlAMJxP3RpKBbmS
         7TSPAhe/Ul9irk85qmWlHnJGDeEZA8t8TnhmdoHJkJ/wqlPwtFpBJhKGdhtG/Gf7x0fq
         ia9pe6lTQbBWpBqXssxkicOP2kDECarc+e7cwIsy33FWP+oNffAWoefqNTrHrCJjoM1U
         y3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770803548; x=1771408348;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WlA/0DQhAaLzc62fU7hn+N6h+vP5jTvtak8QscuPTcs=;
        b=UExq76nHpnRj6FpF7Y/nivpCxUwjYf0d06I4MfG++n/x0eUw4uSwrEKY+zMM4I10oC
         CLvO00y5crArTksIuSruRO745HDLB/ZapAW3cxqwf30bwPE67emC722NV9/QzNsMxofe
         QMiqhL8/a7DcKg68vbKLz1w7emx2iqsM7JxZ6TJIXxhgR6g8ZyGPffwkRYQSb75pZYUC
         UhJQuPUWoqayMIPJumDAlhrw7Rvhp0/6ak2pAyv8jCL1w6zzhJMoBob84lxv5Uo5IS/Z
         gpfj2vScIkHnDIhrXR2QXJUD8H0kBc4tKnQPuM3FbEQkQTmSQXIKbHcBlV1REXKohZsC
         Q2ow==
X-Forwarded-Encrypted: i=1; AJvYcCXXSpYaGLtP+nGOSRAzoaGzpV2QNy06nySHefCiYd/vPQXzTNr2gXVhW8izugXSTRK0dmB60Fl2@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw9QZwXU4L+q2p0hQz8m6JvjHWxphrPs8J9YLRL6VGFE9CWejN4
	54is7XuluYZlzy+FV38ZeBAGF6aT2+NTvqlVwRH4tVDbM78AgY19xnuN
X-Gm-Gg: AZuq6aLIG7BRFIUecqhXy+v+EvW7xljZ8InRrB2HTV6mUHmgII5LyRj4EF/y6NeTcza
	iuwngDXpeutfMx5pkkRHg5EQoiG0l1FK/L4XGcma4KYjQeQwHuQCkk15wrL3reiQZDQhhx4BnQs
	Tffd0UshIiJt66HJ1JWmvbkmkKbzBcbvUOOuNnopb8V1PdB+tXlQHx033dMCVx7HKvauFP97p0E
	apoaRa6qjFw70w3MyzwXrVfpCkMBchbTW9QvNJ5UkxqTDPHN45VIWozuueC4/Ji0vLE5+y5UT7y
	JHRcMojRVI9k36zloCVyNvig5KSGRFCOL036+smXcM7BxsMV5xGiNGLY3LGhh/WvRMpJ6HeAA2r
	0TkTAaL/63wX2BlcZYnfGwyiNYV1HkajA6FZgH3alK8S0kS0nEjukAAKM6GOXt/2tWxEjfAGtik
	vOhPyXYYclHq5Lo+dO8F/psopgIaBI4O9JL9VTlsF13Kw4Xx4nynwPF4FsI1ytW2NZPbGQg9U3H
	R6o
X-Received: by 2002:a17:902:f54a:b0:2aa:e3ba:d045 with SMTP id d9443c01a7336-2ab29b7973fmr14836365ad.8.1770803547808;
        Wed, 11 Feb 2026 01:52:27 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2986edecsm17568455ad.22.2026.02.11.01.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 01:52:27 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------aaXpGtG0sny9pfM8rBgrfgfB"
Message-ID: <747b9ab4-6711-426d-95a5-4ce6c8732edd@gmail.com>
Date: Wed, 11 Feb 2026 17:52:21 +0800
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
Subject: Re: [PATCH net-next v12 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
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
References: <20260210052226.3005666-1-a0987203069@gmail.com>
 <20260210052226.3005666-4-a0987203069@gmail.com>
 <aYsurPBMnzWDZCco@shell.armlinux.org.uk>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <aYsurPBMnzWDZCco@shell.armlinux.org.uk>
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.70 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-1362-lists,openbmc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:richardcochran@gmail.com,m:alexandre.torgue@foss.st.com,m:joabreu@synopsys.com,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:peppe.cavallaro@st.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,openbmc@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,synopsys.com,nuvoton.com,st.com,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[openbmc,netdev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 79192128351
X-Rspamd-Action: no action

This is a multi-part message in MIME format.
--------------aaXpGtG0sny9pfM8rBgrfgfB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/10/2026 9:12 PM, Russell King (Oracle) wrote:
> Please note that net-next is currently closed, so you should be sending
> net-next patches with "RFC". See section 1.4 of:
> https://docs.kernel.org/process/maintainer-netdev.html
>
> On Tue, Feb 10, 2026 at 01:22:26PM +0800, Joey Lu wrote:
>> +static int nvt_gmac_setup(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	phy_interface_t phy_mode;
>> +	struct regmap *regmap;
>> +	u32 macid, miscr, reg;
>> +	int ret;
>> +
>> +	regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys", 1, &macid);
>> +	if (IS_ERR(regmap))
>> +		ret = dev_err_probe(dev, PTR_ERR(regmap), "Failed to get sys register\n");
>> +
>> +	if (macid > 1)
>> +		ret = dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
>> +
>> +	if (of_get_phy_mode(pdev->dev.of_node, &phy_mode))
>> +		ret = dev_err_probe(dev, -EINVAL, "Missing phy mode property\n");
> If you pass in the plat_dat to this function, then you have access to
> plat_dat->phy_interface. I went through all the dwmac glue code and
> removed such PHY interface gets, so please don't introduce new
> instances.
I'll drop it.
>> +
>> +	miscr = (macid == 0) ? NVT_REG_SYS_GMAC0MISCR : NVT_REG_SYS_GMAC1MISCR;
> I find the use of "miscr" to be the register offset, and "reg" to be
> the register value is confusing. Normally they're the other way around.
I'll update the naming to follow the usual convention, for example, 
using reg for offset and val for value.
>> +
>> +	switch (phy_mode) {
>> +	case PHY_INTERFACE_MODE_RGMII:
>> +	case PHY_INTERFACE_MODE_RGMII_ID:
>> +	case PHY_INTERFACE_MODE_RGMII_RXID:
>> +	case PHY_INTERFACE_MODE_RGMII_TXID:
>> +		ret = nvt_gmac_get_delay(dev, "rx-internal-delay-ps");
>> +		if (ret < 0)
>> +			return ret;
>> +		reg = FIELD_PREP(NVT_RX_DELAY_MASK, ret);
>> +
>> +		ret = nvt_gmac_get_delay(dev, "tx-internal-delay-ps");
>> +		if (ret < 0)
>> +			return ret;
>> +		reg |= FIELD_PREP(NVT_TX_DELAY_MASK, ret);
>> +		break;
>> +	case PHY_INTERFACE_MODE_RMII:
>> +		reg = NVT_MISCR_RMII;
>> +			break;
>> +	default:
>> +		return dev_err_probe(dev, -EINVAL, "Unsupported phy-mode (%d)\n", phy_mode);
>> +	}
>> +
>> +	regmap_update_bits(regmap, miscr,
>> +			   NVT_RX_DELAY_MASK | NVT_TX_DELAY_MASK | NVT_MISCR_RMII, reg);
> Please consider programming the NVT_MISCR_RMII bit via the
> plat_dat->set_phy_intf_sel() method.
I'll switch to using the plat_dat->set_phy_intf_sel() callback and pass 
the required info through private structure.
>
> Is this register preserved over suspend/resume ?

It is not preserved by the GMAC suspend/resume flow and therefore needs 
to be treated as a system register rather than a GMAC local context.

>
> Thanks.
>
--------------aaXpGtG0sny9pfM8rBgrfgfB
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/10/2026 9:12 PM, Russell King
      (Oracle) wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:aYsurPBMnzWDZCco@shell.armlinux.org.uk">
      <pre wrap="" class="moz-quote-pre">Please note that net-next is currently closed, so you should be sending
net-next patches with "RFC". See section 1.4 of:
<a class="moz-txt-link-freetext" href="https://docs.kernel.org/process/maintainer-netdev.html">https://docs.kernel.org/process/maintainer-netdev.html</a>

On Tue, Feb 10, 2026 at 01:22:26PM +0800, Joey Lu wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static int nvt_gmac_setup(struct platform_device *pdev)
+{
+	struct device *dev = &amp;pdev-&gt;dev;
+	phy_interface_t phy_mode;
+	struct regmap *regmap;
+	u32 macid, miscr, reg;
+	int ret;
+
+	regmap = syscon_regmap_lookup_by_phandle_args(dev-&gt;of_node, "nuvoton,sys", 1, &amp;macid);
+	if (IS_ERR(regmap))
+		ret = dev_err_probe(dev, PTR_ERR(regmap), "Failed to get sys register\n");
+
+	if (macid &gt; 1)
+		ret = dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
+
+	if (of_get_phy_mode(pdev-&gt;dev.of_node, &amp;phy_mode))
+		ret = dev_err_probe(dev, -EINVAL, "Missing phy mode property\n");
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
If you pass in the plat_dat to this function, then you have access to
plat_dat-&gt;phy_interface. I went through all the dwmac glue code and
removed such PHY interface gets, so please don't introduce new
instances.
</pre>
    </blockquote>
    I'll drop it.
    <blockquote type="cite"
      cite="mid:aYsurPBMnzWDZCco@shell.armlinux.org.uk">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+	miscr = (macid == 0) ? NVT_REG_SYS_GMAC0MISCR : NVT_REG_SYS_GMAC1MISCR;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I find the use of "miscr" to be the register offset, and "reg" to be
the register value is confusing. Normally they're the other way around.
</pre>
    </blockquote>
    I'll update the naming to follow the usual convention, for example,
    using reg for offset and val for value.
    <blockquote type="cite"
      cite="mid:aYsurPBMnzWDZCco@shell.armlinux.org.uk">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+	switch (phy_mode) {
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		ret = nvt_gmac_get_delay(dev, "rx-internal-delay-ps");
+		if (ret &lt; 0)
+			return ret;
+		reg = FIELD_PREP(NVT_RX_DELAY_MASK, ret);
+
+		ret = nvt_gmac_get_delay(dev, "tx-internal-delay-ps");
+		if (ret &lt; 0)
+			return ret;
+		reg |= FIELD_PREP(NVT_TX_DELAY_MASK, ret);
+		break;
+	case PHY_INTERFACE_MODE_RMII:
+		reg = NVT_MISCR_RMII;
+			break;
+	default:
+		return dev_err_probe(dev, -EINVAL, "Unsupported phy-mode (%d)\n", phy_mode);
+	}
+
+	regmap_update_bits(regmap, miscr,
+			   NVT_RX_DELAY_MASK | NVT_TX_DELAY_MASK | NVT_MISCR_RMII, reg);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Please consider programming the NVT_MISCR_RMII bit via the
plat_dat-&gt;set_phy_intf_sel() method.</pre>
    </blockquote>
    I'll switch to using the <span style="white-space: pre-wrap">plat_dat-&gt;set_phy_intf_sel() callback and pass the required info through private structure.</span>
    <blockquote type="cite"
      cite="mid:aYsurPBMnzWDZCco@shell.armlinux.org.uk">
      <pre wrap="" class="moz-quote-pre">

Is this register preserved over suspend/resume ?</pre>
    </blockquote>
    <p>It is not preserved by the GMAC suspend/resume flow and therefore
      needs to be treated as a system register rather than a GMAC local
      context.</p>
    <blockquote type="cite"
      cite="mid:aYsurPBMnzWDZCco@shell.armlinux.org.uk">
      <pre wrap="" class="moz-quote-pre">

Thanks.

</pre>
    </blockquote>
  </body>
</html>

--------------aaXpGtG0sny9pfM8rBgrfgfB--

