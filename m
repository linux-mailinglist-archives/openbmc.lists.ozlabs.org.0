Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C125C88FE23
	for <lists+openbmc@lfdr.de>; Thu, 28 Mar 2024 12:34:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dljgceTU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V51dx3f9Fz3vZy
	for <lists+openbmc@lfdr.de>; Thu, 28 Mar 2024 22:34:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dljgceTU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=manojkiran.eda@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V51dN2PS9z3dXb;
	Thu, 28 Mar 2024 22:33:42 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5d8b70b39efso655950a12.0;
        Thu, 28 Mar 2024 04:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711625618; x=1712230418; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+kLanRBlqX8HlhHJd1EuboE4CdfDSblPAQpGFR2UoHI=;
        b=dljgceTUK0PS7dI7b5JzJdNymZTx7jIczpCOuQEx6bBP+RdNFtjOYQZTJDLPavTy2O
         vsXKKT8AZPJWBfEPqVpgwwohMrrjxWDXsZw0xgXz2eMufSmEjoCzIKvv+kT8vJ1UzSWV
         bqw1MDkXb7+2TrYFoTklGED45NI4DEKlKKfyRL5nbobwh1tFwML7UCWkNTKABuR1+0Rp
         ccjtKndF5GUl6sj8bmZDD8pSlPxLz77sS1yP6yaZJpQXqkyku3rClDa4dcygPwUuavpD
         gQGBkaVIs4jn9U922siuNC0TRpJpnAce6zEweoNVNTOqXtTHYK5H08Te4h+3CslJbDXD
         Y60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711625618; x=1712230418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+kLanRBlqX8HlhHJd1EuboE4CdfDSblPAQpGFR2UoHI=;
        b=ldwRpf+hfTHPJis2X7QRDttZ+F8P53eXevel/IPkSIfa0ZcOfi28cST4jX7GZL+07i
         d+XMAUHXQUAtRSVkIvhupzPpvFHKfjpRhnp1Uins5WD5smxCwBn8rGElqlvULsS6LbdO
         G9ma3ib0VRN3xiWTrf75Scouke+QIjf9eQ8PApKYdU77msNNbTus3lsiUfbQNUcZ2Z4k
         VkWAaEL/6yKL43JQFg2vO8etK0JT5+ROo5sXC7eY+Jivs35nF5odUjy6qiF0e9K9AgSj
         jhyW4zuf8+Dg//7OWW1RXJ9TXVcB8GxR4jvZAyJcPdPPMnO0wpmmx/2q1kHmk9+/Mee4
         1+7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFSOMK505XZy8pyxHmD5KKT1D6eaHNmWj3d7tA14MVurSehJUizxds3uxTpwrx+Ex61nW4v/1A+djtqvAA/r/LDqKiEVxMLvcj6hv4bCm9UBekX5JYgj89OtoP8X067mqfpWDqqXBv
X-Gm-Message-State: AOJu0YyOtTQDNrki4P0TbwP68AKs3KesduAss1saPf91Xg3bVdXei+hi
	JBBNr2dWsqJ/6thg4GKpis/wBL78znhXdCurf9XsRu1/YypZJRd7
X-Google-Smtp-Source: AGHT+IHuuhHhHTN8Vk2oFh7RQ5imuAXNENsjhoN5lsG/+ejPKPrgj43OHqKRbOUo9podhvM5NqfWTQ==
X-Received: by 2002:a17:90b:4c8a:b0:2a0:53cf:9bae with SMTP id my10-20020a17090b4c8a00b002a053cf9baemr2142394pjb.32.1711625617852;
        Thu, 28 Mar 2024 04:33:37 -0700 (PDT)
Received: from [192.168.29.219] ([49.37.251.254])
        by smtp.gmail.com with ESMTPSA id m5-20020a17090b068500b0029fbfb620cdsm1173744pjz.28.2024.03.28.04.33.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 04:33:37 -0700 (PDT)
Message-ID: <582c276c-ea2f-456c-9bf9-47e39289a0b6@gmail.com>
Date: Thu, 28 Mar 2024 17:03:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] dt-bindings: aspeed: Add eSPI controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 patrick.rudolph@9elements.com, chiawei_wang@aspeedtech.com,
 ryan_chen@aspeedtech.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20240319093405.39833-1-manojkiran.eda@gmail.com>
 <20240319093405.39833-5-manojkiran.eda@gmail.com>
 <bad5df79-e040-4868-9db6-701110894ea3@linaro.org>
 <a9faa9b4-9bf6-49b6-b7eb-f642e2d261c3@gmail.com>
 <f2a487c4-eba3-4a78-9a14-67c8754c8b61@linaro.org>
Content-Language: en-US
From: Manojkiran Eda <manojkiran.eda@gmail.com>
In-Reply-To: <f2a487c4-eba3-4a78-9a14-67c8754c8b61@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: conor+dt@kernel.org, vigneshr@ti.com, richard@nod.at, openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org, robh+dt@kernel.org, broonie@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, miquel.raynal@bootlin.com, jk@codeconstruct.com.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 20/03/24 8:14 pm, Krzysztof Kozlowski wrote:
> On 20/03/2024 10:59, Manojkiran Eda wrote:
>>
>> On 19/03/24 3:26 pm, Krzysztof Kozlowski wrote:
>>> On 19/03/2024 10:34, Manojkiran Eda wrote:
>>>> This commit adds the device tree bindings for aspeed eSPI
>>>> controller.
>>>>
>>>> Although aspeed eSPI hardware supports 4 different channels,
>>>> this commit only adds the support for flash channel, the
>>>> bindings for other channels could be upstreamed when the driver
>>>> support for those are added.
>>>>
>>>> Signed-off-by: Manojkiran Eda<manojkiran.eda@gmail.com>
>>>> ---
>>>>    .../bindings/soc/aspeed/aspeed,espi.yaml      | 94 +++++++++++++++++++
>>>>    1 file changed, 94 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml b/Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml
>>>> new file mode 100644
>>>> index 000000000000..3d3ad528e3b3
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml
>>> Why Rob's comments got ignored?
>>>
>>> This is not a soc component.
>> I did not mean to ignore, i have few reasons listed below that provides
>> information on why i felt this belongs into soc.
> 
> soc is dumping ground of things which are purely SoC specific, not
> covered by existing hardware structure in bindings. Maybe indeed this
> does not have any other place, but did you actually look?
> 

Yes, i did look at existing hardware bindings, and cannot seem to find 
out any other suitable place. I can definitely look again.

> Anyway, please CC SPI maintainers on future submission.

Sure, will add them.

> 
>>>
>>>> @@ -0,0 +1,94 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +# # Copyright (c) 2024 IBM Corporation.
>>>> +# # Copyright (c) 2021 Aspeed Technology Inc.
>>>> +%YAML 1.2
>>>> +---
>>>> +$id:http://devicetree.org/schemas/soc/aspeed/aspeed,espi.yaml#
>>>> +$schema:http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Aspeed eSPI Controller
>>>> +
>>>> +maintainers:
>>>> +  - Manojkiran Eda<manojkiran.eda@gmail.com>
>>>> +  - Patrick Rudolph<patrick.rudolph@9elements.com>
>>>> +  - Chia-Wei Wang<chiawei_wang@aspeedtech.com>
>>>> +  - Ryan Chen<ryan_chen@aspeedtech.com>
>>>> +
>>>> +description:
>>>> +  Aspeed eSPI controller implements a device side eSPI endpoint device
>>>> +  supporting the flash channel.
>>> Explain what is eSPI.
>> eSPI is a serial bus interface for client and server platforms that is
> 
> Explain in description of the hardware.

Sure, i will add this description in the binding document in the future 
submission.
> 
>> based on SPI,  using the same master and slave topology but operates
>> with a different protocol to meet new requirements. For instance, eSPI
>> uses I/O, or input/output, communication, instead of MOSI/MISO used in
>> SPI. It also includes a transaction layer on top of the SPI protocol,
>> defining packets such as command and response packets that allow both
>> the master and slave to initiate alert and reset signals. eSPI supports
>> communication between Embedded Controller (EC), Baseboard Management
>> Controller (BMC), Super-I/O (SIO) and Port-80 debug cards. I could add
>> this to the commit message as well in the next patchset.
>>>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    items:
>>>> +      - enum:
>>>> +          - aspeed,ast2500-espi
>>>> +          - aspeed,ast2600-espi
>>>> +      - const: simple-mfd
>>>
>>> That's not simple-mfd. You have driver for this. Drop.
>>>
>>>> +      - const: syscon
>>> That's not syscon. Why do you have ranges then? Where is any explanation
>>> of hardware which would justify such combination?
>>>
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  "#address-cells":
>>>> +    const: 1
>>>> +
>>>> +  "#size-cells":
>>>> +    const: 1
>>>> +
>>>> +  ranges: true
>>>> +
>>>> +patternProperties:
>>>> +  "^espi-ctrl@[0-9a-f]+$":
>>>> +    type: object
>>>> +
>>>> +    description: Controls the flash channel of eSPI hardware
>>> That explains nothing. Unless you wanted to use here MTD bindings.
>>>
>>> This binding did not improve much. I don't understand why this is not
>>> SPI (nothing in commit msg, nothing in description), what is eSPI,
>>
>> eSPI uses Peripheral, Virtual Wire, Out of Band, and Flash Access
>> channels to communicate different sets of data.
> 
> And what are these channels? What does it mean a "channel"? Is it just
> how you organize transfers and classes of devices? Or some sort of
> addressable instance on the bus?
> 

Yes, an espi channel provides a means to allow multiple independent 
flows of traffic to share the same physical bus. Each of the channels 
has its own dedicated resources such as queue and flow control.

> The channels feel like some sort of software or logical concept, not
> physical. Physical would be endpoint with peripheral. Or flash memory.

A channel is a logical communication pathway or interface between the 
chipset and peripheral devices. The concept of channels in the ESPI 
protocol helps organize and manage different types of communication 
between the chipset and peripherals. Each channel may have its own set 
of protocols, data transfer rates, and supported features, tailored to 
the requirements of the devices it serves.

> How do they fit here?

I am not sure I understand, can you please elaborate ?

>>
>>    * The *Peripheral* Channel is used for communication between eSPI host
>>      bridge located on the master side and eSPI endpoints located on the
>>      slave side. LPC Host and LPC Peripherals are an example of eSPI host
>>      bridge and eSPI endpoints respectively.
>>    * *Virtual Wire* Channel: The Virtual Wire channel is used to
>>      communicate the state of sideband pins or GPIO tunneled through eSPI
>>      as in-band messages. Serial IRQ interrupts are communicated through
>>      this channel as in-band messages.
>>    * *OOB* Channel: The SMBus packets are tunneled through eSPI as
>>      Out-Of-Band (OOB) messages. The whole SMBus packet is embedded
>>      inside the eSPI OOB message as data.
>>    * *Flash Access* Channel: The Flash Access channel provides a path
>>      allowing the flash components to be shared run-time between chipset
>>      and the eSPI slaves that require flash accesses such as EC (Embedded
>>      Controller) and BMC.
> 
> Please make binding complete, so define all of the channels.


I would like to inquire about the rationale behind this request. Based 
on previous feedback received from the upstream efforts 
[https://lore.kernel.org/openbmc/HK0PR06MB37798462D17443C697433D7191D09@HK0PR06MB3779.apcprd06.prod.outlook.com/], 
suggestions were made to model the flash channel by utilizing the mtd 
subsystem, the virtual wire channel by utilizing the GPIO subsystem, and 
to consider the OOB channel as a type of i2c device, thereby allowing it 
to be utilized by the existing in-kernel MCTP subsystem, among others. 
My intention was to prioritize upstreaming the flash channel binding, 
along with its driver code, before proceeding to address other channels. 
I am curious to understand if it is a strict requirement to have the 
complete binding upstreamed before addressing the device drivers code.

> 
>>
>> Although , eSPI reuses the timing and electrical specification of Serial
>> Peripheral Interface (SPI) but it runs an entirely different protocol to
>> meet a set of different requirements. Which is why i felt probably
>> placing this in soc was a better choice rather than spi. Do you think
>> otherwise ?
> 
> soc is dumping ground for things do not fit other places. Are there any
> other buses / IP blocks similar to this one?
> 
> 
> Best regards,
> Krzysztof
> 

Thanks,
Manoj
