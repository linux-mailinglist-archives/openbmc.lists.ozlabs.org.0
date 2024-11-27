Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 569859DAF58
	for <lists+openbmc@lfdr.de>; Wed, 27 Nov 2024 23:53:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XzF8G5XfPz3d2S
	for <lists+openbmc@lfdr.de>; Thu, 28 Nov 2024 09:52:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::530"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732694626;
	cv=none; b=DUqc4z/2wIWVz87cDjrXusXrEdzauJYYgmLC+vIj0zYeN4h3ksaVyN3HgZ1UHDnxwex3zYoCiJHOIigu+OtDNQu+sSrQP+itbYQ7yvzssio4bkIGUeggOo8HRMdRXDOdAsZZW1pKceA4QTmdWHec54H83oSmCdj4hv5/3cu2pWcQf3v0QG8sUR+HGowelG08RkBHQO9uYNgTF9OE08+aX7NIe5ggQ6xHVIqVxnF1Mv54Vek1e56CKvAp80cnkmq4RTrCwI/pciavGmNTNUwOkN5DVlJpFdPtJvjn5J7hjF7Gss7LoXs3sObksxlvqfxMhVDhAGhTPHv/FTff0AVH7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732694626; c=relaxed/relaxed;
	bh=HvstvQGGZWpwukBxOMgySPouyXZH3tEoacDeqR0VV4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UaTUIceaZpGrjP9/dFvwU7DZb/T6/Qtzx8hemXdXIboEz4VcyWFqEzzfI3sWORpflxKKHkgGqL/CBxmmu41YW7ohRdtzPFyP2RpLr3+lpfXGoyGsi0gCkJdMfS5pYAV+fr3LNK6DKnO1H87HYiWAdNe2Zd/J8NnGM16YMpLXRLTwOmOqL2sY2m1DwgpB6gfJByBDAOX7gwq6Z+vbKMKAkw9IgyFHbMjVdfIpTK8K3JWx6p9mERgMDFrDrSjXdknlpCcoHcRDVGMLZDORXSB07s+OtRse7DQ9DdKFDHhdoqUBLhumSVoJG9I0TaRS/VmrEaVyw/paIjUKipyi4k2Fxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UGNGTPvG; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UGNGTPvG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XysQS4ZqMz2xGw
	for <openbmc@lists.ozlabs.org>; Wed, 27 Nov 2024 19:03:44 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7fbd70f79f2so4426838a12.2
        for <openbmc@lists.ozlabs.org>; Wed, 27 Nov 2024 00:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732694621; x=1733299421; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HvstvQGGZWpwukBxOMgySPouyXZH3tEoacDeqR0VV4A=;
        b=UGNGTPvGAzjpcvNVq+eryS+KyrhwVTDhYcMUCIhWCsH6Der76gL1xTphiDk8ugBn1z
         XhYxa4hS4TpUtKPmOlzoRovUu/yhNfoB+ZbkdwnfaCXSRfIHI9dHqHSm/l9OZcxkm6ft
         OLcMeRjkytpE65oSPVAm8S7c/s7U/JCFdqD1jTouC1OONHbZrQopsqGTWD0kHmx1nM7c
         3dXmpd1Jj6IDRAKCVWxpTfAq5ozRfBn7h9JQYaK2Uhs09kudBPSp5vZNALssJIIxsfdm
         eTt9CpAliUkhGN3gU/MU7R9bPTF994cA9kHSDRyU8Ld4UdnWjAtjzeXOVFjDDZqgMMPt
         M54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732694621; x=1733299421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HvstvQGGZWpwukBxOMgySPouyXZH3tEoacDeqR0VV4A=;
        b=poSXMc5NyY0darIyjpMLMMyUHvnh/JGetgqiULwNgM+3zqy/00UGPSHOqc9WYBoxyx
         gaIKL3MqRrdYW0Hm/Evrl0KrFbOr+EpjQCoVbWfoZRHtl6EcmBVbU/rMe4FKMqNyp7XM
         M/4eozOkIsWHkio7ZEbYIzum09xClETzIG8br9SqQAYtUoxZ88wKwjgTqwNpYj+14enk
         LbNB48oKv0ZafTcODW8RroXWYr4jTwprYNS/9WF62V6HBrYbxQOjKGB5ZROwypUiqJiV
         QOoyxBrU5wgBCDsWhhy5KEghnWeJTy/dd7luOYT+8oKmLkNCRXHW5nBBNip5Fw2ArhDS
         ee/g==
X-Forwarded-Encrypted: i=1; AJvYcCW3M26M4svcl+AwCz/uSi6lLkeTIzeA2PShXBTE1D2qIZn9vi99/l8Tr6R0EwuKfTYgsBRfe8Hl@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzwHbS+LBfK86iQHv9nBcyjk2mdvS2UIgwHWznAu8+zf7KO7Ple
	wW0R6XPcWKwVVOgKlx9Mv7uRBcoXJhsKVqqp+o25lnGUqx+CMkIO
X-Gm-Gg: ASbGncv+u+YQEw12T6htSWed41zRioF47FmQGc9EFc7miGkBpTYH0BnRuCjCH60lVq7
	WXqbJ9/8+HEh/vTXWAPQvvovlmKTsvCshNWmc2R6c45AqEcw1W/77AXvzYPzR8BjE2+kTrt4of8
	TcEAFMWDaUkEHn/k4/2jtiFc8anFmU5U7PBVvmOfwCUijDVipuI2Jl80wip77Kq4GnflInhfaTY
	YMEr8iaMjoDJONFa0im2cDRidn2YwnlHHSRPoz30gi4rjpT4EblOJTBvMUetbQOqkO7FDDtaLMU
	VXOUG3n07C6ED8y3w3k1gBBh50AF
X-Google-Smtp-Source: AGHT+IHRo3XtMbkGU/iUkrZZ9kDEO66Pm5yljji2WIQGTrvtOISCN9QXMkeyFyIaUUK12nAZ7FFb4Q==
X-Received: by 2002:a05:6a21:3288:b0:1e0:d380:fe61 with SMTP id adf61e73a8af0-1e0e0b9dbf6mr3148053637.45.1732694621422;
        Wed, 27 Nov 2024 00:03:41 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de531308sm9618017b3a.110.2024.11.27.00.03.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 00:03:40 -0800 (PST)
Message-ID: <fb61cf82-b14d-4f58-99bb-9677305a0aa6@gmail.com>
Date: Wed, 27 Nov 2024 16:03:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for
 Nuvoton MA35 family
To: Krzysztof Kozlowski <krzk@kernel.org>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com
References: <20241118082707.8504-1-a0987203069@gmail.com>
 <20241118082707.8504-4-a0987203069@gmail.com>
 <7c132784-87db-44f9-8be4-a0805e438735@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <7c132784-87db-44f9-8be4-a0805e438735@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 28 Nov 2024 09:52:40 +1100
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
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, joabreu@synopsys.com, schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


Krzysztof Kozlowski 於 11/26/2024 6:10 PM 寫道:
> On 18/11/2024 09:27, Joey Lu wrote:
>> +
>> +static struct nvt_priv_data *
>> +nuvoton_gmac_setup(struct platform_device *pdev, struct plat_stmmacenet_data *plat)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct nvt_priv_data *bsp_priv;
>> +	phy_interface_t phy_mode;
>> +	u32 tx_delay, rx_delay;
>> +	u32 macid, arg, reg;
>> +
>> +	bsp_priv = devm_kzalloc(dev, sizeof(*bsp_priv), GFP_KERNEL);
>> +	if (!bsp_priv)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	bsp_priv->regmap =
>> +		syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys", 1, &macid);
>> +	if (IS_ERR(bsp_priv->regmap)) {
>> +		dev_err(dev, "Failed to get sys register\n");
> Syntax is: return dev_err_probe
I will use dev_err_probe instead.
>
>> +		return ERR_PTR(-ENODEV);
>> +	}
>> +	if (macid > 1) {
>> +		dev_err(dev, "Invalid sys arguments\n");
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>
>
> ...
>
I will use dev_err_probe instead.
>> +
>> +	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* We support WoL by magic packet, override pmt to make it work! */
>> +	plat_dat->pmt = 1;
>> +	dev_info(&pdev->dev, "Wake-Up On Lan supported\n");
>
> Drop, driver should be silent on success.
Got it.
>
>> +	device_set_wakeup_capable(&pdev->dev, 1);
>> +
>> +	return 0;
>> +}
>
>
> Best regards,
> Krzysztof

Thanks!

BR,

Joey

