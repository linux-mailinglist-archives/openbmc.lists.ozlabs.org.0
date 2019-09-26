Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A797BE9FB
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 03:17:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dxq44thqzDqj4
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 11:17:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="NJaNofrS"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="nq4SFQRI"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dxpW0rD1zDqg8
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 11:16:34 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0674B592;
 Wed, 25 Sep 2019 21:16:31 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 21:16:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=jKmOc9RNDUOmwe3tQBVb8WcLRmeRPot
 vR0Cf4LWhJso=; b=NJaNofrSSW/ToxJ/G5p2aNyLt08+xi/mRqH97cUJEl7b8y8
 kf0K0WAcPKxhRusiw/ptp9QfoTKwe9px3gCs7G/hfilACGWIsYApI8oI/fV4DoN+
 agOElQzupeJpNBpaalLn1MmcGv1sS3tmgsvknOnNjcOJ/CkNuSECqzDrnspfcFYU
 7myDrh0T2IY7PtvHo6DM0Y7n7jBKX9I898TUSZQwQI6Ca8TPZ3alIydimAvJ7OHI
 PK4tI0LiQy72/x5NfFid/xNJR4qAUPKnmQvKx+ovzo4eeNJGV8TdavvprOHBPUdZ
 rGC0IVD42hBrURjS/VXoCS3grOegS7kae11IRsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=jKmOc9
 RNDUOmwe3tQBVb8WcLRmeRPotvR0Cf4LWhJso=; b=nq4SFQRIgSOKPJCHhnUlQA
 RBasH52k7UErUi2Oyh1edf2yjKMppf1OiKfNI5XlSvxMAcqcjNPXffQHeQ0o6Djt
 bPa+TZX8DcJiFk5H9iDrd3lf+5TVrgj6EMBzq8MGGwLvvdaMZkS1WzVA6/eoSFM+
 p0InPelipbxu5FK8vFluJPm0N0TKzmk41fvz6qTCLWcpvKZSz7Avy3qwnLcq2XcF
 IlsN5/xynj3Z5IHytT/yAF2Tohdy4QSuTsFRqGVn5rCgV+CSF03g1PSSc+TtEOd/
 Eliw4HD+qeKXn4CKvUcQ05APpPoLId8G0bYdoB3Bvosr/F446jxDVxnPtaiCi6hQ
 ==
X-ME-Sender: <xms:bhGMXQWh2otr2UxFjVwpEEwF0N_qglDbK_qFuWJQGXm2tQjis_BHbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeefgdeggecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:bhGMXZxU3e-8YtoGBAseUbzxcYtWT41n-YhQRvpVnBd-vsOnT7VaCg>
 <xmx:bhGMXXy2e2I9Vh9vutR8e3riqaBQRkZFSjdihIqjJvUOhjpnDuIH-Q>
 <xmx:bhGMXe1ZDnU-q464n_kCP61D_-qWDhz77hoarY1w4Q_lx_ujZ0p0MA>
 <xmx:bxGMXRAbZhBpXr-cxtZ4G5C2qmC6UTlXG16HgTWzjj18DPNnX1G_MA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 514A6E00A5; Wed, 25 Sep 2019 21:16:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <5c0e438e-050b-4eea-9fc8-ed15bd1bf75d@www.fastmail.com>
In-Reply-To: <20190925125610.12096-8-bradleyb@fuzziesquirrel.com>
References: <20190925125610.12096-1-bradleyb@fuzziesquirrel.com>
 <20190925125610.12096-8-bradleyb@fuzziesquirrel.com>
Date: Thu, 26 Sep 2019 10:47:12 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Bishop" <bradleyb@fuzziesquirrel.com>,
 "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_v4_linuux_dev-5.3_07/10]_ARM:_dts:_aspeed:_Add_Rain?=
 =?UTF-8?Q?ier_system?=
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



On Wed, 25 Sep 2019, at 22:26, Brad Bishop wrote:
> Rainier is a new IBM server with POWER host processors and an AST2600
> BMC.
> 
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
