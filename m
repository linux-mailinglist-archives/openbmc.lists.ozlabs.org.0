Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FE9B0858
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 07:39:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TSJG0dq3zF468
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 15:39:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="LhI+OTMI"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="QtuNRUzK"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TSHb6shSzF3lK;
 Thu, 12 Sep 2019 15:38:51 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 286614C7;
 Thu, 12 Sep 2019 01:38:49 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 12 Sep 2019 01:38:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=1K6jRTYNbrTt0S2z4EGpf5QtdQZ9iE6
 A4qNFJmy5FwE=; b=LhI+OTMIAni6lwqy2kX6DGEygo6HfNFZuxNMfQtdXxMsmOo
 5UfPZnZTTwY+8u9e1FJBqWICcVGb42K/F5PzRwcOEYqa+H3qZGiD7nv568GoCDqb
 /y8u2rYiIxf9+WxHclkjG+OEIcFhQEdQ8B1HpAOa4F3J4L7R02nla18OFDupwoWr
 dtCqHqAZQOT/JXaathEdqhic+TeoJ0e1Ebq60diMW0ctLukfYRIo1AtEadTXPeKD
 ghnLwOFbfZmSeUQ/DF9G2w2u7+WTBUmEauBWE4j7daO0BsfDGsex5PtUQJqFm2/g
 3dcpBPXS+rUAWy3Al4OepDT3Zk36+XfLidiGLfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=1K6jRT
 YNbrTt0S2z4EGpf5QtdQZ9iE6A4qNFJmy5FwE=; b=QtuNRUzKdD6f6vsd6ZyNBi
 lBRC30v7/KduqNaR3y/uZS6w1b4Y2v41Tm2VWOno54zW/JsA79gteusVeoTTma1/
 d6qpDddhdNCZLqE7S4z7jaLrTcdI49KJ6n3oNItsBGmzHeqeixtfaDIor7K/x2CW
 YtLKnqTQ87DkHlYzggbe0LdJ7U80J2xWCyagMRHW+JihiEXknh6mEZ0qB3gxNFxA
 gl0BHtFvdjrM7bfLIG305zkde4sXp6qFB1Za5QgaPvOUv2FX0mYOykjBI2yq29WE
 XdFtR1bhTcktWBEJ79aHrei8ODObOWposgpPQ/Tstz9drAEFzYnvYPNG4TRhOorg
 ==
X-ME-Sender: <xms:59l5Xd8Tk7vEsYQBTgHt2aPMx_v7OV3mnoPMf9gHdmLrs1GACjc2IQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrtdeggdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:59l5XbA_-5h0JnM6iiwnN7yTzjWFOnYco7q4h2hnfNlMVWgqFnU9aQ>
 <xmx:59l5XSQN6Jp8rLLefpyrVvXXyaSdU7PESsSJ2cwRy17Dteqh0zHIMQ>
 <xmx:59l5XSsP_FQPav4Zm1yKZop1AwLsLuX7zODXZnuvCnaOOUpkKMzEZA>
 <xmx:6Nl5XZ1PyaVdf5bfrKI70F-C-pCHAPhKSeupSPxI-4IwkCSdoR166w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id AD4DAE00A9; Thu, 12 Sep 2019 01:38:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-237-gf35468d-fmstable-20190912v1
Mime-Version: 1.0
Message-Id: <5c5538e7-4b7a-4d13-b4ac-584be4090d48@www.fastmail.com>
In-Reply-To: <20190910190756.31432-3-jae.hyun.yoo@linux.intel.com>
References: <20190910190756.31432-1-jae.hyun.yoo@linux.intel.com>
 <20190910190756.31432-3-jae.hyun.yoo@linux.intel.com>
Date: Thu, 12 Sep 2019 15:09:19 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <jae.hyun.yoo@linux.intel.com>,
 "Eddie James" <eajames@linux.ibm.com>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_-next_2/2]_media:_aspeed:_set_hsync_and_vsync_polar?=
 =?UTF-8?Q?ities_to_normal_before_starting_mode_detection?=
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
Cc: openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org,
 linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 11 Sep 2019, at 04:37, Jae Hyun Yoo wrote:
> Sometimes it detects a weird resolution such as 1024x287 when the
> actual resolution is 1024x768. To resolve such an issue, this
> commit adds clearing for hsync and vsync polarity register bits
> at the beginning of the first mode detection. This is recommended
> in the datasheet.

I guess this answers my question on the previous patch's commit
message. Maybe it should be in both?

Andrew
