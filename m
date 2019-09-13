Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87502B16DC
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 02:19:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Tx8D4hb3zF54q
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 10:19:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="BQKKVypc"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="N73yuY+I"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Tx7V4xGDzF54K;
 Fri, 13 Sep 2019 10:18:30 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C9231218C1;
 Thu, 12 Sep 2019 20:18:24 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 12 Sep 2019 20:18:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=oNwpvvEFJpewbaAAzElh0tbN5tfdwes
 oAvqCdHyUw20=; b=BQKKVypc07wGv3ETEqiDniu/M41UoqTlRbeyipH149Ckz9H
 HTZ31Kl6EjyTRRfUZ4/eOINWVA60mIulx/Ap0w8gNCMxDxL1M28X7PEWrY5n8MRf
 BMYfkD4jVHSVT9hRxCvUepksrTR4d4o1U+1mQQOfPRPFekIcZWZ5pxhYoIaa8nRZ
 mYZ/Mh5p8HgtubTZJAgOwhhunIURsZN36S/7HbrPXHRnBLJr9RTU+K26zUPO+/GW
 KJzUeiW70j+UluBkXtiXvGWk1Fe1zRceKk13C/2dZB9dzDCJ1HylswbHiRCiyNMR
 mAm7PvVcfXMiBPY0kISDz9tfmJQu2lNrohxgQsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=oNwpvv
 EFJpewbaAAzElh0tbN5tfdwesoAvqCdHyUw20=; b=N73yuY+IyuOqVQNmQaRPnN
 xFqjQoGIW6OjoJBzc/g3zzTlYM0jBgi+h+ZnQGm9AX7Rm2X5pmmwxNiMvp6q72yW
 JrhIg+WqT/JzN7ro2sNXWqhTiJQ1Q7yVKuzL0QV9QLl9o4kg9o9+zeVcqIbfcPbh
 1tI1fwsrvt1bDF4+ywWq8aByms/iw+qzvryenH3iPq3x9ahXUKLmPfco6t2HKEp2
 s3+bF2WGhgRY/trTmNZMbKF27LDORxJICPMy+deiGZz8gPdPRjzJ4OGRyBP2mJsP
 hIIPfVrXVWD+2GXvrwKMsgCoGFdZLSy7EwGxN4Gor8gciRwUoQlaBQvTtxrVNyvw
 ==
X-ME-Sender: <xms:T-B6XVzBfMV0FCGSNx67R1ER2fZZIHDPdALWnGEONwoYHVD_JBpvFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrtdeigdeffecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:T-B6Xf0JkaJrv512xukpHGAmztcvJJa9REAAaN5yLprZ4sqWgrXj1A>
 <xmx:T-B6Xb6cFvvZzKmhbFMxOAjy2d8HgILQTXiMUO9Z7EOT5vYJbYFhsg>
 <xmx:T-B6XaWm3CneoLTmi69aMjzeBy1jnk7prR0mJvLk8cVDfDAkBDU9Eg>
 <xmx:UOB6XZ4Yzrw0nRUORO1XxTIY3WvjzhKjHBmNdcu4dMQa6k2K6I4esg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D9C27E00A9; Thu, 12 Sep 2019 20:18:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-237-gf35468d-fmstable-20190912v1
Mime-Version: 1.0
Message-Id: <2c24c8a9-b357-4948-8744-3900ed28012c@www.fastmail.com>
In-Reply-To: <490bc4d9-e471-3b0f-49c9-39e99af95d62@linux.intel.com>
References: <20190910190756.31432-1-jae.hyun.yoo@linux.intel.com>
 <20190910190756.31432-3-jae.hyun.yoo@linux.intel.com>
 <5c5538e7-4b7a-4d13-b4ac-584be4090d48@www.fastmail.com>
 <490bc4d9-e471-3b0f-49c9-39e99af95d62@linux.intel.com>
Date: Fri, 13 Sep 2019 09:48:56 +0930
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



On Fri, 13 Sep 2019, at 02:36, Jae Hyun Yoo wrote:
> On 9/11/2019 10:39 PM, Andrew Jeffery wrote:
> > 
> > 
> > On Wed, 11 Sep 2019, at 04:37, Jae Hyun Yoo wrote:
> >> Sometimes it detects a weird resolution such as 1024x287 when the
> >> actual resolution is 1024x768. To resolve such an issue, this
> >> commit adds clearing for hsync and vsync polarity register bits
> >> at the beginning of the first mode detection. This is recommended
> >> in the datasheet.
> > 
> > I guess this answers my question on the previous patch's commit
> > message. Maybe it should be in both?
> 
> I think the previous patch is a bug fix and this one is an enhancement
> patch. Better splitting them.

I wasn't suggesting squashing the patches, I was suggesting updating
the commit message of the first patch to better justify/explain the
change.

Andrew
