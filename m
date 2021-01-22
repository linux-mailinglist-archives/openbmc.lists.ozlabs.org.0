Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 262E92FFBBE
	for <lists+openbmc@lfdr.de>; Fri, 22 Jan 2021 05:28:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMR8N2T7yzDqd7
	for <lists+openbmc@lfdr.de>; Fri, 22 Jan 2021 15:28:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=ZeZ4jq/X; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=hbB0bMoi; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMR7H1gMCzDq9S;
 Fri, 22 Jan 2021 15:27:22 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id C82BB580569;
 Thu, 21 Jan 2021 23:27:18 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 21 Jan 2021 23:27:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=U7g9k3PvYt9UgcoB3XFDaqENiCMcd2h
 Uzwa4zVgQbjY=; b=ZeZ4jq/XYIdPXNjIuTtcT9lE1GqpKRjf9M7NbsSbfo8rDIV
 rBruB4VeqwlCo7LzT4wWn0DapnJHsgEpzly9/Q4rC5PQp3QdGmeVTDbEGae0S5Vr
 YyTBZ2R6PS2tqVMinjdbRP9NHbwSv6q7SWgac7tkJzNNpRPvR2G/xjJFDj7VZRFl
 bJ93/fKsy2b/SWR2ArP/M6XrvaePZKF502R0ATIMVkG8MUNddw/ewU8aZvqru+fO
 yIJCBWJ5IJUrwqBszKALkpQVnJbeLfLnYKh2pa7sB0GjDAYe7f61gxbuug2BGvXn
 wVhRAuTUqz5NE+QTlHnlF1YvzHRFOPy9fD3xs1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=U7g9k3
 PvYt9UgcoB3XFDaqENiCMcd2hUzwa4zVgQbjY=; b=hbB0bMoiisltKMA4+XhPyb
 lHFS+MKVnrhlFupaGRRCpuprgHaMJ8JINdugKvzgk24wxqTQpxRAaFcNo8PrR8MU
 9+WDf1uaxLyg+VVzYo4Pz52ANAX9TIoctPbKWfNt6wZqphyjzyqfevGWfmWQhA1q
 8qyul/ZVF1Laym4mP4GbKP0jWKlTd1pQ1+ojZO1h1MBaPEg1k/Mzprqld1VFwUzP
 qtFndVUGppwVqBlFWCEoUxz322qmEXc9rJAbx3qPOytQr9c08psYlq8bpFbPqKeg
 fW9dV8zQ7Zg5Nun65G6SfgJYDdNZqE/1Y0GbGsTvgCqBb9jMuiWQlX1vPxSW81Nw
 ==
X-ME-Sender: <xms:JVQKYDWOik28oOfADP4u6nN9PVgRiD4SOA6kUwL1ktaQ66VGDZ5qAQ>
 <xme:JVQKYLlGlNZUvZgr3zZ0GCjBWsh0Rr-4p74BcAqLTmkgruqaT6rq2hyE79AMGGscb
 F2HMmMbgrahh5ukow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehgdejudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeekkeejveejfffhtddtteejtefhkeekvefhfeeihedtgffgleegleffkeej
 tdffjeenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgu
 rdgruh
X-ME-Proxy: <xmx:JVQKYPaqmCx4bx4cmNnVloVN8_Ir9WkGHMw92nb0Kl2xXNBpl9-Kjw>
 <xmx:JVQKYOU6RVqh7jESHUijel9kBlkEoAOaJauK56WPX0bDb03d84MjnA>
 <xmx:JVQKYNmVw79ikHLYcw3DH3Nol2t0_KAkIV30RIVbVcb8DYShHhkL9w>
 <xmx:JlQKYP48QHOA63zPW6xdUMC1q54pISPRhOcRHoAAcImLXkAdqfxMxA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 819F4A0005D; Thu, 21 Jan 2021 23:27:17 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-78-g36b56e88ef-fm-20210120.001-g36b56e88
Mime-Version: 1.0
Message-Id: <647428e4-49fb-4e2b-9291-895488c9c7f5@www.fastmail.com>
In-Reply-To: <20210118065059.2478078-2-troy_lee@aspeedtech.com>
References: <20210118065059.2478078-1-troy_lee@aspeedtech.com>
 <20210118065059.2478078-2-troy_lee@aspeedtech.com>
Date: Fri, 22 Jan 2021 14:56:44 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Troy Lee" <troy_lee@aspeedtech.com>, openbmc@lists.ozlabs.org,
 "Joel Stanley" <joel@jms.id.au>, "Philipp Zabel" <p.zabel@pengutronix.de>,
 "open list" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: hwmon: Add Aspeed AST2600 PWM/Fan
Content-Type: text/plain
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
Cc: Rob Herring <robh@kernel.org>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 18 Jan 2021, at 17:20, Troy Lee wrote:
> We add binding for supporting a new AST2600 PWM/Fan hwmon driver.
> 
> Changes since v2:
>  - Fixed yamllint warnings/errors
> 
> Changes since v1:
>  - dt binding with DT schema format
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Reported-by: Rob Herring <robh@kernel.org>
> ---
>  .../hwmon/aspeed,ast2600-pwm-tachometer.yaml  | 131 ++++++++++++++++++
>  1 file changed, 131 insertions(+)
>  create mode 100644 
> Documentation/devicetree/bindings/hwmon/aspeed,ast2600-pwm-tachometer.yaml
> 
> diff --git 
> a/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-pwm-tachometer.yaml b/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-pwm-tachometer.yaml
> new file mode 100644
> index 000000000000..fa5340f5a43f
> --- /dev/null
> +++ 
> b/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-pwm-tachometer.yaml
> @@ -0,0 +1,131 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +
> +$id: 
> http://devicetree.org/schemas/hwmon/aspeed,ast2600-pwm-tachometer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED AST2600 PWM and Fan Tacho controller device driver
> +
> +maintainers:
> +  - Ryan Chen <ryan_chen@aspeedtech.com>
> +
> +description: |
> +  The ASPEED PWM controller can support upto 16 PWM outputs. The 
> ASPEED Fan Tacho
> +  controller can support upto 16 Fan tachometer inputs.
> +  There can be upto 16 fans supported. Each fan can have one PWM 
> output and
> +  one Fan tach inputs.
> +
> +properties:
> +  compatible:
> +    const: aspeed,ast2600-pwm-tachometer
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  "#cooling-cells":
> +    const: 2
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^fan@[0-9a-f]$":
> +    type: object
> +    description:
> +      Under fan subnode there can upto 16 child nodes, with each child 
> node
> +      representing a fan. There are 16 fans each fan can have one PWM 
> port and one
> +      Fan tach inputs.
> +      For PWM port can be configured cooling-levels to create cooling 
> device.
> +      Cooling device could be bound to a thermal zone for the thermal 
> control.
> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 15
> +        description:
> +          This property identify the PWM control channel of this fan.
> +
> +      fan-tach-ch:
> +        $ref: /schemas/types.yaml#/definitions/uint8
> +        minimum: 0
> +        maximum: 15
> +        description:
> +          This property identify the fan tach input channel.
> +
> +      pulses-per-revolution:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        default: 2
> +        minimum: 1
> +        description:
> +          Specify tacho pulse per revolution of the fan.
> +
> +      cooling-levels:
> +        description:
> +          PWM duty cycle values in a range from 0 to 255
> +          which correspond to thermal cooling states.
> +
> +      aspeed,pwm-freq-hz:
> +        default: 25000
> +        minimum: 24
> +        maximum: 780000
> +        description:
> +          Specify the frequency of PWM.

What about using 'bus-frequency' instead?

> +
> +      aspeed,inverse-pin:
> +        type: boolean
> +        description:
> +          Inverse PWM output signal.

What's the benefit? I know the hardware provides the function, but do we need to expose it?

> +
> +      aspeed,falling-point:
> +        $ref: /schemas/types.yaml#/definitions/uint8
> +        default: 10

I feel like it probably shouldn't have a default value.

> +        description:
> +          Initialize the pulse width.

Then can we make the property name a bit more intuitive? 'pwm-duty'? Alternatively, [1] calls the duty "cooling-levels", can we use something in that vein instead?

[1] Documentation/devicetree/bindings/hwmon/pwm-fan.txt

Andrew
