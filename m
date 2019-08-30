Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA27A2EA5
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 06:42:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KRfs6npJzDrFY
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 14:42:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="T5iMEn8q"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="UzqV8LMn"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KRf93cdwzDq7g
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 14:42:08 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C413821AEF;
 Fri, 30 Aug 2019 00:42:05 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Fri, 30 Aug 2019 00:42:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=SNCu5pUdCYms/2tCe1ETmFHLu9YMjDa
 W2nJLgI4uyrk=; b=T5iMEn8qZEjX86WrXMguqH28lBxkdc8tU2SSlQUbXUaXW7y
 0yTE1UjOaL0e73VyiBvZJlRG2qGlQnxt7CBGuNpQ+wr29ff+pXYYNhqct4r6FnGM
 lFc+Oth/5+FU81XMxjxsu9j65/M7fVosrCd+E3ggkT937tHSvGfhL5j6M1zeDhI5
 Pr/Mx421IZg/209lS68OQdA1y7DSZ9ooR0i1+m+KbVUU/dAFGJhG/HZ/kEJvWkRF
 7QzYvktY+bcxJY9OLWdggg3X46cjKYAmenBVSoUpqgNLua3Fe0bH7jVHSLWRIMwP
 NvwQtjaNxxpDQtmslfe2aHLKB6yXOqJFiFOdKQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=SNCu5p
 UdCYms/2tCe1ETmFHLu9YMjDaW2nJLgI4uyrk=; b=UzqV8LMnWb614+p+VZf0qo
 BrA9FrUejKCPGeYLB35BI19piXG1vgAQmGTidA7SpH7you4FN2L5ZPshHEA8lGK/
 Dico4FrAIM8U+jJgf3c4iQBmE2sL2pW8BdysByg1XkkOCQvYow7UO1vILHjUev0L
 lld5rFaqsiIiqA7aUC8N4YmrvurNDiVJWChRJulpH9XcSez1xsSkdJi8gOgr/ACf
 mkml8m+oNSSUBqiNXk65BrRpEFEC8fIvF8qvPZ8nkbORJQ3N+vtkYPonsV6lVddz
 FimZivVxJXtJFRkqVY8yE5+BVBsryQE3T53nHZzhG+DQFXQruo7d/aeDCGzoP0Hw
 ==
X-ME-Sender: <xms:HaloXZWToMpOv1ocQG3iHDStUYmCFtQt5RGxQgwlLdC8y_EjoipQTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudeifedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:HaloXXYRv9JnTxfeg81AirqFNUohi48r9PTwjHMDWQk4K6eh6B1o3Q>
 <xmx:HaloXWTytPKC25GYoTSQS3r8AupvjWxl8IzhC9hqYjhmwjg_Ei5gFQ>
 <xmx:HaloXXQT2Wtz4aB81IkBSRuOvyJwuHH1XKgqsEDLwZxVu3nJao85Ig>
 <xmx:HaloXbLZekMMVWmH8W7NUmRaASvxdekv8CJPGBhJpcGsgH-lQLYk1Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 77DADE00A3; Fri, 30 Aug 2019 00:42:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-154-gfa7592a-fmstable-20190829v1
Mime-Version: 1.0
Message-Id: <57995e3f-ef82-49b3-909a-054b5b9bef8e@www.fastmail.com>
In-Reply-To: <CAE33tLGxcBFHYzXQ7Uqdg03ZibvS4busoJT=iGTwLMb8TMD-2g@mail.gmail.com>
References: <CAE33tLGxcBFHYzXQ7Uqdg03ZibvS4busoJT=iGTwLMb8TMD-2g@mail.gmail.com>
Date: Fri, 30 Aug 2019 14:12:27 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "AKASH G J" <akashgj91@gmail.com>, openbmc@lists.ozlabs.org
Subject: Re: Enable KCS interface in zaius
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 29 Aug 2019, at 09:05, AKASH G J wrote:
> Hi all,
> 
> I am using server platform with Intel processor and Aspeed AST-2500 
> BMC. OpenBMC firmware with zaius configuration is used for BMC.
> 

Zaius is an OpenPOWER platform (and our OpenPOWER platforms use
the BT interface rather than KCS). You're using an Intel-based processor
for the host, so perhaps it's better to start with an x86-based platform
such as the s2600wf. This should already have KCS IPMI enabled for you.

Andrew
