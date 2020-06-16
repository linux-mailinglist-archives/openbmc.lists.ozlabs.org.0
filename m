Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 741BA1FA54F
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 03:00:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49m8xj6VxSzDql2
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 11:00:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=XR15/x1W; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=LpTyR4Ml; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49m8wx0HGczDqTs
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jun 2020 10:59:28 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id C87B06D9;
 Mon, 15 Jun 2020 20:59:24 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 15 Jun 2020 20:59:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=2kvhOzOZedrMIvr1fJwQ5TAIDez8jjT
 /H/zR2WUuLHI=; b=XR15/x1WncsJhOa+A6dfdkmUtUpglT6IBgj41OWnklbfalM
 AA+BDZES2gH86cadxX7A3JfuOJsGRDkqDq4TtZcoLgcPMWXRgpPVQ/uJNb0GJDQ7
 H1yNtEPoK+b/LF+nuXkeqP25mBXxiv07svH0STr4s6I1UybC+TO7OX3ZYa42NhF2
 Su3JBRMRU628V02PcP/oJhDtcDLaRPhZCo6lbuuAMKVM84gu4DXWBeaE2LAY/B7W
 mQpLhMne/iSAam7PWYfWyv4/eUTwMyvBFP16xWovyPXQSfDRNnKiXCnQjVDO+kNQ
 8j8hCbbca/OqHLdzQSsYAJku1pBO6Xn6gJ0bWjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=2kvhOz
 OZedrMIvr1fJwQ5TAIDez8jjT/H/zR2WUuLHI=; b=LpTyR4MlITe1E4Mo/LbKNn
 //3tMSow0KN87lSl/Haqw0kh+n0C5rxKfQvIR/i2yXsIfe3AvhL+WisavqDIUACe
 z7OeQTZPbDNRNGjtySizmCorsI4oAvSg0xUbUIP/Wcu2BoFWrenjYjqOz5WHh6ER
 XL1MH9/gr7qg5cQzOS4zpOAttyEdwr8WgJlmAKi7+lH+rVnWJmGzLCGmkty4NZRe
 wz1X3gFguLCbJsBIvZBvuHH6gSq7qQMZ/bi9TLYaItuAoMBXsWW8LjP0tIa1IhYG
 o32HD739g21tTm/MFaI3WCLfNdPvHL3Ydw/oYsCdaaGYPpAbLQO2rZpyih6AegCw
 ==
X-ME-Sender: <xms:bBnoXtZrLd22nT439E4suMQO6iQsy4A4-v0eXSFO-0VVYvAindgRAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudeiledggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:bBnoXkZKd0C1IJ5lpFT421W7W4g8NWYjLvlmwHLJ-VcgQWaJPczwSw>
 <xmx:bBnoXv_bbcNMOIFgWuoVzBP-ZpochM_jl_gaBNNlrAQcH322GUX8QA>
 <xmx:bBnoXroxZR8C5g1KvDo_vjqM4h5vXe1hjnZaHlNoRdtuwvr5TCwOAQ>
 <xmx:bBnoXuE_ZAw4W58e2qdtEcJJcVCnFbG6aTDJ36kUn9MN0PFyKX6O6g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id EA2E8E00C6; Mon, 15 Jun 2020 20:59:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-529-g3ee424a-fm-20200611.001-g3ee424a1
Mime-Version: 1.0
Message-Id: <20011749-3b7d-4158-824b-ff88b09bea5d@www.fastmail.com>
In-Reply-To: <CAERBOQJJXu+4FikBD=G16eGeCOq712ZfyMSsV_EVuwg=h_pMWw@mail.gmail.com>
References: <BN8PR12MB32820451E47D3AE41B7401A8C79C0@BN8PR12MB3282.namprd12.prod.outlook.com>
 <CAERBOQJJXu+4FikBD=G16eGeCOq712ZfyMSsV_EVuwg=h_pMWw@mail.gmail.com>
Date: Tue, 16 Jun 2020 10:29:02 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "vasant patil" <vasantpatil2@gmail.com>,
 "Vasant Patil" <vasantp@nvidia.com>
Subject: Re: OpenBMC Redish support and Working Group meeting
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

Hi Vasant, welcome to the list.

On Tue, 16 Jun 2020, at 09:28, vasant patil wrote:
> On Mon, Jun 15, 2020, 6:50 PM Vasant Patil <vasantp@nvidia.com> wrote:
> 
> > _General Question: _____
> 
> >  * Are users allowed to attend the working group (like PMCI) meeting who have not yet signed the CCLA?____

IANAL, but I see participation in working groups as the same as participation in mailing list and IRC discussions: Without the [IC]CLA you can't submit changes and so can't expect to have a large influence, but nothing is preventing you from engaging both to help grow your understanding of the project and the project's understanding of your problem space.

I hope we see a CCLA in the future though!

Cheers,

Andrew
