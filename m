Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3F8358891
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 17:33:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGQK35D6Dz3bt1
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 01:33:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=m701xrDV;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=AcnfSV/B;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=m701xrDV; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=AcnfSV/B; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGQFh0Xcxz3bxv
 for <openbmc@lists.ozlabs.org>; Fri,  9 Apr 2021 01:30:47 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 598765C0176;
 Thu,  8 Apr 2021 11:30:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 08 Apr 2021 11:30:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm2; bh=z51
 8Sxzx58nuF6JEE8gRB4Xea5mVKxKaVN0FroLrA6U=; b=m701xrDVHi75m+z6sgj
 NF8Qq8wUCXWYebQLvXwGvEwLtZZ4U+NhU0aiVCa4oEhSfYcaJyFBbaiC/muqISqW
 PpFDivcw1OQwowx0+kBf4XXzNBe4m5X47jerDa12SfzAWOT+asfIHPWut6Nq4Frf
 eEotmvwUC5Ogt/QTrpyKX1EhAhY587gmg5KL19cOzG84mfgCv8QqSgsg8FXUcgEA
 oasGo3a53Yj7hzTvbxwbwLaDq+H14jagRocCDMfHkAV1zPOAdaOoJCStaOFaRgUW
 yano1Ylg8t7mmt4dQmVlI7fQQkS8b2fZAUztlLMqBpPWpROBhR3fbUYJBQPv9x+S
 g3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=z518Sx
 zx58nuF6JEE8gRB4Xea5mVKxKaVN0FroLrA6U=; b=AcnfSV/B4nFqm4bNyUfF/n
 59IhoQvDsn6Ut2xtsCsvLjMTlF9n2MhOfyGd7Jl5qWXRzQ3WqSAc5zQ2JLiI2cJ9
 Z3oMhQaNgYZpFezP36Eugj/q9CgbqKbLEfW57seYJ2jW8rYfipBCsH32DRcYzzAv
 GSGg5gfoZ2zL1frehhYfJH6uAqyrQ1gQO7+PWrwIbRCQ8aIDTsOSV3K16BBouiiD
 IYCCz+MtlD03lyEkKtl5nkbD4sxYIfcqndVUzHyvQSvdClRiOlmzgE+jXpTj+3tj
 pWS/QKg2xzqE9al6mdMoDO+LaiFNzVEKftyJS6Q6Oryax5+PZKIVUn9jUkOaNTRQ
 ==
X-ME-Sender: <xms:oiFvYAtbY4cq77jc5UnVEoBFYgmBTXTXvUCzYMTRdVGFQ7wa_S0C7Q>
 <xme:oiFvYICzJ8--3chsO0xW4uraxgL-6eOIPBEbky8Uyihf-1m3XzIGUlZ0TvtoJwgJk
 popyiBqeaKh4KxPxIE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejledgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepfeffhfefheeguddtvddtueeihfduieefkeefieefkeef
 udefueevudelgfekffefnecukfhppedujeefrdduieejrdefuddrudeljeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsges
 fhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:oiFvYIV7TDLn0WalhL_JSTeFntWc2u4psVSfrjsTWLDxtT-kU3qkHQ>
 <xmx:oiFvYGBLZwP7144wcqLA5WXf11RieglOh-h68hD08F6NQnQ7qxAPaA>
 <xmx:oiFvYL-lyUvRCWcjCr8Tl2Wv64hr1uAcCJcnni0AM2UaCvSPnZE6LA>
 <xmx:oyFvYBozTcHMY150Pk12sNd3yCmhyeehuILzfUoFdp7F5TmAk-NfFA>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 92BC0108005F;
 Thu,  8 Apr 2021 11:30:42 -0400 (EDT)
Date: Thu, 8 Apr 2021 11:30:40 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Lancelot Kao <lancelot.cy.kao@fii-na.com>
Subject: Re: group for foxconn CI  / fii oem repo
Message-ID: <20210408153040.c2wvk7idgdsvl52b@thinkpad.fuzziesquirrel.com>
References: <DM6PR08MB58838020F8543D03C6235064B2929@DM6PR08MB5883.namprd08.prod.outlook.com>
 <DM6PR08MB58834FC516032C1D11C9F9F9B26F9@DM6PR08MB5883.namprd08.prod.outlook.com>
 <20210315205148.z6mcrx32kxr56lm2@thinkpad.fuzziesquirrel.com>
 <DM6PR08MB5883E400A28403E42592BF07B27E9@DM6PR08MB5883.namprd08.prod.outlook.com>
 <48C1C5DD-1D95-4001-A7AB-55F5ECD912E3@fii-na.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <48C1C5DD-1D95-4001-A7AB-55F5ECD912E3@fii-na.com>
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
Cc: Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Neil Chen <Neil.Chen@fii-usa.com>, "vveerach@google.com" <vveerach@google.com>,
 Mustatfa Shehabi <Mustafa.Shehabi@fii-na.com>,
 XP Chen <Xiao-Peng.Chen@fii-na.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Mar 29, 2021 at 06:40:36PM +0000, Lancelot Kao wrote:
>   Hi, Brad
>	Here is an update, thanks
>   mohaimen.alsamarai@fii-na.com
>    lancelot.kao@fii-usa.com
>    Xiao-Peng.Chen@fii-na.com
>    Mustafa.Shehabi@fii-na.com
>    Neil.Chen@fii-usa.com
>    avery.zl.yang@fii-na.com

Wow, thats a lot of maintainers for one repo!  :-)

I've sent invitations to everyone here, please accept the invitations 
and then once that happens you should be able to merge code in Gerrit.

-brad
