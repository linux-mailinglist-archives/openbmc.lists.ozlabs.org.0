Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7176673344
	for <lists+openbmc@lfdr.de>; Thu, 19 Jan 2023 09:06:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyFZQ5gh1z3fCN
	for <lists+openbmc@lfdr.de>; Thu, 19 Jan 2023 19:06:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=nug90yAN;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LAhVEuFa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=nug90yAN;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LAhVEuFa;
	dkim-atps=neutral
X-Greylist: delayed 538 seconds by postgrey-1.36 at boromir; Thu, 19 Jan 2023 19:05:49 AEDT
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyFYn0flHz3c8d;
	Thu, 19 Jan 2023 19:05:48 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 600285C012B;
	Thu, 19 Jan 2023 02:56:45 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 19 Jan 2023 02:56:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674115005; x=1674201405; bh=zM/k9tWl4A
	ZrWACJdmXZKTCMgs2DStBICdw4oFEh4H4=; b=nug90yANL1BU+oerGfsfC3JWCp
	px5nq10ZWCYRxRqjuR7cr0E1dZfNERA1YS4xgs24Uu8QSy1UqWyk48hgQ5/BJqtH
	svftZg4LRcVVZpRwYwObtIs5ZbUlRJGfon7agIi0xBDsQO7/0jqSFD/3dgBYDf/p
	qPQ99mVRoDklIyGf271Vhf5Lusz/Jhm5M9o3p2g9jCHMn4LarI5wwlv6qRLmhRjX
	sG440ytAjY61X6m1loZwPEK0rFlks+cH6liuttQj9EdxPT3Fv0Z4mST8ZDXOJdsm
	4DiNB1r2tnHce6cBNQ+2s9S7Et6G/gBy95kyQXpI29wy9bxo6TVuuzbicPbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674115005; x=1674201405; bh=zM/k9tWl4AZrWACJdmXZKTCMgs2D
	StBICdw4oFEh4H4=; b=LAhVEuFatwN4IqZ62mEz3Hnr2TNcpjs+OpJaS/SSH/vc
	2meRhx/01xhC72sMQZLpp2u4IwcGe90j7Qr24dL4X2JBmw6wzNQ23KZG8JKiPWKK
	8byfhu3YQE8qkOpd5PbSo5df5E/wAb5q8BbGzTOOm1AfcU7Ys7WMN/xDtjRcRYFY
	Z+wvvfTnQyMxjD3GnuU6ll2APFcUeiX1BiJdazHEblINDqjq1M0n6O4GI709zCRc
	bMqZkt2mTOK+SiLYy6Bne98gZ5UGR7pOf08Er6/gcSteneHET57cY+ZwjuhbY6uX
	FMn5qT3tCJ8cgKgOtM8J/C8LLS3IT1CL2JeQuztDGw==
X-ME-Sender: <xms:vPfIY-kHc6idtBmJEJMnOM5f19hT15nponz-QEK6H0BnDTBqJSnJrA>
    <xme:vPfIY13Q17Ji2RPFJKB7L5_-r5yXGBk1c70DGtfb8E7rFj-2Jf6j4_8I-4ucSS4Pc
    lXtNl9JTSkFBowjodo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtledguddugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:vPfIY8qdM75Mgw2blVly3rYojUfqbZ9aYEPi5l5Yxrl00y_uCB-bSQ>
    <xmx:vPfIYykX2ULdg1eb8H6rSSzuE1rRP2CX8O0s4tGtj5m0Lcgb1jqm0g>
    <xmx:vPfIY812TaWcznlN9lBuCvcyHQnmNoTU5wJiKi3WSfv1BYddvvaaDw>
    <xmx:vffIY2Mk-8K9tt6Igf6XVogGHUGah65qpykOb6DwH8aVP7XENUOMcQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8233AB60086; Thu, 19 Jan 2023 02:56:44 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <66ef9643-b47e-428d-892d-7c1cbd358a5d@app.fastmail.com>
In-Reply-To: <Y8jzsmC3azFgbZLP@enigma.ccjz.io>
References: <20230110042533.12894-1-clayc@hpe.com>
 <20230110042533.12894-3-clayc@hpe.com>
 <110af65f-9c18-524d-a073-ef7be60d1f5a@linaro.org>
 <Y8AIHDizIqu9u9BR@enigma.ccjz.io>
 <48cd3e28-f1db-487d-8971-473dc8c12c09@app.fastmail.com>
 <Y8VUOENIhe72sqMO@enigma.ccjz.io>
 <55f09599-b553-4429-aa79-ca99ccf95cda@app.fastmail.com>
 <Y8jzsmC3azFgbZLP@enigma.ccjz.io>
Date: Thu, 19 Jan 2023 08:56:25 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Clay Chang" <clayc@hpe.com>
Subject: Re: [PATCH 2/5] dt-bindings: soc: hpe: hpe,gxp-srom.yaml
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, "Verdun, Jean-Marie" <verdun@hpe.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-kernel@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Hawkins, Nick" <nick.hawkins@hpe.com>, Olof Johansson <olof@lixom.net>, Russell King <linux@armlinux.org.uk>, openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jan 19, 2023, at 08:39, Clay Chang wrote:
> On Mon, Jan 16, 2023 at 04:18:59PM +0100, Arnd Bergmann wrote:
>
> Sorry for not saying it clearly. I meant to put those HPE BMC related
> drivers that are "not specific" to a particular subsystem in
> drivers/soc/hpe. For those fit into some existing subsystems go to their
> designated places.

Ok, that makes sense. I'm just trying to reduce the number
of drivers that fit into this category.

>> >> Again, it's hard for me to tell why this even needs to be runtime
>> >> configurable, please try to describe what type of application
>> >> would access the sysfs interface here, and why this can't just
>> >> be set to a fixed value by bootloader or kernel without user
>> >> interaction.
>> >
>> > The register is used for communication and synchronization between the
>> > BMC and the host. During runtime, user-space daemons configures the
>> > value of the register for interactions.
>> 
>> That does not sound very specific. What is the subsystem on the
>> host that this communicates with? Can you put the driver into the
>> same subsystem?
>
> This is a control register in the BMC chip that partially controls host
> boot behaviors. When writing to the register, privileged mode is
> required. That's why we rely on a kernel driver for writing to the
> control register. And, there is no corresponding subsystem in the host
> OS. For this case, is it acceptable to put this driver under
> drivers/soc/hpe?

I see. So this sounds like it might be generic BMC feature, which would
be nice to handle consistently for all BMC families. We had some
discussions about other BMC features in the past, but don't remember
what the overall consensus was, so I'm adding the openbmc list and
as well as aspeed and npcm maintainers to Cc.

The part I'm still missing is what type of userspace makes this
decision on the BMC side, and whether that might already have a
generalized interface. If there is, maybe part of that interface
can be abstracted in the kernel.

    Arnd
