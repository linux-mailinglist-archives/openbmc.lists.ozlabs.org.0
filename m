Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E16FFA12F59
	for <lists+openbmc@lfdr.de>; Thu, 16 Jan 2025 00:43:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYMy60Xgxz3g0P
	for <lists+openbmc@lfdr.de>; Thu, 16 Jan 2025 10:43:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1034"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736939135;
	cv=none; b=Mcjw2FMRMy+AW8Rj8faWgZRpwfmRxpE96HaTNvpWcsrTjR1b3SS/HfPQQSUqAYfX+7Js0H66TMLsSEv0XnDo50AofPl9fzIMPGU8/8oHv6owZ0bwpTkEEo8uHPnrw53Ro5ai4017S/lGlgJSthS+nnlFA3PlA7JdL/ArfEhmeK/wckPP19+zXS+7rJZz+vr+5SMH8xzzEBCj2Odzsrx5uLsKEi+WmKJEGMbp+kdGWMg2EVmNcS2UYQnavVP5H3rsGTTFk68J50kzgjMr0NL5GrxXEZym1ObqoDuXD5D+mm1GeBYB+t8hg+j3zc6r82Y9aOQ3g/o5qXouRz8wLnlcdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736939135; c=relaxed/relaxed;
	bh=DZhmJVX2Z/1on+VLI7mM1RgJuJ/QDUUV3rq29Mr1CH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GJNF1SDki4xAEZ1GtFyNGD2CnQ+AogFe52rbW6SiZsHT8PAlVQRhyQIzAiuFoNTSO3U0ptRkbNRVYEHQ6bNArTarxJaQ3TKrymaXQVXM9XoAHJ6CdzgglMJeC6xnpJiMZ28S34hLqTp+lvTf4nX9TradStnN/HzVAGVdZ3YuCfXrPXiLmJwnk41tXo+1PKmEttuJdhvl6iTqtYhsJtvRlK7Xe1O6NHVMDNPKFwnAJXkuyONAiaZUbcNpYGflqIXk+mCSIPMcX1DUvGYTNT/CTvDmxw+b4WqwrkuNyl/tFt/C1SdCVFFBwAYpAzT5R/2bZJb5iNBHEiZL0KLIhdVgeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HCBF+I68; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HCBF+I68;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YY37f4fT1z2ykf
	for <openbmc@lists.ozlabs.org>; Wed, 15 Jan 2025 22:05:34 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2f441904a42so11250558a91.1
        for <openbmc@lists.ozlabs.org>; Wed, 15 Jan 2025 03:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736939132; x=1737543932; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DZhmJVX2Z/1on+VLI7mM1RgJuJ/QDUUV3rq29Mr1CH4=;
        b=HCBF+I68GUKxaYQ43y1+I7H6z2sslzKO2GXhL2OwGWsEMENPzYUkLIv7pBQuWKVYsK
         TAnkHHyx+cXB7mGfgNEV7xc4YpY3kW28piEb6wsAcKJXK982H+0h1uBepjfiHHlnImDI
         v4ndIDzfXi1ERCFsIKgZTSa9FwXEvUK17s6JOuWeuXWG1fKfHqtt8Zkybip1XwjGe9Nc
         T86FoX3iWlnfZv6/RJEZvEPvLXTXvY2u+exxM6kTYsjm8sPpK1hBHgxw8qptOQY93KEf
         rm7o7PsryHiVYLqIMM+SUsg06jj748uDKPsc4e9W6iW9BGCBc3bqgqGmvK8WRDhBcAL+
         cUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736939132; x=1737543932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZhmJVX2Z/1on+VLI7mM1RgJuJ/QDUUV3rq29Mr1CH4=;
        b=Xh8toZy3DF+Hxra+UfRyKgzEFQrzPBcL4kmikgFrfAH13+CrCovyFKnlDZe0gok6vT
         sCjt42zYDyzXq6PSnDw3q7GJURIPwVkstPmz3POw2uYZhLVn9uHdLIVtk9ug/obMZwfu
         /gt895B4m2tQMl6Lxns7Me8mgohqZhamCJpALBs0kHB8BoVd+WP5Hb0M7G6MalblcEIx
         WqXxFBfoF8cb8XGkm7nDTp1jPMuYdtMDMT3U2tX7NGTO6vRslKhEiCdcJ/bszE5WVhEC
         TuUxo1ABBgikazrxKpb1b9g+E2Y4UUXUtaPFj9fkXYTutJrneRlXdYazGOhYPnTnpAuJ
         zsuw==
X-Forwarded-Encrypted: i=1; AJvYcCVqAQVdzPLIBH3WdWQUYyU2AkhpaJ2Qs73oGlNmwoILxDo9elG73uK3s4w5qnBN6BMVtH4UNv5q@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyXyQDh4jttsYDBrlcJ9uzrfW+ZxXw2a76ANH6CcxCW2ACk3mD+
	emBPlUtOXmobk/SEZX/1BeFmQ3tWpPT8AAC7P/pb2RSafFUFtmft
X-Gm-Gg: ASbGnctTV6gCVhqAL6nf0NafkLZWCWPi4nUQ7mgYPLmgH40kODmh1i8gTHLegLLbPSI
	8Nwe85vC5pHFrS1mmXV1ALR8O7nCE5eHPO6vImGdgp/Ve+gXho2p3JmBDtCZYod8/dbVtsmyLQ2
	MPoFhMeyFDMVy0feL/R+b6FE+yrupZJLMmnbfDL1pK7/VdavtT0HEOGwZeqlcCZkvG6UYEZFJMW
	JLyJOF2uSv/ZP8zbulE+COm3UTKU00IZgv+kXYgpeTv+lPyaK9CQH6HeSMGSR0pXFvIqkFxKJLB
	iMTYdcovCPVDEDl+KFy/1DbwcSHJECiB7FE=
X-Google-Smtp-Source: AGHT+IEIUJ161wQLQ7M7tzPplUbCNDBmqlqWnABZRELuVW2sGY23Vkufmemaywh2bkhh0gVhD2Yq9A==
X-Received: by 2002:a17:90b:264c:b0:2ee:9b2c:3253 with SMTP id 98e67ed59e1d1-2f5490c20e7mr40326717a91.30.1736939131935;
        Wed, 15 Jan 2025 03:05:31 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c22b474sm1111164a91.44.2025.01.15.03.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 03:05:31 -0800 (PST)
Message-ID: <da332a44-8fbe-40c3-8053-c4c9fdfc8746@gmail.com>
Date: Wed, 15 Jan 2025 19:05:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
To: Paul Menzel <pmenzel@molgen.mpg.de>
References: <20250113055434.3377508-1-a0987203069@gmail.com>
 <20250113055434.3377508-4-a0987203069@gmail.com>
 <a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de>
 <2cf758f2-529e-4ccd-9dc1-18fc29ad5ac0@gmail.com>
 <990a3fc9-7fd6-49b6-8918-d5bf4ae48953@molgen.mpg.de>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <990a3fc9-7fd6-49b6-8918-d5bf4ae48953@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 16 Jan 2025 10:43:15 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, alexandre.torgue@foss.st.com, edumazet@google.com, schung@nuvoton.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, richardcochran@gmail.com, ychuang3@nuvoton.com, peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Paul,

Thank you for your kind reply.

Paul Menzel 於 1/15/2025 5:22 PM 寫道:
> Dear Joey,
>
>
> Thank you for your prompt reply.
>
>
> Am 15.01.25 um 10:03 schrieb Joey Lu:
>
>> Paul Menzel 於 1/14/2025 9:49 AM 寫道:
>
> […]
>
>>> Am 13.01.25 um 00:54 schrieb Joey Lu:
>>>> Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac 
>>>> driver.
>
> […]
>
>>> Also, please document how tested the driver. Maybe even paste new 
>>> log messages.
>>
>> These are the kernel configurations for testing the MA35D1 GMAC 
>> driver: ARCH_MA35, STMMAC_PLATFORM, DWMAC_NUVOTON.
>>
>> I'm not sure if this information is sufficient, so please provide 
>> some guidance on what else I should include to meet your requirements.
>
> I’d be interested on what hardware you tested it. Probably some 
> evaluation or customer reference board.
The driver has been validated on our development boards, 
NuMaker-IoT-MA35D1-A1 and NuMaker-HMI-MA35D1-S1.
>
>> I will include the log messages at the end of the email.
>
> Awesome. Thank you. Personally, I also like to see those in the commit 
> message.
Understood. I will include in the commit message in the next patch.
>
>>>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>>>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>>>
>>> As you use your company email address in the AUTHOR line below, 
>>> please also add that email address to the commit message (and maybe 
>>> even as the author).
>>
>> I will update the AUTHOR to use my personal email address instead of 
>> the company email.
>
> Understood. (yclu4@nuvoton.com is also personal, but the Gmail address 
> is private, I guess. ;-)).
Oops, I meant to say "private" instead.
>
> For statistics, how companies contribute to the Linux kernel, having 
> the company address somewhere would be nice though, as you are doing 
> this as your work at Nuvoton, right?
I will keep the company information in the driver header as you mentioned.
>
>>>> ---
>>>>   drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
>>>>   drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>>>>   .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 179 
>>>> ++++++++++++++++++
>>>>   3 files changed, 191 insertions(+)
>>>>   create mode 100644 
>>>> drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
>
> […]
>
>> log:
>>
>> [    T0] Booting Linux on physical CPU 0x0000000000 [0x411fd040]
>
> Out of curiosity, how do you get these timestamps T0, T1, …?
>
> […]
>
>
> Thank you and kind regards,
>
> Paul

I simply forgot to enable CONFIG_PRINTK_TIME. Here is what the log looks 
like after enabling it.

[    1.886100] nuvoton-dwmac 40120000.ethernet: TX Checksum insertion 
supported
[    1.893104] nuvoton-dwmac 40120000.ethernet: Enhanced/Alternate 
descriptors
[    1.900048] nuvoton-dwmac 40120000.ethernet: Enabled extended descriptors
[    1.906806] nuvoton-dwmac 40120000.ethernet: Ring mode enabled
[    1.912611] nuvoton-dwmac 40120000.ethernet: Enable RX Mitigation via 
HW Watchdog Timer

BR,

Joey


