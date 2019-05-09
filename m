Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1106E184EA
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 07:43:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4502MR14sRzDqJ1
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 15:43:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="K7epDhGt"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="2FYma63Q"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4502LZ0YykzDqGh
 for <openbmc@lists.ozlabs.org>; Thu,  9 May 2019 15:43:01 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D077E23D21;
 Thu,  9 May 2019 01:42:57 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 09 May 2019 01:42:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=P8cuWqIFd9MmpH07T2Gg4NI44AqTrZJ
 dh/zTugCl5Dc=; b=K7epDhGtGK8bdH//crjffFBmyi1aK2PMxGKFpVBzA0dlLq0
 yZRjwYyIrTV/W5J+y7Mo0mm21jip99zsjxqDP29JyGAgZ8VB+xR3uhVDxZzabupa
 9li8oeTTDIVAJhYVPqvdpsgu8/+gCd6Q/NYrD0fRBxZTPJz9usntc4w8vpH0XPvt
 eNBvqMwwC3JKwVUB5LgzAt/QtgLM/BsOCvHpBKKPoY6D+FwUlGXcOJPUMI32wyca
 kCpkNlMRej5xh+FQh5mc29JZn0v3q/DOQfJ0QIyYEluRfKL2bVHo2GAH1hniskNo
 AjSS/NqtIJSNolx2q1RoNQZ4BOIarhrMNGWNf4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=P8cuWq
 IFd9MmpH07T2Gg4NI44AqTrZJdh/zTugCl5Dc=; b=2FYma63QT6Qhkl62xwZ4Mx
 /nSytbzdp5JZ213MmQlMmDyRn96ZzGUjV+Z/qNejWeeg5Mza67FqGAUNB9jd6J85
 ORvNmbETtktZHh4rKtX5G7Lv7AcpF/SsA4valtq9tTOq+fG2AgvWxOipgS41SdfA
 3mMy09MLYWGO9QmHrvNsrEwPQ7TM4aiDdt5F8BlZvWlLqWZa8lnzALJlo9NU0TWy
 OoAyM8rjS8vFdrae6TyeijTQINyw5lQxAiEBI1ez5TBUFGBkn/ZupXt/2Gjo/ZYt
 Vi2tPjKaYyIKrlKoE2ZijXyMdkH0sPDAZcV0TN2if4wyeK56Bwq7TCLwdkAP5eqA
 ==
X-ME-Sender: <xms:4b3TXLT-g8jJlyRBaw2uCvzyhInnvsTWmxLD-Zk5KQblto7MHmyT8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrkeeggdeljecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffohhmrg
 hinhepghhithhhuhgsrdgtohhmnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgv
 fiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:4b3TXNeYqGuEhOTD60Xl1-F9HdPybpPu6h46wc2tXt0uza2m19QM9Q>
 <xmx:4b3TXPARA_AuSZNy8YsNeucSTlL0UyrInMLg_PHmwOAXGBbrszJybw>
 <xmx:4b3TXPmi-e4V3y-gR5V9DCPjDjh5pH9XhlpjMRA2pL9Op94qY_V1vw>
 <xmx:4b3TXGbZCFuZkq42bxIdR2fy8CkPsWRFNcnkGceN7L5E2FXja2cE-g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4A33B7C3DB; Thu,  9 May 2019 01:42:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <6300b181-e846-4d4d-b749-0eb6b86ae1f6@www.fastmail.com>
In-Reply-To: <CACPK8XftUZPWf_1hVaFu-iw7Hd1CT6oBcUHsAWcX1NVYRyLzQg@mail.gmail.com>
References: <CAO9PYRL4Pr2hV=Hz5dvTJzhx-x9WPJL12qZEKuh+DiCWx2RMww@mail.gmail.com>
 <CAHkHK0_FCE=QHF6tdD3DyGNcOMZHkhrkAZmgPwQ0Lr-G0-e9Qg@mail.gmail.com>
 <CACPK8XftUZPWf_1hVaFu-iw7Hd1CT6oBcUHsAWcX1NVYRyLzQg@mail.gmail.com>
Date: Thu, 09 May 2019 01:42:48 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>,
 "James Feist" <james.feist@linux.intel.com>,
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
Subject: =?UTF-8?Q?Re:_Intel_kernel_patches_(was_Re:_Is_there_Intel_node_manageme?=
 =?UTF-8?Q?nt_support=3F)?=
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



On Wed, 8 May 2019, at 18:32, Joel Stanley wrote:
> On Wed, 8 May 2019 at 03:44, qianlihu <wangzhiqiang8906@gmail.com> wrote:
> >
> > On Wed, May 8, 2019 at 11:22 AM Deng Tyler <tyler.sabdon@gmail.com> wrote:
> > >
> > > Hi all:
> > >     Is there any package support Intel node management in current openbmc or plan to support it?
> > According to my understanding, you can refer to these repos:
> > [ipmbbridge] (https://github.com/openbmc/ipmbbridge)
> > [node-manager] (https://github.com/Intel-BMC/node-manager)
> >
> > Also need the ipmi related patch here
> >
> > https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-mods/meta-wolfpass/recipes-kernel/linux/linux-aspeed
> 
> Is there a reason the Intel team has not submitted these patches for
> inclusion in the kernel tree?
> 
> I encourage you to send them to the list for review and merging.

I encourage this too, as looking at the patches the authors of the drivers could
have provided input and avoided some confusion. For instance I have concerns
about the pinmux patch. Also, I feel like we could also try to hash out a general
solution to the LCLK issue rather than burdening each LPC driver with enabling
it.

Cheers,

Andrew

> 
> Cheers,
> 
> Joel
>
