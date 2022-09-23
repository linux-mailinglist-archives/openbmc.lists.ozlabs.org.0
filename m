Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DE35E73A2
	for <lists+openbmc@lfdr.de>; Fri, 23 Sep 2022 08:03:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYhRM6Zhnz3c7g
	for <lists+openbmc@lfdr.de>; Fri, 23 Sep 2022 16:03:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=L6oPndB+;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=fL+1Ay1S;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=L6oPndB+;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=fL+1Ay1S;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYhQs1QKnz3bbj
	for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2022 16:03:16 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 12B695C0114;
	Fri, 23 Sep 2022 02:03:09 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Fri, 23 Sep 2022 02:03:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1663912989; x=1663999389; bh=LbPN/wK4lS
	Id3SPNtqVAxk+CNaQoe5IR9K4RZDGQeko=; b=L6oPndB+iNQNRTjWQkIAYkRY0Z
	QYhA87rmRJHgzQbzEU/SkmeIOYjzlISkuNhZXMtH/F49LfgvixRgyiyYBI+++z/D
	CszxOuqr6JzZ1+XKZyp+3hHqiNr65+LaXv42t2WQMbf5pvsjwmSwzDSdMFrrX1ZI
	6pw6ihyeGZGreiAeBYuXp592nY/e9ZqYqOnVXyvcrZru+gO/29PI3QFKLzHgmcrh
	doMhiwJkBOfJGSqqKjMuMPCBppHEBZUZrzZvkAo4K3cPeczxrokxYbWfPDs0BBx5
	V4mPHQkZLrzwGxEDbna9Y0v6q0zvkbX4oUABRW6ntcIJjqlcWqFfTItOGuEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663912989; x=1663999389; bh=LbPN/wK4lSId3SPNtqVAxk+CNaQo
	e5IR9K4RZDGQeko=; b=fL+1Ay1SqqlFPhNhU0C77+jhhyQyifpAxlinYlw72wae
	MoKmttNgvFDBUmkbAWjDXHSX0XhqZ3G3jbRmEj4KEkS+yDTEKPlmWU+jNlDJcS2T
	50AszOa+5/TSOAaBZtD/yntzKIaCJtU4S7dbW5EkU9jBpi5c3y1QjCsvohxSHV6W
	4TDwKiVuoOluJx8DnZoWxYKHjXZ8MfwJw1fNJD61q7Q9825sJ3UehTOtsxIjyFod
	eZjMJvVTN0rer8F69L1T+VqFLCdKLSreUej94TBoCNDqI8AZUXjojEwOATUcwh/u
	KqFiH6r1bHifU3apOWh7NLYvljUHcYdjLMEsk5oy+w==
X-ME-Sender: <xms:HEwtYyQWRVig_pDQ_x4wjbVLRaeSW_0qNkeZGv01AVxR0RT_OWyLGw>
    <xme:HEwtY3zhdJDf1_5niBXctQGF9WKn4i8N6OzmFJ12VsPh1OGpS0PuNW67LztxoW8UG
    qNv8H0P7AFhQ7bEOA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefhedguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    nhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecugg
    ftrfgrthhtvghrnhepkedvkeejkefgjeduffetteegjeekteetudevtdfftdeluddthfeh
    veefteekieetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:HEwtY_3BCeLePFryoMFOKOZfHG0HRBAfpnQcU7xagJMmUuWNEWWUkA>
    <xmx:HEwtY-BSkIIpF7ek618DGzVSbG518I9BwL8vkJu3Loz0Xlmz3EFJ4Q>
    <xmx:HEwtY7hNrCSK2FHZa6sZGunQ6dWmafsJcQ-evJwfPSIgDypPKosE_w>
    <xmx:HUwtY7JBnId7_G_YdA1U_yBu2IEFuRVAZRl1U48HbF9R7YMY4AqQsg>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9C9D91700083; Fri, 23 Sep 2022 02:03:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <932f4c6a-599c-49aa-9db4-a560b7727885@app.fastmail.com>
In-Reply-To: <20220921074439.2265651-2-joel@jms.id.au>
References: <20220921074439.2265651-1-joel@jms.id.au>
 <20220921074439.2265651-2-joel@jms.id.au>
Date: Fri, 23 Sep 2022 15:32:48 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v3 1/4] ram/aspeed: Use device tree
 to configure ECC
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
Cc: Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 21 Sep 2022, at 17:14, Joel Stanley wrote:
> Instead of configuring ECC based on the build config, use a device tree
> property to selectively enable ECC at runtime.
>
> There are two properties:
>
>   aspeed,ecc-enabled;
>   aspeed,ecc-size-mb = "512";
>
> The enabled property is a boolean that enables ECC if it is present.
>
> The size is the number of MB that should be covered by ECC. Setting it
> to zero, or omitting it, defaults the ECC size to "auto detect".
>
>   edac: sdram@1e6e0000 {
>     compatible = "aspeed,ast2600-sdram-edac";
>     reg = <0x1e6e0000 0x174>;
>     interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
>     aspeed,ecc-enabled;
>     aspeed,ecc-size-mb = "512";
>   };
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
