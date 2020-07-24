Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 110D322BC1B
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 04:43:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCYRK2jVTzDr9M
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 12:43:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=NGB+ZQ3J; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=rpWDjB/Y; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCYQg2RCRzDrhn
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 12:42:51 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id E8D86B46;
 Thu, 23 Jul 2020 22:42:48 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 23 Jul 2020 22:42:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=hsxqbT28R8XKzEhR27ioVAs6ga17h4z
 lkIuF0Z7PC1M=; b=NGB+ZQ3JhrlV4xKHPv7IsY9VQ+i9zIlhAQeI3t0e1RVZTjC
 pu7tQr9XPw+DCouNPtzmcxs9ISoayml5XGbexnMTNEsN1qLWqjnT8sqQPnAjlEdH
 TQmwz94jCrnccdrU2W7zOOpbFzq9andkwPxWlf/NMw8a8CixWs1zfynlkqAh4Hd2
 8mOvyqHhpO9UqobCVOH6tmgyD6YqzB5oIhh8g0/isKV8o6EREZwStb9gSLArxqyB
 fFKV+cYwHC0VFHO2BHw5X3B6BfPpAbBC9vfF9onfz6hLvKxc4kN+ewo6Kyo9MtFh
 l1bFVFk40ZBMWJ0TgWZGdwcv6YizANiL4sBicXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=hsxqbT
 28R8XKzEhR27ioVAs6ga17h4zlkIuF0Z7PC1M=; b=rpWDjB/YjjjaGXXyj2v4WZ
 mPmY+KDMrhOrm1VLwAs2WVz3urSpfXc4+MxAUf4bOohgGPuEzGRjvH6alE2pgjrQ
 rSyijnbytLHHAs8M3M90WmpEi3E+Ei0pDT8P5NHcIPaZQ9fkJmNb1vBGIsH5xa5q
 QV+Jkikggkvwpin8inGi3cnASXXOpKSNKUHmb1OPbbQ0oyZmVFBezvGBTkIGVa6N
 BKI5BHga1c/7DH3ugTqg0RVLoK12jCay+TNsc30DZxvjthskTaT4ACrzK1d4r9WO
 0QrpB0dAZohD+Gc7obMRuUKS4IQxAqHCWLO0qavcN9aexkQwXik+ajnNCLiLWG8g
 ==
X-ME-Sender: <xms:qEoaXzRQCso2aUB724Xjnf4mIieiot8jF_T0TDhf8EW4SZB78K8Z-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrhedvgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileettedv
 tdfhieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:qEoaX0z6WJraqsWEMc5m9prsMlG9PWqIE4PRPV5a1E0ay0yG3Pokyg>
 <xmx:qEoaX40yM0aOljbGVmhCBv2VhQyP2yhloxJ-Df9Bd8xiSwKrb0cuvA>
 <xmx:qEoaXzCgFgiQU38zsxP3zD1E1pFI0zz69UESg5sPY4oF7wC8MW_zjw>
 <xmx:qEoaX3sN-eKcWqLk_g45jUwOkbvdC2P30STANBYDXV9w3-KruYHERg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E1E7CE00C9; Thu, 23 Jul 2020 22:42:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-92-g11c785d-fm-20200721.004-g11c785d5
Mime-Version: 1.0
Message-Id: <55511304-2430-47b7-ad27-dc216da194fc@www.fastmail.com>
In-Reply-To: <20200724023036.354310-4-joel@jms.id.au>
References: <20200724023036.354310-1-joel@jms.id.au>
 <20200724023036.354310-4-joel@jms.id.au>
Date: Fri, 24 Jul 2020 12:11:55 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.4_3/3]_ARM:_dts:_aspeed:_tacoma:_Add_CF?=
 =?UTF-8?Q?AM_reset_GPIO?=
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



On Fri, 24 Jul 2020, at 12:00, Joel Stanley wrote:
> The GPIO on Q0 is used for resetting the CFAM of the processor that the
> ASPEED master is connected to.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
