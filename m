Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 158524D7C32
	for <lists+openbmc@lfdr.de>; Mon, 14 Mar 2022 08:42:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KH7mt0T6Tz3chd
	for <lists+openbmc@lfdr.de>; Mon, 14 Mar 2022 18:42:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=ejJ1Mcrf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=ejJ1Mcrf; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KH7dM2J6lz3cdQ
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2022 18:36:23 +1100 (AEDT)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7C39D3FC9F
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2022 07:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647243378;
 bh=iAtSOaeLKxQsN9oiK9IKSKgSGPin9K0zGNTzo54gjLk=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=ejJ1McrfEU8hBrkyg9HYVguxj9Ylx7vnA1gvJSacWKkxNcaMpB3+GGVONaJg6ZiJd
 SsdzFwrRTf/skmDfOtZ0p6M+7Gg3ZOVW3jLqnttFuy6bLZE4jj/We1x1GheOwUC9KI
 lCB3UXDfpdHMBMD5h/mpSGO8JwJRbm8Um4rf13cl03rkQIlySUYmM1n40DMdbhewkc
 3Hq24WAxYGV4OO3sLM0+tMFzv2njr2YEeEJQzNcLOyCt516n5SPLGTMwHO3Si7NkkV
 0Wfu39dfl+KmyrYdruN7wtTXHCO2QalQOS9R8UsYkpz9XkZUpAmFtJeOp6Cfby2+zI
 s7hbpw1ls5T3g==
Received: by mail-ed1-f72.google.com with SMTP id
 co2-20020a0564020c0200b00415f9fa6ca8so8192432edb.6
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2022 00:36:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iAtSOaeLKxQsN9oiK9IKSKgSGPin9K0zGNTzo54gjLk=;
 b=LsFfKhtP36dPEfPD11hRDCPfiMD2nsn1TZ1gvz8U/x8Fq+fEYHVViAdSPqvOymlB2b
 Mrh/AcVTpluwymOYvlGJb+SIw/zmr3opJMNGwO2NH3dbOtmYaC6KZD1J5mfmH9Dm6xWH
 hhMlPxK43XQvMRlgLN/0tkp1+wcSGQRxJpFjj4hsJFMIENBHy82xnSqvWwuKPp2IwXXU
 PBiD7k/lb55uhcB41sbnC5ZmcsAcDFsFdsoacNJBhcbjmJnitoigVmMqoFf6IZyOcz88
 iyose8tVarLt64Vc+CHgOfjqLtsK+uUqPstJlTcP9pX+Q0FurlIvSW5uaB7ofSiOQSTC
 SuBg==
X-Gm-Message-State: AOAM533uL3zAmYKQMSAkLhkCudGBTt5v1Tg2ShZ/Noi2REtq9ptZIOor
 u/4VjRlOvoeapfaji4f5d7TGSDtuscLslVN53kV46pDKmNNVCXPWK2/4l7UXynxMf8spLepKwD2
 ZBWTukRcFbsDXyBCGHyJYAXhW7B9pp+UYkhHz
X-Received: by 2002:a17:907:1614:b0:6db:e3f7:2cb4 with SMTP id
 hb20-20020a170907161400b006dbe3f72cb4mr255450ejc.435.1647243377979; 
 Mon, 14 Mar 2022 00:36:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycCN76EHq9M0eAQGZvA10vpA52jlIoM5/wMGxfvQsd+ClzDaAgk2gAPmK0IIzzn0h6WBnHrQ==
X-Received: by 2002:a17:907:1614:b0:6db:e3f7:2cb4 with SMTP id
 hb20-20020a170907161400b006dbe3f72cb4mr255415ejc.435.1647243377741; 
 Mon, 14 Mar 2022 00:36:17 -0700 (PDT)
Received: from [192.168.0.152] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.googlemail.com with ESMTPSA id
 z21-20020a1709063a1500b006da6436819dsm6448816eje.173.2022.03.14.00.36.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 00:36:17 -0700 (PDT)
Message-ID: <143db512-0223-1553-c141-2dc24a23c430@canonical.com>
Date: Mon, 14 Mar 2022 08:36:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/3] EDAC: nuvoton: Add NPCM memory controller driver
Content-Language: en-US
To: Medad Young <medadyoung@gmail.com>
References: <20220311014245.4612-1-ctcchien@nuvoton.com>
 <20220311014245.4612-4-ctcchien@nuvoton.com>
 <1f5e1e49-4ab0-5e06-fa8f-2a11b0fd1df9@canonical.com>
 <CAHpyw9dHau348qJB6g+fCcKqWByUsRHAGwb_mdUg=hjhW+xNsw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAHpyw9dHau348qJB6g+fCcKqWByUsRHAGwb_mdUg=hjhW+xNsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: KWLIU@nuvoton.com, tony.luck@intel.com, rric@kernel.org,
 Benjamin Fair <benjaminfair@google.com>, linux-edac@vger.kernel.org,
 KFTING <KFTING@nuvoton.com>, avifishman70@gmail.com,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, ctcchien@nuvoton.com, tali.perry1@gmail.com,
 devicetree@vger.kernel.org, robh+dt@kernel.org, bp@alien8.de,
 james.morse@arm.com, YSCHU@nuvoton.com, mchehab@kernel.org,
 linux-kernel@vger.kernel.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 14/03/2022 06:32, Medad Young wrote:
> Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> 於 2022年3月11日
> 週五 下午5:15寫道：
>>
>> On 11/03/2022 02:42, Medad CChien wrote:
>>> Add support for Nuvoton NPCM SoC.
>>>
>>> Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
>>> ---
>>>  drivers/edac/Kconfig     |   9 +
>>>  drivers/edac/Makefile    |   1 +
>>>  drivers/edac/npcm_edac.c | 714 +++++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 724 insertions(+)
>>>  create mode 100644 drivers/edac/npcm_edac.c
>>>
>>> diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
>>> index 58ab63642e72..757e1d160640 100644
>>> --- a/drivers/edac/Kconfig
>>> +++ b/drivers/edac/Kconfig
>>> @@ -539,4 +539,13 @@ config EDAC_DMC520
>>>         Support for error detection and correction on the
>>>         SoCs with ARM DMC-520 DRAM controller.
>>>
>>> +config EDAC_NPCM
>>> +     tristate "Nuvoton NPCM DDR Memory Controller"
>>> +     depends on ARCH_NPCM
>>
>> || COMPILE_TEST
>> (and test if it compiles)
>>
>> (...)
>>
>>> +
>>> +MODULE_DEVICE_TABLE(of, npcm_edac_of_match);
>>> +
>>> +static int npcm_edac_mc_probe(struct platform_device *pdev)
>>> +{
>>> +     const struct npcm_edac_platform_data *npcm_chip;
>>> +     struct device *dev = &pdev->dev;
>>> +     struct edac_mc_layer layers[1];
>>> +     const struct of_device_id *id;
>>> +     struct priv_data *priv_data;
>>> +     struct mem_ctl_info *mci;
>>> +     struct resource *res;
>>> +     void __iomem *reg;
>>> +     int ret = -ENODEV;
>>> +     int irq;
>>> +
>>> +     id = of_match_device(npcm_edac_of_match, &pdev->dev);
>>> +     if (!id)
>>> +             return -ENODEV;
>>
>> Why do you need it? How such case is even possible?
> this driver is used for two nuvoton SOCs, one is NPCM845 and the other
> is NPCM750

Yes and how NULL can happen for OF-only driver? Unless I missed
something and this is not an OF-only driver? Do you allow any other
matching methods?

Best regards,
Krzysztof
