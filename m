Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 262DF3D325E
	for <lists+openbmc@lfdr.de>; Fri, 23 Jul 2021 05:54:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWFnP04tQz30G2
	for <lists+openbmc@lfdr.de>; Fri, 23 Jul 2021 13:54:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=V4GRmNXw;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=wlzJeUfc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=V4GRmNXw; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=wlzJeUfc; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWFn04YF0z2yMS;
 Fri, 23 Jul 2021 13:54:12 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 9DF345C010A;
 Thu, 22 Jul 2021 23:54:08 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Thu, 22 Jul 2021 23:54:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=xS4UlT8eqZ4HbXnlKo2wRx3nOGUU1G6
 jbgGMu/4vs7E=; b=V4GRmNXw9KxItI2mclr4P+n+y8MA8ohHFIEiZXjKM2s3p75
 SQKSig8Osajim9/1m1is7b7WKEowNmgNGdqV4axk/2Z4tp4lLv073ibqngaPYfjG
 e4V2alR9GeZWg8F858x2mkhFJbyUZUBRar742VlCjimn5OnUrlQ9kiqEYFU3LreP
 IbrwbzbeiPyn/xnCnQ0Aetp1TWWelym9wg4u8qMn/COQSapHyvZ2ST/TCEysF6jg
 gH6yo72CdhGhghz6ajk6cNovHk8undf0uakPhoCAZC8VUsOjzwM4q1lScOv1umeD
 3KZQtz39m1Van/ZIvjE/ee6G6VFMM2k5SBj/sZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xS4UlT
 8eqZ4HbXnlKo2wRx3nOGUU1G6jbgGMu/4vs7E=; b=wlzJeUfcOGgr90bxzOb/YU
 p0eO2F92UQrQECl7mHnTMLE7Y46Peyugd3oFmRgywd01jdXcyc3BeR/i/Ey49FXP
 gxglJqNgD9w10hsDOZ4cLTNcIskESK/ScJYvjhOlYTj/1RRE3Sq+SuQZM1Q3Q0Ce
 akc5G5li/9elJ0wxUPRHiPeJDpeF/0aq6Epk5MjDzS5M5bdBL5sBhV9ZXMnKiOr5
 pSVLJiL7mIL188VRrhXAQgjKsQNUEj4NJZzVI4i1esoIdjodm8aOmd2ySvS8t/Gu
 v2/Cmuk/8u1loz4t4snAqERgcVausfEK3Bomvymokj4i7EnzDywm2DGgI5v9USGw
 ==
X-ME-Sender: <xms:Xz36YFf46-PrPSbgtq7O3vj62FfOVuectW20CypNFeNX1Jy7gl-nBQ>
 <xme:Xz36YDMDwbY8Mzp-kyMu8e_v-j3IFEIcTI09R_4vy00RMmqTc6l7aqGeLwLxSsE0T
 ERqjkk4KBH4pCDHgA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeejgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:Xz36YOiGcl1e3MCA7GD69oDL-9tnudc9JNoEvs_AwEjy0v0e3iwzAQ>
 <xmx:Xz36YO9Mu4E1ZGuLuI_3sMV6oyYzbeEi0b-p9IjOvTyj_gF1_XkZ6w>
 <xmx:Xz36YBtAdu4XkqW2JPx9viqc8oIkT33cJbhrGvhfi7E3bCvg0Xtm8w>
 <xmx:YD36YLLBSgtUbo_evZVcsicStpYcLR8BwnZrIr-5ufCXutjdwkWmDA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8EBF3AC0DD0; Thu, 22 Jul 2021 23:54:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-540-g21c5be8f1e-fm-20210722.001-g21c5be8f
Mime-Version: 1.0
Message-Id: <d6beadd3-cd57-40ec-aee7-0dc9d8209461@www.fastmail.com>
In-Reply-To: <20210723034840.8752-1-rdunlap@infradead.org>
References: <20210723034840.8752-1-rdunlap@infradead.org>
Date: Fri, 23 Jul 2021 13:23:46 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Randy Dunlap" <rdunlap@infradead.org>
Subject: Re: [PATCH] pinctrl: aspeed: placate kernel-doc warnings
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
Cc: kbuild test robot <lkp@intel.com>, linux-aspeed@lists.ozlabs.org,
 Aditya Srivastava <yashsri421@gmail.com>, openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 23 Jul 2021, at 13:18, Randy Dunlap wrote:
> Eliminate kernel-doc warnings in drivers/pinctrl/aspeed by using
> proper kernel-doc notation.
> 
> Fixes these kernel-doc warnings:
> 
> drivers/pinctrl/aspeed/pinmux-aspeed.c:61: warning: This comment starts 
> with '/**', but isn't a kernel-doc comment. Refer 
> Documentation/doc-guide/kernel-doc.rst
>     * Query the enabled or disabled state for a mux function's signal 
> on a pin
> drivers/pinctrl/aspeed/pinctrl-aspeed.c:135: warning: This comment 
> starts with '/**', but isn't a kernel-doc comment. Refer 
> Documentation/doc-guide/kernel-doc.rst
>     * Search for the signal expression needed to enable the pin's 
> signal for the
> 

Acked-by: Andrew Jeffery <andrew@aj.id.au>
