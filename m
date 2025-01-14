Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D27A0FEB5
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2025 03:22:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXCZb19znz3dVl
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2025 13:22:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736821347;
	cv=none; b=D9SiH/Nj+wObCT/BjZ4FhyCNu+6iElkLXQ5oUGbbLiL7tBXTtup/CbzSP2bPbt3tnhzgjeoO3tE8TMFrUnNm/T/z8vQDS5CxnZxwfuudNcoDXneWsic0imP8HvcKFTPqP3aavqx9Bg8KhVD0CqMZVGCyfVez3krzENMdd/lLOZP/2qWmC6RjYch6l7ARe1dn80t/e2tSP7H2MyvcQWllI6JQCnCvZr8WJWPbxEzfix29nMw89yxo2dfrXm8D3eKFQnsB8A+jdlVTaAS6cMpGMk/JIQNvD3PnDOx646BpV5PxkwVEMelrlHcFn0kiJ9lJyBAMaEhvpLVlu0xc1Mewuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736821347; c=relaxed/relaxed;
	bh=q++QPyxHMp/WwXTDrHwqKxKHjtWXHAXL/aKMbF08JiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b7iEgF96IbLncrAgrxw4AUqHcsxIYrogbxPC0aM/895O7Iy72kKbdrmKPFTvjiiBoKayEtlSlSgemyLL+n7Tshb1IlBTVawAcqon8NP1Y6bOHH4bGppp+t72+8cwu/yPLKuRxeB9BRgfA+MQ0EYJN8cyuZ/HxaKFRN5mdl+2aGOaj/0NtaCG9YyTKAvDwMsmznbmFtI0Kz+HLYHBhuhX/gJ7f8db6uJH9hF5LJudpsBIwySptSOIpx0pTOJvK69077/V1/oTwW9oRPviG1YKKYuXezBYpMt/q5ScofS2OgEWQoZdgNLyjXjC45X+NHVkqBCQoEnmLHiQzUBZvcfXqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org) smtp.mailfrom=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXCZV2jLsz3dBG
	for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2025 13:22:26 +1100 (AEDT)
Received: from [192.168.0.224] (ip5f5ae8ae.dynamic.kabel-deutschland.de [95.90.232.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 55E1861E64780;
	Tue, 14 Jan 2025 03:22:03 +0100 (CET)
Message-ID: <d9fc5212-9710-449e-90b9-a195305d990f@molgen.mpg.de>
Date: Tue, 14 Jan 2025 03:21:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
To: Andrew Lunn <andrew@lunn.ch>
References: <20250113055434.3377508-1-a0987203069@gmail.com>
 <20250113055434.3377508-4-a0987203069@gmail.com>
 <a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de>
 <e7041d36-9bc7-482a-877d-6d8f549c0ada@lunn.ch>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <e7041d36-9bc7-482a-877d-6d8f549c0ada@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
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

Dear Andrew,


Thank you for your quick reply.


Am 14.01.25 um 21:16 schrieb Andrew Lunn:
>>> +#define NVT_MISCR_RMII          BIT(0)
>>> +
>>> +/* 2000ps is mapped to 0x0 ~ 0xF */
>>
>> Excuse my ignorance: What is ps?
> 
> picoseconds. An RGMII link needs a 2ns delay between the clock line
> and the data lines. Some MACs allow you to tune the delay they can
> insert, in this case in steps of 2ns / 16.

Thank you for the clarification. Maybe it’s my English, but I didn’t 
deduce this from how the comment is worded. I do not have a better idea 
either.

>>> +#define NVT_PATH_DELAY_DEC      134
>>> +#define NVT_TX_DELAY_MASK       GENMASK(19, 16)
>>> +#define NVT_RX_DELAY_MASK       GENMASK(23, 20)
>>> +
>>> +struct nvt_priv_data {
>>> +	struct platform_device *pdev;
>>> +	struct regmap *regmap;
>>> +};
>>> +
>>> +static struct nvt_priv_data *
>>> +nvt_gmac_setup(struct platform_device *pdev, struct plat_stmmacenet_data *plat)
>>> +{
>>> +	struct device *dev = &pdev->dev;
>>> +	struct nvt_priv_data *bsp_priv;
>>> +	phy_interface_t phy_mode;
>>> +	u32 tx_delay, rx_delay;
>>
>> Please append the unit to the variable name.
> 
> Which is trick, because they are in units of 2000/16 of a picosecond.

Understood. Maybe a comment could be added?


Kind regards,

Paul
