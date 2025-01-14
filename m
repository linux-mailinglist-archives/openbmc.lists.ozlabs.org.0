Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2DFA1140B
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2025 23:27:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXkJw0D2Vz3d8t
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2025 09:27:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736851018;
	cv=none; b=M2vUy/FXDrNYd8/mT2qzvJUxp+OKAkHqWlbMh0lxvwWWm7ll2wpWS84Y/P9eywevFZMmjwSaMVJDIpk4S5M0Bs0JM9ZbXQS7JEvQ37nQA0g4U7ZxENFelHLWOnBHbvAHqE9sTOaR/yYOGKyHLlYEuDFMZB48b4iJmB509yzR01plfX1v+lvrRc6iAE46GL9F/l1fkL43Kj2cFETMNa90EwEIQysTqO3/c/7QBicFDBnHxGIzbghKSZApt4ytN97DVsBsdJlWTiebQXygN1Ucp2x90TMu1yn554rKODsdr0oJgqJXBVBEL9UaFfJdBVRFirlu2QV0mtJKSPFebkqoPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736851018; c=relaxed/relaxed;
	bh=GA/Tg/7baXnKm3SwQ55FP1056nxIRWPWVHxeGnzfrOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kOXlUIPoPHncW4KY48+xzoxSEvdnkNAMOAVFKxfQrEhLbDfdSlPfGWiNMnXaQFoBQqv9V/QBOpnJ72kHcUpkoDVR66V4Ao2WC6CgZNFZjjlXU1oZ4skeiuZzXOGDq008jBQRPM7kYzxZgHBgvHR/sPduhOwWRypX4cqgBnMQtKCYkdQRZ57IgWNd77Q/NMb2BR0QK6bz/9Wi8qix1c97ycMriSd0PWZiRyezR8SdJK9h/o42A+dOUOLYDRgPK4h7Fh4J5ugwBsWDmmZMOP+vFLzI4wl1QTQO/+vvBayRT9F/IVoqQPVgCIyIVA9qtQ2r7NhJndos55gUUvLMcrnNLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=91.218.175.172; helo=out-172.mta0.migadu.com; envelope-from=si.yanteng@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.172; helo=out-172.mta0.migadu.com; envelope-from=si.yanteng@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 388 seconds by postgrey-1.37 at boromir; Tue, 14 Jan 2025 21:36:50 AEDT
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXQXy3qtpz305Y
	for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2025 21:36:50 +1100 (AEDT)
Message-ID: <52dab677-6ec9-4ae2-803f-1a2a34c32007@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736850599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GA/Tg/7baXnKm3SwQ55FP1056nxIRWPWVHxeGnzfrOw=;
	b=jwbL0GKCIehF3M3xckD3cBWjbhPRCEMzEavXLyL4y5L/V94tF6HT1FTrRQweF3EOUCan/A
	I0YTwI/haTiPydzelWmoiRk98CTdR5v6/A0FuXJWBHVFOuU12WncAKnqTr1P9VhNwz8t3r
	8yED/ivhpv/jPtwP6yHQnDJynDt7+jw=
Date: Tue, 14 Jan 2025 18:29:47 +0800
MIME-Version: 1.0
Subject: Re: [PATCH net-next v7 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
To: Paul Menzel <pmenzel@molgen.mpg.de>, Andrew Lunn <andrew@lunn.ch>
References: <20250113055434.3377508-1-a0987203069@gmail.com>
 <20250113055434.3377508-4-a0987203069@gmail.com>
 <a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de>
 <e7041d36-9bc7-482a-877d-6d8f549c0ada@lunn.ch>
 <d9fc5212-9710-449e-90b9-a195305d990f@molgen.mpg.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <d9fc5212-9710-449e-90b9-a195305d990f@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Wed, 15 Jan 2025 09:27:24 +1100
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

在 2025/1/14 10:21, Paul Menzel 写道:
> Dear Andrew,
> 
> 
> Thank you for your quick reply.
> 
> 
> Am 14.01.25 um 21:16 schrieb Andrew Lunn:
>>>> +#define NVT_MISCR_RMII          BIT(0)
>>>> +
>>>> +/* 2000ps is mapped to 0x0 ~ 0xF */
>>>
>>> Excuse my ignorance: What is ps?
>>
>> picoseconds. An RGMII link needs a 2ns delay between the clock line
>> and the data lines. Some MACs allow you to tune the delay they can
>> insert, in this case in steps of 2ns / 16.
> 
> Thank you for the clarification. Maybe it’s my English, but I didn’t 
> deduce this from how the comment is worded. I do not have a better idea 
> either.

Hmmm, how about:

2000 ps is xxxx

I checked the kernel code and it looks like
folks usually put a space between the number
and the unit.

I looked into the rules of a bunch of publishers
again. It seems like there's a rule about putting
a space between a number and a unit, but when the
unit is a symbol, that's an exception:

space:

10 kg
10 ℃
10 h

no space:

22°36′48″N, 114°10′10″E


Thanks,
Yanteng
