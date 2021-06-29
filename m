Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0703B6BE2
	for <lists+openbmc@lfdr.de>; Tue, 29 Jun 2021 02:59:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDR2Z1S4Qz3bTP
	for <lists+openbmc@lfdr.de>; Tue, 29 Jun 2021 10:59:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=HFQa1Guu;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=UbiiN4lS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=HFQa1Guu; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=UbiiN4lS; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDR2D2td2z30C4
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jun 2021 10:59:14 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id CEA735C0293;
 Mon, 28 Jun 2021 20:59:10 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute2.internal (MEProxy); Mon, 28 Jun 2021 20:59:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=KvihXOuDDIueI75G3MocQ+efFKEEsKV
 dyLphow6BCwc=; b=HFQa1GuuJqv43kqHqw5fIca1vAZU6uv/rfzRDX/douSxvnt
 g+widEw1Qlf3rIQXb+aR1azqbUeYDEpOh1Nnrp2IDNTmbOMMidYDO/eWzjEBD/XS
 iOZ8Sdfnf1ziwKJmoVrrSp67OI2CERtylfbIGyZ4AumdMjPQII/SwutzAINHITxf
 Y6UeNAUh6mfA7vQem7MkDefz1Y9c2LUm2+PlLWBhfEgUnm5NO+33hGuz9e7pSaNS
 KmTIfJQ7ASakET4GQmBYfvj9haaWZAznH4IyxrTNjxFEJdZwGa60V9x9q6DmkUTV
 c97GT0fKzsa2gdPlFiiLKrmmSIW9F1dS0zryWgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=KvihXO
 uDDIueI75G3MocQ+efFKEEsKVdyLphow6BCwc=; b=UbiiN4lSR9uRTnAzHsFXkO
 Qx3RZ462kYICqwYwcIvp1CJg3nvFcWw2PT0GFSeOiJys7ycYBYpI+Wuuw1foTeNR
 mnFfe5/F1Cu4D2nqn0YnboAjYfiGHnRzuSAzUlQomnBbVLAp+jmRfz3YvDspWTMS
 MoP/OX0gYqR1TL3rWcgPmn6AeA1FZVA6dtCDEj8Zl0DWKF2IPXuW26+qE1UWr0ga
 UllO3jMAO7vWqu1Nl/FWZ9iTsbQpMGnxXC7QnodXlW58V6hUwSdRO7+xwnGkGZab
 9u3tXjws0iYwUdfrZ6B7gaefC1nUBsJNOCHMrhNFk+aoIxWI1LbZd8FSAd7OMoGw
 ==
X-ME-Sender: <xms:XnDaYH_umwcvlcHgHCuiziHvkMc1XHdwtKVd_LrWVer_fMsPaL0KmQ>
 <xme:XnDaYDvCtJxk6DY5sFOnp9vMTheVaNikE8YoJd2oyVTFlMLAII82E71b4yrFBZZ2c
 ScJyyoScU6bQJwT4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehhedgfeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:XnDaYFANPE8T8BI_emQbwBZq_lLLF_24bfq-mNZH6nxa0pTyHJ-uyA>
 <xmx:XnDaYDf3Kpt3USOSeea6vdrsvH-ZQvN8_XL2r6YCvUM4sDhLOlP0bA>
 <xmx:XnDaYMNwXoCFHSILNB0Lf2grLLXeKcZ35rvIeA3yQpvLUbADTxvotQ>
 <xmx:XnDaYGWE30edArrGpwrr_NmuL369hs7Fu_wUSi1q4IBjdnjYNa1Q_Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1556BA0003D; Mon, 28 Jun 2021 20:59:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-530-gd0c265785f-fm-20210616.002-gd0c26578
Mime-Version: 1.0
Message-Id: <b6f0d522-01c3-4b8b-9273-ed2132d27b4f@www.fastmail.com>
In-Reply-To: <20210628205137.zrww6xxheukt3q2y@thinkpad.fuzziesquirrel.com>
References: <fb9071bf-f2ad-417b-b9a6-d0baeed67e06@www.fastmail.com>
 <20210601202613.7o3kplhw2z7mrdvw@thinkpad.fuzziesquirrel.com>
 <0f0408a1-45f4-9c10-59ad-ca9428260c79@linux.vnet.ibm.com>
 <20210628205137.zrww6xxheukt3q2y@thinkpad.fuzziesquirrel.com>
Date: Tue, 29 Jun 2021 10:28:49 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Bishop" <bradleyb@fuzziesquirrel.com>,
 "Bruce Mitchell" <bruce.mitchell@linux.vnet.ibm.com>
Subject: Re: Request for debug-trigger repository
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 29 Jun 2021, at 06:21, Brad Bishop wrote:
> On Tue, Jun 01, 2021 at 01:48:16PM -0700, Bruce Mitchell wrote:
> >Hi Brad,
> >
> >I think Andrew has is default branch as main, and it looks like you 
> >created a branch called master.  Do you want that changed to match 
> >what Andrew has done prior to him making any commits on it?
> 
> Hi Bruce.  Andrew is certainly free to do that at any time.  I sort of 
> want to encourage any repository maintainer to just go do this right now 
> but I don't understand what the impacts might be, if any.  My thinking 
> is that the next time I make a repository I'll just make 'main' the 
> default branch and we'll discover and work through any issues that 
> arise.
> 

Sounds good to me.
