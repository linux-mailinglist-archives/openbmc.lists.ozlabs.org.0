Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F93596E1A
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 02:16:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Cp9z0tlzzDrJn
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 10:16:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RnIKqRDs"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="i/SXx35C"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Cp9H0NkhzDrDJ
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 10:16:02 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 41DAA21FE0;
 Tue, 20 Aug 2019 20:16:00 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 20 Aug 2019 20:16:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=nCUb9VdWaIOe4Mj8igYB85jaKnjgXrL
 GWhUTF19qZSQ=; b=RnIKqRDstXtm9fbuQ33zV+o43M4RUOaIy9dMPSF7xp3x9ow
 yFOWjhSHlWiMczXul3ds7swEOYznI0Ayk5iZKfcNmGfAvt1VRl2gfT8ym2A/TpEM
 bQDuLWhTutDjS1Y+tz7ERzvtOt6PwsaXKOg3l4kMHICQV7rj3vsIyJMztKg+Q0u3
 MMbbZOzdOIqgWwLC52R8Pp+7R963oZ4b+7rlY8lRAvyx20KDTJMexeQej4bUVpDC
 dRfpSDpKRhp4LaQ1z7I7bS88cFABLN7oh7UHwY+w+P/93F4i2KGHhW2yHtetFtzj
 UVJbN/007mQDhO395t0wvZ6ufFVkRWJ16aEShTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=nCUb9V
 dWaIOe4Mj8igYB85jaKnjgXrLGWhUTF19qZSQ=; b=i/SXx35CiB23ed/RaHC+9u
 mDHVTLWiCxoz4l7XYnQLO1EZKkVBVpq5aRyLj9a75zVfpb7LyKDfrBS2lZ3E+2r+
 Bsxp9/Xlh7CsO+fM4q3nIS80putCBd3wZFEichu71JIkQfifOWs9vk6zKW1CxenU
 t0ZZZKWR9TTDrkHZP+gv/0QXxc6SFt5+qCjdntBIX1UvbUNy7agHTrxspfKTFbNt
 ecKPZ77cxnUYxgw8ZfK1TZnNDy2DBf5768huHQBqFI2+dDfOz6Z7TOTrHAdF5vIa
 +xeAOsENvmWN3efEJ9Mcrip4x49M4NGpVkMlpzN+LRtj9k3TaEvmlkUWBRKor46Q
 ==
X-ME-Sender: <xms:P41cXROs7YK2cvuy8azon_s0H5aJY2Wotkt8znn-uT-ACRr38nj5sg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudegvddgfeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpefofgggkfgjfhffhffvufgtsehttdertder
 redtnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrg
 hjrdhiugdrrghuqeenucffohhmrghinhepohhpvghnsghmtgdqphhrohhjvggtthdrgiih
 iienucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenuc
 evlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:P41cXUu0JV71s6BnZkXaihm4Gsl8GgCsQHOtYETiftaLQhg86prA-Q>
 <xmx:P41cXUFlIskpzcivBjh3wXwOy1lRCXi_b_vZBqjiNjo69UDQo-XCfA>
 <xmx:P41cXfQwo5oOVbQWlvRVjnK6YC4c3B0Z5_looFxGQlxiEiVpdoxY_w>
 <xmx:QI1cXf16NaXg0llSqlv_v6VUAjGThvZGbwtuEp1DzuyLSDwG9fqQ3A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4BF27E00A3; Tue, 20 Aug 2019 20:15:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-878-g972612b-fmstable-20190820v1
Mime-Version: 1.0
Message-Id: <96a33d95-b42b-4a45-9a02-b14de0aa947d@www.fastmail.com>
In-Reply-To: <9788269D-C3EB-45AC-8591-888907C4D145@fb.com>
References: <9788269D-C3EB-45AC-8591-888907C4D145@fb.com>
Date: Wed, 21 Aug 2019 09:46:34 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Vijay Khemka" <vijaykhemka@fb.com>,
 "Brad Bishop" <bradleyb@fuzziesquirrel.com>
Subject: Re: A new repo for objc-debug-tools
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 21 Aug 2019, at 06:22, Vijay Khemka wrote:
>  
> Hi Brad,
> 
> Can you please create a new repo for obmc-debug-tools. I have put a 
> simple document here and will elaborate later.
> 
> https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/24591/

The documentation suggests these tools are primarily for debugging
purposes. This wasn't clear to me previously - I now think we should
just host them in the openbmc-tools repo where we already host a
bunch of other scripts for debugging. If you want to install them in the
image then we just write the recipes necessary.

Andrew
