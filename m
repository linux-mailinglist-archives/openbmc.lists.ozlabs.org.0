Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2436A3FD21A
	for <lists+openbmc@lfdr.de>; Wed,  1 Sep 2021 06:22:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzrW00PpSz2yJq
	for <lists+openbmc@lfdr.de>; Wed,  1 Sep 2021 14:22:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=h8DM0elI;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=KWw/2WzR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=h8DM0elI; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=KWw/2WzR; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzrVT10xhz2xfH
 for <openbmc@lists.ozlabs.org>; Wed,  1 Sep 2021 14:21:52 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 2D53F320076F;
 Wed,  1 Sep 2021 00:21:48 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Wed, 01 Sep 2021 00:21:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=2NjnRziPa5JFGhjHhPlz+ssvtz0s5yT
 2qfH6E9G2cR0=; b=h8DM0elI9SA0SyNEWw5QmBuDOZNd/PATUK8B97j8OuKLOA0
 0tvFCvE1S+sbcPtMxZvRlaPQFMwrT1MHD/EL1cLzbyGxy6IXt0jo+V+7+5AiPI2Q
 BI5+64lcNGnKA6Kry+T+fS0lNxjy2yVYBoe3E8DUiS+wAAOUvoOMZS4hElocux/a
 ApnFHoJKEunM8fSUvmu6Xa4lAdAlr/VFQfmu7pOzv6Ueaar7C1MZ+E7Z4ueQA/+a
 FuJz8B8LmzVM1J2hC9cY8xL2/aJjyENOZe7K6WuPvTYpIZOm5Re8aX99Zw68RPZ7
 ib9HeQoEfb1vw7heilZauivVVoJrvBgEk4e0tUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=2NjnRz
 iPa5JFGhjHhPlz+ssvtz0s5yT2qfH6E9G2cR0=; b=KWw/2WzRNtdfohcMofi5fZ
 B6cWpfrrPJDQhk32tUq7UhmMXRHCa2Ey8atSp9q2A3XxOWYfWDZyyJ6HkhymCKoU
 llVsF8GsqJxdIc6iQordM+5bCcDfG9LRVB51a/aXYRsaJZBXFQdO0CiBwoq3sxFQ
 ihte9yitpLxTNYcA7nmGmoVqav3/4kyRIivkZ7zQZ+ycYZkzNLLygA0pQ1MI1BLd
 EGEdBOCNRyrTXFyivW9lkbLrIWaohBodk/lKKHNKhGu+6uZmmjXW13HFHQKJwfFK
 QWh1mt5OHi1yLBvM4ItZPGwmY/rdyqEBECwonV0S/OmHSbjNCRPg851OlYaRdoPg
 ==
X-ME-Sender: <xms:2v8uYf2-HklKEMRvMEDwcgpDAkGOcUvEgGzwRRoZFIgh8rDrT2K1sA>
 <xme:2v8uYeG74ICj04NjMyoGKaQLfKADZKw0-VNAhGEOnmcR5zmg_dvZd3QXh8xA_GBmg
 PCjeiVG3PGo5lGUwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvvddgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:2v8uYf58SBH84Y7OaaticU2J38NatB4HxE3_8jR0tplH4zbAqrUntg>
 <xmx:2v8uYU3YND9V2rk-iXYALKEpnE91tbJw7vhGTtr0BSl3mZDtwbIDeg>
 <xmx:2v8uYSELFc0iEeoNQ3gKeUJdCagFQWYAl76ExYkGW9HuQsIk62cUwg>
 <xmx:2_8uYdP7_Dq-s47VVQncwDWAf9KMRI7IElRVDaRnVB6Q6fWvqXqk9A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7EA91AC0DD0; Wed,  1 Sep 2021 00:21:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1126-g6962059b07-fm-20210901.001-g6962059b
Mime-Version: 1.0
Message-Id: <bf9d4499-a6de-4ef6-b9bd-5e0564f856f4@www.fastmail.com>
In-Reply-To: <20210713190014.8142-3-bentyner@linux.ibm.com>
References: <20210713190014.8142-1-bentyner@linux.ibm.com>
 <20210713190014.8142-3-bentyner@linux.ibm.com>
Date: Wed, 01 Sep 2021 13:51:26 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: bentyner <bentyner@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.10_3/3]_ARM:_dts:_everest:_Define_name_?=
 =?UTF-8?Q?for_gpio_line_B6?=
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
Cc: Ben Tyner <ben.tyner@ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 14 Jul 2021, at 04:30, Ben Tyner wrote:
> From: Ben Tyner <ben.tyner@ibm.com>
> 
> gpio-line-names B6 set to checkstop
> 
> Signed-off-by: Ben Tyner <ben.tyner@ibm.com>

Has this been sent upstream? Regardless:

Acked-by: Andrew Jeffery <andrew@aj.id.au>
