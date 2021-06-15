Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFB83A8BF8
	for <lists+openbmc@lfdr.de>; Wed, 16 Jun 2021 00:44:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4NfV6DkGz30HP
	for <lists+openbmc@lfdr.de>; Wed, 16 Jun 2021 08:44:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=lGj6R/+6;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=GqZUIEzV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=lGj6R/+6; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=GqZUIEzV; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4Nf66b64z2ymQ;
 Wed, 16 Jun 2021 08:43:57 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id D1FE458065E;
 Tue, 15 Jun 2021 18:43:51 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Tue, 15 Jun 2021 18:43:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=a1n+H/r58DrOu+6wcj/wMJNk6uExtCA
 2MLS3ZO7f12A=; b=lGj6R/+66HbO6xVEUCX76buv6MYW71elWUJJuPrcmmLSVGg
 svKC7FWTrs8kgjbZxZeevSFXao36yqVtBxP/SJjx7aqv5whuhtbhcgyvsqYBGnnz
 POsQYIVK+X62IRl4ktGGovtB/7KclgEiWAsVnWyaWh0y2/KQEKZnWWpJrVd5BFDi
 j1B1nTeLok8Hej78jMj7Edlesnvkr41HGlvwhBkvIQ5rcjjFMiG21qWzkoOxIbKb
 FgpLrlZw40QXDDqPj+l4ubawV9pN+Z9CdPoddm+8sO0vKtKOaug8ZhbUn2Mkpxfz
 oH/uBFekOOTAyJctyhS5ZFS8Duo/IZluq9vzdSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=a1n+H/
 r58DrOu+6wcj/wMJNk6uExtCA2MLS3ZO7f12A=; b=GqZUIEzV6YS275fl4SANx+
 mZErkEiN8pmieruei/4/wp0ZasHnttA8jHvz4L1dfXbZomBqaTVxxXzs4z4sjDJc
 QOVQWIM8G9gdpT6vIDkOQkfunV00dXbrhn2kAkQrRfPZmqg2KIVUzeTBPt2kJI5d
 6sFKhkeibJSOLDNU2dKLF9GSdG1L1R/Yq3rv/kwbQZ12oQb+1na1q5WqgbdJx+HU
 RobnuRNPk+DTNV/zTGAZXpX6+kerNGrABlmtgR80TTjUjKRbNW7xB3ZoSfjaPvrz
 sUUbpxvh24Op2NBqtJCRfUBGhMC0nWFicI6piKdc71NHLIXjgVn7pSfA42kGZtXA
 ==
X-ME-Sender: <xms:JS3JYLFzeUG-G4ItQU95L2gbxSG-t77RqVTH8B4ylREYwkm7YCifLg>
 <xme:JS3JYIVkyWuKHOZn0IqTg2KlJCobHOa936ZCHz1Q9z4-6s5CDPm3xdyXZz5mWGpVo
 KY1qwna4kxNwy5APg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvkedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:JS3JYNKiC80ZuBJ-BT-1pDa6_TI8kQttNo46T0kSG2r3f0eXEAsJfQ>
 <xmx:JS3JYJFruDxowjGWIQWZRpqCPBut-k8QluPUfUcVp-IL-wLsjiRGSg>
 <xmx:JS3JYBXXGa9e4LBN02HKMxWEQ_CXdUYqw4tYUCsqfsjN6sv5AuLivw>
 <xmx:Jy3JYCUF5sJgpAE65-7bbyiFrhZTXai1EEe-rJYJcUoyN2N-kZyGGQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6B5F3A00079; Tue, 15 Jun 2021 18:43:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-519-g27a961944e-fm-20210531.001-g27a96194
Mime-Version: 1.0
Message-Id: <b1b7fd82-3edf-41a6-baa6-530bcf76c3ca@www.fastmail.com>
In-Reply-To: <20210615184657.GF2921206@minyard.net>
References: <20210608104757.582199-1-andrew@aj.id.au>
 <20210615184657.GF2921206@minyard.net>
Date: Wed, 16 Jun 2021 08:13:27 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Corey Minyard" <minyard@acm.org>
Subject: Re: [PATCH v4 00/16] ipmi: Allow raw access to KCS devices
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 linux-aspeed@lists.ozlabs.org, CS20 KWLiu <KWLIU@nuvoton.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, openipmi-developer@lists.sourceforge.net,
 Zev Weiss <zweiss@equinix.com>, "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 16 Jun 2021, at 04:16, Corey Minyard wrote:
> On Tue, Jun 08, 2021 at 08:17:41PM +0930, Andrew Jeffery wrote:
> > 
> > Hello,
> > 
> > This is the 4th spin of the series refactoring the keyboard-controller-style
> > device drivers in the IPMI subsystem.
> 
> Ok, no comments and everything looks good, I have this queued for the
> next Linux release.

Thanks!

Andrew
