Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 813EF393919
	for <lists+openbmc@lfdr.de>; Fri, 28 May 2021 01:21:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrkN74FVhz301X
	for <lists+openbmc@lfdr.de>; Fri, 28 May 2021 09:21:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=Pd6DjPTZ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=BLOEg08z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=Pd6DjPTZ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=BLOEg08z; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrkMn30hnz2y0D;
 Fri, 28 May 2021 09:21:09 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1342E5804E2;
 Thu, 27 May 2021 19:21:06 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 27 May 2021 19:21:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=t3tHT0j6eItqHp+gErG+i6p1MIvTfMZ
 7NV9x8uuZgaQ=; b=Pd6DjPTZR5vrpUPDF2a9UVEcQ4NPkarDDfzk+Cabp9ld11v
 imB6yxEXCfJ81SO7YgZ4CiSbxUaOZXAofW1c8h103GiJQirjfQ2F2e/M5HOjfcu7
 gZUP0Xje8ob0krB3Vc4NWpd4HQZ43VcVcoUhX5op6bUrTb456KtNViHtPXBQiWcA
 yrok/TsOvmbBysZ+enEvF2dh6u+33X2Il5KL+BS+C1vumO2Giy+KbHUeKINUVshG
 SXJY9doa3bdPdEkQa9QmtOkSurnwOZftJvsZ9ptx4ZcstzE374OHgCOuc0Pm3agb
 VWSEHlkBej/GKwkMDPROQQfYvyZRhnNur8czotQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=t3tHT0
 j6eItqHp+gErG+i6p1MIvTfMZ7NV9x8uuZgaQ=; b=BLOEg08zus2s6GeAfg2E03
 sNNF1RbYpVOPctHZyfsb6kYKolEObNmheAZFgeOZiEfTMmUoeszlhpCVAzfPHRVu
 UPTeb1FOkVleOu06WQ89QRW5Bfm2qzwwQE2uuVENJ+4v9yk1fiNmUzhCDYbatKGX
 GFJok/r3F8BvhId/LXjXC1mw4804jtQVp5qDVH2xMGZF0nrBHo7W15cofAh4B2DC
 UNnhl/ZVUHPqKbMyOj/lRkBpGP6ZriKMudGJOk+nPsA3oXDDUe2sDr9RXnfuE3ms
 NwCaKSIlvSTqKb24VuAYpX/uiSoZWuSXukeIq5EpD/R5CP5Jap96dHdWsQy/o/Kw
 ==
X-ME-Sender: <xms:XymwYEImLIb3QW2ae32uxSFwFQjuis1JoDD-RgvQbxPJydVneWrJKg>
 <xme:XymwYEKy-ZPs2LAXfaUBgOxv30_t15fX2m7nyFEc-_PuVEMefilkpyHt-JI4l1svH
 82T1NiR06ixa9SCUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekiedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefguedvfedvgffgudehjeegudefvedufefgveefudetffdvfeeigffg
 jedvkeetnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhi
 ugdrrghu
X-ME-Proxy: <xmx:XymwYEuKsN9D2OO6tqJpLJ_XNvPwWRawesoekvK9nKeSiZMJYa4vYw>
 <xmx:XymwYBawcaYITQ1lwZSR7fGcxgKOzRZTxtJIOM6B_k3z17ogLJY_UA>
 <xmx:XymwYLaBJ6fveBtuLPciMrA8iVC0aM-zKSmNgvOQ3E5oVM3NpZKJGQ>
 <xmx:YimwYHrk-5wnqjm-hx-7ZL3ciKEFEK8SqXKljI443TNL7qyC6uqZ5Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id BA59BA00079; Thu, 27 May 2021 19:21:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-468-gdb53729b73-fm-20210517.001-gdb53729b
Mime-Version: 1.0
Message-Id: <f7df6bb6-762d-4250-a4bc-076cbfc441eb@www.fastmail.com>
In-Reply-To: <20210527102512.20684-2-jamin_lin@aspeedtech.com>
References: <20210527102512.20684-1-jamin_lin@aspeedtech.com>
 <20210527102512.20684-2-jamin_lin@aspeedtech.com>
Date: Fri, 28 May 2021 08:50:43 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jamin Lin" <jamin_lin@aspeedtech.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "Brendan Higgins" <brendanhiggins@google.com>,
 "Benjamin Herrenschmidt" <benh@kernel.crashing.org>,
 "Rayn Chen" <rayn_chen@aspeedtech.com>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>
Subject: =?UTF-8?Q?Re:_[PATCH_v2_1/1]_dt-bindings:_aspeed-i2c:_Convert_txt_to_yam?=
 =?UTF-8?Q?l_format?=
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
Cc: Steven Lee <steven_lee@aspeedtech.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 27 May 2021, at 19:55, Jamin Lin wrote:
> Convert aspeed i2c to yaml.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 86 +++++++++++++++++++
>  .../devicetree/bindings/i2c/i2c-aspeed.txt    | 49 -----------
>  2 files changed, 86 insertions(+), 49 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> 
> diff --git a/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml 
> b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> new file mode 100644
> index 000000000000..1f7064d77708
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED I2C on the AST24XX, AST25XX, and AST26XX SoCs Device 
> Tree Bindings
> +
> +maintainers:
> +  - Rayn Chen <rayn_chen@aspeedtech.com>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2400-i2c-bus
> +      - aspeed,ast2500-i2c-bus
> +      - aspeed,ast2600-i2c-bus
> +
> +  "#size-cells":
> +    const: 0
> +
> +  "#address-cells":
> +    const: 1
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      - description: address offset and range of bus
> +      - description: address offset and range of bus buffer
> +
> +  interrupts:
> +    maxItems: 1
> +    description: interrupt number
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      root clock of bus, should reference the APB
> +      clock in the second cell
> +
> +  reset:
> +    maxItems: 1
> +    description: phandle to reset controller with the reset number in
> +      the second cell
> +
> +  bus-frequency:
> +    minimum: 500
> +    maximum: 4000000
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
> +    #include <dt-bindings/clock/aspeed-clock.h>
> +    i2c0: i2c-bus@40 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      #interrupt-cells = <1>;
> +      reg = <0x40 0x40>;
> +      compatible = "aspeed,ast2500-i2c-bus";
> +      clocks = <&syscon ASPEED_CLK_APB>;
> +      resets = <&syscon ASPEED_RESET_I2C>;
> +      bus-frequency = <100000>;
> +      interrupts = <0>;
> +      interrupt-parent = <&i2c_ic>;
> +      status = "disabled";
> +      /* Does not need pinctrl properties */

Note this actually isn't right and someone (me?) needs to send a patch 
to fix the devicetree(s) - the I2C mux properties for bus 0 and 1 just 
don't have a group, and so SCL and SDA need to be muxed individually.

I expect we wound up with this comment by a lack of a match for an 
erroneous grep.

Andrew
