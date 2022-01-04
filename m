Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B92C1484631
	for <lists+openbmc@lfdr.de>; Tue,  4 Jan 2022 17:49:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JSz9t3y8mz3000
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 03:49:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=UMEKfw+/;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=dvGkXqLe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=UMEKfw+/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=dvGkXqLe; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JSz9T394Gz2x9P
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jan 2022 03:49:33 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 518B232020BE;
 Tue,  4 Jan 2022 11:49:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 04 Jan 2022 11:49:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=nS3
 9duvxC3Jyti4jtU3dileaXdYFaYJzRf0iWX6V74s=; b=UMEKfw+/pxeSe0d5YEx
 zluz14jFsX12Hwj+hxhIq5Tu5CVsm5yFfVkQol75Wr9WqYTL0k7Pmqt9sisemPqU
 1KJExdhFtvC9lQymxapTkHkNnf2SFWHam3MYCi+/ZUnGoh6jnQfsxvSHx2SSwPjg
 KdnHU35FUcQAppfeTvnWw5qPv/bvdAGoUYo5i3fbSPrGuHsioQMt48R7VYWOPupO
 60JMVEByVpSzs00mUsfiMpgJu2IoknBpxAAvbLY+gLo2qVy3n2nh7IaHf1Gv1w+E
 BAo2aceGYKquVKGF5/F+pdUmj3lgS3vwwp+ncF+p7eoKixwM/GI1/D1O68Urbeke
 mEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=nS39du
 vxC3Jyti4jtU3dileaXdYFaYJzRf0iWX6V74s=; b=dvGkXqLe94kFz4YkB+UVuE
 GumMAK+QofWetusqaRi41iifgwj4s+ODY+YGiYVYgy/MiJJoP62UXyn3xMGjivTi
 oJI59W9l4hKtPkfgwAGTXpTQxbEjp6VCrUONLh1OVk6SSKfcm6Tkec7Xr1BEjObM
 ac0W4i0GkAIzdA6fsKC7OC/ev9uSaw/dqrK0NMP+9JGRa4kLGXTqfop/xf/HSfAR
 fVsHNLdjmztCynDRLyGTcsqQv88kfO82HcD+gctuE1rw8sXrR4QwUavh6CDBZUfm
 cJkHhxA5T0px5r7K1ZGXDkaq4KCBi4XIKGLha0AJan27/FTbEKSaUZaMRrAQ3Hsg
 ==
X-ME-Sender: <xms:mnrUYWR4HO_qosXuPcxKKqoqf6LxHqjviVAv2sBAWkCzkEnhwsSe5w>
 <xme:mnrUYbw2b19dakDt0npYEoWF5JAFStkmTemAjp_su0ubWtkXkHQA9HRPQGLiH0zxg
 BY9jg9P7HCGHNmHgo8>
X-ME-Received: <xmr:mnrUYT2ONwIQu9GfqRXkrwUMcPkx1zabgqeMM3Txoe3QYFzIpUQ-VWP0k-CaQb6-xknE7G5HUvcu_J0ZuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudeffedgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
 dttddtvdenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhu
 iiiiihgvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpeegheejgfeutd
 ffteegfeefheeileejtdefgffhgeeuhfduveejleefkeejgeeiueenucffohhmrghinhep
 ghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:mnrUYSDKkSZJ1Tmd66g75ZPlHRNGnub0Ip-jJe4dakY5OwkyC1JepA>
 <xmx:mnrUYfiTb7lKLVfMdqJv8gKgpHOFKhhQjl914CV7cY0oAZdFLiOQGg>
 <xmx:mnrUYeps-Syf7YdATNVzWYJMjmkUeUkTAqiSNHwHYsq1-w7B6OlMUQ>
 <xmx:mnrUYfJVn2Tal-VOgzsi90RVNgTFDnksaejGTij-Hcgh5nkMeXDsNw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Jan 2022 11:49:29 -0500 (EST)
Date: Tue, 4 Jan 2022 11:49:28 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Glukhov.Mikhail@depo.ru
Subject: Re: DEPO OpenBmc CCLA
Message-ID: <20220104164928.jdfjoq73x2ivmsjt@cheese.fuzziesquirrel.com>
References: <1bdc743e1ca04cfbd8cddc58e764aa1ad2dcf62e.camel@depo.ru>
 <eb67dabd6c0a36a78f8516104e9172ee9676e5f8.camel@depo.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <eb67dabd6c0a36a78f8516104e9172ee9676e5f8.camel@depo.ru>
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

On Mon, Dec 20, 2021 at 06:55:47AM +0000, Glukhov.Mikhail@depo.ru wrote:
>Hello. In accordance with https://github.com/openbmc/docs/blob/master/
>maintainer-workflow.md please add DEPO Electronics LTD to the list of
>participants.

Hi Glukhov and DEPO, welcome.  I added your CCLA to the repository,
thanks!

-brad
