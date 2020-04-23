Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3FB1B53DD
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 06:57:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4974mK29ZFzDr0P
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 14:57:21 +1000 (AEST)
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
 header.s=fm2 header.b=N70x8pKZ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=eA7xYCLF; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4974lY1d0SzDqlD
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 14:56:40 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id DEDB35C0;
 Thu, 23 Apr 2020 00:56:37 -0400 (EDT)
Received: from imap25 ([10.202.2.75])
 by compute3.internal (MEProxy); Thu, 23 Apr 2020 00:56:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=xocsWVtOKQzcSIK1VxNuo9TJm59sL78
 PVZOc/Xk8mC0=; b=N70x8pKZeyUA2dQyVHX5EUMBrHpl0zYzgCmJbv6ykzV+lS0
 N9vmy2bDNncBT129lpsWMLucn51a/C1V09B9G0CHykfr9GNqE2a30B2Qi1TD9bdE
 RfIce2igZOhj+MABQTJNMQm2S2OxwabfvpM+l2iz0V1Uy4jFIfqylmDPV/zMiNLS
 Dw/ZFJT9nk28wJNTVSvPBUMLN3vK3ARBzF0OYT+ixOiK98IWSPrRDEh2psnioU8W
 3cPsi/9M6lmhtk6sKWqqhd4nx39GXKKtRk92CJDj6NllCPR8Y9puc4lPZyg8nDca
 WaYSVkM1sPDSB4Sc3MopBP8Wwj1QHJpsqaevwxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xocsWV
 tOKQzcSIK1VxNuo9TJm59sL78PVZOc/Xk8mC0=; b=eA7xYCLFAwvjAeR1pm+HNx
 kTmhN1juSVlYbnB9nj/qfba6+CSOrq55mDQtbJhCoh1tmhMD++J44rlPk+KeBpgR
 eJ4bl9LZC/Ysv6n1m/YOCfF1Rrt1K89UVk5Li5cUkY3HVbpKQV6F0JpvsFJ0xa6d
 E1VMy0tSvWeRkeFxDSlWVMadMhQ/qWFTyQELk9EBIKjWeRzcHJO4N/WgimhKB2pg
 XSgKByliSKSC4KH5/s1mZvJrujBByJ7tBVuEaVyF3Xq3UW0sQCbqzErB7712GMpV
 xV0rx2mNn8q4cIRP4+bOJqOVdz2Bkj7rbhr7XlzR4/fBmp8yTAT6yHiF9CnrWqYQ
 ==
X-ME-Sender: <xms:BCChXhpQ6OlGo4p2R0m_bdBsbhHR5GMiEoo9igGwqt0edAUsAwatZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgeekgdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:BCChXrDt4cGW2KZiCgbR2WMDLPL1lMVuebqslNysGfQjcCuCD1SDag>
 <xmx:BCChXjxYzEXbH77P6orE7r4BK_XCIYR6HEON9TskHsRc50q9tUNIeA>
 <xmx:BCChXo1V25nwJCt4RILiN0JRl1oH_-NHEiStfkSW5_hkaHRokz1W_g>
 <xmx:BSChXq_rqqgQps7Nimrs613fE6-rToDbHM4UlwF1zo2JUiMxy_veAQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7D3EFBC00C3; Thu, 23 Apr 2020 00:56:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-351-g9981f4f-fmstable-20200421v1
Mime-Version: 1.0
Message-Id: <0cb06d8b-61fe-4641-960e-f52952bce239@www.fastmail.com>
In-Reply-To: <1504A9E7C77EF44697F386AD61B1626015347268@BGSMSX105.gar.corp.intel.com>
References: <1504A9E7C77EF44697F386AD61B1626015342605@BGSMSX105.gar.corp.intel.com>
 <8ae8365a-ff09-4f4a-9445-17898487cb29@www.fastmail.com>
 <c7996c7f-460a-41df-8d95-4444cee7462e@www.fastmail.com>
 <1504A9E7C77EF44697F386AD61B1626015347268@BGSMSX105.gar.corp.intel.com>
Date: Thu, 23 Apr 2020 14:27:11 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Bhat, Sumanth" <sumanth.bhat@intel.com>, "Jeremy Kerr" <jk@ozlabs.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: MCTP Sockets related questions
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
Cc: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@intel.com>,
 "Winiarska, Iwona" <iwona.winiarska@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 22 Apr 2020, at 18:03, Bhat, Sumanth wrote:
> Hi Andrew,
>     Thanks a lot for taking the time out for answering our questions on 
> MCTP sockets in detail. Do you have plans of pushing a Kernel based 
> MCTP implementation proposal to gerrit ?
> 

Yes I do! I'll try to get something together in the next week or so.

Andrew
