Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF04E36D040
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 03:24:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVLX24vlHz2yyx
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 11:24:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=DK6a7JJp;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=OYk0xc3U;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=DK6a7JJp; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=OYk0xc3U; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVLWn2dz4z2y86
 for <openbmc@lists.ozlabs.org>; Wed, 28 Apr 2021 11:24:21 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 0B6765C009F;
 Tue, 27 Apr 2021 21:24:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 27 Apr 2021 21:24:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:content-transfer-encoding
 :in-reply-to; s=fm2; bh=qa7Z/eDQWTB9kMFmjgEA9ap1yIM4nCEToi7VqX5F
 yjM=; b=DK6a7JJpD5heLpUZgS8o7oKL/MlXYHtJREkMbsexwBIbNpKh7dhPxoUp
 bwPEYpnr9uZWCOQTc+ROrLQzcevywotndRm10BR1g24AonfD/a+XmK4QQQI7wd7h
 X5gzMZRSBT96spN/JLEIrDb3kzzElVS3d8554zuuZFw52XL0YQzZ7yV/aJ3hCDAn
 G0oaFaDW0w0O0nzop76YwJdmYsjE0hB9d4ta0svNC8GSsrk5sg98zXlNMHyv2yXb
 wnUjY3xzDBd/d+7bEBGGkywMkmqnU1IkngWPV6SPIq5CszKI3wsWIbHenp7SRX3H
 OIZ4P/qEoeGMegIrSSgQxskaZhOXbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=qa7Z/eDQWTB9kMFmjgEA9ap1yIM4nCEToi7VqX5Fy
 jM=; b=OYk0xc3U1HIUxSST3J6Yva+t/6RwLr7/S6HFg8DlQ3ZdoeUqQsTeEFdtG
 5kLEvKLs5IgHVct6+5tJmsL6KiIdtuf70O0DBTXRO/CK3qU3LvnV5L6ip25GfgGU
 tp9LgCkyZmzniDIQFvB5YXaNwDygQW6jPVsMW5rrXp6pWLURgJBf6MxXuA3Tlguc
 xvV1t+3AwbRmprRZEfGeMWecnixLgpdXlnQJ4MDORT8x5dhz8r9EsVxAO3+akm3G
 N7Pds+pYPJ8kj6n8wdM9Yu1lSZ9Lh//iyMCmfSJcidMOnrFa2FLei3IfmZVfmTLr
 seuRiDcHrP+lG0SW5tHunoYF6e6EQ==
X-ME-Sender: <xms:QbmIYJ5EkpC-Fyp2GQ1vqgko0yLpbihjnZ-o7_CzMu_fdnNjgDpkZA>
 <xme:QbmIYG5Hi4XqjIh-aOMDQrgnJqtU-Nz_KDyzf_WexTDO5olyJfUpYhLP3bfV6bh-e
 0WeFYldWpZZrlXE_MU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvuddggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggugfgjsehtkeertddt
 tdejnecuhfhrohhmpeeurhgrugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiii
 hivghsqhhuihhrrhgvlhdrtghomheqnecuggftrfgrthhtvghrnhepffdvgffgtdetheek
 vefhveduffetvdekjeefleeiheeijeeugeffudehgeelfeelnecuffhomhgrihhnpehoph
 gvnhgsmhgtqdhprhhojhgvtghtrdighiiipdhgihhthhhusgdrtghomhenucfkphepudej
 fedrudeijedrfedurdduleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtgho
 mh
X-ME-Proxy: <xmx:QrmIYAeWQjP6wj2JYzi3icyjTq57qoFtM1D97OIVxgi8ICRRHIYINg>
 <xmx:QrmIYCKXe0vyfNItZj1lLzZCTWtIwuLPA7qAbEdMDuZ_X4fk2pj_Og>
 <xmx:QrmIYNKpAzlUwzB5Q3mhgVJS4NkJpWpMr9w2CQMHfVsAr7ZpsmBE2A>
 <xmx:Q7mIYLikDY9tPN8DDq3jrtj2yPTXSDt_1jMS44pUuLFFKqTbglKGpQ>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 27 Apr 2021 21:24:17 -0400 (EDT)
Date: Tue, 27 Apr 2021 21:24:16 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Charlotte =?utf-8?B?TGko5p2O5L2z5L+QX0FTUm9ja1JhY2sp?=
 <Charlotte_Li@asrockrack.com>
Subject: Re: asrock rack layer
Message-ID: <20210428012416.odr35ojcwzyz3uqb@thinkpad.fuzziesquirrel.com>
References: <20210422123001.fb6knneedeqrfgaz@thinkpad.fuzziesquirrel.com>
 <CAH2-KxBB78A=7GTPEpfKBJSGgc=Ei_DaFN0p2F4NEKbsHxJfWA@mail.gmail.com>
 <83f10aa7d0a84a2085c97d01168f2e84@asrockrack.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83f10aa7d0a84a2085c97d01168f2e84@asrockrack.com>
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
Cc: Ed Tanous <edtanous@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jeff9 =?utf-8?B?Q2hhbijpmbPmnb7lhIlfQVNSb2NrUmFjayk=?=
 <Jeff9_Chan@asrockrack.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Apr 27, 2021 at 03:44:56AM +0000, Charlotte Li(李佳俐_ASRockRack) wrote:
>Hi Ed,
>
>Nice to know you!
>
>It seems X570D4U is not submitted by our team...
>https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/40463
>
>Just curious, the developers listed in schedule A are Jeff and Leo, can someone else make contribution for ASRock Rack too?

Hi Charlotte

I can understand the confusion, but meta layers hosted in the OpenBMC 
GitHub organization (github.com/openbmc) are *not* owned by the vendors 
they are named after - they are owned by the entire OpenBMC community.  
So to answer your question - yes, anyone can make a contribution to 
meta-asrockrack.

thx - brad
