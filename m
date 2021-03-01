Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E40F13281C4
	for <lists+openbmc@lfdr.de>; Mon,  1 Mar 2021 16:06:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dq3W40j1Yz3cJx
	for <lists+openbmc@lfdr.de>; Tue,  2 Mar 2021 02:06:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=RO7nWR6N;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=blnZ721J;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=RO7nWR6N; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=blnZ721J; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dq3Vn434Fz30Hq
 for <openbmc@lists.ozlabs.org>; Tue,  2 Mar 2021 02:06:07 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8B0885C0170;
 Mon,  1 Mar 2021 10:05:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 01 Mar 2021 10:05:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=Zvk
 5zJhu73qlS3hqoEbSMBeWXmbW0yvTTrzWEx0Dn2g=; b=RO7nWR6N9TPKLXFtkwu
 2FILCr76+e68veNYMkKV8T9PgbcpNk902PFMmaFENjzXOF6ASoruI0/F7BwJUeMj
 WPsCdQN8cDjkHpCki/ISXOcRD3zhAzLRgzblqp0KQQEt333hJsqcPjRppkggAKe3
 dEkGZLYn5tIm4Sz79OXHIIdi4eebv+EK+a5SWE9LyFYpqVUK4aJNsUBLAAW2ae1s
 gDoDfdGQXMU9u4s01ZgaQxO3wwGwWSmGAKag/IySEV7Tgf9FAvrAyF1SrJK3DNo2
 c3/gXsrQiCa+xv3+JnXI1vcTTvsShfNP5eFF8FdgLOgQdG+yOdXKL3y5k0fo9nZQ
 L/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Zvk5zJ
 hu73qlS3hqoEbSMBeWXmbW0yvTTrzWEx0Dn2g=; b=blnZ721JZojhkY0Y26SPb8
 CFKNsazJNTjdq+KrhNbnG/tw9L3P7AUq3cJXlNOdI2V0ubHMfdJhcTUAWMFGSebZ
 axHkEvxiW+AySjQvw3tmDy4272GcuyJQFk49hpxBh4tehgFtQyv5z9cKf0PPvXKl
 fJ/8IuvZYYuU6mhhBAySB8+TNE/GCrWCFg6RdL6yYdYMkpTidefQUZOB3+BHeygd
 9LFtmeINcis0+2Ttne/7FEfK96c7QUBdjdbA6iJXFFlqfkQe266xb7k9gOtF2V28
 ivjtoRNNr0McJmW/T9iVpvyolknmvWh6ea5GvkLGAitYYIfUarCBoszvPJ4QfYTg
 ==
X-ME-Sender: <xms:0wI9YG1FYmqmUu_OWKlohLItfKJNXSQS7douURpdSI6qz0lyPS-ZPQ>
 <xme:0wI9YJGZqWQ40eGB3j19-wH-2jQyiGbmqdVYaTe_h8RyvAQsXr84PL6fQkJC_bCOm
 K3KJM_yxhj0AlBSaiU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleekgdejtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehrrgguuceu
 ihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhmqe
 enucggtffrrghtthgvrhhnpeeffffhfeehgedutddvtdeuiefhudeifeekfeeifeekfedu
 feeuvedulefgkefffeenucfkphepudejfedrudeijedrfedurdduleejnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigssehf
 uhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:0wI9YO4AO4POsgCWkOEZHvVP1uZ8RplYfxSZ4ROSJ5ZXGVbI-29Gbw>
 <xmx:0wI9YH2lQGcKqz9aROdGl6oT2pd5bZNuvWiJxYwGjWpQXFp0ruSMlw>
 <xmx:0wI9YJGItDylgm0FN2kPBM7KDFm_934I1t-bFgJMfs81mTOq1MNMGw>
 <xmx:0wI9YIwN9wBT0FnmaNTEV-YfsRUtArc1o6231JC02uSPzX2UEt6OFQ>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 579DE240066;
 Mon,  1 Mar 2021 10:05:54 -0500 (EST)
Date: Mon, 1 Mar 2021 10:05:52 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Wludzik, Jozef" <jozef.wludzik@linux.intel.com>
Subject: Re: any in-progress Redfish TelemetryService enhancements?
Message-ID: <20210301150552.hfwsnzgb5wczdpyx@thinkpad.fuzziesquirrel.com>
References: <20210218190654.kkdsmrlxgenzr6nz@thinkpad.fuzziesquirrel.com>
 <CACWQX81HtHCqXZCzmJqppR+tBy5xDjBHa_q5gw7YTHZ9UaAH2w@mail.gmail.com>
 <20210219193348.n5e6w4e2vr4sk5ge@thinkpad.fuzziesquirrel.com>
 <47d61387-d71f-b72a-fe30-316a3a37829b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <47d61387-d71f-b72a-fe30-316a3a37829b@linux.intel.com>
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

On Wed, Feb 24, 2021 at 01:09:56PM +0100, Wludzik, Jozef wrote:
>Hi, "Append" is on the list of to dos and should be ready till summer
>(might be ready). 

That's great!  Any chance you could you provide any hints on how you 
expect it to be implemented - I'm not sure if I can wait that long to 
get started.  I would like to make sure that if I start working on it, 
it will have your approval from a high level view.  If you have not 
given it any thought, no problem - I'll come up with a proposal and 
report back here.
