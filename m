Return-Path: <openbmc+bounces-1314-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMGhOE8rgWlgEgMAu9opvQ
	(envelope-from <openbmc+bounces-1314-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Mon, 02 Feb 2026 23:55:11 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00418D286F
	for <lists+openbmc@lfdr.de>; Mon, 02 Feb 2026 23:55:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4hks0Q0qz3bkL;
	Tue, 03 Feb 2026 09:54:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::532"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770010886;
	cv=none; b=flpv6TGiapO6VatOqfKN5XdwEKHyWDnBXUrdTQoX5tUHChzLN6P0+vri943ZBKrh8sAbaoXWNuQ8Y8wDcWii3skiSUYn9da6216ri9INKlZTbFEZfiT6T6Tt2hVXegvW55J0O0UkoMHcThSrxkfiQP2sk90Kc7L5mwQewfrWwN8hxC06U7c2vNCSa9BRh2Qy0yuep6lQ3BIzgTywjDrZOCVRzLLrUDv9r+HqZZgSNVYtk6YLDkZ4c9Oj5Mu4iUyQs6qeuVA37SNkZtWcIfGIhtyjoWbUw2i0uDnsm20ZK8wYtMLsp6hJv1RWeZACV/aILFYnlHN9rmdXuPB3ufKy/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770010886; c=relaxed/relaxed;
	bh=w/OodEpFjOF1QKMpfh/He7lSljXTwFAUK5yvvx1mDI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kedp4mlfm9TilL9VLilFQPDTbVLq5v/PLRKC7ACWJLRjjkrhXbnEGGcJrdwifn5pjCp8Hb3gNxMyqnuoi4ijvADa1Y42DZjDn841Gk1Q2f3zhso1mSGyfRkbfKLPI41UM/vZET4QOYMZUe4k8BJ1tierfBfsuYBuw8ztxoULa8jZodjyNXwhG7StAw7whcwuJXN1+2XBJEi0ya4rSHMd8U7gQPmcB5J+N1uHRjzmsc9wwIdohB0LMJ4c6d9v+iNf6NimHX+FzO/fPra7ZREYJSLaz2yDoxZ7XK6wTr7TGOWVtovG+IY4G7ai4WmKiiFiFxnjpPP32DSKu9I46KO0jQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eQbZhbFw; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eQbZhbFw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4Fpr25Kwz30BR
	for <openbmc@lists.ozlabs.org>; Mon, 02 Feb 2026 16:41:23 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c2dd0c24e5cso1548567a12.3
        for <openbmc@lists.ozlabs.org>; Sun, 01 Feb 2026 21:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770010880; x=1770615680; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w/OodEpFjOF1QKMpfh/He7lSljXTwFAUK5yvvx1mDI8=;
        b=eQbZhbFwEof6Y7SlZbVyN6JqPqQv2HN9ieOZEwzxToGgP95UukEI8fsQuzuPGUsiSd
         ItNzaS1NY4ahZkS+y6Z+otxBwmcgTNSlPwYJi28UrEeYwc3Q0Uu6i5k91POywfNLPOxO
         UR8szJyrx1VR8/7136R2uihetPQmn4APK4k8+kHaJZigLRlLKmjd8zDBR7f80Ywke0bB
         7YMWRQc0e4sKAFeRolFFKdq9XmX44KNxBjnwblpNnCcUDjFUiuKWEmb4+5cDVLJWjk/h
         2ZNtsarr4FFsQaOVqVexiduHQlcsGqh19/Df9JSRgepdCfBmdrz+yseFOgmFbzW/uvt+
         Vpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770010880; x=1770615680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w/OodEpFjOF1QKMpfh/He7lSljXTwFAUK5yvvx1mDI8=;
        b=b3HgqppGTpUd/gmRj6ypiIeCzREnTip48Yo+PNBsV0HQJHSwFnQcZRrlUCvt43ohxa
         igdVDodcxpjHDkSTIZWgGvFm7kAH+Z+kWnG0FmqxrzuZXMNEGE3dM8/aCi4SDsNTSj/+
         0PdKSFgURCG32U7Vop4z8NO40yjWaIoK08cCm2+xf89bAOLcZaSVk7z5jgw9FsoZoIHl
         7VikgEw68HuA7Hd+qL+n0bdJf1iSoUCJDfckBvd89zhlWZRa1xTJowtezCrp133WPXf9
         xFjQ0lj5E3mYOm3P058H1qQTITHvt8fRE3cqpXX5S+tuhTgyWpW1jY5oRulbMnLA+IhU
         YkJw==
X-Forwarded-Encrypted: i=1; AJvYcCVe4R5aRT49lAOjG1bWGTFuI+pklQp4AgDDEmU/CQvlDbczOspZGDLmlH+sTCnPfc+or8rKNbVV@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzA9pN3xEeuJXCyajwjIXPH46QDrnc/JzxcUNZ76PgH093KpFlh
	4ElwmyQgaui5d1D9guroSMYXEypQiF085oEQZ1TLEnQc0G4G1+ZT/ETI
X-Gm-Gg: AZuq6aL3J60taeyRffHjELy8m1SW1NAB2TmDvApKFS2JGUuBGLYFe7p229se+hIP4LG
	q+0kGQpyVuDyazsXSaRe8iLbUkSy8FqBlo+V15AIjIA4ho4HsMyORe6QTqM1c2X3E/KvU0I5O2A
	n8Ckcn/guZU29vs6QG7tLj8nlf8OEwkKKAoWnM19EJuXhPHl70En+0ohmF/kPZN6er87v8jN+82
	hD5XiHOCpCzUhfAFdW+azhhmZOA0ej2QB2/E4MkVCWsx2Zg5eRuqtAxSQPh/E0jVhO0jbsQdudH
	oPvCjkyYu1X1Of9uzlePVNJsybQ4GWDvn5G3ncj66uaDLFCs5lj6jYedz8xjkQdGCFnRMosIfzo
	fJ/hD3yTAJUgOrn8m/HvpYGaSFhdum55CTGDzi7jmIUFkUctFsCRLPCaybjxrIEHQNSsubGOUow
	4CFQI56sO5XEtU0HAqWtm5pdp1xhABYxmm3bhy7i8jvQ46jFThrGzYXFiRXT6pMLn1ksLD8fsYO
	4Q=
X-Received: by 2002:a05:6a20:12d6:b0:351:2c6e:6246 with SMTP id adf61e73a8af0-392e0148042mr8658013637.56.1770010879891;
        Sun, 01 Feb 2026 21:41:19 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c64276efb16sm13296475a12.4.2026.02.01.21.41.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 21:41:19 -0800 (PST)
Message-ID: <217f7407-ede2-4be8-bbd8-f2e499170e24@gmail.com>
Date: Mon, 2 Feb 2026 13:41:13 +0800
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
Subject: Re: [net-next,v10,3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
To: Jakub Kicinski <kuba@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org, ychuang3@nuvoton.com, andrew+netdev@lunn.ch,
 linux-stm32@st-md-mailman.stormreply.com, yclu4@nuvoton.com,
 pabeni@redhat.com, davem@davemloft.net, andrew@lunn.ch,
 peppe.cavallaro@st.com, joabreu@synopsys.com, linux-kernel@vger.kernel.org,
 conor+dt@kernel.org, richardcochran@gmail.com, krzk+dt@kernel.org,
 edumazet@google.com, robh@kernel.org, schung@nuvoton.com,
 netdev@vger.kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
References: <20260129054445.416242-4-a0987203069@gmail.com>
 <20260131015008.970729-1-kuba@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260131015008.970729-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.70 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-1314-lists,openbmc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:openbmc@lists.ozlabs.org,m:ychuang3@nuvoton.com,m:andrew+netdev@lunn.ch,m:linux-stm32@st-md-mailman.stormreply.com,m:yclu4@nuvoton.com,m:pabeni@redhat.com,m:davem@davemloft.net,m:andrew@lunn.ch,m:peppe.cavallaro@st.com,m:joabreu@synopsys.com,m:linux-kernel@vger.kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:krzk+dt@kernel.org,m:edumazet@google.com,m:robh@kernel.org,m:schung@nuvoton.com,m:netdev@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:conor@kernel.org,m:krzk@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,openbmc@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.ozlabs.org,nuvoton.com,lunn.ch,st-md-mailman.stormreply.com,redhat.com,davemloft.net,st.com,synopsys.com,kernel.org,gmail.com,google.com,foss.st.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[openbmc,netdev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.dev:url]
X-Rspamd-Queue-Id: 00418D286F
X-Rspamd-Action: no action


On 1/31/2026 9:50 AM, Jakub Kicinski wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
>
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> ---
> net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
>
> Adds Gigabit Ethernet support for Nuvoton MA35 series SoCs using
> the stmmac driver framework.
>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
>> --- /dev/null
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
> [ ... ]
>
>> +static struct nvt_priv_data *
>> +nvt_gmac_setup(struct platform_device *pdev, struct plat_stmmacenet_data *plat)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct nvt_priv_data *bsp_priv;
> [ ... ]
>
>> +	bsp_priv->regmap =
>> +		syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys", 1, &macid);
>> +	if (IS_ERR(bsp_priv->regmap)) {
>> +		dev_err_probe(dev, PTR_ERR(bsp_priv->regmap), "Failed to get sys register\n");
>> +		return ERR_PTR(-ENODEV);
>                             ^^^^^^
>
> Should this propagate the actual error code from
> syscon_regmap_lookup_by_phandle_args() instead of always returning
> -ENODEV? If the syscon lookup returns -EPROBE_DEFER, this will lose
> that error code and prevent the driver from properly deferring its
> probe when dependencies aren't ready yet.
>
> Other dwmac drivers (dwmac-loongson1, dwmac-starfive, dwmac-sun8i) use
> something like:
>
>      return dev_err_probe(dev, PTR_ERR(regmap), "...\n");
>
> or
>
>      return PTR_ERR(regmap);
>
> to propagate the error.

Thanks for pointing this out. I'll fix it in the next revision.

Joey

>
>> +	}
> [ ... ]

