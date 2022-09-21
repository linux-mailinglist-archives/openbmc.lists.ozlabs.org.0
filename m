Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EEE5BF61F
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 08:13:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXSl32qfNz3c1c
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 16:13:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=LnIKTLlY;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=XWRj+TiX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=LnIKTLlY;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=XWRj+TiX;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXSkd5zzYz2xgb
	for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2022 16:12:41 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id E7E545C00C1;
	Wed, 21 Sep 2022 02:12:39 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Wed, 21 Sep 2022 02:12:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1663740759; x=1663827159; bh=hUcLxCXyQL
	c9kQIPtGK9YpTeOBnDErEijx4VR6BZEMM=; b=LnIKTLlYSUgyqfLQmpDGDKBexc
	1zm0fnk2UYWW+Tq4ha4xmUUFLmDKJqX3UCRZpWIGzl2G24wK7U+6Zjwpe1b0v/vt
	7/Bu3nZgZDo5+xVzyEY9pAaPTDvYmGIFRPsmkiV7EBOs05I4lH+/jJHeOQCh739o
	gGPelpdPDljhhLWX1mwUdu8vy8tk+ckslShWIScGgrY7QQ5bDuJUN6+pGH0ykLjv
	mkXNsdaff8/laVjke8mS8ZVAuTduTc6VcBTvJDhCeQyw3QOBgxoRgGtwHaNay57z
	i54IH03Kljdu9Y6vwN/9JStmm4FPDDU6kZmAIPQSAZmrzDrvwDo6zZbEbYPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663740759; x=1663827159; bh=hUcLxCXyQLc9kQIPtGK9YpTeOBnD
	ErEijx4VR6BZEMM=; b=XWRj+TiXMSN2O4w692VTbv0BUYqJ7UVVnRwcA/eyExHF
	ZmCejupt5CsrNXU1DFCIb3NkX5Jh7hS0N4B2ny43GMXoeW9Gzi6BTGLF1pvJoke6
	ZWfXldKvN9V3lCugOWcO8sMqQT+K7v7gOSsWK29CR25xizUc1STrVjUx1hEsH3Ev
	/7je8o664cJYz6qWr4aGyBxd/etGGgyNNhfj+oC/In/LcyzHKPnbtOWqg2n7OE1F
	VGUvIwtkkYbFeajEjqXeu3YoM09yrs+raLkGxWGoql2yet1QVVckb4Evdx0uJeFu
	eHtKHgp+Ng8effGnTRwRxS821msuBmNPfW0/oUiPcQ==
X-ME-Sender: <xms:V6sqY33kHsM-Yy_mY_OwlWuQyg61L9kzCkRGWYCv9r3AFkAJ741eKQ>
    <xme:V6sqY2GzoSapE_WzBltN8MDAtJOlzAIuVLf1VhJG8rm4iediRRHJcYPQQYd_4ytV2
    LH9aBMyEQuuiSe2qg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeftddguddtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    nhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecugg
    ftrfgrthhtvghrnhepkedvkeejkefgjeduffetteegjeekteetudevtdfftdeluddthfeh
    veefteekieetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrh
    homheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:V6sqY37ezizhc-xS04ROyQT0sTG2YAUE1piHoYe9rRZ1eN1eM-oOLw>
    <xmx:V6sqY81bBZWsCtE2DyXhHOr3jkRNGHn86Ts_jJuWc_q8uPni8vCeWw>
    <xmx:V6sqY6EIAufzcSmeA_6mnZpEZ_hPO_OtRpITDBg33GBwMY5oPvA6MQ>
    <xmx:V6sqY1MNXtVXnYB38lL3T4wkCWI7MGN3y33_nGcy1cJ7rBHGnhBgXQ>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B41DA1700083; Wed, 21 Sep 2022 02:12:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <c9adde33-09c1-483b-b30f-3b3797fe8904@app.fastmail.com>
In-Reply-To: <20220921045420.2116037-3-joel@jms.id.au>
References: <20220921045420.2116037-1-joel@jms.id.au>
 <20220921045420.2116037-3-joel@jms.id.au>
Date: Wed, 21 Sep 2022 15:42:17 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 2/3] ram/aspeed: Remove ECC
 config option
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



On Wed, 21 Sep 2022, at 14:24, Joel Stanley wrote:
> Always build the code now that it is enabled by device tree.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
