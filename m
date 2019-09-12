Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DF7B084F
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 07:36:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TSDw0ZwBzF45n
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 15:36:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="h5KQIcK8"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="rQ3Rj+OC"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TS8J3BqLzF3wC;
 Thu, 12 Sep 2019 15:32:32 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B62A1511;
 Thu, 12 Sep 2019 01:32:29 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 12 Sep 2019 01:32:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=HXnqi2m/BtoX8yKDvfymopMouxsh1hG
 OuxsMkysRLIM=; b=h5KQIcK8/VSF455VfEAxg+/L+dgQqx0X5TKUVPMFE2Y8Q5B
 hPWgg2QpJZ82gTn+aHJldWPteoAB4P7awfOc8dLo5RPTTZbky70JPv3ZUqTpXHJW
 dqpPudDbcWvBVbaP6hBctVzcFWPyecoNj0k8hfhzl5Wpc4qqJHsr3mni8zhspCl+
 AdkEiRMCR46NRRJA1MPkfx0llX5MsxVo1UtTsv+ysM1j39lWM3rc0kQ+ASVjcuJV
 FDWgFG88PDz438ZYM+EwsyffVkS6zwrDi1m4khbX9JSsuD9BcqBDrsB6imyYjhLE
 l6UJqd3HuXXBf+QGMRV8V/GK0EotnhKngnZzwhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=HXnqi2
 m/BtoX8yKDvfymopMouxsh1hGOuxsMkysRLIM=; b=rQ3Rj+OCAM1i2f+R3dLymq
 Fv4VlloBHbmOWNpkBlqV63CwWiquWQF+C0NJ4DMYr33JD1phMxA/CnP+BWqCYf0q
 Tn+a4HhebxzFNH8ObpaLFK4dApmIuHLUhsA8GfUL4x1EZXaNbAwuR/X9OBfX+Ft8
 j5hil8nSCnQ8tY67e4rwzkC4+2i5/xAl5iBdfdEmkbIiIMEO0kd9RsoPSwAD/jWA
 Z65VpTOGfk5Ahp8+bIyd5LoIHzBMpi2G20kmnX8DynuRD6W+ETk5qRecYZkGqrhS
 V3+JOwKUCIQewZ4apJ4gGL0wkoBFpuWMBiBYqE3rJvNrVNYz3fDtEuQf5mh9QLoA
 ==
X-ME-Sender: <xms:bNh5Xb8FIWE2F3KuJVk8NUa2cZOp7WbmBe2nCQ-nH47TYSUNrUTIzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrtdeggdeljecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:bNh5XUD597UG-59ED2d5Q25Uy7nwLZjNzV2JTVjdFZIweZN7pW7u7A>
 <xmx:bNh5Xbypg5pVAPD6BRfBQtswPK3T3puyoI78kN-E6tR5plb6t03NDA>
 <xmx:bNh5XZTMcW7bEr-PxR-BkCaYP720wzrsyQ5EwlnN3zK-MVC0lA8xTQ>
 <xmx:bdh5XQML8ZRgY6WGg36ebT0OWuS4GglI9c5Lts5FhDIaS2mOnrGpWA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 620A6E00A9; Thu, 12 Sep 2019 01:32:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-237-gf35468d-fmstable-20190912v1
Mime-Version: 1.0
Message-Id: <a11026fa-f2bb-47a2-b792-6009c2bbe63d@www.fastmail.com>
In-Reply-To: <20190910190756.31432-2-jae.hyun.yoo@linux.intel.com>
References: <20190910190756.31432-1-jae.hyun.yoo@linux.intel.com>
 <20190910190756.31432-2-jae.hyun.yoo@linux.intel.com>
Date: Thu, 12 Sep 2019 15:03:00 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <jae.hyun.yoo@linux.intel.com>,
 "Eddie James" <eajames@linux.ibm.com>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_-next_1/2]_media:_aspeed:_refine_hsync/vsync_polari?=
 =?UTF-8?Q?ty_setting_logic?=
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
> This commit refines hsync/vsync polarity setting logic by making
> also clearing register bits possible based on probed sync state
> accordingly.

That was tough to parse, but I think I understand. Trying to rephrase:

Enable clearing of hsync/vsync plarity bits based on probed sync state.

What was the issue that drove the change? Do you know why it was done
the way it was prior to this patch?

Andrew
