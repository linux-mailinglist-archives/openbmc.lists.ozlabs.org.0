Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E86634D7C2E
	for <lists+openbmc@lfdr.de>; Mon, 14 Mar 2022 08:42:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KH7m761Cxz3ch0
	for <lists+openbmc@lfdr.de>; Mon, 14 Mar 2022 18:42:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=RRjxuZri;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=RRjxuZri; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KH7cF1R7Rz3bl4
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2022 18:35:24 +1100 (AEDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EF66C3FC9F
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2022 07:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647243316;
 bh=7XD/ZCIPD+pSa/ajluyXSHrFnnLxPbj9dv4H6XXzi7o=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=RRjxuZriAsaR77So9xWe6U3lKguXv3h8zPlDoRWaGCNefBEj2hLvSsREqM4viYOna
 4ax02wxx1bMBZ/0eSeoAatw5HU9rSkW2HY86ZeDuz/u10Oqo184enCuPAUDxegRywC
 4DDB5qVlzDVl6cepdg1TqmTyERUwyuvLJJe8k0Rrr5VHdKktOx65Z85OTuIyII4lDG
 hrF9Jch2pR2Vh5jTjKYrH+JZvd7wxy3EvqNYHeM3pKDX1WLYXY97tmweNmljhCDZCi
 1RmRMn3mDk65Q+cZepjqpHFgG19K2X1hhsEJcObiNFI6cmcS9TJWok1khtl2fgc29x
 8wBk0NwPz2q4g==
Received: by mail-ed1-f69.google.com with SMTP id
 b9-20020aa7d489000000b0041669cd2cbfso8169145edr.16
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2022 00:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7XD/ZCIPD+pSa/ajluyXSHrFnnLxPbj9dv4H6XXzi7o=;
 b=sLaKE1lU9OA6HrXMSR2alpr807j9tQ4VrcCdgg+MqeFLn9su5+GXp7N1hRm27hgcrB
 a2WjKe4t1EmVz9V2WPlr/auH1BXEAOzbvqfU+w+k12DxDKKfdhT3YL7X58/h5ib3IyMk
 6MB0JrqNcq8hIWtLYG3pPN8AzSBMur9SUfk/SshG62E5fyer3TF2qQTfNLeDADEbWmvr
 jrPm7KOv1CaIEaEtjF44PZn2M7/0UNYFYcUvZ6lldhVio01clyK3CKLcSU2f5mqf1sRm
 tR8Q18dDhCOIGREk6TfZDfs9Wf+Tj+jWYawptf4O3kqGyjg+W0Cg1FNOoI6AQi9XZw5G
 mFcw==
X-Gm-Message-State: AOAM533dv4tnUSgifKn6D4yt33qmoWkOHyQjOSluI8yBj3dFZt3OdfGj
 hnvyqr9hdGbCmBaZphKOfWSAkYLChIDn25TcbVQmX1AtXU+JTOMVoYcXCJ5BfIn9Mi7kzRp66Fa
 QPjgpkqDkDm6A/lhwbW0Sn05igKSZWrYkpMKW
X-Received: by 2002:a05:6402:4301:b0:418:585b:cfe1 with SMTP id
 m1-20020a056402430100b00418585bcfe1mr9566754edc.250.1647243316380; 
 Mon, 14 Mar 2022 00:35:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQjBMUwRWUV4MpFNb8hzB27BfL/O3/uSgyWyC0crEVt9Qfy2ep0MNaTkAJB5rcza+jxkL4Mg==
X-Received: by 2002:a05:6402:4301:b0:418:585b:cfe1 with SMTP id
 m1-20020a056402430100b00418585bcfe1mr9566734edc.250.1647243316197; 
 Mon, 14 Mar 2022 00:35:16 -0700 (PDT)
Received: from [192.168.0.152] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.googlemail.com with ESMTPSA id
 l9-20020a1709066b8900b006daa6015a0dsm6336356ejr.89.2022.03.14.00.35.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 00:35:15 -0700 (PDT)
Message-ID: <4f8fffa7-631a-9b87-ee0a-0fb7dc1fec66@canonical.com>
Date: Mon, 14 Mar 2022 08:35:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/3] EDAC: nuvoton: Add NPCM memory controller driver
Content-Language: en-US
To: Avi Fishman <avifishman70@gmail.com>
References: <20220311014245.4612-1-ctcchien@nuvoton.com>
 <20220311014245.4612-4-ctcchien@nuvoton.com>
 <1f5e1e49-4ab0-5e06-fa8f-2a11b0fd1df9@canonical.com>
 <CAKKbWA7Pr8Gi-rU5_BZ32y5aiLV0tSM19WkRe+zF8spWdk5zMg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAKKbWA7Pr8Gi-rU5_BZ32y5aiLV0tSM19WkRe+zF8spWdk5zMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
 Benjamin Fair <benjaminfair@google.com>,
 linux-edac <linux-edac@vger.kernel.org>, KFTING@nuvoton.com,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 ctcchien@nuvoton.com, Tali Perry <tali.perry1@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 James Morse <james.morse@arm.com>, Medad CChien <medadyoung@gmail.com>,
 Borislav Petkov <bp@alien8.de>, YSCHU@nuvoton.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 13/03/2022 21:22, Avi Fishman wrote:
> On Fri, Mar 11, 2022 at 11:15 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
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
>>
>>> +
>>> +     npcm_chip = of_device_get_match_data(&pdev->dev);
>>> +     if (!npcm_chip)
>>> +             return -ENODEV;
>>
>> I wonder, how is it possible to have here NULL?
>>
> Both of_match_device() and of_device_get_match_data() can return NULL,
> are we missing something?

I think your driver is OF-only, right? If yes, how is it possible to be
here in probe() (meaning: being matched by of_device_id) and a few lines
later do not match the same of_device_id?

Best regards,
Krzysztof
