Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 179DD352501
	for <lists+openbmc@lfdr.de>; Fri,  2 Apr 2021 03:15:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBMYY0Pxbz3bxc
	for <lists+openbmc@lfdr.de>; Fri,  2 Apr 2021 12:15:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=QmvoUwqB;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=JZhNp9tC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=QmvoUwqB; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=JZhNp9tC; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBMYB389Fz2yZ8;
 Fri,  2 Apr 2021 12:15:08 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7CE5E58044C;
 Thu,  1 Apr 2021 21:15:03 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 01 Apr 2021 21:15:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=0IYE65VpdI2bLygqtwJCM7v6WhpJJA0
 g0UEFyBjpU0c=; b=QmvoUwqBqnfx1N/MGhvy/CXchrLJ9pKf0ba83tlC1I2MHEn
 Q/Zpw+BMj8VqMlIN7tp21P2oGAI8bzC4AtuuIqOyPljr8pqAJm5OwCRBF2G3KzdZ
 +0lge3c9y/FXH/sBQDLuKqSwhXViOFmkepmfAhUK31Q6LOcyyX4z75vCHoa/p88H
 bxqE3OeTgbiREgLf0mmfdsckm5WrtomoE0GeFxPCyodCGdeZ0DjSB8dcStUwv44a
 Sa063Q1JNcLLKkAkTiCZJQXtrQqtY72bJ5lxn6r7qgDW4nrhnInLrYeuAp6GY1vK
 gb7w1HKmwMFfUwcM0//f0pWH4JlsyRsFJSyEUaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=0IYE65
 VpdI2bLygqtwJCM7v6WhpJJA0g0UEFyBjpU0c=; b=JZhNp9tCjuZm6Fhs8D+onh
 UMPFCVxpoIUSyAPmdl5WZk5qfCBwBUA9H+pODH9EcUHKTexrozJL0ZcgSxE1QGVh
 fsB+Z5hyUwAQb/4AbPN1OPNnPJQej+EludzxYtmSoUgwZUxaRpgeWL0kQlJd9/Nn
 0xPAyiuumWdIVeJcD45IY04MDBPkMKaRdf91uJlfOEqxHadvm2ouVu3W485PrxXk
 p07c0sRMUV8md8msStm4Ogsljy/y6rOz+6t+sOyKKt9MSeC6sOvYzINzg1N5NjEl
 Lf+zRigBfpEbQCe7Si0utAaqChRnteVd3dFwxDueJSmBHrwPXlaq4syyfiADyEPQ
 ==
X-ME-Sender: <xms:FHBmYLWXgTg11goRSzY6-ID7_HKnzWREooG98EJIwmjQ5xUydZGDAg>
 <xme:FHBmYDlSTJYhFCHZIeH9q_7C0L94AT4ULnMZlpsquMmdkOf5vwUIQJnbOx_Xk1l-3
 eVYFzqzDmC2pp8ZrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeihedggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:FHBmYHaQSsLqg2gQxJA6cb6Ot9y1aHGLj4GO1zr8eehGrqfInae76Q>
 <xmx:FHBmYGXyNH0cmhUTezL7C7IbOeld2ehKBU9ssTdVfByJ3RBwFzmODw>
 <xmx:FHBmYFm3sShDYWCytyfX2Qso0ltJSaY0Xe11Oyo2cWnYtVFok4W-gg>
 <xmx:F3BmYH6CNtcM8r5D52GnmJVbyfs6QGxeTwNmTIuBpjyLeImEoWftwQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6F1B5A00073; Thu,  1 Apr 2021 21:15:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <639f957f-a0d7-4a06-8598-90da0e17820b@beta.fastmail.com>
In-Reply-To: <20210402004716.15961-5-zev@bewilderbeest.net>
References: <20210402004716.15961-1-zev@bewilderbeest.net>
 <20210402004716.15961-5-zev@bewilderbeest.net>
Date: Fri, 02 Apr 2021 11:44:39 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Zev Weiss" <zev@bewilderbeest.net>, "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_v3_4/4]_dt-bindings:_serial:_8250:_add_aspeed,
 lpc-a?= =?UTF-8?Q?ddress_and_aspeed,sirq?=
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
Cc: - <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 2 Apr 2021, at 11:17, Zev Weiss wrote:
> These correspond to the existing lpc_address, sirq, and sirq_polarity
> sysfs attributes; the second element of aspeed,sirq provides a
> replacement for the deprecated aspeed,sirq-polarity-sense property.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  .../devicetree/bindings/serial/8250.yaml      | 27 ++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml 
> b/Documentation/devicetree/bindings/serial/8250.yaml
> index 491b9297432d..a6e01f9b745f 100644
> --- a/Documentation/devicetree/bindings/serial/8250.yaml
> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> @@ -12,8 +12,13 @@ maintainers:
>  allOf:
>    - $ref: /schemas/serial.yaml#
>    - if:
> -      required:
> -        - aspeed,sirq-polarity-sense
> +      anyOf:
> +        - required:
> +            - aspeed,lpc-address

Why not aspeed,lpc-io-reg like the KCS binding?

There are some things we can do to improve it, but we shouldn't go and invent something different. I prefer aspeed,lpc-io-reg because it's name derives from the generic 'reg' property as does it's behaviour (if you assume a related `#size-cells = 0`).

> +        - required:
> +            - aspeed,sirq

Why not aspeed,lpc-interrupts like the KCS binding?

The generic IRQ property is 'interrupts', so like aspeed,lpc-io-reg the interrupts proposal for KCS follows in name and form. I'm hiding it behind the aspeed vendor prefix for now while I'm not satisfied that I understand the requirements of non-aspeed parts. Similarly, I added the lpc prefix because we don't tend to describe the host devicetree in the BMC devicetree (and so there's no parent interrupt controller that we can reference via a phandle) and we need a way to differentiate from the local interrupts property.

I don't see a reason for either of them to differ from what we already have for KCS, and I don't see any reason to continue the sysfs naming scheme in the binding.

Eventually I want to distil an LPC peripheral binding schema from what we've developed for the peripherals supported by aspeed and nuvoton SoCs.

Cheers,

Andrew

> +        - required:
> +            - aspeed,sirq-polarity-sense
>      then:
>        properties:
>          compatible:
> @@ -190,6 +195,20 @@ properties:
>        applicable to aspeed,ast2500-vuart.
>      deprecated: true
>  
> +  aspeed,lpc-address:
> +    $ref: '/schemas/types.yaml#/definitions/uint32'
> +    description: |
> +      The VUART LPC address.  Only applicable to aspeed,ast2500-vuart.
> +
> +  aspeed,sirq:
> +    $ref: "/schemas/types.yaml#/definitions/uint32-array"
> +    minItems: 2
> +    maxItems: 2
> +    description: |
> +      A 2-cell property describing the VUART SIRQ number and SIRQ
> +      polarity (IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_LEVEL_HIGH).  Only
> +      applicable to aspeed,ast2500-vuart.
> +
>  required:
>    - reg
>    - interrupts
> @@ -221,6 +240,7 @@ examples:
>      };
>    - |
>      #include <dt-bindings/clock/aspeed-clock.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
>      serial@1e787000 {
>          compatible = "aspeed,ast2500-vuart";
>          reg = <0x1e787000 0x40>;
> @@ -228,7 +248,8 @@ examples:
>          interrupts = <8>;
>          clocks = <&syscon ASPEED_CLK_APB>;
>          no-loopback-test;
> -        aspeed,sirq-polarity-sense = <&syscon 0x70 25>;
> +        aspeed,lpc-address = <0x3f8>;
> +        aspeed,sirq = <4 IRQ_TYPE_LEVEL_LOW>;
>      };
>  
>  ...
> -- 
> 2.31.1
> 
>
