Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B5BBD68E
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 05:06:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dNHb2jWWzDqbY
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 13:06:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="bqZwmF7c"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="TxhhV9qm"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dNGv51l4zDqJX
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 13:05:43 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 58953222BD;
 Tue, 24 Sep 2019 23:05:40 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 24 Sep 2019 23:05:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=Y+ibk0UUYEbmzKl8cfmwXCqMgHVieAb
 FrO9zd+Qk4fs=; b=bqZwmF7ce9U8njZjQjOyqwshOxjEdbyyQfvSUWiIvstZqDs
 zn06335sYOpeguqrvVRSFUJvzBT1T6eYOvJC9jzfCeUmyIczwdK3pgUt9tyELhhG
 BsNok352oAc7vVMLmNdW65Vbm1/I407cU6u+D4qC057H7vH/sPT6vFf0lFRfqJ84
 QzwRq0peOQfZquhx9rrfGJ4vB6hyMwFDYM3HWMoGIHlx1tc2hcy7+9CoU28updW4
 PL8Mqkue/pkPCgfCDnEvt9UZVhdnw4xIg2kpovyM1bqHda9dDBEwjkAtqudymZcg
 SERYWUKKtBBdODZRi3nJR41i1ozql0mce6D+IMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Y+ibk0
 UUYEbmzKl8cfmwXCqMgHVieAbFrO9zd+Qk4fs=; b=TxhhV9qm5YA5wDh91zUpYY
 W9qB/oOeGZ+r6nwDbrWWZ3XPXDIQW1AD0UH4WS63T54GxX24QVuNjEqD2D4mGz0O
 AKQvpAQc65PTtRrtWMM7MwBlrH4Oxouf1sj0zRG3pOb/HgY4i8F0VPQP8k/Fskde
 0yOu3tSDvpniMy58wMFERfguTeFaM6edVvPAMXqK6LEedsguwzHoHU/+Orb2iOCo
 6T33DZLxX0Tew+PwyyKeG8g+YFKUxG8dAtB0Il9Z7dfYy7OG3UBZR1NCQSpTplRy
 pMk+G21KUeDknEAPj7SlbgBGR+tL5gx7cFzxH6DqV6ySAn+gAGCZRBv/bvgbuYYA
 ==
X-ME-Sender: <xms:gtmKXX1UknzvcK41h7XZ8963va2rTvxFzw3MS_hLuR4ovXxE6gXJ3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedugdeikecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:gtmKXZEDGgPqKMgSiPqZU1iAsvmhiXBHIsHE7qo1foo1RkGqYqmbag>
 <xmx:gtmKXacvzNL0wp3ijsiwjlXSOavGirh4yzU6ylWU3INYKaMcpDoLTg>
 <xmx:gtmKXXTHaWGZ9uNd7_OnQPBZ_PvkeS0yXvAhU1_bXs4Q3viGAyZzUQ>
 <xmx:hNmKXetn9fCL08bZAqqQUQMBRUQKDE6a5vFh006d5r0qS7x6NVBg_A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5B6B1E00AF; Tue, 24 Sep 2019 23:05:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <96c312f3-0ec1-41fc-a7c8-277aa5450459@www.fastmail.com>
In-Reply-To: <20190924194759.26854-5-bradleyb@fuzziesquirrel.com>
References: <20190924194759.26854-1-bradleyb@fuzziesquirrel.com>
 <20190924194759.26854-5-bradleyb@fuzziesquirrel.com>
Date: Wed, 25 Sep 2019 12:36:22 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Bishop" <bradleyb@fuzziesquirrel.com>,
 "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_v3_linux_dev-5.3_04/10]_ipmi:_aspeed-g6:_Add_compat?=
 =?UTF-8?Q?ible_strings?=
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 25 Sep 2019, at 05:17, Brad Bishop wrote:
> The AST2600 SoC contains the same IPMI (BT/KCS) devices as the AST2500.
> 
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
