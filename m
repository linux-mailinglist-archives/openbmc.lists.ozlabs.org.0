Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5053EE17A
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 02:53:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpXZR5vfbz2yZ2
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 10:53:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=NlDF0Ps2;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Vm4Z9PD2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=NlDF0Ps2; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Vm4Z9PD2; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpXYy1cBjz308t
 for <openbmc@lists.ozlabs.org>; Tue, 17 Aug 2021 10:52:37 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 3ACF65C01E0;
 Mon, 16 Aug 2021 20:52:33 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Mon, 16 Aug 2021 20:52:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=aRUIVL8bDQg60r27tg3YTaXhc0JWk+Q
 UG2N46SHCKRE=; b=NlDF0Ps29cteRKOTiG9Pg5iaC74XVNa9q/tJLo7XVpsu6z8
 PVpQ4lw7haYVMZPhkLqbEEcOzPDbwtg26wSl8NVquj66OfsMYhPtm7yYDd3Wzff1
 0f+wCy5R1n18cbG+mtNZwfuVS3Z3bWkLKT8qKaOMTmz4uhBBlAgPBz5O8MJWfrtF
 EYix8xpAu3ZrOnY/c4p7/kssu2q9y6TUowMc2+JdmkxGAWZOdHs6ZPrimVHp3j/l
 VPXallVN/5GBChx7nf9g4rcFeOUShFvSqqiAS/4oRDpF882eCJYtFs+arZHoyr7r
 +j++BeMUOQf/+ULSRTjCrgmwUf9CP2Xe/ASa67Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=aRUIVL
 8bDQg60r27tg3YTaXhc0JWk+QUG2N46SHCKRE=; b=Vm4Z9PD25WnxZFf7+Pi2W1
 hEsm3Q6RIFZTzNbdDX6+ssM4TbmZcm18BYRrZ4dkF0Wdy52L4SxLPylH0n8GwFhf
 V0GwoabBE3d4aMNoc6rSTZPvpZeh/ozfDcEmZgpYXb24DI2VUlJWc+pOh7byYwse
 7VFv9FvG84ChJbQPF4+cR4DjynrR05UNZFiHhg0IqFvvnyVmLZpNJzuiU00/apuR
 snPv/n/vVFCTCm9xPBdy78ywxE0KignpBikLlc3pKU4rt2SoQsdZTgqvQm/9J73o
 3zSzB9hyur+zGhQ1jGx9WGziC4cZe6/bJOPLZtYwQwxVKfl1IU84K1tboEz643nQ
 ==
X-ME-Sender: <xms:UQgbYQziIeeUNm7peQTXX5QSB6kegoBi92bBIeRry-9tFt6WCBbJ9A>
 <xme:UQgbYUQjiu0IzDBJfeZhwKIGwT8YrHcLNVL1LOQKZ6oMDWmAECgUtkhfJRgZ-spmj
 3x8oZUmibAPgJerMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrledvgdeflecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculddvfedmnecujfgurhepofgfgg
 fkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgurhgvficulfgvfhhf
 vghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrfgrthhtvghrnhepte
 duudeugfffffduffetgedtkeetieellefhueeuhfdtjeelkeejfeffffffueeknecuffho
 mhgrihhnpehgihhthhhusgdrtghomhdptghonhhtrhhisghuthhinhhgrdhmugdpohhpvg
 hnsghmtghprhhojhgvtghtrdighiiinecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:UQgbYSV0kLEh2TJnH9gwe_wlebKs-C0xGhez3yxrzX_QHQN2inWKNQ>
 <xmx:UQgbYegd2s96FpjbIvVVR4VRjSoHBJfNdyUW5YKFnHoZ7feDbxqvqw>
 <xmx:UQgbYSDw4HRZES3_JJf9CLZmDF12B2mvSvQ6_d-VHgxMuT68LXnA6A>
 <xmx:UQgbYZ_6TS9-iPd7r72I3YJ3v6oroZViXrm4livm9Wj97WMJksT7qg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 079B1AC0E77; Mon, 16 Aug 2021 20:52:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1118-g75eff666e5-fm-20210816.002-g75eff666
Mime-Version: 1.0
Message-Id: <f8640524-be37-405c-ae16-8a65e9140b85@www.fastmail.com>
In-Reply-To: <CAK2KAUCFQSHq9zu3JaJ6gG_VYTywUJXydWPcuZ0nHuEDtdQJDw@mail.gmail.com>
References: <CAK2KAUCFQSHq9zu3JaJ6gG_VYTywUJXydWPcuZ0nHuEDtdQJDw@mail.gmail.com>
Date: Tue, 17 Aug 2021 10:22:12 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Figo Chen" <newb2.d.c.2013@gmail.com>, openbmc@lists.ozlabs.org
Subject: Re: Apply the account for OpenBMC contribute
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Figo Chen,

On Mon, 16 Aug 2021, at 16:16, Figo Chen wrote:
> Dear Sir,
> 
> May I have an account to join the OpenBMC git to contribute ?

We need to unpack a few things to answer this question, because how to 
answer it is less clear than you might suspect:

1. No one needs to create an account for you if you're looking to push 
patches for review, you can do this yourself by following the process 
documented here:

https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#submitting-changes-via-gerrit-server-to-openbmc

Essentially, you need a Github account, and once you have one, you use 
it to sign into our Gerrit instance[1].

[1] https://gerrit.openbmc_project.xyz/

2. If you're looking to become a maintainer and have the ability to 
submit patches, you need to show the existing maintainers that you're 
capable. This is usually done by participating in discussions on the 
mailing list or Discord, reviewing other people's patches and proposing 
your own.

To the point: Generally a very small set of people can actually merge 
patches.

3. Currently, contributions to OpenBMC require signing a Contributor 
License Agreement (CLA). The process is described here:

https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#starting-out

Essentially, If you're doing this out of your own interest and not on 
behalf of an employer, then you need to sign the Individual CLA (ICLA). 
If you will be contributing on behalf of your employer, then you should 
convince them to sign the Corporate CLA (CCLA). Prefer the CCLA if you 
can.

Hope that helps,

Andrew
