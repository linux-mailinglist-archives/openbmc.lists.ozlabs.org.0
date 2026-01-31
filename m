Return-Path: <openbmc+bounces-1305-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMlFLNtffWnpRgIAu9opvQ
	(envelope-from <openbmc+bounces-1305-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Sat, 31 Jan 2026 02:50:19 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDC1C01BF
	for <lists+openbmc@lfdr.de>; Sat, 31 Jan 2026 02:50:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2wn33cPYz2yrn;
	Sat, 31 Jan 2026 12:50:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769824215;
	cv=none; b=bfcmVzgzHR2HgYSguECd9vKf/cjnkEghRJAtA+bK5Xa+PEQgkjIhFRiOFBVAcL00CyLe9wPhMZuONr+RnudroEWo+d2XBxspsgyp4pWppOKhTav99uaZGcaPfZOAU9f5QkGi7dsJN8ekRLUDK2GIrgQkupo/FrJLCBv5qyvyUQU9TUd6e30OVCjarljfWlTtjqzcijndxlZhwvxO69ZPERjFt8dwSfSlkzgtTDiMhLRwdj5AdSsJZTj2YcZLrlG5BNKQop/SfLNgFy4IIq241L02qMInr8QEHOBpkQQMs3EG80ydvmuD8TggooN0iFABTXI9YErc+jl0XbujXd+izQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769824215; c=relaxed/relaxed;
	bh=U1p3l0Ab/P6U2jKHqy2nPkaIBhQyAdHsvReVOEIQzkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KuGWKWAYDfXTxp/10ok2QD2vLcAIO8dbeefBH3PgeBiOSEwEkTfdYKzUdSqqVxhSrnfFifrb+0fD8suqgkRmIOeayh9gz7y3J7IW8VWXI8Y2aYOaGPScrrj73CUtDZQqeqaizZk8H5ONW/fSjGoafqpWsuzMriXFRdHuf+MCU7o6IsAjF+UOlwn4JIZ5mSSdUC9lJAnnukMSYKV8UGCXNo+DQd6XVRXjq81++wIIJ6Vzmt6dic3lGpG+FuTv4+WzcFIcZzwoy/doD5zN+6NFypFk7O3X6o90sbzSHM3tX5IUzzWliJUqaLAq/lDpfZQP1ZGXzQ2P4gmPr/tu+NGQcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dLN628Bx; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dLN628Bx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2wn22b4Zz2yql
	for <openbmc@lists.ozlabs.org>; Sat, 31 Jan 2026 12:50:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 441BC6013C;
	Sat, 31 Jan 2026 01:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07668C4CEF7;
	Sat, 31 Jan 2026 01:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769824211;
	bh=yZ2ydlBeIEM1kguh/UCzdsK/jkpYCuJzFCaodPIBfF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dLN628BxXGuoHL9Qtmsod7rQPNY34dyHhFXsPj7T2VvVclMks14q8oXxR8pt0zc0A
	 nOfqTI/JVn/lkuhuAAH0dG/qVsAPEk1RbDcePZvbV9u2+MWc2wlQhutVrC1Upwn2VA
	 G1xyGz0UGUOYigVRwkTTR1GrS4nac8TLelDxZrzYaqwfirmUr04JK67qwmf+lbYyDQ
	 HInljldRdfEyrR31FcyuwXxPy3ltyp5vsKGD+VkEjWy4Ac/pd49EbyTmtuXXIH7dNK
	 SKnRh45SZ9QYkRfdSzFc1KReVFwxuKnVizP7I/TAyuDNqHsFO5SmN+8s9UNHtrIhiA
	 MOtJ51o1b9MfA==
From: Jakub Kicinski <kuba@kernel.org>
To: a0987203069@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	openbmc@lists.ozlabs.org,
	ychuang3@nuvoton.com,
	andrew+netdev@lunn.ch,
	linux-stm32@st-md-mailman.stormreply.com,
	yclu4@nuvoton.com,
	pabeni@redhat.com,
	davem@davemloft.net,
	andrew@lunn.ch,
	peppe.cavallaro@st.com,
	joabreu@synopsys.com,
	linux-kernel@vger.kernel.org,
	conor+dt@kernel.org,
	richardcochran@gmail.com,
	krzk+dt@kernel.org,
	edumazet@google.com,
	robh@kernel.org,
	schung@nuvoton.com,
	netdev@vger.kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Subject: Re: [net-next,v10,3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
Date: Fri, 30 Jan 2026 17:50:08 -0800
Message-ID: <20260131015008.970729-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129054445.416242-4-a0987203069@gmail.com>
References: <20260129054445.416242-4-a0987203069@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.80 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1305-lists,openbmc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:a0987203069@gmail.com,m:kuba@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:openbmc@lists.ozlabs.org,m:ychuang3@nuvoton.com,m:andrew+netdev@lunn.ch,m:linux-stm32@st-md-mailman.stormreply.com,m:yclu4@nuvoton.com,m:pabeni@redhat.com,m:davem@davemloft.net,m:andrew@lunn.ch,m:peppe.cavallaro@st.com,m:joabreu@synopsys.com,m:linux-kernel@vger.kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:krzk+dt@kernel.org,m:edumazet@google.com,m:robh@kernel.org,m:schung@nuvoton.com,m:netdev@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:conor@kernel.org,m:krzk@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kuba@kernel.org,openbmc@lists.ozlabs.org];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,nuvoton.com,lunn.ch,st-md-mailman.stormreply.com,redhat.com,davemloft.net,st.com,synopsys.com,gmail.com,google.com,foss.st.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[openbmc,netdev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:url]
X-Rspamd-Queue-Id: 2DDC1C01BF
X-Rspamd-Action: no action

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family

Adds Gigabit Ethernet support for Nuvoton MA35 series SoCs using
the stmmac driver framework.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

[ ... ]

> +static struct nvt_priv_data *
> +nvt_gmac_setup(struct platform_device *pdev, struct plat_stmmacenet_data *plat)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct nvt_priv_data *bsp_priv;

[ ... ]

> +	bsp_priv->regmap =
> +		syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys", 1, &macid);
> +	if (IS_ERR(bsp_priv->regmap)) {
> +		dev_err_probe(dev, PTR_ERR(bsp_priv->regmap), "Failed to get sys register\n");
> +		return ERR_PTR(-ENODEV);
                           ^^^^^^

Should this propagate the actual error code from
syscon_regmap_lookup_by_phandle_args() instead of always returning
-ENODEV? If the syscon lookup returns -EPROBE_DEFER, this will lose
that error code and prevent the driver from properly deferring its
probe when dependencies aren't ready yet.

Other dwmac drivers (dwmac-loongson1, dwmac-starfive, dwmac-sun8i) use
something like:

    return dev_err_probe(dev, PTR_ERR(regmap), "...\n");

or

    return PTR_ERR(regmap);

to propagate the error.

> +	}

[ ... ]
-- 
pw-bot: cr

