Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D49528CC7
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 20:18:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L26vj2HS1z3c96
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 04:18:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=tRTKawTz;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=g8xn0+IN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=tRTKawTz; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=g8xn0+IN; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L26vD5jgwz2yHB
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 04:18:31 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 75BE25C024B;
 Mon, 16 May 2022 14:18:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 16 May 2022 14:18:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1652725107; x=
 1652811507; bh=/uxANgtIaCE1iQSkjhYgC55fRgh1fYHq5gcdSsJ7YoQ=; b=t
 RTKawTzjO9ykp6aAsaGNo2FtKRFARvYebxyQAZKECLPoV+eiskUzZrtF+zVGNs7z
 ka6py5ZlPLFkZt/Udxe1r2P1hf820xHwcxKlhbM1iqmA9xN8fJ0CogY7YKgUsz33
 +lBdAP7I0E4Zq/Ea3+oItv/c4BT1NcVUUpH7ITIdBZqI0PPXcvJzth9SWqBmUatB
 lWkHTGixOjLgWEVUWVA83r/+/sL1I0Y4Y+DFdjYsCSnSrAsyGHYBA8PX8SyTmO2M
 j31r68+SOcT1RU0UkgRVHr6kLfkoDVVePgwRMrqqfyVD17oBAFQ0+m0I5xRu3cn5
 xQpcwTt4/L+UN7cynfhfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1652725107; x=
 1652811507; bh=/uxANgtIaCE1iQSkjhYgC55fRgh1fYHq5gcdSsJ7YoQ=; b=g
 8xn0+INfrSoZWggQE0OzeM9sBZnUGgkqex0ltG8z65jBzv/CgJE2B9GxhadBd5Ky
 z4brcBsvRiAXpKZYAiXSAbeGcdCYWZ4DsYiMee6X3aUqCTW/rGqnT9aPKbSDx6GG
 1J73oiSPurbR7LA/aLRgDDwLJZ7h8O3SDy8kO31TaKxP29ZpjyRwKx63E2aQtKPa
 +iDpVFODf6mncop69mZS5n72S8+xdtyMtibYXXhVkStJozinWZQE5FmptLYDvUPx
 wNImt9As+elpwYBP8zlHaz2/OM9E9pEhzTU+uECvtASImuordD7+5GOc19dcGkMT
 oUGBq7mTZvkMQvkLCSXQQ==
X-ME-Sender: <xms:cpWCYgvUfetPWYkXfTzrsdWCQdbqTi21hiDeG72_66yNhIVLrrMtNA>
 <xme:cpWCYtdGL503QxS_eOdWbm_POLYURrwDIiHkuS7aV-R0NLZI7f4grN0qw5L_0wpQP
 WD6scsE5w3JnxPIFkw>
X-ME-Received: <xmr:cpWCYryrWh5adkKPNEJhZuYXKRxnWuWHJLVZFw93-wYoR3mebWbSDPi1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdduvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehrrggu
 uceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
 hmqeenucggtffrrghtthgvrhhnpeffvdeljeetgfevleefuddtgeehuedtgffgvdetveek
 keelveeigeejfeefueffjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigs
 sehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:c5WCYjNzGQF_KFFKY5qwQPE1-Q99HxZZtd7fEJCq5KotlGP9skfIfQ>
 <xmx:c5WCYg-jnf5MySlWEmcxETU9EvVRXXDxxegfONMqQlSCPykNtgh3BA>
 <xmx:c5WCYrWDWN48A5DhlHGgvwvuUNIdFarHqnyqa9OE9yWOlz8h7KisTQ>
 <xmx:c5WCYiJjjlnETgn2DHkodS8Cs-BUfmF-XZA1w-yZFQlvX27AHLraaQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 May 2022 14:18:26 -0400 (EDT)
Date: Mon, 16 May 2022 14:18:24 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Aspeed SPI driver upstreaming
Message-ID: <20220516181824.ntp33kv75subztsa@cheese>
References: <20200106232722.GB1233@patrickw3-mbp.dhcp.thefacebook.com>
 <31ec66fe-9ff9-b28b-3b83-a6c0a7959f30@kaod.org>
 <20200109164317.GE1233@patrickw3-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200109164317.GE1233@patrickw3-mbp.dhcp.thefacebook.com>
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
Cc: taoren@fb.com, openbmc@lists.ozlabs.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Patrick

On Thu, Jan 09, 2020 at 10:43:17AM -0600, Patrick Williams wrote:
>It looks like this patch set is still the MTD-only implementation, which
>is useful for SPI-NOR chips but not useful for non-flash devices such as
>TPMs.  Is there any work or thought into how we could do a generic SPI
>controller and then layer the MTD above it?

I wonder if it is "just" a matter of implementing one of the low level 
controller methods described here:
https://www.kernel.org/doc/html/latest/spi/spi-summary.html?highlight=spi#spi-master-methods
along side the spi-mem callbacks...

>We have some system designs where we have both a NOR device and a TPM on
>the same SPI bus.  What we're currently doing is using the
>(non-upstream) aspeed-spi driver which lets us use both the TPM and
>MTD/SPI-NOR driver, but since it doesn't have the calibration routines
>the SPI-NOR runs at a slower speed than optimal.

Are you still using the aspeed-spi driver?  Have you had any issues with 
using it?

Thanks,
Brad
