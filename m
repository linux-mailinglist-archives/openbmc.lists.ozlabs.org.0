Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18097298547
	for <lists+openbmc@lfdr.de>; Mon, 26 Oct 2020 02:21:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKH8r1qQGzDqL2
	for <lists+openbmc@lfdr.de>; Mon, 26 Oct 2020 12:21:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=kIJz0y9P; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=DxHi4I5e; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKGqV2CfWzDqDf;
 Mon, 26 Oct 2020 12:05:57 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9B1ED5802FE;
 Sun, 25 Oct 2020 21:05:54 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 25 Oct 2020 21:05:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=PjCEKJNwHP+or4yM/7RVtpSygcMnFt4
 xl43qcV/o4CU=; b=kIJz0y9P/3HwndrCMXvOzzEFsFLpOJH5whTwJ9GnAhLjEFw
 X+hZcwjHyZ50AXdK1TNwznDPcOZ/ML0KFA5FHoEucSFy/D+1PJNNmqlIn3Y0Olri
 pNRzXOhu7wSdMV9dn+Sx8+TGIBNmD2a8HTaIhTLCDJ/uGfi+ChLpvi3P2kBv0Kwg
 0aR0ho3G3W1Q90poctZWTutzxdCeIhag5ExVqwCu0unUfu0PdAeSc/PR45jxos+h
 WIC/lGsZICBtCf7xFTKSZOnTdN2UFLKpgF3CmQh0/ktLxAxEQllsDoyGs7xSz78O
 MRlZ5wxFg1bwsxuQp7XO2JW1GeHZBI8/UulJeIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PjCEKJ
 NwHP+or4yM/7RVtpSygcMnFt4xl43qcV/o4CU=; b=DxHi4I5eqBv21IyE6FHmfg
 EvgR3Ohf0h17CJLUZdVzkSUxja7U0KFcttcHrwrc2cFYHG9Mo1BYyFJ5LjbUd58u
 V5D9CmGRIWG2dbBmWRV0VfzfPWXEqTnYmlg/krLL1tM0SlcwjySPDOwYo0eocLF9
 jgBwjKRkQXFQ2c6pwtH/IHlgFMBhUhHKLDeimQZhyD061LLqwV3fksFeJhRco2U1
 xaUNdPmiG8pO90fLNUQElBIrAH7S6+Bz1py1u7N9a2j/rWI0Bgu/8NqatUVHx9qo
 VirZWiLaF0PoEqF/7tZnXke1ZuWQ79iFi1qL9zPyFLjwQIaBh7tlLBZKSBtBIgpA
 ==
X-ME-Sender: <xms:8SCWX6S5hvczJTm0cNhKzdeJnXmHWNbzzD6Ie3Zfo0j481msYMGb3Q>
 <xme:8SCWX_x-TBJJ63a9vbb7Gcag3jTS4RSfFAdAciBu3lQRCpbIskmzbwz9myHZmmE-v
 psnJXQE-7FcFKCFXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeehgdefudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:8SCWX33RWBSkvNsZ_nJHlXuH-ReTT2BWuXkQEezAU049ynmxPUkSBg>
 <xmx:8SCWX2DsJkDTDjhJj4Ju0zvFLX0IzSxERXcpmAtcnWVJtGnLvk19WQ>
 <xmx:8SCWXziptK26yyNHoL50WSB4ym_mdwtVxfaE-bMXXvHt48QBPq-28w>
 <xmx:8iCWXyPlT9BJ8sbWIvAPa5uPWCoLgAwqA5a6dOIwp0u3a1s7DaBI8Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 900ACE04F6; Sun, 25 Oct 2020 21:05:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-529-g69105b1-fm-20201021.003-g69105b13
Mime-Version: 1.0
Message-Id: <49ef1445-ddb5-41fb-b9f5-f885a1784e77@www.fastmail.com>
In-Reply-To: <20201012033150.21056-2-billy_tsai@aspeedtech.com>
References: <20201012033150.21056-1-billy_tsai@aspeedtech.com>
 <20201012033150.21056-2-billy_tsai@aspeedtech.com>
Date: Mon, 26 Oct 2020 11:35:32 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Billy Tsai" <billy_tsai@aspeedtech.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
 linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 1/3] Arm: dts: aspeed-g6: Fix the register range of gpio
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
Cc: BMC-SW@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 12 Oct 2020, at 14:01, Billy Tsai wrote:
> This patch is used to fix the memory range of gpio0
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
