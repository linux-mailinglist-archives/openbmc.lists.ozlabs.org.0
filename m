Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1A3A96E0
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 01:13:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P03w35Q6zDqvW
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 09:13:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="bBvLPPFe"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="hKrrhWX0"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P0350vbZzDqt3
 for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2019 09:12:32 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CBA3421FB6;
 Wed,  4 Sep 2019 19:12:28 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 04 Sep 2019 19:12:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=vGP81f7jjYF1gPn4rpr7UM0ppbtxQGY
 WxDs0wFeu2zU=; b=bBvLPPFeUVDYNqBR69qjRqq3rKwj/TfWfvwF6a2AQsILpre
 YuPc/rCCFEfDb1qQyN3Xx6NqmnbNZXijt41JVx2lkcA6B/AiYlILV9gnAjO7Zuwp
 iAzfJ5tmx2XU8XS8YFl6QdySAnGeA9Qb3NEgjXt7+2U/4tuSV7RIAmH62L1bGzpG
 2meeVEsDaO5TRAuNu7g8jjtoDo6vZ3kGfGyPizD95nqaN+/r7T8S6Wvz0gXWfNt7
 7+nfk+lh3hlMyFLMGbx3mSNprQ45r4JVdT35DXPHBcTJBIMfFXyLDTMtExB+ikHm
 peiPFL1DW0FfLv/yGV0vG1VsdRWakjMGYezcr3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=vGP81f
 7jjYF1gPn4rpr7UM0ppbtxQGYWxDs0wFeu2zU=; b=hKrrhWX02VQ+sxt7tKRNOL
 BxPm+u0xjjgdxYmaQVFgoG/5Cfr/lxy1l+rrmWAYNP02IsqWRhha7mxG+Rj1JHLO
 obVzIkbicY/6E3rtUDj2MN235DtP43VZwzZ3BPX1d5FtME2hTkYFDy0qtnpCBhUB
 XNiQJzJJjj+UEZaPsAJC5pD3zXU4aTDvkIQxXJ26EjegxQu5IdNB25/iX9RNfD8J
 CJihDHK3ylJUtlFtwDO7HE2oe/o9K91XoluRKb+976hiShNcqO+LehVkPRX6uv9h
 DgoEoQW4q9m4HIrSithlq3NEisyjGjN8YLoOstH3SRxQHN7y/yxqoCBXNBwkBRQA
 ==
X-ME-Sender: <xms:20RwXZAEiqWUQB4_WLKIvTwjs8C7a-bZ-WRvhLzjs5PUUxrmdMxamg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudejiedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:20RwXYF3juB3wTL7DXIHIYhZV6CKTHf0ekEg7netRnYuuQEpe1Qarg>
 <xmx:20RwXdf2lP0lIpqC1oUweflim6Iz5L9PhG65l38SJIPgU66e81JSJA>
 <xmx:20RwXd-PsPYF9Mj3_MeCF9zMTuzoNkinQjd3IM0luCPjXMr26U86Dg>
 <xmx:3ERwXdIpxGJmQX637QG6Rx5Uk49fIm47jjfyJNYAmMEJfqPPvia0Gg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 65E10E00A4; Wed,  4 Sep 2019 19:12:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-186-gf4cb3c3-fmstable-20190904v1
Mime-Version: 1.0
Message-Id: <e37f18a6-18f0-4768-96c7-fb4ad05fe03f@www.fastmail.com>
In-Reply-To: <ca423521-05a5-1fcd-27f1-bb5f68fa3c23@linux.intel.com>
References: <20190904200758.5420-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8Xfzn3A7nCFqCbSm=6qsB-5dgJOcz1rgSGhRH=xojb4m_w@mail.gmail.com>
 <ca423521-05a5-1fcd-27f1-bb5f68fa3c23@linux.intel.com>
Date: Thu, 05 Sep 2019 08:42:53 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <jae.hyun.yoo@linux.intel.com>,
 "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH dev-5.2 0/2] i2c: aspeed: Add H/W timeout support
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
Cc: Brendan Higgins <brendanhiggins@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Tao Ren <taoren@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 5 Sep 2019, at 08:31, Jae Hyun Yoo wrote:
> Hi Joel,
> 
> On 9/4/2019 3:54 PM, Joel Stanley wrote:
> > Hi Jae,
> > 
> > On Wed, 4 Sep 2019 at 20:08, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
> >>
> >> In case of multi-master environment, if a peer master incorrectly handles
> >> a bus in the middle of a transaction, I2C hardware hangs in slave state
> >> and it can't escape from the slave state, so this commit adds slave
> >> inactive timeout support to recover the bus in the case.
> >>
> >> By applying this change, SDA data-low and SCL clock-low timeout feature
> >> also could be enabled which was disabled previously.
> > 
> > Please consider sending your RFC patches to the upstream list. You
> > have a big backlog of patches now.
> 
> Thanks for the reminding. I can't send the RFC patches yet because QEMU
> H/W model isn't ready yet. I'm still waiting for the fix from Cedric.

QEMU shouldn't be preventing you from sending patches upstream, rather
it prevents us from enabling the buffer mode support in the OpenBMC
kernel tree. You should be sending all patches upstream as early as possible.

Cheers,

Andrew
