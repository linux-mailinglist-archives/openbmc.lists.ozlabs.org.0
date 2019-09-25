Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23419BD6A2
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 05:20:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dNbs4ypVzDqRH
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 13:20:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="balZ3X2A"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ix0K6cmE"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dNbM5RDtzDqRH
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 13:19:59 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E6640221DD;
 Tue, 24 Sep 2019 23:19:56 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 24 Sep 2019 23:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=fQHfteWatJc4LsULS3VNk4xG03sb92I
 6vJZUySlHmyw=; b=balZ3X2AWrbjFllUiulc4yyH7lb75nKCWrzBNbwLTssYb8o
 xbNKT6AwvY5lKbHN81VWwYBuBowlygha85UYEIN4yuu3jgkp7648xzC0O+v7Pv44
 YWm2mCY99tjxSrn4hY7Mz5uy3qh6j+rAcMVvo6LArTEQyQYSWPz25y7fbHzE7UN7
 PmW1+6CMbgHlyGHqt8yAOCa20xtJklMw9RsTMDTedmaxT4TjTkOnfQU9ncy0xLlE
 d+rxr3m3LPMQLYU7Hv7W9CuCb3+b+s+VAsWyEnHjNmPFCTRutbPnAW09b2wgPJPD
 f+XBsniedWBgrmFY9IUl2SLmNRC9o6sTi+M6XSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=fQHfte
 WatJc4LsULS3VNk4xG03sb92I6vJZUySlHmyw=; b=ix0K6cmEY2alZfY4xpfvzK
 K+oXSnGaK2VxpGgSCZpfD0libtpW81vZo2Die9KvzBWWEUNd57ADlK1r4LXik5ea
 i2D8nBwmmshycG3PFjcoPL5GIiHrA1+LpJhDvVGO3Fp1wBCDbs5y2ehDSAbKnAH/
 fni7pIAJDHFCtWCwTHcj++8Ybv52YKxrJWwXufx7K/zwmPgFL+brH8w8ThB9iTPR
 8No7EANr4JibyA6tyz0bsB2DGwlQtKKdQjJaQPvFMqeN5CApcGCkJen5pHlqZyos
 jHW5I/BuJcqHogWTGtqhcJmtRAZFB7IIqvlKRMXVO1320jm9o/ZA3X68EUqhCO7w
 ==
X-ME-Sender: <xms:3NyKXanZa90ukScerDlGNN_MyHQzmpZa8YDpAXXvxqskC1J8_dt7qQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedugdejtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedu
X-ME-Proxy: <xmx:3NyKXUEvil8mpFsUobOp_x011x-o2c5OVv812O6RUEcEcY8vlS6cUA>
 <xmx:3NyKXYujdeCNc8yjguGYXY2_i8XzCD30mgW1Lu6hyKdL2uS_BD5u6Q>
 <xmx:3NyKXXiK2r0_k-xHXDHxIGlcJFvRPOsOmUKw1t32n8V6Par2yxXTdw>
 <xmx:3NyKXdYQ3IhtbjwsVvAKBBfH9CgKO94e4-17wSaYPWDqg4iM5vc_Cw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id AE83AE00AF; Tue, 24 Sep 2019 23:19:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <3b742736-f529-43b2-a4fb-6d672a47b25a@www.fastmail.com>
In-Reply-To: <20190924194759.26854-10-bradleyb@fuzziesquirrel.com>
References: <20190924194759.26854-1-bradleyb@fuzziesquirrel.com>
 <20190924194759.26854-10-bradleyb@fuzziesquirrel.com>
Date: Wed, 25 Sep 2019 12:50:39 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Bishop" <bradleyb@fuzziesquirrel.com>,
 "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_v3_linux_dev-5.3_09/10]_ARM:_dts:_aspeed:_rainier:_?=
 =?UTF-8?Q?Add_mac_devices?=
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
> Rainier contains two network devices.
> 
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
