Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 490F8B0648
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 02:47:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TKqq6CY0zF40R
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 10:47:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="brgVN9S8"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="bfqLjY1c"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TKqK6L26zF3wM
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 10:47:25 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1891E599;
 Wed, 11 Sep 2019 20:47:23 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 11 Sep 2019 20:47:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=3zTx1PG3rd+W2YjcIruif1IO5F14Q3j
 /vaepHYElpg8=; b=brgVN9S8yLZqfLvNTdlj4HAXvKfhH2maVtOAXPpeN4uSleB
 qj/wcIxvmdiXd3lBrX6gmTHmZMeQR93KZ/oMmGtB9wtLnqtR6k5FVfxxfQBwHqO/
 DWvEnxFp8TJib2DGmLRIf1QZlv1Jn+IOIAALMR7FE4l0vjgFDQO5g5bHdiRaQlaA
 XHl9rqNQxkg9l5ixCLy3U2Pt9RuqQdA9Yx6uBUTROzdMJeA7oMFIEFRc4TiAEhSl
 hUxgGifFy2YSORgsUVdyGJJ5LtPc0sScaiEK4aSHQH+9rXCDYbyCAuVn7pb/VxfT
 v8CjWKwX52UBk9N5hKVDY4haB4Ul10WXEO16bCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=3zTx1P
 G3rd+W2YjcIruif1IO5F14Q3j/vaepHYElpg8=; b=bfqLjY1cExb0K1ypEexEoy
 ZIwxWv56lh6QmXM31z/81b4zakH4WRV1QNmSFbSuGjii6qZvfdHDygT4j7ethnan
 b/13Z6ADzXeVRi2YoqUKJrQEsUcYVxbzmNOjCuSr5/uhD3Wu5rY+R+y7Yrzandaw
 LVW3/u29VzKSnZXKhevU9gaY+4XLvT7NFcqDVRUTRnPbxB3NLEq84Be8d4S0yhlh
 nQ6MuYIzRnysZaCfRBTVmi3zSYdco8cKgFBUvQCtjHWigltMCSpJlMbgP3IdnQBP
 W6713WPeervB7+ng3I/T8pvUQ2JKs5qPgNOqs7TsDLuQUGw/S31iEOgFRao3XjtA
 ==
X-ME-Sender: <xms:mpV5XRLVV6sPRDVPvu-MLzOPFOCbTwrvV76YIsRmq1uxQY9F66D7yQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrtdeggdeflecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:mpV5XWP63Qs2ppUVk72ykeHa6yW6rAoX9DO2QNjv9anREVpVQhc0Eg>
 <xmx:mpV5XcqkXRz6uOplfcSWDvkp4jQKNe4336f0WI3yYyNPH3oqPQIQoQ>
 <xmx:mpV5Xfe10q5jCwinrZwZvFQVpyCAV2ccmfXNdM26xoH3Ry8Vj5ysaA>
 <xmx:mpV5XTJHe62bxEMOw5HfmdbhC9OVM4BB9PP6VbZbRIfYYPPSAvhE3w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 15966E00A9; Wed, 11 Sep 2019 20:47:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-227-g18586b54-fmstable-20190911v1
Mime-Version: 1.0
Message-Id: <2d541d50-29da-4212-aca7-609abc7a478a@www.fastmail.com>
In-Reply-To: <4739073b-3ac8-4e0f-b3e0-7a268ccd3db4@www.fastmail.com>
References: <85985690-0f45-9c8e-cde7-caa7d932ff12@intel.com>
 <eba2e99e-f3bc-4906-aafb-1e09794c6c43@www.fastmail.com>
 <393e2e29-979b-3787-9776-0d5f5f8fbc6f@intel.com>
 <4739073b-3ac8-4e0f-b3e0-7a268ccd3db4@www.fastmail.com>
Date: Thu, 12 Sep 2019 10:17:53 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Johnathan Mantey" <johnathanx.mantey@intel.com>
Subject: Re: QEMU native compile issue
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
Cc: openbmc@lists.ozlabs.org, Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 30 Aug 2019, at 09:38, Andrew Jeffery wrote:
>  (I intend to update openbmc/qemu to 4.1 with some of the patches from
> legoater/qemu aspeed-4.2 on top in the near future). 

I've now updated openbmc/qemu master to 4.1. CI appears to be chugging
along fine, but please keep an eye out for qemu-related failures.

Andrew
