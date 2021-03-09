Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93361331D1B
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 03:46:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dvfjj4QBDz3cHP
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 13:46:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=fbbwAutX;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=AjTM0mIH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=fbbwAutX; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=AjTM0mIH; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvfjR5Dmmz2yhk;
 Tue,  9 Mar 2021 13:46:19 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6A18658077B;
 Mon,  8 Mar 2021 21:46:17 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 08 Mar 2021 21:46:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=Tpdvc0wIJyQlbESu9uTMwNjhu6BkX05
 ntP+NLrip8N8=; b=fbbwAutXo3dNbhPjH2Fc1TRDi2WNPtt0PdwmRmCbuKRQKwb
 xQuFJ731mrIMCsLQgutAkbEf70bBP1WGd3mVLmYe6lhIDO4S0c9r6Yqo3JuNySsY
 t/J+2h9QRN7qGNsdZe8JNm9xSQgNkyGPW9CmWugKQY1J9R9n2w8Zx6Uh9KFejqe2
 udZ3LqayR2e/L5fiQEwTS8983sMNoCMV0KeQRejejOKoDTqGuad2OrL+jj6gIeA2
 iA5j0VLgU1GDh/rm4GhTP3gywPbqXMFpzasrCnEO1CbN9DBGiDpOifXIS4j3X0/U
 eZjYArRiIFeLDtrfAosCiYljBtu0buWpaH2qzhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Tpdvc0
 wIJyQlbESu9uTMwNjhu6BkX05ntP+NLrip8N8=; b=AjTM0mIH1z4B0Xh+oM/oxt
 QoP+Sr+ZU+EX78gTuEN+l2i/Snz9ejRcszvXnJr+lTCh3099W0rw0JYDMw5vuteg
 Kj5FUMRKXRHSQR7qJ2euBD0MzEhVMZq/ECyLR9Bw+ERheiPEhpwCpeet9vgD5CER
 J9IDNanmdMsH/iIBt6gQpqMYY1eSu9PnParU9FjiGVmVJeaKy975dKoVoe6iFOsi
 PaW+1a+gSDwV5OXtDq27oNiQJEm/n2tzmRq38q8dliUT8Q9DpydfnVA2arahdSDl
 B8j+Ftqb9wQm7hL1OVjOmvI21NmkwUCVUXuP9UdVUtSjLc50y9xXI95eHEwfIvug
 ==
X-ME-Sender: <xms:d-FGYKvxk6NSN9cSuRTS6hi-JLu0eUiu8dpDVbBEx6sqCk8JaNHTSw>
 <xme:d-FGYPejt-whBncMjC81hZLfrIBSsxX49iCp8bvbev35w4Nv9dY-_xlULMIdQu7bI
 HQMI4LCPnwd6S3djg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduhedggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefguedvfedvgffgudehjeegudefvedufefgveefudetffdvfeeigffg
 jedvkeetnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhi
 ugdrrghu
X-ME-Proxy: <xmx:d-FGYFwSlRjhgPZQxeJ519D6v7UCNOZtcj3Ij1BCTVHy6cTJFPts7Q>
 <xmx:d-FGYFPlql9I9BSvNVg_KSslgT6Z201lJcETny7WP08g9NoCGBKwfQ>
 <xmx:d-FGYK_6k-S6NEstvVd7f93XPQFmjBeq0bEIowfTCBkVhq2aWopLjQ>
 <xmx:eeFGYKOMhTmwCBXjdbzOroRCsY3EGwpmWTQTM3N9RYG5LzxwnAr8MQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A3B3FA00068; Mon,  8 Mar 2021 21:46:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-206-g078a48fda5-fm-20210226.001-g078a48fd
Mime-Version: 1.0
Message-Id: <0fbc1435-1f0f-4c0e-935f-95874d438fbf@www.fastmail.com>
In-Reply-To: <20210305230710.GA798530@robh.at.kernel.org>
References: <20210219142523.3464540-1-andrew@aj.id.au>
 <20210219142523.3464540-17-andrew@aj.id.au>
 <20210305230710.GA798530@robh.at.kernel.org>
Date: Tue, 09 Mar 2021 13:15:55 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Rob Herring" <robh@kernel.org>
Subject: =?UTF-8?Q?Re:_[PATCH_16/19]_dt-bindings:_ipmi:_Convert_ASPEED_KCS_bindin?=
 =?UTF-8?Q?g_to_schema?=
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
Cc: devicetree@vger.kernel.org, "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Corey Minyard <minyard@acm.org>,
 linux-gpio@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 linux-aspeed@lists.ozlabs.org, openipmi-developer@lists.sourceforge.net,
 Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Sat, 6 Mar 2021, at 09:37, Rob Herring wrote:
> On Sat, Feb 20, 2021 at 12:55:20AM +1030, Andrew Jeffery wrote:
> > Given the deprecated binding, improve the ability to detect issues in
> > the platform devicetrees. Further, a subsequent patch will introduce a
> > new interrupts property for specifying SerIRQ behaviour, so convert
> > before we do any further additions.
> > 
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml | 92 +++++++++++++++++++
> >  .../bindings/ipmi/aspeed-kcs-bmc.txt          | 33 -------
> >  2 files changed, 92 insertions(+), 33 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> > new file mode 100644
> > index 000000000000..1c1cc4265948
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
> > @@ -0,0 +1,92 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-bmc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ASPEED BMC KCS Devices
> > +
> > +maintainers:
> > +  - Andrew Jeffery <andrew@aj.id.au>
> > +
> > +description: |
> > +  The Aspeed BMC SoCs typically use the Keyboard-Controller-Style (KCS)
> > +  interfaces on the LPC bus for in-band IPMI communication with their host.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - description: Channel ID derived from reg
> > +        items:
> > +          enum:
> > +            - aspeed,ast2400-kcs-bmc-v2
> > +            - aspeed,ast2500-kcs-bmc-v2
> > +            - aspeed,ast2600-kcs-bmc
> > +
> > +      - description: Old-style with explicit channel ID, no reg
> > +        deprecated: true
> > +        items:
> > +          enum:
> > +            - aspeed,ast2400-kcs-bmc
> > +            - aspeed,ast2500-kcs-bmc
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  reg:
> > +    minItems: 3
> > +    maxItems: 3
> > +    description: IDR, ODR and STR register addresses
> 
> items:
>   - description: IDR register
>   - description: ODR register
>   - description: STR register

Oh, neat.

> 
> > +
> > +  aspeed,lpc-io-reg:
> > +    $ref: '/schemas/types.yaml#/definitions/uint32'
> > +    minItems: 1
> > +    maxItems: 2
> 
> A uint32 can only have 1 item. uint32-array perhaps?

That sounds more appropriate.

> 
> 
> > +    description: |
> > +      The host CPU LPC IO data and status addresses for the device. For most
> > +      channels the status address is derived from the data address, but the
> > +      status address may be optionally provided.
> > +
> > +  kcs_chan:
> > +    deprecated: true
> > +    $ref: '/schemas/types.yaml#/definitions/uint32'
> > +    maxItems: 1
> 
> Drop

Ack.

> 
> > +    description: The LPC channel number in the controller
> > +
> > +  kcs_addr:
> > +    deprecated: true
> > +    $ref: '/schemas/types.yaml#/definitions/uint32'
> > +    maxItems: 1
> 
> Drop

Ack.
