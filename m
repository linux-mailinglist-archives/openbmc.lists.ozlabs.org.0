Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 511EF3025AF
	for <lists+openbmc@lfdr.de>; Mon, 25 Jan 2021 14:49:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPWSH2cCrzDqx6
	for <lists+openbmc@lfdr.de>; Tue, 26 Jan 2021 00:49:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=MzYzgUhE; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=ogEMaW0e; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPWQv0M6vzDqtV
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jan 2021 00:48:05 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 442BC5C009F;
 Mon, 25 Jan 2021 08:48:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 25 Jan 2021 08:48:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=2qq
 mgpTAMDFvk9BywP0pZjYHoZzGlOVV+L+nsB7BuAY=; b=MzYzgUhEgL5hikzuuJI
 lqIDuswjg+yP5DfKVZwVSyp43Ot/lwve63BIMxYKE7oLR2Yi/609tqBZV2Gm8uyZ
 xkxss3e1/M2HZlmc0TBmfvY3g69Jsz4wvbCjxYpE5DXO5fgnGnYS3gE5Ikz5bmuP
 tSyCGzgvMV3JMk0vzDEfPGsZrZH04/fRpPxGjE69URSYEh6foLykCMqURWknQZGE
 eLKGla2mrQcTGcUtguE8Cce2YdOnZw6ptVt+LwCPiEcqegAYGXPv3UOVCCh44Fbf
 221hC7yXGtIFOjHUYukBQz7OOUXotPs2QJSlBSIjBhN1on3rOLKMyjzqigolsg/u
 wPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=2qqmgp
 TAMDFvk9BywP0pZjYHoZzGlOVV+L+nsB7BuAY=; b=ogEMaW0et6W3gFjxf79J6r
 uGKtxsBCiXzaBDxVFY5sysbj9kbF3+pASalrzdVc7J1e3nINMd88g3PtPizHvX95
 NscNjQHiDQIYRgHDvf8e+UnSRZvaP7kihuT4kf00WS5V7VToOAcvfqkShwV4gqDB
 /uKMxK/VBuMMC8i0qRKCDiEAi7xAVBrcsTFzkADk12CEKiU+n62kJo+Shqvj00JX
 PdWHCWC9mMwMF/XgxnR5nAYQB3LaI+rtyfehBRjdpzkLPdyhAwEq7BDGz5My6Etw
 4J/Be+pTTvmgqKGn+t9ZB+sSDa9Ayzl/PFr3dIvqF8hakm7E8yS4Q5iN5iMV1WvQ
 ==
X-ME-Sender: <xms:EMwOYPGr8YatF5R1oVGmRvmdx8wXTZiiNDhWYGic3XagtJbYBwko0Q>
 <xme:EMwOYMXXgl2MamncVKlEa5IVQ96F-vmCeQop4KRo3cZ8AnLbq93XiQz5_BRCn4qFn
 kt9fnvKI79CMvJDJXk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefgdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehrrgguuceu
 ihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhmqe
 enucggtffrrghtthgvrhhnpeeffffhfeehgedutddvtdeuiefhudeifeekfeeifeekfedu
 feeuvedulefgkefffeenucfkphepudejfedrudeijedrfedurdduleejnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigssehf
 uhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:EMwOYBI1jRXfo8rQjXkPmfWMw8Rtue9Sz32mRio7QfIugEtxRWIdwA>
 <xmx:EMwOYNEwSdgjorkkwkxbtSmM17jQ6NmlqlsD2JboyYlXbr-FBo8T9A>
 <xmx:EMwOYFVT9VMT42C8txjUGsKucqazdesdg5HoDDEyoEx4turqMYlimQ>
 <xmx:EcwOYGciEX33DKX4eRe_q95ppt_YhOMMG80XBQm7lCI1cVxlLoUa4A>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8EBAA108005F;
 Mon, 25 Jan 2021 08:48:00 -0500 (EST)
Date: Mon, 25 Jan 2021 08:47:58 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Andrew Geissler <geissonator@gmail.com>
Subject: Re: Gerrit owners plugin coming
Message-ID: <20210125134758.d2ijyw4gwrxpztvx@thinkpad.fuzziesquirrel.com>
References: <CACWQX821ADQCrekLj_bGAu=1SSLCv5pTee7jaoVo2Zs6havgnA@mail.gmail.com>
 <F55AAE75-B6DB-4185-95AB-4318E725B0C1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <F55AAE75-B6DB-4185-95AB-4318E725B0C1@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jan 21, 2021 at 10:07:21AM -0600, Andrew Geissler wrote:
>
>
>> On Jan 20, 2021, at 1:23 PM, Ed Tanous <ed@tanous.net> wrote:
>>
>>
>> Overall, I hope that this will be a great improvement in the overall
>> structure and usability of openbmc, and remove at least one stumbling
>> block people new to the project tend to hit.
>
>Thanks Ed, this is going to be great!
>
>Brad, we run this autobump[1] script in a cron job right now. It scans the meta-* layer
>recipes and creates bumps into the meta-* layers as needed. I assume all we
>need to do is tweak this to just look at openbmc/openbmc meta-* layers now and
>do the same bumps against openbmc/openbmc?

That's right.  I'll do that this morning.

-brad
