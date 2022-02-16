Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7E74B8FC2
	for <lists+openbmc@lfdr.de>; Wed, 16 Feb 2022 18:56:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzQdG142Sz3cHf
	for <lists+openbmc@lfdr.de>; Thu, 17 Feb 2022 04:56:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=LOGfb8He;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ROppxVLv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=LOGfb8He; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ROppxVLv; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzQcq0y5lz30NR
 for <openbmc@lists.ozlabs.org>; Thu, 17 Feb 2022 04:56:26 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 8422F5C0240;
 Wed, 16 Feb 2022 12:56:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 16 Feb 2022 12:56:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=OMfQ+YVEWP7ZBS
 vkUD5hNf4CcJH5hNzDAwI2Sq9JB/s=; b=LOGfb8Hesb/zjyciklA7K6s7t/rOuH
 l1kUb5hqAia8z5DFz6TsaAgRyKIBQE7rL3xRD8xxpRaUO4olgWCJDelLMB8WmEKR
 aA4sc0Zpykr14AH2NY5jhdVD0CexV1BiDdBpC2X/Ssk4/tQM9LTauRUfxfeeT9Jn
 Y/DHGot6rCykgQY81EIQXxcMTBbUfc7HUSJlg/Gg5YFMdzSYskpCG6AdXIKaTlRP
 IPiG1Ow1J6yt3OXR4pUPMDTjg394h4I9vuvkhL4DyLarQ30Cc+PBK2sl4WPCkFXX
 sbt2bzDdRucu5jVFyThQikC9L6Dgx1K+5tWeTUXK4G53HWLLdhtwM66g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=OMfQ+YVEWP7ZBSvkU
 D5hNf4CcJH5hNzDAwI2Sq9JB/s=; b=ROppxVLvF+RqYoAITRsikjtyjTBokl6ez
 LiCwJoblpe53tkYf1i74jtoU3wNnDnRbzz7WDT6C7MxzlTJryU9gmN7p2Or2xRLM
 gxo6/USdcUabSPk75bZolA+zoTiKnmlHqiZ419m2dypMr/326txBoP1ItpNajppV
 75bpeVUsFaMvXqboux2j6OkDKc7Fga0TUwiWoXdiwa7mAr3dtqmV14r8nV1cToKp
 MF22lgEVB7VQ71I85GELUlKPLE0iU6RaKjR0CfaPqwiT8e6qdA4rBV/ruclW1/5c
 8KgigqbaZIS2UIhpCVflvZ5Lh3BXiLpUN3mDiB07nucvkAhZha5/w==
X-ME-Sender: <xms:xjoNYt7rnLWoulZUZ1jVElydU5SXgnOsVT6nRtR6S2kSKYfj1vcHlA>
 <xme:xjoNYq79V4xb7b6It6r3AuihBjNLTYQlc49l4tz6XKAQ1Pp9Tfb4Q_xE-VNKA4Y_h
 2T5mMa9425XFpz8gRc>
X-ME-Received: <xmr:xjoNYkevKYf-yX6LUTqdcdInW1NZGIqhH4xWyUKL8qs_e54LSsrdPHdg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeeigddutdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesthdtredttddt
 vdenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiih
 gvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpeekkeeliedthfdvtdeg
 ueehvddvkeeivddujefhhfevhfdujeeugeefffeltdejtdenucffohhmrghinhepohhpvg
 hnsghmtgdqphhrohhjvggtthdrgiihiienucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvg
 hlrdgtohhm
X-ME-Proxy: <xmx:xjoNYmLXkGw15gK7te_icwk4ms3wgntBsscpb6G3SkrvqPEhj9Ex4g>
 <xmx:xjoNYhKFySFr_JlA-UqQBTgTTWYzPeM2FSBFGnacPzbK6WEDWuzVTg>
 <xmx:xjoNYvxw2jneBL0blVX54tUOxFl3oKmHuvaa1mMnLb-R89x9shkDHQ>
 <xmx:xjoNYjzOzOYvXtpS54-hsArfU5bfofQ77SYyMV5wtIdItXm7qUNERQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Feb 2022 12:56:21 -0500 (EST)
Date: Wed, 16 Feb 2022 12:56:20 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Gilbert Chen <Gilbert.Chen@arm.com>
Subject: Re: request to add Gilbert Chen to CLA repository ACL
Message-ID: <20220216175620.qwdoegm5d7ja3hof@cheese>
References: <PAXPR08MB6560EBD9F7A7DB8A23A9997E862F9@PAXPR08MB6560.eurprd08.prod.outlook.com>
 <af16b2be83e516ee1315ed6c238e98384fdf473b.camel@fuzziesquirrel.com>
 <PAXPR08MB6560E663519DBD5399A077CB862F9@PAXPR08MB6560.eurprd08.prod.outlook.com>
 <PAXPR08MB6560715A7152F90C9274667B86359@PAXPR08MB6560.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <PAXPR08MB6560715A7152F90C9274667B86359@PAXPR08MB6560.eurprd08.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Feb 16, 2022 at 01:48:55PM +0000, Gilbert Chen wrote:
>Hi Brad,
>
>The change of openbmc-build-scripts has been merged. My gerrit account is also in arm/ci-authorized group.
>But the gerrit patch I submited still cannot let OpenBMC CI work for me. When I push new commit.
>The change log of gerrit still shows "User not approved, see admin CI"
>https://gerrit.openbmc-project.xyz/c/openbmc/pldm/+/51184
>
>Sorry for trouble you again. Do you know if anything I missed?

It is no trouble.  I forgot that Gerrit creates private groups by 
default, which would cause this.  I've corrected that and it should work 
now.  Please let me know if it doesn't.

-brad
