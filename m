Return-Path: <openbmc+bounces-14-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AF5A9E44B
	for <lists+openbmc@lfdr.de>; Sun, 27 Apr 2025 21:02:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zlwv24fkHz2yNG;
	Mon, 28 Apr 2025 05:02:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745780558;
	cv=none; b=cPxjG8xDQoLVPCOl2PeRwBTH1nPf5JL7HYfMpk+0DgHY47camOjAkqa67yV+luz8s0/CHGsycAeSPp6jvXm+uby7Y8T9qe5X00XTlhavhWDd3ZQBPcpoNk9dSTzj+wJI8+ISIMTE64HBswlAbTNxUNkbw+qNE5yWWYXUlZR4tfPvSodL52nrXtD4q+zLcYY79glaTxEk4zobzdjVqF1YyyMDj5cRSXB0qSXbvnMj+6k8ft+sQlWMx5uVPK+Aempcq6hnJ30H0pkRWcGhCaNg8hhnjHFrhFoKseWVwRBrhIyxw3STI59yzW3MGkk0tAu8bK/9fCTjw5kgaclzT3JCzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745780558; c=relaxed/relaxed;
	bh=PEeF4SjYCfv0yFMQNVz1Moyd5z7aaD2CZmNo1aGxrV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qtj/QtczdFPwaiNnaA1S0waK0fY4fkdExkaY6INsPmsXgTT34HnTb2k03VbioHKlj77SqM7/hNnirkBBzB9r7KMXHYzQlNiBJLspDUKw987Z/K5ECLu9Xo3EUMk/pIxw3vym+HVzWs7yhOBoygMV+cOS00mZOiiXwKllieNFxCOkwMMBrIolze/j976AL3Tum/bBVAVrgQXfj/CE5oaOx5jErN2hPZ/Pnv26ly7ovLyupn+5dP0tzGoGexOsCAzfA8Grpsn99d3ToS7V7gl5vGfqWdEyuoWCHoy/Te5ty2pJ1AUGtGRUF5BeLvCwsZj7wUQTvwMG4j5nwM1dT3V2pg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KLf+t2h3; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KLf+t2h3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zlwv12qFPz2xxr
	for <openbmc@lists.ozlabs.org>; Mon, 28 Apr 2025 05:02:37 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D36E9A403DE;
	Sun, 27 Apr 2025 18:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D722C4CEE3;
	Sun, 27 Apr 2025 19:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745780554;
	bh=R8tOTglTl8ZwDIpzs55Bm4A/NsGF97weBUTxT59Zeao=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KLf+t2h3Wf9Etv4/OzPqw3E0joZD0wt9h9wHqV0EWwlPAJIih0n0Jg5gWuYJk3Z6q
	 JYBaH6PPtNmFYG3LvFsFfi3/2Nofz0otGv6nwQHkz8Isx2ZhE7I3mOain9faTW3B5L
	 GIJaxywty4yY894+hq1+2IVHe7GEaP+b+bWcMLqmRcJFlmHls/4iSCvmrDgDGtiUPG
	 I/E/FV6zJdBv5HxKoriByZ3w2ke/YbL9Tow8xF3Pn+0ljIzW02U/QBBnc1C73+6pso
	 7i0H9CflQY6y9kxidrPJN3SXkgnPLux3jQ06E5CV68eimo7WxHwIuCcKGaLu8D4ZCM
	 XdAPGU31k9+tg==
Message-ID: <364cb2a9-af29-4952-acca-59b9c2d73267@kernel.org>
Date: Sun, 27 Apr 2025 21:02:29 +0200
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: nuvoton: Add EDAC controller
To: William Kennington <william@wkennington.com>
Cc: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250416001350.2066008-1-william@wkennington.com>
 <9dc96af3-239f-4cb6-b095-875b862be493@kernel.org>
 <CAD_4BXhMs4sopska1=czqWDM8nY6gswXv3LBeUGNzFWn1+7V8g@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CAD_4BXhMs4sopska1=czqWDM8nY6gswXv3LBeUGNzFWn1+7V8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 25/04/2025 23:23, William Kennington wrote:
> On Tue, Apr 15, 2025 at 11:53 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 16/04/2025 02:13, William A. Kennington III wrote:
>>> We have the driver support but need a common node for all the 8xx
>>> platforms that contain this device.
>>>
>>> Signed-off-by: William A. Kennington III <william@wkennington.com>
>>> ---
>>
>> You just sent it, so this is v2? If so, then use v2 in subject (see
>> other patches) and provide changelog under ---.
>>
>>>  arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
>>> index 4da62308b274..ccebcb11c05e 100644
>>> --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
>>> +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
>>> @@ -56,6 +56,13 @@ clk: rstc: reset-controller@f0801000 {
>>>                       #clock-cells = <1>;
>>>               };
>>>
>>> +             mc: memory-controller@f0824000 {
>>> +                     compatible = "nuvoton,npcm845-memory-controller";
>>> +                     reg = <0x0 0xf0824000 0x0 0x2000>;
>>> +                     interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
>>> +                     status = "disabled";
>>
>> Why is this disabled? What resources are missing?
>>
> 
> I was avoiding enabling anything would not be used in the most minimal
> kernel configuration (Kdump). Anyone actually using the EDAC data from
> the memory controller could enable it. The np]cm7xx common dts also
> has this node disabled, so it would be consistent with that SoC.
DTS is nowwhere relatd to your kernel configuration, so that's wrong
assumption and wrong goals. DTSI should have disabled only devices which
need board-level resources. It seems not the case here, so drop it.

Best regards,
Krzysztof

