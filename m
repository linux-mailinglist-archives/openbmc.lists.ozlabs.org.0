Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1383B23E3
	for <lists+openbmc@lfdr.de>; Thu, 24 Jun 2021 01:09:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9Jr61gd6z309S
	for <lists+openbmc@lfdr.de>; Thu, 24 Jun 2021 09:09:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=F+dP+lrz;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=UTiGIcaj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=F+dP+lrz; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=UTiGIcaj; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9Jqj5FVLz2yyL;
 Thu, 24 Jun 2021 09:09:21 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 74A485C0223;
 Wed, 23 Jun 2021 19:09:15 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Wed, 23 Jun 2021 19:09:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=KSlYOGHgpU5Dlcy6RFUzQZY7lvA8ovW
 dvMa0nbG4J8E=; b=F+dP+lrzVhW6v5K89nr+8nQL8hquA/3C2Tj3awEWTGW0wKV
 r1c3ybD9Cfh2pasDorMxm2pTtlgsENpC+tkM9/+piA9K/fB8I3ccLpUKs1SCLhru
 VcJO+lrK9mPkzXG15VhVnq1f2yChZeI0RPiHmmTz9y9NwEPovYe+w5BWhxqkW+wt
 ww5ftzRmYcHIa1TfecOoWlJPkAT9wL33Y8zDJR0sAq1vowJADKp8Sy7SMYbqqCPZ
 H9NSqGym5ovYjmjuRLzzNi8bEgeLTeypU9gJb4L9kb2xt12TtiWISvZC2cGGGvt7
 WEEMbTTjUdSZ7XOopwOKjrCRktOYNmguzvdYKig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=KSlYOG
 HgpU5Dlcy6RFUzQZY7lvA8ovWdvMa0nbG4J8E=; b=UTiGIcajtLWr4A9Y0ppSST
 q3Ynfe5n0D+Z3l137UvgGX5BHrziU+An9VuLSrTAbHjFpDqhWeRi4mxQQ3/1G/mK
 vUjCKiEQO01CEtsN6ze9IBUwWuYDFv7jFakZAZWHQf46W7AzgD+8OeeYUFhIKb7v
 7OyVJX+75NFLtjBp5tcRN4rOzA6pVNTkArcdVjGZJQbbHJLivFN3yK5e3bOjgpEs
 K1qL1OSXMprX4xW739h25h/3s2kx2uK9bugDXfEyjm/JXlO2fceTHWambNrxeKyf
 bpXIweRp604x5ZFcfkER6j8/NBBTYWD9VSnzI7sSmbtuI3zdAi00a+7URg0UJavA
 ==
X-ME-Sender: <xms:Gr_TYKpSBTfh1_k7i4hBCoh9IjjJQ9b7_g5jp9zquLkWa6jZHbwSWw>
 <xme:Gr_TYIoKNx7Wh_5FqnpWFhnzwgfnym9yblcaPU720K8o-4ITdKeg0P4TMcnQv_BVf
 SeB0EK4cKlADdTw8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeggedgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:Gr_TYPPQf6tJ1XUidOhUMxBtZc6I67LeGbztESWUePuX6GhwGmmLIQ>
 <xmx:Gr_TYJ61DXoSvx8ypYegs4BGexNFYyeG2Rjbzjm6tpn97lyFxSjXJA>
 <xmx:Gr_TYJ4M7vYgr5BKpks7Cylssw1ye_CPz5YAggNsjlHK8aLmMBmDuw>
 <xmx:G7_TYLSWvrywWPdKCte6lYzGKeMfaY8LF_nQRP79fTC5TitOZZeIgA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 707A2AC0072; Wed, 23 Jun 2021 19:09:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-530-gd0c265785f-fm-20210616.002-gd0c26578
Mime-Version: 1.0
Message-Id: <7365c20e-541c-4e32-a907-0519534117ae@www.fastmail.com>
In-Reply-To: <20210623230401.3050076-1-bjwyman@gmail.com>
References: <20210623230401.3050076-1-bjwyman@gmail.com>
Date: Thu, 24 Jun 2021 08:38:54 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brandon Wyman" <bjwyman@gmail.com>, "Joel Stanley" <joel@jms.id.au>,
 openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH] ARM: dts: aspeed: Rainier remove PSU gpio-keys
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



On Thu, 24 Jun 2021, at 08:34, Brandon Wyman wrote:
> From: "B. J. Wyman" <bjwyman@gmail.com>
> 
> Remove the gpio-keys entries for the power supply presence lines from
> the Rainier device tree. The user space applications are going to change
> from using libevdev to libgpiod.
> 

Have they already added support for libgpiod? We should support both at 
least while we're switching over.

Andrew
