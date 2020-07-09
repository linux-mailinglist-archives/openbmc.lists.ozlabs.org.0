Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AC5219F24
	for <lists+openbmc@lfdr.de>; Thu,  9 Jul 2020 13:35:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2YyH0PxSzDqsy
	for <lists+openbmc@lfdr.de>; Thu,  9 Jul 2020 21:35:35 +1000 (AEST)
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
 header.s=fm3 header.b=dbvGehWI; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=jU3+zd0m; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2YxH4YYSzDqsy
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jul 2020 21:34:43 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 46A4F7BA;
 Thu,  9 Jul 2020 07:34:38 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 09 Jul 2020 07:34:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=kDC5AKwiFnwQnOxH4nQjxWMvh7BXrpN
 lKOQU30XFyJY=; b=dbvGehWImasnS/A2WITYOYk8YV8tHzNxhoRJXehTEKtlZf7
 RSZD9cxlNdzYRbF5ar1E8TK5ksnzDbXHPoGaNVqXsiJwlxLmzwuWfuaMqvyBCcOv
 wwmWiRM3agfg+IoEYdnS1c5drGGbG6J/rmzYv8tbgt5GvkNlsHscaJkd8h3yjqAk
 SUHhTsD7Hs7Ibe1LBhx0H95Rt/Y43TKbhikqGG0issmKdprJDqaWAY+HRwEO0OJR
 kbqC6YARbxGfJJYKXlZjWzzIQIjhi8MfAhvuLUAdwiGn0oNScrz7jsWak9Tdw/AZ
 7B/h+DC08bJ5sECniXbZDJ3JSRT4CRpva0mGo+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=kDC5AK
 wiFnwQnOxH4nQjxWMvh7BXrpNlKOQU30XFyJY=; b=jU3+zd0m+FeEJo7QzJGjaZ
 9QzTsIeO5HlyhczjQbJLxHn7Jer9LI6EuEcf5E9xrgXUJVFLuVSC+1E0q38lt071
 gT8glNxMuWiBBrSPSGTvJCUeXKBT0+W2I+24iHesF/ipkv0qkbfNB/ziWAVMUTxA
 tXC1UyN+DmzSJAG9iGSYQ6d8cvOkkLjD7QWZhJsfXiPBSnvx83kzXIjDDb7GbF3u
 m/NnsbTFFsnpW7dX79FjD1cPdZQcxonfuP2bcUjkHM8szfGT5P77WCSG1CxpqDBA
 GYGKJDTsQiseA9FHgnVu9tfLqTm9yI/N7i0ey6IhgSe1QpjYM6jhnJXOg6ZyW0mA
 ==
X-ME-Sender: <xms:zQAHX3mCraoezeMPUhXLKleCHbiMl5JwWx6-kZ40wdkWAOi92j9L9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudelgdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:zQAHX61fmwyuRhyJVC7M9elXbtlQyGBH6oLi-FqB9YRbMxWC4OghpA>
 <xmx:zQAHX9qC-SaT5HPX7-mJlNfv8qmH8QLNKjU0DTfkFZiGLfhykeW-Cw>
 <xmx:zQAHX_n-p7XQQjPEFmDc0mG2qj20hOGFrKTM7JJmez_4Fj-v-PCHYA>
 <xmx:zQAHX2BjNFMXAPzgD8nXa89M2kSo7-_iFuCv_QIcLozuctiPva8egQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 44681E00A6; Thu,  9 Jul 2020 07:34:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-613-g8a73ad6-fm-20200709.001-g8a73ad6e
Mime-Version: 1.0
Message-Id: <8b7b04d4-369f-4dbe-9201-4e1a6492c5e5@www.fastmail.com>
In-Reply-To: <20200708202454.21333-1-eajames@linux.ibm.com>
References: <20200708202454.21333-1-eajames@linux.ibm.com>
Date: Thu, 09 Jul 2020 21:04:16 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-5.4 1/2] clk: AST2600: Add mux for EMMC clock
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



On Thu, 9 Jul 2020, at 05:54, Eddie James wrote:
> The EMMC clock can be derived from either the HPLL or the MPLL. Register
> a clock mux so that the rate is calculated correctly based upon the
> parent.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
