Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5AD3371E9
	for <lists+openbmc@lfdr.de>; Thu, 11 Mar 2021 13:01:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dx6wd73T6z3cZY
	for <lists+openbmc@lfdr.de>; Thu, 11 Mar 2021 23:01:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=HSLGxLEi;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=S0oS722n;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=HSLGxLEi; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=S0oS722n; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dx6wM3hKNz3cFx
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 23:00:50 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D64685C014B;
 Thu, 11 Mar 2021 07:00:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 11 Mar 2021 07:00:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=qic
 qHcaiIAkay4xB037P5EEHEuwooJ+m4ZAIHyCet3E=; b=HSLGxLEiIzHeNdAOq9w
 H+KzSooppUMzXE+J11NpsJpM3Ah8zhkOp3Bfw/bzTS4ic0aE1oaXGjUvDo7ekUgw
 yGPrKGdoROT5cSvja/ngkDOg9CblWsPBAAQH9d3iPPyDH042rtRcub8K4RfIp8V4
 2e+rWVm75rKqjQU3pKSUya84P0SuWJZt32E6Zc8PLzw00uHC0Npr9pJUStsA4asU
 hryjP49bno+uUTr2VlVXsUBvvALteqkK5SHe+FinmTw81JhlV5Y8fvkkP7om9EWf
 uh0cT+wxPkVlOsj9CebWXKyAlm8n0oz2Q5X/A+thHW8Fsd8DdFbAZpZ0Znc7CpEl
 7vA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=qicqHc
 aiIAkay4xB037P5EEHEuwooJ+m4ZAIHyCet3E=; b=S0oS722n4c+MngfraxX0eT
 IFItH5vwE0ofOFAos9y++IyIDU5NyICH69zbmz+Px7FNX474fo0XJjUSC06qod53
 evgyRgdw7BaG0r4M3sWgJZql7Ot6uv2pZYg3uDfLgJoNEpmXg69xvT9wKWcKuVqV
 BtvcLsi9hGgT5qEwnkUhiFpYIQfdR0y9/f4tPIkZqgUqfY0/1h7Io7LGRKEcLLRk
 yoFR4HPS2SxeKZC1b5hAWgqEQa+pDBktDNqn3W3uC/CBihpXc/mUK/4QpBBxLZWT
 Zny6u3lJM9a9Zq0Nn5vs82UbbufehQ6tHOiN23j08U3w8kgwtzMYDCfZbD34T7aA
 ==
X-ME-Sender: <xms:bgZKYNz77SiRwgM_YMCVvBM42VlX2QIXxKO8Rf5jLBx8jV-4QRHgag>
 <xme:bgZKYNQAYnx_h6WXppxDtYGhNy2ccBLUf1uF2hPQMxwdGTT64a7Mzgj9Qv1eXX0lC
 Mv0J8LBm6E17H6Bz1Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvtddgfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepfeffhfefheeguddtvddtueeihfduieefkeefieefkeef
 udefueevudelgfekffefnecukfhppedujeefrdduieejrdefuddrudeljeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsges
 fhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:bgZKYHUqSZXdmPhjOoxckuCVd82gZe4u-EbtNaGNoEFeP8C-9zg0jA>
 <xmx:bgZKYPidCyvK0F9vRiM-zbGR_MILHR6ecflMGnR1xKczfX5hWLx4jw>
 <xmx:bgZKYPDWwrCWGouEqVGpTKrWE_nxH03sMal52kdUCISAThAG0POXMA>
 <xmx:bgZKYCpBA6ZLZBajDGdxDb20Ks_YSe1u-bEESlJgKv2ERZ6oUfGhcg>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0D7AF108006A;
 Thu, 11 Mar 2021 07:00:46 -0500 (EST)
Date: Thu, 11 Mar 2021 07:00:44 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Troy Lee <troy_lee@aspeedtech.com>
Subject: Re: evb-ast2600: Getting some build errors - 'u-boot.bin' is too
 large!'
Message-ID: <20210311120044.lycafutqmsy7ueza@thinkpad.fuzziesquirrel.com>
References: <CAHf5csd1tt-VNS9Wfuwqito2Fy75bfhArAEhZP_d1LXeOz+YVA@mail.gmail.com>
 <PS1PR06MB2600DD0B6A4F3F30C771342A8AB29@PS1PR06MB2600.apcprd06.prod.outlook.com>
 <8bfeaac7-8e70-c45b-8a87-8ab7d667cab2@os.amperecomputing.com>
 <20210309221020.ut4gds26ivcp6mst@thinkpad.fuzziesquirrel.com>
 <20210311031107.GA2095174@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210311031107.GA2095174@aspeedtech.com>
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
 Thang Nguyen <thang@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Mar 11, 2021 at 03:11:07AM +0000, Troy Lee wrote:
>Hi Brad,
>
>The 03/10/2021 06:10, Brad Bishop wrote:
>> Hi - We changed our process a bit and now patches are to be submitted to
>> openbmc/openbmc instead of openbmc/meta-aspeed.
>>
>> To help with that transition I thought it would make sense to mark these
>> as hidden in Gerrit, but that seems to have gotten in the way a couple
>> times now.
>>
>> I've changed the project flag again on all these meta-repos to read only
>> - you should be able to view them again now.
>>
>> If we want any of these merged - they'll need to be re-submitted to
>> openbmc/openbmc.
>
>That explains why I can't find these patches a week ago, and it appears
>again yesterday. Thanks for pointing it out, I'll re-submit the change
>against to openbmc/openbmc.
>
>Thanks,
>Troy Lee

Thanks Troy!  Sorry about the hassle :-(

-brad
