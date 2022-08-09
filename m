Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1640E58D16B
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 02:37:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1vK809DGz2xGr
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 10:37:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=kHmVmqK+;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=SllE8aS4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=kHmVmqK+;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=SllE8aS4;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1vJY0tJ0z2xGx;
	Tue,  9 Aug 2022 10:36:28 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 086515C0003;
	Mon,  8 Aug 2022 20:36:25 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Mon, 08 Aug 2022 20:36:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660005385; x=1660091785; bh=zg8D05det1
	7wHTcb1SQBJ3QqJGHDqgu5vFpaar6HYxg=; b=kHmVmqK+mbKwLRwLUD31etUwad
	7t7bdNYlFth+90f6jokU/Dwkk8d2OpXixJ0L4T07exT2bBuRjb5eNl/PF1N0mbsb
	F0wz7850K2Xp4+tMd8XxUYK5itbs//3OI1qObAP8MUwcPe5trKVKS5tILE2iI8Om
	Mmmg6nClEuJBHPCddo7XUg/Sf1U77SCyD94HtGe+wOAIFvM7j5uJHONzqyU5CLNB
	yUSImXIKeiYOzd54ow9iuLkEfB3W4cxdYMrXZsd79CmdOg9OhT43MWUVzfDYltLk
	aPmynAktSYaFoFfbzPH9yltZr0urmV29G+EOzfXwG9h8Ojuj/1ynwfWiUzhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660005385; x=1660091785; bh=zg8D05det17wHTcb1SQBJ3QqJGHD
	qgu5vFpaar6HYxg=; b=SllE8aS4h2z9MxtoeAolX2GrOP8mOJu9k3Joa0F0axa4
	E9dIyZSiMJI6DZVOHZuOkqTF5ADybN6kxMMcF4sXne7sNg5MnHdx822jX2ny+LSY
	YgegNddAskWa3SlD/STYB51J3MzuVtKqoHjPburHAfnc8XoqO8ddaXCDOCU4YPt9
	zkjKsfJ0sBp9f4QBj6D5xltsxCQhDTQYeyzjQl1FraeDIC/68x54KTzxRwIFvsvm
	hE3klqEfsWRDxRjLGwp2E5vJqbP4G6T5KW7vsJOUOcn12zPuom1xz/dVvWkppoEx
	rdMU7FIZow7f2UK2K/yk8nvuYJ4BrQov4XappP5GDA==
X-ME-Sender: <xms:B6zxYuA27BcCXmQTkSEuf2mrsoI0NPBiOJud8u5LHS4t__jK8kWwiA>
    <xme:B6zxYoi5VofS3XlBN4-F_8vBU05Yg3cVWhd7V7ddUvMg9IA0oPotMq3uSA2cauvxd
    k95GqRJSQjNn5TgJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefledgfeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:B6zxYhmHXXuBsboX2cRurVAuaiOkb_HBam5SVfx0Tblsv6akdQvagw>
    <xmx:B6zxYsxnIgwSXFqx0aLFgK1aO-RQrlS-oEvRn188GuFTB8MPJmxtkg>
    <xmx:B6zxYjQ-O-iio_KERf8Ul5otTiwh9xSv1nJvflduAn3OjIkDYGEMQg>
    <xmx:CazxYkIPI5XJ1Yl36JGA7ZG6m-RedNAn8CEXNM0rN-Dg-7Z-B1gi7w>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D26901700082; Mon,  8 Aug 2022 20:36:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-758-ge0d20a54e1-fm-20220729.001-ge0d20a54
Mime-Version: 1.0
Message-Id: <cd11b517-ae6c-4a67-9f43-74825812b00b@www.fastmail.com>
In-Reply-To:  <SEZPR06MB52695BDBE90ECE00DB2D9684F29D9@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20220516064900.30517-1-ryan_chen@aspeedtech.com>
 <20220516064900.30517-3-ryan_chen@aspeedtech.com>
 <5d863bc1-4f27-48b6-89ab-c3f02bc09057@www.fastmail.com>
 <SEZPR06MB5269DFE2CF762B62846D315EF2999@SEZPR06MB5269.apcprd06.prod.outlook.com>
 <4c4462a6-e950-48cb-b9ba-822909a86867@www.fastmail.com>
 <SEZPR06MB52695BDBE90ECE00DB2D9684F29D9@SEZPR06MB5269.apcprd06.prod.outlook.com>
Date: Tue, 09 Aug 2022 10:04:37 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ryan Chen" <ryan_chen@aspeedtech.com>, "Joel Stanley" <joel@jms.id.au>,
 "Philipp Zabel" <p.zabel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 2 Aug 2022, at 18:34, Ryan Chen wrote:
> Hello,
>
>> -----Original Message-----
>> From: Andrew Jeffery <andrew@aj.id.au>
>> Sent: Friday, July 29, 2022 11:13 AM
>> To: Ryan Chen <ryan_chen@aspeedtech.com>; Joel Stanley <joel@jms.id.au>;
>> Philipp Zabel <p.zabel@pengutronix.de>; linux-arm-kernel@lists.infradead.org;
>> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org;
>> openbmc@lists.ozlabs.org
>> Cc: BMC-SW <BMC-SW@aspeedtech.com>
>> Subject: Re: [PATCH v3 2/3] dt-bindings: i2c-ast2600: Add bindings for AST2600
>> i2C driver
>> 
>> 
>> 
>> On Fri, 29 Jul 2022, at 12:33, Ryan Chen wrote:
>> > Hello Andrew,
>> >
>> >> -----Original Message-----
>> >> From: Andrew Jeffery <andrew@aj.id.au>
>> >> Sent: Friday, July 29, 2022 10:29 AM
>> >> To: Ryan Chen <ryan_chen@aspeedtech.com>; Joel Stanley
>> >> <joel@jms.id.au>; Philipp Zabel <p.zabel@pengutronix.de>;
>> >> linux-arm-kernel@lists.infradead.org;
>> >> linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org;
>> >> openbmc@lists.ozlabs.org
>> >> Cc: BMC-SW <BMC-SW@aspeedtech.com>
>> >> Subject: Re: [PATCH v3 2/3] dt-bindings: i2c-ast2600: Add bindings
>> >> for AST2600 i2C driver
>> >>
>> >> Hi Ryan,
>> >>
>> >> On Mon, 16 May 2022, at 16:18, ryan_chen wrote:
>> >> > +    i2c0: i2c-bus@80 {
>> >> > +      #address-cells = <1>;
>> >> > +      #size-cells = <0>;
>> >> > +      #interrupt-cells = <1>;
>> >> > +      compatible = "aspeed,ast2600-i2c-bus";
>> >>
>> >> This isn't quite right with respect to your binding description above
>> >> :)
>> > Yes, the compatible need to be " aspeed,ast2600-i2c" is that your point ?
>> 
>> Yes, but only if we agree that we should have different compatibles for the
>> different drivers. I'm not convinced about that yet.
>> 
>> I think it's enough to have different Kconfig symbols, and select the old driver
>> in aspeed_g4_defconfig, and the new driver in aspeed_g5_defconfig. Won't
>> that gives us the right outcome without requiring a new set of compatibles?
>> 
> The new driver in aspeed_g5_defconfig.

Right, behind a new Kconfig option.

> And different compatible string 
> claim will
> Load the new or legacy driver,

I don't think we need this. It's enough to enable the new driver in the 
defconfig (and possibly disable the config option for the old driver).

> it should ok like the different 
> generation SOC. Have 
> different design.
> Am I right?

We have SoC-specific compatibles already, so the new driver can just 
bind on the compatibles for the SoC revisions that have the new 
register interface. The old driver just binds to the device in the SoCs 
that have the old register interface.

There's an overlap in support between the two drivers, but for people 
who care about which implementation they use they can choose to exclude 
that driver from their kernel config.

None of this requires more compatibles be added.

Does that help?

Andrew
