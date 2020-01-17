Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E780A1400AD
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 01:16:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zM7P1F6szDrMf
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 11:16:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=YcJgwttw; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=C4HBfJy8; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zM6j0mfvzDr3P
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 11:16:12 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4183621DC7;
 Thu, 16 Jan 2020 19:16:10 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 16 Jan 2020 19:16:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=xB/yXSP/UjBJ86c4Ut6ZaX+XDHeP7AK
 8jUnVDO4A0sg=; b=YcJgwttwyG1gvmk0Cr0GFdB3BI+5XGH3odmGzZvaVB7aIvW
 MZ7jrJK8nXCJ9O9haveTyWhKXhFZypyOSxMu7P5WX7cIbePCeS/MCDdzS4Yi5Mik
 zDhsCdb/9qu2GRpxaVihh2Ah1KAPa6JCG4z3n0H7VJ3q7KIoPerHui4MrKCOni/O
 tMLGHpaBQMB79IkAD05epZu2AN+FL8S9/lAbeNx4xFBavbuZodSh6UchNOvx4VQo
 0q/KLBy5TuHeozMPYp1e5Fcjgvw7fh+rEJjZMyLjghSZ6mV7kNB/gC13uf7rz5CP
 o3XjY5bTd8dzdHB7hEDCg0WPyw2t51C75sjFJEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=xB/yXS
 P/UjBJ86c4Ut6ZaX+XDHeP7AK8jUnVDO4A0sg=; b=C4HBfJy8+m8rYgjpeu3uEV
 ZG4FK21qCrOcK8WzBcxukWqBwz31+ve6K7RM//G3EOwo6w3a4MovAOU8gulVnU6e
 d6BYPdPsDFA5kmnPqi8Rs+xv6XnFI0Ox6uanKMk5znEwctx0TClRBJJjyFt9SOeE
 hIDfXIZCn6QyUt9v16/77XnT9gXNQ5hFNimQCk35x4637k7JEG0smnFL0QYHN7Zk
 //RlHuY/LvuLwTbxg2CwDdGL68jNS9BEoEgL1OlcPdFwsl0XE9tZ5+/Pa4HdW+UH
 yPp32FjBOgor+0U3anUcC/96fRspTGYfknSV+D4wcqA4bXh0AeZuyoehxgkFoIZw
 ==
X-ME-Sender: <xms:yfwgXpb8LAplIBY_Zc3Ef4r_uRZnTzk2BN184rfuspONfR2HylzInA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtdeigddujecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:yfwgXlpZXb3p0ulegy4E3yhNzoLC_izlgtBH_mVxXVkFwRbhqL0BAQ>
 <xmx:yfwgXtqGkcKiqyJ3hoYAymjq_4AXqe5eG3kZQlGYEZUYlUrqWFQTuQ>
 <xmx:yfwgXv08XyhQoHv9A91XCkZc17_CLiFDnMKi_wlqz92JvUeG8UBxYQ>
 <xmx:yvwgXsnO8NGFQ1VfbBbUQREfW3tceQM8oRVyJIhkp-Jeh0mx48YVOA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 89BAAE00A2; Thu, 16 Jan 2020 19:16:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-754-g09d1619-fmstable-20200113v1
Mime-Version: 1.0
Message-Id: <e07764fe-b410-4f5b-984c-c0f08d53deb0@www.fastmail.com>
In-Reply-To: <20200116235729.GA7867@taoren-ubuntu-R90MNF91>
References: <20200116232525.2819-1-rentao.bupt@gmail.com>
 <20200116232525.2819-2-rentao.bupt@gmail.com>
 <27f552c8-52bd-4452-9457-54a1963ef67e@www.fastmail.com>
 <20200116235729.GA7867@taoren-ubuntu-R90MNF91>
Date: Fri, 17 Jan 2020 10:45:48 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Tao Ren" <rentao.bupt@gmail.com>
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.4_1/2]_usb:_gadget:_aspeed:_add_ast2600?=
 =?UTF-8?Q?_vhub_support?=
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
Cc: Tao Ren <taoren@fb.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


> > > +
> > > +#ifdef CONFIG_MACH_ASPEED_G6
> > 
> > No, this prevents building a kernel supporting multiple AST generations. Please
> > describe the differences in a platform data struct attached to struct of_device_id.
> 
> Got it. I took "#ifdef" approach just because it involves little
> changes. Let me move to of_device_id direction then.

Thanks.

> 
> > Also, what's the plan for upstreaming these changes? It's okay to send them for
> > inclusion in the openbmc tree if you're wanting them to bake there for some
> > more widespread testing, but it's not clear what the intent is.
> > 
> > Cheers,
> > 
> > Andrew
> 
> My major goal was to get more testing and early feedback. Given we've
> decided to go with of_device_id approach, let's ignore the patchs then.

No worries, in the future just let us know in the cover letter :)

Andrew
