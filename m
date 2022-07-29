Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8875849C2
	for <lists+openbmc@lfdr.de>; Fri, 29 Jul 2022 04:29:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvBKt65fkz2xkT
	for <lists+openbmc@lfdr.de>; Fri, 29 Jul 2022 12:29:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=CV1+kb4O;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DRkTB/VZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=CV1+kb4O;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DRkTB/VZ;
	dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvBKR2YvTz2xHf;
	Fri, 29 Jul 2022 12:28:59 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 48E885C0131;
	Thu, 28 Jul 2022 22:28:56 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Thu, 28 Jul 2022 22:28:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1659061736; x=1659148136; bh=iM6rPyrBSS
	v1gLxYpyLmgkE2Xy8DoM8IAvlqobbDAXc=; b=CV1+kb4OZ1C7Wm9O6iLUtPTOIl
	zmskcBwCvUteypiQ8aL60+UYIViyoFa4W9WtXGHJQ/JJeB+4EPhdPUtbps3cE2p0
	4vO+hjlPPHKdWQaPw7qJHAaz+IPlNpnVebtCO4YFC2IyrHKxKm0ADDk3LzNtaI5a
	KUXeVECr4jECJWSfIWT9voeFOU4K9sr5AzY+OLhlrrZWA05t5SORhxpdmqPfiZM5
	9rKT2iyp8cwKbipXPbZFrehQAuo5Xu68e9lJEELQ1HPYq/R6qIhrg4/nJTg3OgKR
	zslV9DhUTcX6RvexiEVXp/H7tSgsdSva/NVbALVnvtqBkSKC1zoLHB8yf99Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1659061736; x=1659148136; bh=iM6rPyrBSSv1gLxYpyLmgkE2Xy8D
	oM8IAvlqobbDAXc=; b=DRkTB/VZ0ruLb6K7zvJIhVX53t4JvtxE06k/xe2d2Xvb
	mf+W5KWfA6n1K12sGCb4HNeUJ+xKd3bxR+SMpJH1FEaL/PLXJIZobO5ufjI44h9Y
	V+ptcYRB0kb9FIR01nrJZKIjHmr0qNh8Nu+vBCtgVfn9l9xnT2L8w9y+BmVGJjX8
	0rUXKsFzCquuxwBfFJZgKEsZmHZY9WlEAwpgVQBDBcvy5y+gJF8tbuQVWxIy6eI6
	man3aXDCKTYYT84CS5RlvMsrYMzoneLoYG8F/V+ZvkehykeI6KvbvSosaZWX5EYu
	mxFd/iLSJ5kLxQxD1UlmJAcKOg00trEuXZDsL4pIZA==
X-ME-Sender: <xms:5kXjYvwinAztIsoF7Q49KjKk_PO5sILzcrcp8oAdV6-CmPOu1481RQ>
    <xme:5kXjYnRpL7bKKFXnhMq4-2hFS51Bt3FM6DkK-UmfkklSRlUi8I35zvOT_aTCYrSqt
    VD-arREmvI-MVxkDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduiedgtdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeeffeejgfefieetueeffeeiiedthffghefhtdffveegudegffduuddt
    hfelleeludenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdr
    ihgurdgruh
X-ME-Proxy: <xmx:50XjYpV2PvEX1I69SZspf0zpOT9Ght_02gzjetItDc6YVuY5hSEtpw>
    <xmx:50XjYpjHYaIUFaf7lM-12ild0CM78H2x0nw1kg5_3sFVdYF7no1FNg>
    <xmx:50XjYhBQWAmPfCuXXdaJv51s1_raVlU_tVPOBiH1uevSHAI5VbieUQ>
    <xmx:6EXjYk4lumkIxQqy4gxLzMG1fZVrlOWxBSSb4o0Oazw8S7xHBnYtog>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DCEE21700083; Thu, 28 Jul 2022 22:28:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-758-ge0d20a54e1-fm-20220729.001-ge0d20a54
Mime-Version: 1.0
Message-Id: <5d863bc1-4f27-48b6-89ab-c3f02bc09057@www.fastmail.com>
In-Reply-To: <20220516064900.30517-3-ryan_chen@aspeedtech.com>
References: <20220516064900.30517-1-ryan_chen@aspeedtech.com>
 <20220516064900.30517-3-ryan_chen@aspeedtech.com>
Date: Fri, 29 Jul 2022 11:58:34 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ryan Chen" <ryan_chen@aspeedtech.com>, "Joel Stanley" <joel@jms.id.au>,
 "Philipp Zabel" <p.zabel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v3 2/3] dt-bindings: i2c-ast2600: Add bindings for AST2600 i2C
 driver
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
Cc: BMC-SW@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ryan,

On Mon, 16 May 2022, at 16:18, ryan_chen wrote:
> AST2600 support new register set for I2C controller, add bindings document
> to support driver of i2c new register mode controller
>
> Signed-off-by: ryan_chen <ryan_chen@aspeedtech.com>
> ---
>  .../bindings/i2c/aspeed,i2c-ast2600.ymal      | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 
> Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600.ymal
>
> diff --git 
> a/Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600.ymal 
> b/Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600.ymal
> new file mode 100644
> index 000000000000..7c75f5bac24f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c-ast2600.ymal
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/aspeed,i2c-ast2600.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AST2600 I2C Controller on the AST26XX SoCs Device Tree Bindings
> +
> +maintainers:
> +  - Ryan Chen <ryan_chen@aspeedtech.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2600-i2c

The original driver uses e.g. aspeed,ast2500-i2c-bus for the 
subordinate controllers. While the register layout changes, I'd prefer 
we try to use the existing compatibles rather than introducing a new set
and causing some confusion.

Further, what you're proposing here is effectively being used to select 
the driver implementation, which isn't the purpose of the devicetree.

My preference would be to reuse the existing compatibles and instead 
select the driver implementation via Kconfig. Or, if we can figure out 
some way to do so, support both register interfaces in the one driver 
implementation and fall back to the old register interface where the 
new one isn't available (I don't think this is feasible though).

> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description: address offset and range of bus
> +      - description: address offset and range of bus buffer
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      root clock of bus, should reference the APB
> +      clock in the second cell
> +
> +  resets:
> +    maxItems: 1
> +
> +  bus-frequency:
> +    minimum: 500
> +    maximum: 2000000
> +    default: 100000
> +    description: frequency of the bus clock in Hz defaults to 100 kHz 
> when not
> +      specified
> +
> +  multi-master:
> +    type: boolean
> +    description:
> +      states that there is another master active on this bus
> +
> +required:
> +  - reg
> +  - compatible
> +  - clocks
> +  - resets
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/ast2600-clock.h>
> +
> +    i2c_gr: i2c-global-regs@0 {
> +      compatible = "aspeed,ast2600-i2c-global", "syscon";
> +      reg = <0x0 0x20>;
> +      resets = <&syscon ASPEED_RESET_I2C>;
> +    };
> +
> +    i2c0: i2c-bus@80 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      #interrupt-cells = <1>;
> +      compatible = "aspeed,ast2600-i2c-bus";

This isn't quite right with respect to your binding description above :)

Andrew
