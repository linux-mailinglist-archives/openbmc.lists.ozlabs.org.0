Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAE13142A9
	for <lists+openbmc@lfdr.de>; Mon,  8 Feb 2021 23:13:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZKzD5RpBzDrgc
	for <lists+openbmc@lfdr.de>; Tue,  9 Feb 2021 09:13:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=iXgvvWwj; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=h2Vax5y4; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZKyP5vBXzDrBs
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2021 09:12:28 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 04D005C017C;
 Mon,  8 Feb 2021 17:12:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 08 Feb 2021 17:12:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=iHm
 c4QTvs6vkLg8qWQPeLTg0Yn6zWcUPsrzqaYVQziI=; b=iXgvvWwjL+LSmxUPnAt
 gennZLEWzNwMiUoCbMnmnPJmczvOfyjjSkHyM8YzYNpmSssqQgqem770nXIrbgHe
 lSqGZNWA7jcHg6JnhwZfGNUR6Vjvrjg/IR/r30QWgn4HAlDHBfg7/Slv+tv6rLtt
 vRyHXm7A7fcWVqn8XAiQbDsQ5LdTfRoBYPTHRARn9o7Gb1efgxKJrr+66r7A0n/j
 4cNRI8gO19InsfW5z65gBOabTZOkOIKBYvDSPDNybKstYH1J5Dv/Pvnls1rLNh8l
 zwXXlMfTd69iZYXfeGzWHc6mDP3uzeAzFqVfsr2yZ/BpBVuCYGjzZh4F6/1Ql++s
 c/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=iHmc4Q
 Tvs6vkLg8qWQPeLTg0Yn6zWcUPsrzqaYVQziI=; b=h2Vax5y4M0nKLvP80WrJdl
 6hD2J6HG61tpUE6OFldt6vmJX9GFWS/GcidR8GC3P227aYF14coKVJP3VbjVbICq
 pVW6SHES6Mf4efxh57v0SrI1V8F3lQUBBITI4okfpQuzJxBW8boOG/p+2jSYTjL7
 mv2+NrECZq/M8EmliQJ0F9shO6fXq1RDtDW0jghV14BBXDT7vWW/iYvvfgrafPLI
 vgdNCjNVamTNI/2G4gGRHpsNuHWSu8K+HDex4tyvNTdBaRZTNHpZ6wdlVlpq3m6K
 RpJ+DjlUtip1TnvJ435Cg01BYlsRxv1NhVqhDgNR7a+40hjch5jO1CU7Ov9zFqxQ
 ==
X-ME-Sender: <xms:SLchYDQR_Hmh3DiumkytZ9lgtrgA-O9mnFlEt_kAiVXDhk9rc1fsnQ>
 <xme:SLchYONA-Qhu2T2lK4BwHib41AEy8Nc5_R5JW6h-MqyN811pykov1LWRsp6wsC8vk
 E8D--VzuQQatWmp6Pg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheefgdduheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesthdtredttddt
 vdenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiih
 gvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpeekffdtgfeuvddukeet
 feefvddtkeeivddtkeekfeekjedvffefleejgeduueejffenucffohhmrghinhepghhith
 hhuhgsrdgtohhmpdhophgvnhgsmhgtqdhprhhojhgvtghtrdighiiinecukfhppedujeef
 rdduieejrdefuddrudeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:SLchYIbgRrxxpkEPsoKrrmLZVylF0MlYtfxnFUPN4GE488PP5ExD6w>
 <xmx:SLchYIwQWY92YZWr181BFpLPtc5JdlRfC3e_KWtfCnzZU9NT2TxWbw>
 <xmx:SLchYDK6BtL5WHyoTm_EfA7-qnB9KzbgswEMjvg6AtKADZDqiKlYHg>
 <xmx:SLchYHFzjeUzO4zHl_AwtKarzHau7XdJI-lQDUZYbhPfPQiBCXthOw>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6611B1080064;
 Mon,  8 Feb 2021 17:12:24 -0500 (EST)
Date: Mon, 8 Feb 2021 17:12:22 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Thang Q. Nguyen" <thang@os.amperecomputing.com>
Subject: Re: create meta-ampere folder in openbmc repo
Message-ID: <20210208221222.42tgcozztspf3mru@thinkpad.fuzziesquirrel.com>
References: <d5302c4f-c0c4-0bde-2a60-e943a2f41788@os.amperecomputing.com>
 <0e2507bc-f8c5-85c4-cd39-4c603a729f4c@os.amperecomputing.com>
 <da62c090-c6a0-1844-cc2b-44846b83c89d@os.amperecomputing.com>
 <3eff5596ee50878be8623c021816977f42111ea4.camel@fuzziesquirrel.com>
 <96568613-294f-8a3b-9aa9-7918b5df2d9b@os.amperecomputing.com>
 <20210130161537.gj6jhwvsnwgdkofa@thinkpad.fuzziesquirrel.com>
 <94d1598b-0dbd-17ad-3326-c581d583cc41@os.amperecomputing.com>
 <20210201134803.ok4bt3hd5xcrirjo@thinkpad.fuzziesquirrel.com>
 <53126da0-c452-7c64-c3d4-735f38e518d3@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <53126da0-c452-7c64-c3d4-735f38e518d3@os.amperecomputing.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Lancelot.Kao@fii-usa.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Feb 06, 2021 at 11:42:54AM +0700, Thang Q. Nguyen wrote:
>Hi Brad,
>
>Sorry for asking for your help again. 

no problem.

>Currently, I just have +1 or +2 permission when submitting codes to 
>github.com/openbmc/openbmc/meta-ampere. I don't have permission for 
>Ok-To-Test and Code-Review-from-owners. Can you help check?

Is this the change?
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/40355

The submit button won't appear until the patch is verified. 

You should add yourself to ampere/ci-authorized to fix Ok-To-Test.

Please let me know if these suggestions don't resolve the problem.

thx - brad
