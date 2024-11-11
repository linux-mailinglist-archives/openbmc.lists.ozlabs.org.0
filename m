Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5B39C4954
	for <lists+openbmc@lfdr.de>; Mon, 11 Nov 2024 23:50:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XnPrf12Yzz3d8G
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2024 09:50:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::234"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731316681;
	cv=none; b=UqUuFsRyNQvTRrv6Ol0zvkYZcgUh1mGkVz0yN2W6WxXLZSPzc1d+P8oRH4NwtPyrNNW7FMWqQ4r+gTeDsLnEJQVDK8YnWnwkeLUNwcOSAY7G7UuVBOnX0kuPrluj3WMIxbQXwU4JpC19Nv0HKhB7czizewvMzyLq9cHRrn1gsdjzrGueNo/VvZukKaDPJ/lc+pd7lLwcQ1C3fg2SuyBkcWskQY5FjqHXYfJUdrvSJiU1VufOnQpQzXNTdaZKjjNCtDL2zD3GSR3TXoRteFosNzuUtwEjWtTOnK+GN9OHhYfekhyAp8yKncqdfsPG+7yiSQREy4P7HQmvMgLW7Qq8bA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731316681; c=relaxed/relaxed;
	bh=SgzDV6XTYtXT/ZAEBGBUP7h48Bysqg7RCg25yVB5U/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dB6h1adbK+jxhShgdYRa2glqTUni3ZuAnwFmN7w5o8tGdGct01HIMHyYN7AhXrQbJGDPL/xLGYxt8/k8KDJzANrdbJliVkGJUXTqw8fmw8z78knJ5rQZK5ayf2baQfHg2oqyvAvnUNpTnBuCwj5dTI3aBjcrSNot1aAZeLyjs9f6AhzivwjwcEKZa5ccmn0RikeirmNDpuX80yRKM/OUjp0NeE92eyuGIY4jPpeo2ssYJ/ZbWPJ+fKGdcvQYtGCmXsUbv7GlN3ii4BGyUbLhW841x5Qf2zXnY+bDFD8SCazxh27AhNgf/7M9ASPuiUzcH3nnq60S5f/yc5QHEvLvqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aHQZMq0l; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aHQZMq0l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xn3qX19pgz2yNn
	for <openbmc@lists.ozlabs.org>; Mon, 11 Nov 2024 20:17:59 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3e60825aa26so2529569b6e.1
        for <openbmc@lists.ozlabs.org>; Mon, 11 Nov 2024 01:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731316676; x=1731921476; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SgzDV6XTYtXT/ZAEBGBUP7h48Bysqg7RCg25yVB5U/k=;
        b=aHQZMq0lsMypOfbi8GDqFms6yQkQU1HIIxUCr9Rna3u/R0YnwSk76oA86SL/RpZ3bq
         kqJlQQOECWAJFSC+/ym0CTZ/l0/W5QVRFCoa4JbLXmoOKs/pMQ+R6FXZ6VS9as7MpwAe
         gT+1dK9adonbk1dMIPUgSlLqKDT/xUdgQTGzFMPxrmg7KLZY0/sJY/M0ckvfOw++mB7c
         q0+1cwEqF4xmKUis3j0yFQ8FPmlGr7p+F4hc26xLRpQzOwuRirQbWqHYpoY/QJicDCLJ
         3SjN3FiDJ33wke3vxZ+hLJdlmYWWrmduRJpIJFImtATY1lXTfda9Jy59OeebPc96VqQw
         AMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731316676; x=1731921476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SgzDV6XTYtXT/ZAEBGBUP7h48Bysqg7RCg25yVB5U/k=;
        b=VWV8moZAE3T73Th/vpUXacgGRFeUpPb2isfnO3Lk1Z4avIrU5pYsjS2pDRG8T9HrKN
         nJRBeGBHM3v2+PERTA09xMY3qdvGtlwo0ZbZ4CoEW1KaiM6grZ5t97NmaCa9biqhHmpF
         TvX3Id2gECRP0jAXeb7IsA8MWUvak3WChIbbJ8iP5reMBx65Hn/CsPDhicHjACLHWE3/
         pS+HcNMOlNgQPVEsvE3eHJgSkE3dJiQB+mVVQQojmCZjlLaW7wFXmXw7AMEJySGRCvht
         +oq3KMaoqlYDjS2pNTMJjtKIgD7UI4G93GEZIYf7UpnNDaG2Hhd3fhZUyYNytrdBHbcl
         Xsew==
X-Forwarded-Encrypted: i=1; AJvYcCW/cK8k5G1gyJ8Q9NIAE6EGv0SudMIB/5Gj1OYLZIeVUTL+SHPg+KcShiE1eqRO0qwBrwpnLP/I@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzR5bVPT1ls7whohax7T5a6wIsBFrR+mNdB9kZGUGP6f2L6zGxq
	sReqojyZkwqyeJFibu6TFJwFSV3HzMMQ5au0d95DiHedVYhbvjPX
X-Google-Smtp-Source: AGHT+IH5XF4fHujuj+ksffR1RtxhphO0REZBT78S9uIbUEfLxCgT7hRETIpEKjykIRYtuUK5CY8I6Q==
X-Received: by 2002:a05:6808:16ab:b0:3e7:5af4:f8e7 with SMTP id 5614622812f47-3e794680de1mr10057389b6e.1.1731316676277;
        Mon, 11 Nov 2024 01:17:56 -0800 (PST)
Received: from [192.168.0.101] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f5bab50sm6863158a12.25.2024.11.11.01.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 01:17:55 -0800 (PST)
Message-ID: <cb718d0f-75a5-4720-b0c1-d8fb1f1c653b@gmail.com>
Date: Mon, 11 Nov 2024 17:17:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton
 MA35 family GMAC
To: Andrew Lunn <andrew@lunn.ch>
References: <20241106111930.218825-1-a0987203069@gmail.com>
 <20241106111930.218825-2-a0987203069@gmail.com>
 <f3c6b67f-5c15-43e2-832e-28392fbe52ec@lunn.ch>
 <21a00f02-7f2f-46da-a67f-be3e64019303@gmail.com>
 <9455e2f6-b41d-476e-bda9-fc01958e48d5@lunn.ch>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <9455e2f6-b41d-476e-bda9-fc01958e48d5@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 12 Nov 2024 09:50:02 +1100
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


On 11/7/24 21:18, Andrew Lunn wrote:
> On Thu, Nov 07, 2024 at 06:31:26PM +0800, Joey Lu wrote:
>> Dear Andrew,
>>
>> Thank you for your reply.
>>
>> Andrew Lunn 於 11/7/2024 2:13 AM 寫道:
>>>> +  phy-mode:
>>>> +    enum:
>>>> +      - rmii
>>>> +      - rgmii-id
>>> The phy-mode deepened on the board design. All four rgmii values are
>>> valid.
>> I will add them.
>>>> +
>>>> +  tx_delay:
>>>> +    maxItems: 1
>>>> +    description:
>>>> +      Control transmit clock path delay in nanoseconds.
>>>> +
>>>> +  rx_delay:
>>>> +    maxItems: 1
>>>> +    description:
>>>> +      Control receive clock path delay in nanoseconds.
>>> If you absolutely really need these, keep them, but i suggest you drop
>>> them. They just cause confusion, when ideally we want the PHY to be
>>> adding RGMII delays, not the MAC.
>>>
>>> If you do need them, then they should be in pS.
>> I will fix it.
>>
>> We have customers who use a fixed link instead of a PHY, so these properties
>> may be necessary.
> That is a legitimate use case which can require the MAC to add delays,
> but i generally try to get the switch on the other end to add the
> delays, just to keep with the uniform setup.
>
> Also, please take a look at ethernet-controller.yaml, these should be
> called rx-internal-delay-ps & tx-internal-delay-ps.
>
> 	Andrew

Thank you, sir. I will use rx-internal-delay-ps and tx-internal-delay-ps 
instead.

                 Joey

