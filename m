Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 780BA9624E3
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2024 12:27:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv0wT3s2gz30Wh
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2024 20:27:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724840846;
	cv=none; b=jkIvbiag8UBHTfyWdnQ/58PZBjmeWQJx915WrL1VhKJlqch2mD33CFgCRCFe9C2iHlb+J6hhaoCZ9uQAjCcUHboCqEs5LkJ/AAJXrc7gwVod61gHyU0ew9rwL2Wr03uOy7z+zonorLgLVNXMdvvvykfHd4BcsfcobRGKei6PKL1lMmSdwXDgvRxukXIgiNHe5xPLcFwBwoHhnKie9Yi18+Bd1m84KjeDR6ADrGeKU2rVBxhK44BPp6Z2/2FRZVBjewcOoVFanCewaQVo/nE7hhkH1j5Fy6TQnRAG+GvmJOAQMm75F5+rraBRqVsffbqPIQX+6yXj1qDXm1xP/aLZnA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724840846; c=relaxed/relaxed;
	bh=9olwBJDt0RqDFwYls01bbi85T6s6g+I7LbBSH4MlAjo=;
	h=Received:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:
	 Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding; b=frr3h6GNg2FOYMwLLgA/1mLjy3DtVkQW/NP9ItPnsiXSd045Lu8CVDXHiEhLqth5hXRZ/tBR4Lm/qZFK8Xf2pInPdRbJYL8UDBBWo7SozJeGzzvPUeECWro2/IhCDO4lHmd1WaK2uMVLjr9TdcWBJj3umWsHSxKMnTTvUH91QbDAIuHnKdho1WFLWag3QXLbBtSpdmeHYUwpDqU5QXvKSTyf78zcxk7Sw2qaew0KZDwSQHjAYvGkT43/NRgplLQRtPa0t1rnUTrmCsa2ke4xPZLQlzBjleX1xOZkrieEyUtgMb+g79/JHi7m79EDE5ojOh+rABXEr6Yi1ny3U1vuSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dAGLj+IR; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dAGLj+IR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv0wG0zqHz2ygZ;
	Wed, 28 Aug 2024 20:27:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 90544A434C4;
	Wed, 28 Aug 2024 10:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59685C515A3;
	Wed, 28 Aug 2024 09:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724836258;
	bh=4wjsCstqQZZ/e4H4a4DtBSqr+93zTZjzDFUyeOtQ3Ac=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dAGLj+IR7aLFNJhsGX3eoFhoosVgIUZyVEoWteFasKTgp0e+ZwXSSb43FFYAeFMP/
	 5MhW+Z5/pImqftHjK+DTTly4Cb6k1AHg+0LaCXNC0DRYMecxfALg+FEfN/xEOV54BH
	 baDqbZPA/LxJraY5PIeSLrl2VALs0zLZ1HQ6caDBPRaWZGTBRUx7tuMKhmU4PRxsuV
	 HztmIlx9un/9NVq13F/5mBH1D+39Dlui9znn78rCLth8PYXdr0KGZEYBOesi2qW1n9
	 akMlK0pv38zuihRWnV4a1TR44jZ6B++0uuGhhr2xmeyNkE1XbO1Z5qtbZPyWYVVZo5
	 qtOAocZIeXcfA==
Message-ID: <8908eee4-d3a4-4d15-a68e-d0937bbca9f0@kernel.org>
Date: Wed, 28 Aug 2024 11:10:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: aspeed: Add aspeed,video binding
To: Jammy Huang <jammy_huang@aspeedtech.com>
References: <20240819080859.1304671-1-jammy_huang@aspeedtech.com>
 <20240819080859.1304671-2-jammy_huang@aspeedtech.com>
 <nnjcjt2kuplsy5bbxujuubkn2xdtpifjeiqt5qfvktdmaorzuz@x444p5ezcoch>
 <TYZPR06MB6568AB9E260263DBB1ED474DF1882@TYZPR06MB6568.apcprd06.prod.outlook.com>
 <a17f963e-0e6d-4132-817f-2e663268ee2d@kernel.org>
 <TYZPR06MB6568A38AD08F72EC637EFA7BF1952@TYZPR06MB6568.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <TYZPR06MB6568A38AD08F72EC637EFA7BF1952@TYZPR06MB6568.apcprd06.prod.outlook.com>
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
Cc: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>, "andrew@aj.id.au" <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "eajames@linux.ibm.com" <eajames@linux.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 28/08/2024 08:05, Jammy Huang wrote:
> Hi Krzysztof,
> 
> Sorry for the troublesome e-mail notice. We have informed IT to remove it.
> 
> On 2024/8/23 下午 02:13, Krzysztof Kozlowski wrote:
>> On 23/08/2024 03:11, Jammy Huang wrote:
>>
>>>
>>>>
>>>>> @@ -0,0 +1,81 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/arm/aspeed/aspeed,video.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: ASPEED Video Engine
>>>>
>>>> ASPEED or Aspeed?
>>> I prefer ASPEED.
>>
>> What is the name of the company? How is it called in all bindings? Is it an
>> acronym?
> It's ASPEED Technology Inc. You can find brief introduction here, https://www.aspeedtech.com/about_vision/.
> I did check it in bindings, but both ASPEED and Aspeed can be found.
> If you have suggestion, please let me know.

Keep official name, so ASPEED.



Best regards,
Krzysztof

