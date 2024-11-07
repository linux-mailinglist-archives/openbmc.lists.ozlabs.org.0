Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD119C1205
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2024 23:52:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xky451RCyz3vYf
	for <lists+openbmc@lfdr.de>; Fri,  8 Nov 2024 09:51:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::430"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730975497;
	cv=none; b=iv+psTrvn7DzjBhNNjD+Ywq6wLOjIfRfTTq9rgD+hkAQOUYZmX7VXloHsDX+ViLqldXyd1ks1jHD4WQsJqlPd5WDmYn2vIyo3tUH2Kihat1yXz0EshZvT0D8NWvcZMC/XdAEzBWUBcQqp6xxjRdS3icvSTAqivZoVj8v1YMvyPjY7kZYX3eHFM36mOXbq5hp5LTyU3w/eoNyGyxdS2bSYFXL5V9mAMdaujHUl+/Cg7nyXGS1p0GP5UfllscpeCUmwOeHkRbJL10sjrXl2nQ3TWd2YcGgzpEXRO37Gxgf/sQiT/CmcRQyHDNW/GwD0+GlQYZtmvAV6CwSn/ZVgZxmTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730975497; c=relaxed/relaxed;
	bh=YkraiRUrks+s5pcHcVdDbNI0v0htZdI4Vc5A2KCgS+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nn0F0LomasRdnP/axAzsXUNzEGSioFQ7seCryiwlkwqH6LvV6iPTFGdLpuaTo9FDDQ2miLFZVC/8o8TVEhI4jnB/0zBneH2YARfuwJehf02SwepyOWTO1nWYm7mBd3y3JhDL6rHR1NEQSXZq8bMEAxb/Z7xs25TBcUXAVnGtoTcUwzxVmlkTUB1QB5qC5GYJEXSVzIJZyEUT9H6ltVAgZwog+C/QLDGvH+2Qiu4J/TjDtdd84gUJqLGHlG1OOqDZ0SX4NwLByJd1InPdrz8c9Jo/ZrlBEidFXVENit0ykrfCXrRO+NkZswSOzKsdbT1ID779GxMe/g5ZZwcz48DITQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T7OCsHfl; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T7OCsHfl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkdfH4XDjz2yV6
	for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2024 21:31:33 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-71e681bc315so604357b3a.0
        for <openbmc@lists.ozlabs.org>; Thu, 07 Nov 2024 02:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730975491; x=1731580291; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YkraiRUrks+s5pcHcVdDbNI0v0htZdI4Vc5A2KCgS+Q=;
        b=T7OCsHfl8qChqXyxnXytIpE79awE3iUOipnDGTyi5mAw/f30VJQfGy4nhxfbn56o9Q
         p1UAQa1L/h0N3kCwvBMMjv6/m4wTKVZMPonrZfUFYJOKj7/3YPOBYKRdp99yILh4S5Se
         hbDHpknCRw4wWcvR06e9Am7qf/siAkgz1G8xlcqG/O/Mm9kIKvCZNLFR/Pt/8LucfyWg
         zdKXF0U7V+ksZ1sxCbkcouhJvlbD8PUpMVEv2PjwpZP0FW6uj5d8boTIIoVMNCdN/Swh
         848H+Ji9SkUPGadhB7C45+7mzwcqI8vDtOSFC/dt7bXCOLm6rzs/UdQk61AaWFjIRdvP
         K+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730975491; x=1731580291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YkraiRUrks+s5pcHcVdDbNI0v0htZdI4Vc5A2KCgS+Q=;
        b=sqklWnCwIVz49YM0JMRrfuMakkNixmy6PFjgXk5URzfWVQ4ucRj7lUWG+ZQ4pNVncn
         1Kgmr2CD4KGUQ8dyvLsrhomACdqx5tLGAiwSr+M/TxKmxvibvx8gdSM/4d2zk41EN6KI
         RaQkFWUHwthlE8yR/8wxXB6AKCh329/zs1QB8gTbPHOOCZfmt253OodbBgY2kipVC+Sj
         aRLGPH4PVMsHPpDrsDanfsQonN7LhILL9yb2F+9gDVg6zvJWwNdKRCJZPHG1rss04Q5Q
         gJxhvsiaOwNmQq2Li1j+z8LMqGGuwujY5Czxd0yY47gVGeD7rqwJrKTLwPiSDpQJh3Go
         Mm5g==
X-Forwarded-Encrypted: i=1; AJvYcCXtlZPGEuaiKiNKZvqz9iI3bVg+ZbdjdvRVbmKgB6aYM3KFMvEF8z/cI5xUvXQWh4TMbQdtnDx0@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyzyDE/8a+6AgNh1ohdcdAhn5ezz9do7OeyjcuRRwU3Hwx0bh0B
	jl1y7tEWB7uwGn9eVZiO/i7GIQwG5kplUPItwioZlaoRPcHF46Yj
X-Google-Smtp-Source: AGHT+IGNwXAlJHaBXrnsGeXwGA4utGjnJr02l8IicuB7Vk/ooEjnqYAWwWmqFY6U2v0+nQynuABSkQ==
X-Received: by 2002:a05:6a00:3ccf:b0:71e:60d9:910d with SMTP id d2e1a72fcca58-7240c8b7bbemr916513b3a.6.1730975490635;
        Thu, 07 Nov 2024 02:31:30 -0800 (PST)
Received: from [192.168.0.104] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078609ddsm1196578b3a.22.2024.11.07.02.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 02:31:30 -0800 (PST)
Message-ID: <21a00f02-7f2f-46da-a67f-be3e64019303@gmail.com>
Date: Thu, 7 Nov 2024 18:31:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton
 MA35 family GMAC
To: Andrew Lunn <andrew@lunn.ch>
References: <20241106111930.218825-1-a0987203069@gmail.com>
 <20241106111930.218825-2-a0987203069@gmail.com>
 <f3c6b67f-5c15-43e2-832e-28392fbe52ec@lunn.ch>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <f3c6b67f-5c15-43e2-832e-28392fbe52ec@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Fri, 08 Nov 2024 09:50:58 +1100
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, netdev@vger.kernel.org, richardcochran@gmail.com, ychuang3@nuvoton.com, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com, linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com, schung@nuvoton.com, kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net, yclu4@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Andrew,

Thank you for your reply.

Andrew Lunn 於 11/7/2024 2:13 AM 寫道:
>> +  phy-mode:
>> +    enum:
>> +      - rmii
>> +      - rgmii-id
> The phy-mode deepened on the board design. All four rgmii values are
> valid.
I will add them.
>> +
>> +  tx_delay:
>> +    maxItems: 1
>> +    description:
>> +      Control transmit clock path delay in nanoseconds.
>> +
>> +  rx_delay:
>> +    maxItems: 1
>> +    description:
>> +      Control receive clock path delay in nanoseconds.
> If you absolutely really need these, keep them, but i suggest you drop
> them. They just cause confusion, when ideally we want the PHY to be
> adding RGMII delays, not the MAC.
>
> If you do need them, then they should be in pS.

I will fix it.

We have customers who use a fixed link instead of a PHY, so these 
properties may be necessary.

> 	Andrew

Thanks!

BR,

Joey

