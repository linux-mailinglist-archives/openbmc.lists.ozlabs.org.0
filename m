Return-Path: <openbmc+bounces-637-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49720B54308
	for <lists+openbmc@lfdr.de>; Fri, 12 Sep 2025 08:38:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNPrB4FPwz3cdg;
	Fri, 12 Sep 2025 16:38:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757659082;
	cv=none; b=PiVkHioyXFE8rEzcfpnaY8KlD7jY8WVk7roDePSxHaLyY8Mnf1gRBs8Od0axxU57qAM57V5j1nHoxU2HU0Np7XcS5fM5GKxWknI+4MbB1+WXTaAQ1PDwW8fLZ9VQmAgKjNitG8SPBhraPSPpL/dKoCiZYZn496G2ybrA1Eo2x0QGJ7Wc5RaFjismSla0/cnT2qqm7oyXVSKWrmWAfSTjF1Uf4zoaQ90bVydNn5N1sztNrQ1KwwgA1BdJPMWBbttZtiPWh4WwpzI1nDNZCElRcUrQdyL0LeT6jHMiC+QXxr67M9cO3wfuoffQiHeQm6ANA8+CP8NAlXtSVX3IZuIsfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757659082; c=relaxed/relaxed;
	bh=xto8/BdMWnXZvwLxhTrgCCEC4dPKlIq+s0YGwijdyO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WGjeewC8HOaFfZrkXAdEW5C5mCCVys2QqewqGw07D4tTyiPp//kUrNIX/SxXlN/eKKSsWRzI8Mzp3UtsKJCYTMuhLkY2nwaTISGyT3lOo2DVcln0Hi5OOrNUS3TTycX1YyiXlPf5i3lQteov0/sKr3++3SrBxtw+wBHEFrLONT9wcB8iy2Ko/M+u1CJr34AOmrwQ9im/VGcljOLvcmjxWy+xnURgnyKhN/pqOqs3F18tqcPRFlyCmEXLrxG2mxO6GbaFHxYEBzRODwhNJtP9Hy8vYkakXTrrNKaibLpq0uXYPOipfzLKRbxaYgz2FQWh0jSg844/yEYTqzC+uNehGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MkOArNCD; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MkOArNCD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNPr94YH0z30Vl;
	Fri, 12 Sep 2025 16:38:01 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2943D4344D;
	Fri, 12 Sep 2025 06:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 647BDC4CEF4;
	Fri, 12 Sep 2025 06:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757659079;
	bh=FoKfA+Ido5KJFJFtC9Cz3p8xOCs463YOvLfdHV84F2k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MkOArNCDNfzMto9SJgAlT1LbW6DrUzhR2Og1Vjjfeu4YpaG4uOkCA0ELSDBCDOGyn
	 wlzWq24sAELOx8iUeu0ez1jPuKjprH+fVF9lwvegPO149q27ItPoKlXoo12JE2Dqca
	 oRm5/dkfdXUSHiJCYIp8MnZFRiVrigz6eXotiwSc0zbv9A35MoKHQJO4yN/xpGoa0Y
	 JUGo0J2O0g550qO/X0dqEG1Ug5RASlGHkasJt7ZHntSl4mQ7hrcWkQYaIM3r/ul4Yg
	 kIppaAN8Hg8RtTppWTA8vMlguYABqMXtBL5DJQQvmcgMTfmOVLuEz/eFmTmeJhpXdh
	 Of5GMaKRdneJQ==
Message-ID: <6feb419e-ee3d-4573-8820-19c70acdb426@kernel.org>
Date: Fri, 12 Sep 2025 08:37:53 +0200
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
To: Jeremy Kerr <jk@ozlabs.org>, Ryan Chen <ryan_chen@aspeedtech.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Mo Elbadry <elbadrym@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "joel@jms.id.au" <joel@jms.id.au>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
 <OS8PR06MB7541C3B70B15F45F4824772BF2D92@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <994cb954-f3c4-4a44-800e-9303787c1be9@kernel.org>
 <SI6PR06MB753542037E1D6BBF5CE8D2E7F2A42@SI6PR06MB7535.apcprd06.prod.outlook.com>
 <4523caea-3406-4de0-9ab5-424fb7a0a474@kernel.org>
 <SI6PR06MB7535BAD19B51A381171A0E64F2A42@SI6PR06MB7535.apcprd06.prod.outlook.com>
 <8e8aa069-af9f-453f-9bd0-e3dc2eab59ab@kernel.org>
 <OS8PR06MB7541FD8691B43EA33BDC1D22F2A72@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <99053328-a117-493e-b5f3-00902669c8e7@kernel.org>
 <44ef5c93448a3625fcfd003b47a516e8ba795b62.camel@ozlabs.org>
 <f9fc4b59-bdcd-4983-b7c2-0fec94e62176@kernel.org>
 <52943e49aaea7bb6def5bc51dfd57392b6ae66e4.camel@ozlabs.org>
 <OS8PR06MB7541BD362CE9FC0AA3CFC46CF209A@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <3fdee5330d91b5d18a69a311e4df6de874973ced.camel@ozlabs.org>
 <ecefaed7ed0fe83442021c0bfee0a49111269aad.camel@ozlabs.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <ecefaed7ed0fe83442021c0bfee0a49111269aad.camel@ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11/09/2025 11:03, Jeremy Kerr wrote:
> Hi all,
> 
> After a bit of a chat with Ryan, some updates on this:
> 
>> The question was more: it sounds like you're switching between
>> *fundamentally different* hardware units with the mux switch - not just
>> a different register interface for the same peripheral hardware. Is that
>> the case?
> 
> Turns out: no. The controller core is the same, but what gets muxed
> in/out is more of a compatibility interface. This provides an
> ast2500-like register set to the ast2600 i2c peripheral.


If you had two separate bindings, how would you represent it in DTS? Two
device nodes, right? That's confusing, because there is only one device.

If the device can present or change its programming interface, it is
still that device, so still one binding for it. And that device driver
will handle both (or one) programming models.

I remember now the problem we talk about, but I don't get what exactly
you want to solve/discuss. Anyway any discussion should be about newest
patch, not something from February, so if you still have concerns please
raise them at v18 (or whichever version is now).

Best regards,
Krzysztof

