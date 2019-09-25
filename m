Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDB9BD6A8
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 05:21:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dNdH1yQHzDqg7
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 13:21:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="VNF3Xg5s"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="O6g7xYZ5"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dNcg69fRzDqRH
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 13:21:07 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2483A22299;
 Tue, 24 Sep 2019 23:21:05 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 24 Sep 2019 23:21:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=YiQZuysw3WVVTIsLF+1GZ2DJBwCFtTy
 PvOAotzGuQ18=; b=VNF3Xg5svUPHzqwBAvJMcmDY/kj8PJ+5rXU1vcfmXYxYMQr
 xroBjKqWG3HLNHUBksqqiJ5/YaOxPCt8BmIYckV43MHFQOcJPBRemNpvGtE71eWc
 3j8FV7kG88JLeH8Vnq36JZ+7EroLYlXnPzi5REm17AR2thiqNHQgh1Nfuz0OX4tR
 Hnv9YeOJ2MAA/kIMbPnBd0PPkOE4notzhDio0GCPUpqfbI5mCOPPv/pvg7ekpto1
 TGb8vX29lTfWZOq1RujD0oTHSWziRXxJZ6OrCBhrEmfw+EBREtYSjBjEfy4a+m7C
 itbiepqIUdIGEttGMt/KU7CM6G/UKn2pgVwFesg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=YiQZuy
 sw3WVVTIsLF+1GZ2DJBwCFtTyPvOAotzGuQ18=; b=O6g7xYZ5F3a3tLgIlYzu2b
 6HmWgFKyYC8fIK03/JxWrybVXAW6bPWesMv3vFk5hMOrGQ+EvauML71Yx8ZyYbRo
 KnNgCNEzfrrJdhDicPIKfZOAJnnf4AWwUQSdn+Gvpmey/bu7D9X3rbU+kAu7iktZ
 2p1TB7UJRJredSSKwxlYAlMGCDkep9tZv3Q3kvWPv0z169yj9VEyRi4RLhv7fFMx
 z6N8h4PsWWMPRBvw7OqG9+q1k7jngo6l9euiCygZe20PCReN6WmTs7/dDHygDfS7
 3JEbQa/1dM3Hj8ETd29nV6noAv+8oPC5HX4g+twsBm1R0Yvv8eZAdMuSXiGngnHw
 ==
X-ME-Sender: <xms:Id2KXfGlMMrANGcr6mstnTaYrGrQ3guv8rDmsKs5ta1wj3V_HfQoww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedugdejudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:Id2KXQkjHmXKiAiN97xdZhWbku04x4Eow-C5slkReTzTTfczMO5hWQ>
 <xmx:Id2KXcLtRf3pko9fl4yfYIHYDNf4Tm2JwD5JZm5uf6kRt5qyRlB9Xw>
 <xmx:Id2KXRaROSSA65KhXGUOX9ld9m29XxMdRNHN0yFHaZrTY4LNJKoO6g>
 <xmx:Id2KXdZbVuGIA185Mbv7VNonL1BwK0-0al0w5ZE32M_riEYuXNmxUg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E27F0E00AF; Tue, 24 Sep 2019 23:21:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <18bdc94f-e4eb-4114-a10e-19067fb6be50@www.fastmail.com>
In-Reply-To: <20190924194759.26854-11-bradleyb@fuzziesquirrel.com>
References: <20190924194759.26854-1-bradleyb@fuzziesquirrel.com>
 <20190924194759.26854-11-bradleyb@fuzziesquirrel.com>
Date: Wed, 25 Sep 2019 12:51:48 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Bishop" <bradleyb@fuzziesquirrel.com>,
 "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_v3_linux_dev-5.3_10/10]_ARM:_dts:_aspeed:_rainier:_?=
 =?UTF-8?Q?Add_i2c_devices?=
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
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
