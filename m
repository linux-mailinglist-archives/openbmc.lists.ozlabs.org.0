Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF113609EC
	for <lists+openbmc@lfdr.de>; Thu, 15 Apr 2021 15:02:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLfds5CWTz3bq3
	for <lists+openbmc@lfdr.de>; Thu, 15 Apr 2021 23:02:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=jgUNHhl1;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=DQ9jl7uw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=jgUNHhl1; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=DQ9jl7uw; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLfdb1Fg2z30CZ
 for <openbmc@lists.ozlabs.org>; Thu, 15 Apr 2021 23:02:42 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 1F4A812D1;
 Thu, 15 Apr 2021 09:02:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 15 Apr 2021 09:02:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm2; bh=0rZ
 6ZVLvLYA2nUn7oucAsCc98IbyZkp6vKnrfN6v/2w=; b=jgUNHhl1d5wehokSnF+
 CFgivYOm//IWofqZo4Q67jABEY62qS1gWdTm2mqaotUY3qHVWarEIdAocIDS3rgl
 nJQAhWQ50W3muTEsgMhK0ZgoBzOWXS9/hm5oGMM0BeOaRg7Fa+FxlOSy8z4ML0Qx
 OKCBbeZq2euCkvFfCE02zmgSy8vJRnGhHJ1N5GBVEzRbL9l+fJ/NhEz7d3MyFd6z
 huySI+r6HlK4nxYBnYUeidKZ6N240iUOGbKAZ4eGQk0fGxZ1xYDaNDkw/GNq7nqp
 5J1YQF4Ttjn3KfHLS07uz/4vs+qMsqfByA5xsDZC1EKNXhxFa5FqDn00hO9X2nGb
 WCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=0rZ6ZV
 LvLYA2nUn7oucAsCc98IbyZkp6vKnrfN6v/2w=; b=DQ9jl7uwuUReeq/cDufq7l
 5xV91rl1CCFY4uNpF0Jspaz9RuUHK83xT5bmgzFCwrU1QF9MiiG7Hy9pBsAbpz5z
 UMtYl5Sx4gBe9tIV4XmaIxiJZmH02mrjekhFoL5aANe2S5DtF1fkT3mnXFfADB+Q
 p5xvI0cE6gqEBuRtl5R1VlbP0y5ThEnXLqSv4NL8VWMXg7r6LZ0psnEkzxEZiXN9
 6Nnnbaks5lM6jP5klQz9vqTnAozD0fD4EBTNDSwydUHbSpMMuhTuRPQjJewSwN2b
 1xr5IAazvljqHeHTOYO1vFyzOM8+Yht3tZVxZuj22kf4glIXLeQr0ISqy3oXVLIA
 ==
X-ME-Sender: <xms:bDl4YIhQImDnB2AqZlG3gMyVZwO3JMXKwXvkkUnAh16SnKXIAoYxLg>
 <xme:bDl4YDDleGyCu24XZJ2kG2zQnEduNtmeHHT5EvSBog83q3p7Y6w0nif5cFep2Z9BP
 TbZVCjeWpI0h8W0g-4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudelfedgiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
 dttddtvdenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhu
 iiiiihgvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpeegleelkefhve
 evueeihedtueeuhedthffggeduleeuhedttdevhffffeegtddvteenucffohhmrghinhep
 khgvrhhnvghlrdhorhhgnecukfhppedujeefrdduieejrdefuddrudeljeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsges
 fhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:bDl4YJc2GB5Qq_NXXodgzcjKGzk1HGt5Qvyqzx0drBsqfQhZ6QObUQ>
 <xmx:bDl4YLfds3faPqPhoo8jsvioVQtVAPVH-ekNnTlX688l3O_vDfZeOg>
 <xmx:bDl4YNi9JmlwT3CcHUsVV8jvCcbX7BLuCkLRN4Y_pjrrwnWA8ILdqQ>
 <xmx:bTl4YER-u1J9TtgCQpF12ZojGEghv1jtI1-JnDjzor8WPuuBlbh6yw>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9CDB7240057;
 Thu, 15 Apr 2021 09:02:36 -0400 (EDT)
Date: Thu, 15 Apr 2021 09:02:34 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Bob_King@wistron.com
Subject: Re: new meta-wistron repository
Message-ID: <20210415130234.gbg7fgoz3w5j4ofp@thinkpad.fuzziesquirrel.com>
References: <103c91be2e6b46d9bce11da00308c80f@wistron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <103c91be2e6b46d9bce11da00308c80f@wistron.com>
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
Cc: openbmc@lists.ozlabs.org, Ben_Pai@wistron.com, Claire_Ku@wistron.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 15, 2021 at 05:23:25AM +0000, Bob_King@wistron.com wrote:
>Hi Brad,
>
>We need you help to create a new repository meta-wistron for Wistron openbmc platform.
>Could you help for this?

We've changed our process with respect to meta layer subtrees.  Please 
read through this thread here and let us know if you have any questions:

https://lore.kernel.org/openbmc/CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com/

The net is just submit your new layer to openbmc/openbmc.

>
>And the maintainers for meta-wistron are:
>Timothy_Huang@wistron.com
>Claire_Ku@wistron.com
>Ben_Pai@wistron.com
>Andy_YF_Wang@wistron.com
>Ken_Hsu@wistron.com
>Jolie_Ku@wistron.com
>Bob_King@wistron.com

Great - add these names to the OWNERS file meta-wistron/OWNERS (have a 
look at the OWNERS file in another layer for a template).

thx - brad
