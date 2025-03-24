Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 553D6A6D904
	for <lists+openbmc@lfdr.de>; Mon, 24 Mar 2025 12:19:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZLrCp5MQfz3bxM
	for <lists+openbmc@lfdr.de>; Mon, 24 Mar 2025 22:19:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742815138;
	cv=none; b=hSnNspDRSx/RaNQhO584JOSpIeem2Eno19VWr+gmGtIdXn0HjBnGMjm4QXP1MeSUapej1zl82RfQt1LrC0oWh5JcnlOYb1v2YTaxoyb9+nB9TNQ6M8Wg2mIOSfrxkmmtOv9BHb3RqYwXuW11DRxjssg/fiDDkO/lf0ceLlR/mjgMHsL7vQMMrvBz6b4NUAnII8Wi6x09vwNF0KAFtG5/DF5Dcprrqacb9MY/DE89vFJ1mqQPYK3jiDcrn/Ahu06DnBxdsm8l534dVMFtgLIX/muvtEsL3TcSTUKcdKXjHwQ6gpqOtNi/+zKUDEIusOFgmCNLDU+jUSer5j2WBp5tqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742815138; c=relaxed/relaxed;
	bh=Pw0cEx6IsTGG1uYMGo+yYjZIxkwqft8G5guZsdJe3Cc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lliPzF+6h7wWVxxBMG0j39mnJF5BbZrv4IKDEBEKxwSXUkT7bTSHPFkvZak6sGy+ZZAzSDcCG59/DPdsv3e+afe1CPIoL5ENscK3C01uf8VjCbV6KFs+dAq8CdaYn9pp//mA/gGlFdJ4v0LSn9+2R85poYVkR9YWk8Ghn4ueXNvTRoyZ4Ob2UW4CX2tQEHjF4TSNHsdemfx+FuAiCUgeY77s76lFQqtRhdlTALbJMAyBb26IAOYKV+Zlabrznks34Opvem3jEGwxeic3UMolxx1TiJD0x4EH9lzc6qrd8jxwiADmHtOL8yMr1bdbF5c+aICVWDEwtxvfFo6OMEvazQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mGmp2VpL; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mGmp2VpL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 489 seconds by postgrey-1.37 at boromir; Mon, 24 Mar 2025 22:18:57 AEDT
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZLrCj53ysz2xxy;
	Mon, 24 Mar 2025 22:18:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B9CEE43453;
	Mon, 24 Mar 2025 11:10:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66A7C4CEDD;
	Mon, 24 Mar 2025 11:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742814643;
	bh=z/Ldx6B4r8X95UnmP5VrbMIGre4B2pHGjVaFENYqI+Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mGmp2VpL+bJHTYiKFd6rCDqOfHFlHCpcIILSGQMUmBZ/7Rk8fDaeb8zraEfCIWnH1
	 RwWJwcoM4nIKt4+KeJXMVvLqLT+sau5LzLG4HJdzTn0iNezKexA5TX6lnSIS4uE0eh
	 9abFfUDPMxVWMCxgM7UpWZWU9w3xG8FOhCN+Hj4u3fFJfxTYZsMsyHChrK9wA3XoxH
	 VcKulpzR9Uan9efDdJ+NsLFTviInfXc40t7KqMIrGkgLm6Y8nzir/iwmsmSB3L+xyn
	 qUwuQesncTg+Z+i0fLVLhT/nGFITyfiu8MKIDoV2Q+GPoIz5AcVnadvNb8OgTm3J0p
	 HMuDU5vyQcPkg==
Message-ID: <8e8aa069-af9f-453f-9bd0-e3dc2eab59ab@kernel.org>
Date: Mon, 24 Mar 2025 12:10:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
To: Ryan Chen <ryan_chen@aspeedtech.com>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
 <20250224-arrogant-adventurous-mackerel-0dc18a@krzk-bin>
 <OS8PR06MB75415E95342F26F576B5CF8AF2C22@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <50327725-f3b8-4a8b-94a2-85afccd2868a@kernel.org>
 <OS8PR06MB7541B0DBC64B3EF6838DFE74F2CD2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <d1b184c5-84c1-4d76-a1d0-a9f37f1e363c@kernel.org>
 <OS8PR06MB7541D1D2E16C5E77037F3BB0F2CB2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <069b9fe4-c54a-4efd-923e-1558c59fe3f4@kernel.org>
 <OS8PR06MB7541C69AB8E6425313DA8606F2DF2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <677cb075-24ae-45d8-bfb4-9b23fbacc5df@kernel.org>
 <OS8PR06MB7541C3B70B15F45F4824772BF2D92@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <994cb954-f3c4-4a44-800e-9303787c1be9@kernel.org>
 <SI6PR06MB753542037E1D6BBF5CE8D2E7F2A42@SI6PR06MB7535.apcprd06.prod.outlook.com>
 <4523caea-3406-4de0-9ab5-424fb7a0a474@kernel.org>
 <SI6PR06MB7535BAD19B51A381171A0E64F2A42@SI6PR06MB7535.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <SI6PR06MB7535BAD19B51A381171A0E64F2A42@SI6PR06MB7535.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Mo Elbadry <elbadrym@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 24/03/2025 11:01, Ryan Chen wrote:
>> Subject: Re: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
>> AST2600-i2cv2
>>
>> On 24/03/2025 09:30, Ryan Chen wrote:
>>>> Subject: Re: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
>>>> AST2600-i2cv2
>>>>
>>>> On 19/03/2025 12:12, Ryan Chen wrote:
>>>>>> Subject: Re: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
>>>>>> AST2600-i2cv2
>>>>>>
>>>>>> On 17/03/2025 10:21, Ryan Chen wrote:
>>>>>>>> Neither this.
>>>>>>>>
>>>>>>>> So it seems you describe already existing and documented I2C, but
>>>>>>>> for some reason you want second compatible. The problem is that
>>>>>>>> you do not provide reason from the point of view of bindings.
>>>>>>>>
>>>>>>>> To summarize: what your users want - don't care. Start properly
>>>>>>>> describing hardware and your SoC.
>>>>>>>
>>>>>>> OK, for ast2600 i2c controller have two register mode setting.
>>>>>>> One, I call it is old register setting, that is right now
>>>>>>> i2c-aspeed.c .compatible = "aspeed,ast2600-i2c-bus", And there
>>>>>>> have a global register
>>>>>> that can set i2c controller as new mode register set.
>>>>>>> That I am going to drive. That I post is all register in new an
>>>>>>> old register
>>>> list.
>>>>>>>
>>>>>>> For example,
>>>>>>> Global register [2] = 0 => i2c present as old register set Global
>>>>>>> register [2] = 1 => i2c present as new register set
>>>>>> It's the same device though, so the same compatible.
>>>>>
>>>>> Sorry, it is different design, and it share the same register space.
>>>>> So that the reason add new compatible "aspeed,ast2600-i2cv2" for
>>>>> this
>>>> driver.
>>>>> It is different register layout.
>>>>
>>>> Which device is described by the existing "aspeed,ast2600-i2c-bus"
>>>> compatible? And which device is described by new compatible?
>>>>
>>> On the AST2600 SoC, there are up to 16 I2C controller instances (I2C1 ~
>> I2C16).
>>
>> So you have 16 same devices.
> Yes, one driver instance for 16 i2c device. 
>>
>>> Each of these controllers is hardwired at the SoC level to use either the
>> legacy register layout or the new v2 register layout.
>>> The mode is selected by a bit in the global register, these represent two
>> different hardware blocks:
>>> "aspeed,ast2600-i2c-bus" describes controllers using the legacy register
>> layout.
>>> "aspeed,ast2600-i2cv2" describes controllers using the new register
>>> layout
>>
>> Which part of "same device" is not clear? You have one device, one compatible.
>> Whatever you do with register layout, is already defined by that compatible. It
>> does not matter that you forgot to implement it in the Linux kernel.
> 
> Sorry, I still can't catch your point.


I repeated twice "You have one device, one compatible.", provided few
more sentences and if this is still unclear, I don't know what to say more.

> I separated the support into two drivers:

I don't care about your drivers, why are you bringing them here?

> i2c-aspeed.c for legacy layout, compatible "aspeed,ast2600-i2c-bus"
> i2c-ast2600.c for the new register set, compatible compatible "aspeed,ast2600-i2cv2"
> Do you mean I have integrate into 1 driver at i2c-aspeed.c ? can't be separate two driver?

What is this patch about? Bindings. Not drivers. Look at email month ago:

"All this describes driver, not hardware."

Why are you keep bringing here drivers since a month?

Best regards,
Krzysztof
