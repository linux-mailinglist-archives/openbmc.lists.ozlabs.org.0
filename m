Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C0A2F6350
	for <lists+openbmc@lfdr.de>; Thu, 14 Jan 2021 15:40:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGn691cbDzDsdh
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 01:40:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=WNAsDDKN; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=l/twZ8/3; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGn533xZrzDsdh
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2021 01:39:18 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 057DA1692;
 Thu, 14 Jan 2021 09:39:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 14 Jan 2021 09:39:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:content-transfer-encoding
 :in-reply-to; s=fm1; bh=l1bGBWv5XUl7THqf16lJAX58mpE3bd4LKEZGBXYa
 8DE=; b=WNAsDDKNqWDe4VVZdengwNKFez7SE4nTMfJvCwzk3B8JSvPJH4Lrm/f4
 ink0yQiyEP4D3Ms+4/yXwKGA9rPhHN6/VRwYdP5pbthijjzZRyfFobC9BRx1HXSi
 08NL5mnDLrLC6zt5T4GznU0ZKrdVYyLtrUCMVMFETNdn25dinrEIOM8KOQEn0ZLo
 isdw8yrBDsaGWDND/8jxRX1GnjL3GY6hHEpl0nXb2OQH09pLZ1ctuKpiUyZnq9mY
 fd9zWzvBLRRxPR5Fqx8avjKZfwfqqa7gHUGhSItFEg0sv5qhaUE0qlFN4yTVhFBj
 zYHLm53pZFm3AhIXD4TvZLqzJmADVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=l1bGBWv5XUl7THqf16lJAX58mpE3bd4LKEZGBXYa8
 DE=; b=l/twZ8/319NuPpyFvSLSC4hhpHs3I3l+amrwsyAMgpp9Z4i7Qpq8r6non
 4fyMm/m1jslwBbWlJQbzDJs6IjVSbXofJC+SmFOnPMHJ1yW8p9UuM3cm2Y1K6y6b
 1W5sb+KrQm/hlhnP8Iz12o3TzoFpu7XW5LkjiwI/kIY75d22ympDqR1W/Rx6sw7Q
 s3elH0yc4KrvFT1tY8uEz2XYcyW+whca4oNZVE3mWAREttsTKgWw1IXs3OuryrT2
 lqifFPRvn0IeF4fLd/v7zN+ZQetRmXcO0EOibpG4ITUo85tndJpUGPL+g/vbHxvo
 rt5a+IPRWjY5Dm78tfJ/2bt4JQfyQ==
X-ME-Sender: <xms:j1cAYDyP_v3PCqo4DDjJwRCSfldswFNolXBYYfQevNxioDTeqoK9OA>
 <xme:j1cAYLQAWTVi5N-bTiXJsn4fB4Asxa1ebKoAj77DZ0ujZMdzOSea90neL0CJ_YxG_
 gcpN9cSxwmGHSx7mts>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtddtgdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtugfgjgesthekre
 dttddtjeenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhu
 iiiiihgvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpefgteevtedvge
 dujeekieehudeiuedvveffledtffefuddvgfekjedtueejveffffenucfkphepudejfedr
 udeijedrfedurdduleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:j1cAYNVc12JYm9EB-wPN4mdG9QMmkq0-pm9IOgatPqewTMJlCzkN_g>
 <xmx:j1cAYNhQWSIPoFFndSzCHq_HjPyNgmDZQ7_97ruB9g2Z7aqMizUoqw>
 <xmx:j1cAYFBADfJaRGlbK7lfxzpGHJRnbIvkGV-U497jcDAkauHRw669Tw>
 <xmx:j1cAYEPuXwQARUF_J5XOgt8spO7VQJzg6uPU720HJwN60lbp5VoQ5g>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id DA1981080057;
 Thu, 14 Jan 2021 09:39:10 -0500 (EST)
Date: Thu, 14 Jan 2021 08:39:09 -0600
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Willy Tu <wltu@google.com>
Subject: Re: Intel-ipmi-oem repo
Message-ID: <20210114143909.jf3vbk7zhxp3iguv@thinkpad.fuzziesquirrel.com>
References: <CAHwn2XkNiz7rZzn9RbpZCaUM8HD0HO+mJTD9D2ENc_p+SsmXHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHwn2XkNiz7rZzn9RbpZCaUM8HD0HO+mJTD9D2ENc_p+SsmXHg@mail.gmail.com>
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
Cc: vernon.mauery@linux.intel.com, openbmc@lists.ozlabs.org,
 apparao.puli@linux.intel.com, vijaykhemka@fb.com, chunhui.jia@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jan 12, 2021 at 06:54:14PM -0800, Willy Tu wrote:
>> Team,
>> Intel-ipmi-oem should be broken and 2 parts, genric and oem specific. I
>see several functionality in this repo like sensors and storage commands
>are generic enough to be used by other platform who is using entity
>manager. So I feel that we should have these functionalities to be moved to
>a separate common repo which can be used by everyone and this repo can only
>contain Intel OEM specific IPMI command support.
>>
>> My 2 cents 😊
>
>Hi All,
>
>I guess I'll start working on this if no one has any objection to it.

Awesome!

>As mentioned in the beginning of the thread. The plan is to break down the
>intel-ipmi-oem repo into two parts.
>- True OEM at Intel
>- Dynamic Sensor stacks (new repo)

Why is dynamic sensor stacks a new repo?  I would like to see this done 
in the existing ipmid repo.  If the default implementations there today 
are undesired, I'd be fine with seeing those moved to the 
openpower-ipmi-oem repository.

FWIW I would like to make use of dynamic SDR on my new systems (I work 
for IBM) but I still have to maintain support for Witherspoon, which 
relies on the old fixed & hardcoded sensor identifiers.

-brad
