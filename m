Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF648A04C96
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2025 23:45:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSR3D6F2Nz3cVl
	for <lists+openbmc@lfdr.de>; Wed,  8 Jan 2025 09:45:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736222125;
	cv=none; b=Vy5ieaI1Anfffnmahljs7ezHg6bRFh7cMPJ06YPXdxYALhJ2q34A+3IPERyF++lFfwgvLmQ5jq7xEtVX3xVb6G61gDUjAaUFLWCLQmw0a//NGfnFZLZeiMpbdobyLBMERDFFD+D4/1fH3W7Mi6ylcBy9DVHPGEm35pkhG/TUKxVe2nEvOdpH0oN0w3ivz+9ZI8V94VKU+J+2eB3W2SA/EWMNfRfyQYg8uaNWadtNREJUWlJIVgSmourpWYYxcfcaiJ3p0O4sY9XhoxwUPYfJC7denz0Qdw5L6O9Nlc4/TUFCuk+f71RESSIp/9sWjxMPOByEnJYHhgIRt770dWfwig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736222125; c=relaxed/relaxed;
	bh=JkSX5xIdc8zBLFm+jjJZtb1iB0BmRRseeOTnpcRWYIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jwo/rYVkDNOL8s7fHRG8UrmzZLTYVESj1jMVmBqexNjOOKnxzmQF0/1Hi4APRv2wv7fGahCtsR4eZm0VOLtzi630KhIBI9cHo4qe3BzYRumIGKleZ14/p/IQBJSqgTpENQmikm5xqM6hEm3ctHDJm0RgmrG+MRVg6ZOwz+m7ddD3BpEW+fhbeYOGOx0B0mT+oQGOlh8bEU4m9IxUpGUSGY3Rr5Fta8vdDGwqk3r2FrvtLfDgeEphxUkKOo0mqBR7uK2Bx3Aht1byhxVtOFCSTvkelFXP+eYGUcDs2r3+tPaiDo83LNI6ZXmn4ZgIjhCAhAdWOTI/O3BFheP8CUUB3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DHe3TtMb; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DHe3TtMb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRxyz5n8zz3bwp
	for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2025 14:55:22 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ee8e8e29f6so17739222a91.0
        for <openbmc@lists.ozlabs.org>; Mon, 06 Jan 2025 19:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736222120; x=1736826920; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JkSX5xIdc8zBLFm+jjJZtb1iB0BmRRseeOTnpcRWYIA=;
        b=DHe3TtMbARuCrPw0V7H5KvHuVDSmKnf15AYTcyRgrzR2U30MEwo+jfwk3Y7cqLmSYt
         pT6pD9k0bW5vGN3LQfLblk9EtEM/TnflR6D8GNeHvDk1V6aKynNLveDh9/xVmLNiQRkj
         QQtyiBcaq5pVPt57QIdOLrYw5TtI3ZAbw/+baw84fknYqI4o7kbxkSclp747NmU6SiIe
         kqEokf8HqichZ1lSPIJEFA8FfBWR68rh52bR70hm4eXWyTIdFm8IbxsPyr4vQSrk4eBG
         Ks1iH1JqeCLRwkRt9BYoJJMwx5h+1Aw5S4oC02ZHAjnMYWsdJytxZDRDWCVNxtmam978
         zXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736222120; x=1736826920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JkSX5xIdc8zBLFm+jjJZtb1iB0BmRRseeOTnpcRWYIA=;
        b=aXEuwkk4hptSlfz3lji+mfCz6c3ZcLSYUfMrG6oklA7whBxVSpWq5MPT1HMfP0Dntu
         F6/tI6JMlogNsTvf7/rcKeQS5EPxc8cRtRoDcV3qrZ984aaMspI4aHCRFHhrVQ4tY6TJ
         eSok+xSVE+hshF2Y7b5nOwe3FVS2RAqGWp7MTmtt/LjdSLh3mrKhgBKQ9t6KzFs2YA9B
         /nW/PtQpi03BKYV8+A/KaQjpIrchb8R9KWqxYngf0mz6GzuXOFP4t/XgGuXcoO2VCVQG
         E9x6/Y7WnubgJ1vO56zhBAowmpOtkfhjdFwaOBA8+W1fo+FPet3qOtdmSTXoomHHHeoY
         27iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWchMeuyzX78O7iFs81i8kpAsEvFwtP22bKxIqX6HRR5aySXHXnCP1+2aPL/4ORQn1U8o7wU5x1@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzjMEWusdHGXn0qVgMfWrCu7aUzjV5xtRXaokm22w30+XtKJWkC
	2Edf6Fh4tnEOFU1GxhcZUza+AINcsPFfvc5yyf1OBssykkFrjDMa
X-Gm-Gg: ASbGncvSp8hqnryvhma5LkFpCrdcdscdQRcQueQhOsYs1ZyMM7Gd1EQnkngnS31F04m
	w+sIy+3uUfNglXIdNj2BgVLUMiMjyEj7G+uM8IAp/XzXBhmm0tthQmSSGOpP8jk1Ob4UFGXvbRH
	70dQPnrjZZ+3it9uokeFQpbaQad/usuDTjGrardMKFetn9x+rHA405I6J9AOhtS+ySAHqE2tna6
	Spw1eaB35Tv6a6irGQ3aPDOQFGEc1J0NFICXeVvHJawi2yucJ4Xowd4ZLBuEelGWtM0hfgxfD34
	VrUrruJ4euT24fcVUWC2R1t1fcvpJrSETIY=
X-Google-Smtp-Source: AGHT+IE2K2gRs1V2fgpYN0CLM9zdF4nwVbYze0GXJZkFBE9yEldHu2WRl6ZMw9QvCXUDA6422eZIOQ==
X-Received: by 2002:a17:90b:2545:b0:2ee:a76a:820 with SMTP id 98e67ed59e1d1-2f452e3eebamr85264355a91.18.1736222120018;
        Mon, 06 Jan 2025 19:55:20 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f48db83c37sm26295046a91.47.2025.01.06.19.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 19:55:19 -0800 (PST)
Message-ID: <14ad5eae-e10d-426d-ace1-f841b5249e9f@gmail.com>
Date: Tue, 7 Jan 2025 11:55:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com
References: <20250103063241.2306312-1-a0987203069@gmail.com>
 <20250103063241.2306312-4-a0987203069@gmail.com>
 <2736ccd3-680d-4f5d-a31a-156dec056f22@wanadoo.fr>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <2736ccd3-680d-4f5d-a31a-156dec056f22@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Wed, 08 Jan 2025 09:45:42 +1100
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


Christophe JAILLET 於 1/4/2025 12:38 AM 寫道:
> Le 03/01/2025 à 07:32, Joey Lu a écrit :
>> Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac 
>> driver.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>
> ...
>
>> +    /* Nuvoton DWMAC configs */
>> +    plat_dat->has_gmac = 1;
>> +    plat_dat->tx_fifo_size = 2048;
>> +    plat_dat->rx_fifo_size = 4096;
>> +    plat_dat->multicast_filter_bins = 0;
>> +    plat_dat->unicast_filter_entries = 8;
>> +    plat_dat->flags &= ~STMMAC_FLAG_USE_PHY_WOL;
>> +
>> +    priv_data = nvt_gmac_setup(pdev, plat_dat);
>> +    if (IS_ERR(priv_data))
>> +        return PTR_ERR(priv_data);
>> +
>> +    ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>
> stmmac_pltfr_remove() is called by the .remove function.
> Is it correct to call stmmac_dvr_probe() here, and not 
> stmmac_pltfr_probe()?

Thank you for the feedback. You're correct. I will update the code to 
call stmmac_pltfr_probe().

BR,

Joey

>
>> +    if (ret)
>> +        return ret;
>> +
>> +    /* The PMT flag is determined by the RWK property.
>> +     * However, our hardware is configured to support only MGK.
>> +     * This is an override on PMT to enable WoL capability.
>> +     */
>> +    plat_dat->pmt = 1;
>> +    device_set_wakeup_capable(&pdev->dev, 1);
>> +
>> +    return 0;
>> +}
>
> ...
>
>> +static struct platform_driver nvt_dwmac_driver = {
>> +    .probe  = nvt_gmac_probe,
>> +    .remove = stmmac_pltfr_remove,
>> +    .driver = {
>> +        .name           = "nuvoton-dwmac",
>> +        .pm        = &stmmac_pltfr_pm_ops,
>> +        .of_match_table = nvt_dwmac_match,
>> +    },
>> +};
>
> ...
>
> CJ
