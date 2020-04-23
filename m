Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C1D1B532F
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 05:36:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4972yt5VByzDqxl
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 13:36:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=mL6sZyqO; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=P+VaY1n4; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4972y43NM4zDqv4
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 13:35:39 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 71E346B5;
 Wed, 22 Apr 2020 23:35:35 -0400 (EDT)
Received: from imap25 ([10.202.2.75])
 by compute3.internal (MEProxy); Wed, 22 Apr 2020 23:35:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=iNU6398LxJBzZYUrZJE2kvAKduW6kT0
 +ophWvUtyMrA=; b=mL6sZyqOUboqWu49a/hOevRkgaQn00bfJr/K2QBt5xmyFvY
 pk8C2WWlFQIKnOUm+Ku/oO6pqbD611Oeq/XZEDHBZOtYkorkrpwdESld26hS9v5G
 2t9K/nViGwFdsRotSsUFPcbBKoPrg+NoQJqQXI1n7XFDgtP1a9napYH3IzOfVDZi
 tBntjyBmRcLb1wdRPa/9w9gS7GVU8a/MRUkRUORV4E6PQ++CNMfgkocNE8CDYq6g
 ucoby9GwbIQlB48SIz80yIBo3AlPDuYl9rsjLG687U7qyXbjU9YZ76uUjgMtl37G
 msVcCOFFJqS+jgNMPGWymoowC39g6kw18TO2s4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=iNU639
 8LxJBzZYUrZJE2kvAKduW6kT0+ophWvUtyMrA=; b=P+VaY1n44DqE0UQLZebwrp
 46k0a/RzePRjqekCX2EL4tYMGA/rIAjFF2dCkYDSqx4hk8c/Sj5GIBLeja9UqOqJ
 jKiGRdsAjDGSAyCxzNSAEyMvsAbhiS8yNwZ8AAcHeFeEE9wSHPWGew2daP1zCTBl
 ZMY9uPpDm5QjBSLOrFJVuj7ygj8GUDd+GKCljBKr89Ct6pVgSs8aX2uZzRhhrdfo
 WGgk4/qRb8OnRCbJG122MFMvhfYOpvXU94vI6jQ8+tZXoFQ5VvRgqxVvlxuZMcvA
 GLvVSlEQmMNLH/GX/u/KGaN208pszwmqttLKDbzhmAksMRkqt0DI0DIIdGRGdJ7A
 ==
X-ME-Sender: <xms:Bg2hXlhZhMDsnxQNFeFpn_hW0Qe2SA1mfw5z6gFIFSgVGDwvqqQZIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgeekgdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:Bg2hXiSOOcs65VMPRc0cfuP4BNgPWAmqUI5vbWydANWnHH6GTffs7g>
 <xmx:Bg2hXpBiBjRpwiXKfflxgXy9zXdJjAUsuPit3mlm5JK7YSSqNFUBuA>
 <xmx:Bg2hXhn8zkZoG9iH_b6iC0jfd408G6HaNsdIGTDhB1jdlcGW21DJYw>
 <xmx:Bw2hXqs8EQLBezyhAXryCRfYJpHTq4rzDwH3Vtj1_P5hnYQ2u08WbQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 19FEEBC00C3; Wed, 22 Apr 2020 23:35:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-351-g9981f4f-fmstable-20200421v1
Mime-Version: 1.0
Message-Id: <c43b15d3-2c1d-4dc3-8d50-1ff1ae608f6a@www.fastmail.com>
In-Reply-To: <OF30D260EE.ED6617FE-ON00258552.00113D50-00258552.00164769@notes.na.collabserv.com>
References: <1af7b20c.18da.1719fb49f56.Coremail.slm_8269@163.com>
 <OF30D260EE.ED6617FE-ON00258552.00113D50-00258552.00164769@notes.na.collabserv.com>
Date: Thu, 23 Apr 2020 13:06:08 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Milton Miller II" <miltonm@us.ibm.com>, shi <slm_8269@163.com>
Subject: =?UTF-8?Q?Re:__I_wan_to_debug_the_=EF=BC=88export_TEMPLATECONF=3Dmeta-ib?=
 =?UTF-8?Q?m/meta-romulus/conf_=EF=BC=89_on_evb2500_board_?=
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



On Wed, 22 Apr 2020, at 13:33, Milton Miller II wrote:
> Around 9:26 PM in some timezone on April 21, 2020, shi  
> <slm_8269@163.com> wrote:
> 
> >just like the evb-2500's dts, but still cannot startup.  so I changed
> >the kernel of Romulus image's config files try to open the
> >CONFIG_DEBUG_LL=y, when  bitbake obmc-phosphor-image, there always
> 
> I've heard of this option but not familar with people using it for 
> aspeed debug.

I use it; earlyprintk is pretty handy sometimes.

Andrew
