Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4390F2C944A
	for <lists+openbmc@lfdr.de>; Tue,  1 Dec 2020 01:50:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClNmb1kNDzDr09
	for <lists+openbmc@lfdr.de>; Tue,  1 Dec 2020 11:50:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=D/BCekLn; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=o5lasho7; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClNjJ6QMbzDqkB
 for <openbmc@lists.ozlabs.org>; Tue,  1 Dec 2020 11:47:16 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 8E4B25C0064
 for <openbmc@lists.ozlabs.org>; Mon, 30 Nov 2020 19:47:13 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 30 Nov 2020 19:47:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=T2l4dEZmVY9C8I2WIKglZ9vy/xv9j6O
 sRv1LtQgPd6M=; b=D/BCekLnsWUaAXx0XpgdDv+21U8YuQGoZT0lg2LF3Uu7Uss
 8MrVSo4iFM3RzvM9MU6U6jtLD9vWJdgujpBxQdL+/NiayDwFL2VpySFqeMr0Qrfk
 P9irXWA2t1/lxbQdSpc290zyGluse7ZfDUeUaZyeD8D37n5rTWW9jsBTkx9IKyh3
 r5iLdLYsEu5dUJA89igF51nml4ibQCuCmdvgbg/52wAEhbs+EJeqk8YRGmNaDufL
 vF9EtpHkQtK52WVZhtDz5dMFuZUQz6tfmGdmn88Sox3NHToNsLDug5ugTlAr5Omb
 apoBnY1tpzaUf7aWoTcZo585c2TNmYb7LA9RAFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=T2l4dE
 ZmVY9C8I2WIKglZ9vy/xv9j6OsRv1LtQgPd6M=; b=o5lasho78UhhzCIaoP2bZH
 08cyywhTM5BZwTjFFSlc4iDG/FA8HBjLtn6VT3KmO7CPochSKZ7/rue0coXg2K0P
 0bcXnnvmXoxyQ63llegLJ8Rd27M4qVDVCPEyCptnTg5voLXzzdIK9iuw3c0cj+CB
 8IgYkWaCZUtmy+mu761UQOhsuLx4Bm2FOglmbsvAJPlh+c9uQYF3hHnDf9fNvZJl
 i1vIS/a8msLKDYkroHX+ffF0iO6jeZKtuYee/F5RwmpCNzVr4NXQdsbvRIjsOcai
 oPGr2eLzpX7dB+AgCkRRnc919NnSXxLoHqr6+i8TupJN4BdfkHXRyH7VVWL3VXsQ
 ==
X-ME-Sender: <xms:kZLFXzeW8lHpGIZb4swmcPmFON6r3Rnps7ZNA2oqUOLLjukqYPknfA>
 <xme:kZLFX5N76UvoBrGWy2yaAMpm5xfAMT-CcE9BjqV4Mb9GRmCmwUU2cvD7-qE_cxcX1
 dc97Gjm2wAeo_DgYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeiuddgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
 ertderredtnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
 fiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeehhfefkefgkeduveehffehie
 ehudejfeejveejfedugfefuedtuedvhefhveeuffenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:kZLFX8gHVHQLHcGoDDYkgudpxhcPQg442aPnoKlifejKOwCjZrOy7Q>
 <xmx:kZLFX09sCOjMDiwPkgq2M43mfwMOppdMM8UzRvt2jRi2R237uyqsQw>
 <xmx:kZLFX_vb_PMl7Y-JaJFwyO9TW6bmmP2j_e4AWnbrx2Q9gOsJ2yCD6A>
 <xmx:kZLFX97w1KaDJfGO_QUlHVSO6Hpy7cQNTrCs28FdDODFkCGjlCI-bQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 46FC0E00A6; Mon, 30 Nov 2020 19:47:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-622-g4a97c0b-fm-20201115.001-g4a97c0b3
Mime-Version: 1.0
Message-Id: <e9389df6-f4f5-4594-a803-b3b7598fb21e@www.fastmail.com>
In-Reply-To: <eaec79dfa2bc4d65acd2fdb8c93b02f9@SCL-EXCHMB-13.phoenix.com>
References: <f659f8a48f24404fbc5dda747000865d@SCL-EXCHMB-13.phoenix.com>
 <6cc50da92b76ff7fbda5f43651bb32f6ff7b0c9e.camel@yadro.com>
 <eaec79dfa2bc4d65acd2fdb8c93b02f9@SCL-EXCHMB-13.phoenix.com>
Date: Tue, 01 Dec 2020 11:16:52 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: Re: Unresponsive BMC after booting into Ubuntu
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



On Tue, 24 Nov 2020, at 18:05, Patrick Voelker wrote:
> Hm.  Sounds like a different issue. I don't think this solution will 
> help me since I can't access the serial console.

I'm not Andrei, but my understanding was that he wasn't suggesting you try to 
apply the change after the lockup occurred, but rather before. And then if you 
don't see lockups with the change applied, then it might be the same problem.
It wasn't about recovering the BMC from the lockup context.

But yeah, hopefully I'm not adding to the confusion here!

Andrew
