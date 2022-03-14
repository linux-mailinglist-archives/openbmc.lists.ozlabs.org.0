Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCE64D8624
	for <lists+openbmc@lfdr.de>; Mon, 14 Mar 2022 14:42:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHHlF64kSz30Ml
	for <lists+openbmc@lfdr.de>; Tue, 15 Mar 2022 00:42:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=R6YE2Tzp;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=fJfcn2qD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=R6YE2Tzp; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=fJfcn2qD; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHHkn0RSgz2xrc
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2022 00:41:36 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 7F3D25C0158;
 Mon, 14 Mar 2022 09:41:33 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
 by compute5.internal (MEProxy); Mon, 14 Mar 2022 09:41:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=0XQ4WBGUJO+h9i
 1TCKkqcE0YqsEqWK9ayXVbwCmHvcM=; b=R6YE2TzpiOaAqRoUZPmdH62knS60Mx
 ZZyHZjzBfGJAVaLblr38oaOAwICrDaWtW707skMcTMkRGF5jCG76LJE6/HZsq8Oj
 /GtV7136Pe2iM6Nu1uymsqMJFSWbh3mKTCi4Qw3nZyq+l2c9/BZKd4bXtBd9A/RF
 L1j3A2gFO7UEO8HBwzJh4qXD0zwvdaydOjN5o3qp0ExHlcjcJUsdcdOmjOGdbSrm
 3YIpIEnblrqHGrFT7X5/Dmgs4aFAr1SwspdWMRI2JF2KDwF2W2bmWXGbHBgcYmMM
 juDXsTPpuFBXYph207toePM18iOGekMVxVNf9XaZeMk397FtPTvxjusA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=0XQ4WBGUJO+h9i1TC
 KkqcE0YqsEqWK9ayXVbwCmHvcM=; b=fJfcn2qD5ZNTXnWMNfDZikeGXrWQBbXp6
 9ptuhhMi/Q23PsjVPa2EQXVON+yQMDEg21USsAnZrdqXbMY0p9q1W99qKNUqaJ7j
 QmFGSjpD3ONjc9u0KOWrvAD0oiVvXke2jBk6Ju5VWohYu5cYL44C9V6IsZ9lScUl
 1Vuvn0MiBz1u+MPZnDveLEJN1cq4WALda9E29TcehSLxVGTIelq6lk4OVN25kzd3
 NSzXdJuGE7VPNsBL0FeCzj23D57lWnPiazIvJi1772Lxk5mwwdwyjta7fB8HQ6wa
 WMs/zLaPtBOu5ufvoiDyR20kqluz3sv7absV59TPZ9Xk/s2jn2ytw==
X-ME-Sender: <xms:DEYvYi3UGDg0m-B61t5Rc9ue7n6NfSicQ2NFb1Mqupe_nYpbSHFQ9A>
 <xme:DEYvYlHhpBhZSYV-MeyQ_cCjvaCgOnYMg_a-nWVVPaH7nWemNuKD2wKSl6wNfkuhg
 XL1Vwl5YdLGM0RNZkk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddvkedgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpefofg
 ggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfuehrrgguuceuihhshhho
 phdfuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomheqnecugg
 ftrfgrthhtvghrnhepfeeileetgfejgeekffekueejffeiteefteelveekudfhjeehffeh
 jeelheelgfehnecuffhomhgrihhnpehophgvnhgsmhgtqdhprhhojhgvtghtrdighiiine
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggu
 lhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:DUYvYq4Nr4zYwR_8dotS-nkcB7XgCVt00rv07ad3X3L-VEaClNG5Ng>
 <xmx:DUYvYj2THvJeMZlQ7cbE8_k0qIbuwYTCPhcLwiBwWmpvLNNOGhfBng>
 <xmx:DUYvYlFDzW1oMSLIYGnNGy_XelDCDKJf2TS5WPIGlDqgruMaNck5Cg>
 <xmx:DUYvYlB8vaYknqpnvV1VrubVJNPCyG9Xcxgv2D4xw2qf9ojLDnM4Sw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D95A627400FA; Mon, 14 Mar 2022 09:41:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4778-g14fba9972e-fm-20220217.001-g14fba997
Mime-Version: 1.0
Message-Id: <207053ab-6c0d-4f26-9e75-178586c90804@www.fastmail.com>
In-Reply-To: <77316d044b8c415fb07e751662869f30@wistron.com>
References: <916794d657af450baccf0122cca5ea73@wistron.com>
 <9f9e145363cd4022ab7e5f72d12d77d1@wistron.com>
 <77316d044b8c415fb07e751662869f30@wistron.com>
Date: Mon, 14 Mar 2022 09:40:51 -0400
From: "Brad Bishop" <bradleyb@fuzziesquirrel.com>
To: Bob_King@wistron.com, openbmc@lists.ozlabs.org
Subject: Re: Openbmc commit question.
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
Cc: Jet_JC_Lee@wistron.com, geissonator@yahoo.com, Claire_Ku@wistron.com,
 Lulu_Su@wistron.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Bob

On Tue, Mar 8, 2022, at 3:40 AM, Bob_King@wistron.com wrote:
> Hi Brad,
>  
> We have a problem that the members in OWNERS list can not +2 and merge.
> Could you help for this?
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/49786

I sent OpenBMC GitHub organization invites to you and Jet.  After accepting it you should be able to give +2 and click the submit button. I can invite the others in the OWNERS file but I need their GitHub account usernames.

Thanks,
Brad
