Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E1033C804
	for <lists+openbmc@lfdr.de>; Mon, 15 Mar 2021 21:52:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzpWb69zSz302D
	for <lists+openbmc@lfdr.de>; Tue, 16 Mar 2021 07:52:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=ZCKq0Hoy;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=HtqvyP06;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=ZCKq0Hoy; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=HtqvyP06; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzpWJ5rfXz2xgQ
 for <openbmc@lists.ozlabs.org>; Tue, 16 Mar 2021 07:51:56 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 97D9B279B;
 Mon, 15 Mar 2021 16:51:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 15 Mar 2021 16:51:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=Pu4
 gSPSaXbsI+LjddLGjH+I6fodbN4s4/DmkaSU/n6Y=; b=ZCKq0HoyLLwmbtQE0q2
 /EOtd3UJMTS7H2UoZ3gQl7t8S9MQUscxXooX29/4deGixQ3zTz2/yX4WWJmkUWZn
 ygt85oHHOVQ7JQc7zco6nvRMfRGAgnI1MEGsPJoUEE4bbYmE3PVoqTO2qHR92v5B
 CZ/U3N8ieAafXvbFijplKQURun89Jf6d1jCB3zyVGzk+g+7OKh7bR9HTY9tZQ9+x
 K2HlGBpYm/5W9Amx03bR45c9Ly0p9z94pKXGTp8A60wJ1genwhXJTZO60liKyTlU
 tWBW2hghkoKRP2PCsnGSOOFs/2sn2H2+p7QDjHpy6EE/6++P0XLd6tNTQ+lktJ9S
 JRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Pu4gSP
 SaXbsI+LjddLGjH+I6fodbN4s4/DmkaSU/n6Y=; b=HtqvyP06H381aIPanE04Oc
 Cc2OJtmA0gjrUuGV7GGVYd6Y8ZB9h/jRDrLaX3jyuwyqKmi5MPqPJIMji8ugok0S
 WB/NQ5xUUStFZT+o4FznRXNIaPRI4qrAHLZFBFJGpR5uYdWWPZ17A4AAiOqvfPz9
 rHO11/xW98tWVPftalsrONh8VW0iUBXenzrAzOipwC4L+PXvopAFfWaupBWiG76X
 bF8DfCuHp4LAxJStKsDhBMC+U9hLQusQZok0LBYsNRd7QhVde0mEFFauYDiyI87Q
 ieLnxkzmG/f0XRb1N0qFI2YDf8zHw46JLnO5oU7HM6dZ8EqNK1sDqHOW5E+c9NAQ
 ==
X-ME-Sender: <xms:5shPYDkRaKR-G9bVFz3sARNexNIx-Q-h_Zw6sgnQnqvnJ5hcVE0gBA>
 <xme:5shPYG2nSha4K2rTnM6b_YSs9wmJemWuf1WiX8eb7N75RqjgoOPfNvV0AD6SBMkjX
 wsFdQ0_RTfsFR7Zjuc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvledgudegfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehrrggu
 uceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
 hmqeenucggtffrrghtthgvrhhnpeeffffhfeehgedutddvtdeuiefhudeifeekfeeifeek
 fedufeeuvedulefgkefffeenucfkphepudejfedrudeijedrfedurdduleejnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigs
 sehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:5shPYJqPEWZD403EQogdYQYoqZ0pmeK1qBI_gCG8OYV_YJcx55Zq8w>
 <xmx:5shPYLnsWW_HqCYCvJOM2Fzb1XI-pJIfwEDDDWmTg9qEbSsaxrEX_g>
 <xmx:5shPYB3FxxiA3C-qnQNVcfM-QzykJLzmiIkBX9JqEjbHnzidDZRpfg>
 <xmx:58hPYC92sm2lVULEaPJHMCsAneXnlludqeayJSkRx_kh69muNn6CJQ>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id A13031080067;
 Mon, 15 Mar 2021 16:51:50 -0400 (EDT)
Date: Mon, 15 Mar 2021 16:51:48 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>
Subject: Re: group for foxconn CI  / fii oem repo
Message-ID: <20210315205148.z6mcrx32kxr56lm2@thinkpad.fuzziesquirrel.com>
References: <DM6PR08MB58838020F8543D03C6235064B2929@DM6PR08MB5883.namprd08.prod.outlook.com>
 <DM6PR08MB58834FC516032C1D11C9F9F9B26F9@DM6PR08MB5883.namprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <DM6PR08MB58834FC516032C1D11C9F9F9B26F9@DM6PR08MB5883.namprd08.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "vveerach@google.com" <vveerach@google.com>,
 Lancelot Kao <lancelot.cy.kao@fii-na.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Mar 12, 2021 at 07:25:42PM +0000, Mohaimen Alsamarai wrote:
>Hi Brad,
>                How can we create Ci group on gerrit and add people to it

Created fii/ci-authorized and fii/ci-authorized-owners.  Please add
people to fii/ci-authorized to automatically approve patch authors for
CI.

>And we need to create new repo for the Foxconn ipmi oem

Created openbmc/foxconn-ipmi-oem.  This repository needs a maintainer -
can I get a github account handle to invite to the OpenBMC organization
and assign the maintainer role?

thx -brad
