Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FB529FCFB
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 06:16:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMrBV4n3TzDqs3
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 16:16:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=XON1D34I; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=qc/iRqow; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMr9g6cmZzDqcw
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2020 16:15:33 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 7A1C95C0151;
 Fri, 30 Oct 2020 01:15:29 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 30 Oct 2020 01:15:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=3lUVg0bcYIE9MTiO0zVTOtrAIT5wgFm
 RUJesgtYdlPk=; b=XON1D34I3/lXZNZbsJGhiqAa8HsrSVdCOzVHC2SegZ7L6y7
 X4QT8KS1fVXTIQHgAWLzc+V2c8QUbnGL9nfPRPmsEEEqfwcl+OHmsryRBzMGWaAn
 /xmMf/0eriXYHh9H6V7V6itNuymvSfBdcOyw9ZuvPoMy3jK2ZNdutoFcy7Gv5Afo
 nZgZ4lhdd5S8u/yBxLbkLyzBL0juDwsia+41Kxh21bV/7SNkrO9JGo1SGcgyEE7G
 bFWpAntQzrqypk3nhtjKpTuB6w0e89fA/LdgMMfe6FQW+8I1Jaf8PxVqHKiDS9oe
 Eh6hUXbbMAQ14FrXU46c+ag8Oj3YyaPr9Aprz5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=3lUVg0
 bcYIE9MTiO0zVTOtrAIT5wgFmRUJesgtYdlPk=; b=qc/iRqowIiAnRHsjPVKQUp
 B/BBkgbj2CbGli2R5EHn8Zhzev4cSGNa9L+Ud/XkWRfe/vDfzo+1wLiMvrsVK+0D
 BpWbrCm3RVYM1AsGy40jSyaiWoIaup2crJIU+u418wNbe69VQAXy6j6MvhzOGe56
 nZC1DhFsKB64YAtVP9nUbj/QcKPT92fMb0O00iS9xQE2/4zrBqPmUcj+AVGym5s0
 IeiLe3yxpjDAirR5EvlmzEBtX0vRnuwVyqw6i/nrrSWldN6Q6v+1UrrYhJG0QEPG
 kF5mF+5zHZoStdN+jNvrBfw/LU8zk4NYxV6Unned6Ngc3+E22c0sEzuP1IOLw6AA
 ==
X-ME-Sender: <xms:cKGbX7rRlm5pqyNugR1XdjN5XvHps_KATMkLpaKaOtZ1ZLf_RQVF1Q>
 <xme:cKGbX1qEEoIvjXvr5J44CZ4Y4xZnTYPSoP20nBRPXuNLUodsth6LiPbpxZXto4K1-
 LZpMDQEiGV7l3V5Mw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleeggdejlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:cKGbX4OOIwvLjwBKe_gx2S02ASxAI-JNCSigXxCw3eclOzbtVhqU6w>
 <xmx:cKGbX-7L1O-ByP_xve7K-ysfvAR4MjmtQZPiTe-hU2wVtjxvEc0Mjg>
 <xmx:cKGbX65sfuynJ6dEmLUhRSWsyR6o4JzmysFjvYd00AxKcVZQEZdvvg>
 <xmx:caGbX_jYVKOfXtf3Xm3RkGcECk83mtkLKIWznd0dABthbiZN-oLrmA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E3617E00B8; Fri, 30 Oct 2020 01:15:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-530-g8da6958-fm-20201021.003-g69105b13-v35
Mime-Version: 1.0
Message-Id: <4e6a40c2-a059-4928-8ccf-db060d6600b2@www.fastmail.com>
In-Reply-To: <CACWQX836VGj9JOB+h75cODoti9+0mGeMioQbdiTwmVG_8ydFcw@mail.gmail.com>
References: <AT5PR8401MB06263771D26D0EE53D41A5818F720@AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM>
 <CACWQX836VGj9JOB+h75cODoti9+0mGeMioQbdiTwmVG_8ydFcw@mail.gmail.com>
Date: Fri, 30 Oct 2020 15:45:07 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ed Tanous" <ed@tanous.net>,
 "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>
Subject: Re: 2.9 planning/progress docs?
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 28 Jul 2020, at 01:22, Ed Tanous wrote:
> On Mon, Jul 27, 2020 at 8:22 AM Garrett, Mike (HPE Server Firmware)
> <mike.garrett@hpe.com> wrote:
> > We have some patches for dbus-sensors specific to our platforms that are frequently being invalidated by updates upstream, and instead of constantly regenerating our patches, it would be nice to know when the upstream has accomplished its goals for 2.9 and we can regenerate our patches once.  We are still getting acquainted with the processes here.
> >
> 
> The best answer here is to get your patches into review and onto
> master, then you shouldn't ever need to regenerate your downstream
> patches again.  Pushing a gerrit review is significantly less effort
> than even a single rebase, and you might gain some valuable insight
> from the maintainer doing so.  I understand the realities of that in
> the corporate world are not ideal, and sometimes you have technical
> conflicts that are hard to resolve, but at the very least if patches
> are "unmergeable" but in review, the maintainer can take this into
> consideration when other patches are merged, and possibly point out
> breaks.

Very late to the party here, but 100% on the above. As a maintainer I'm not 
really prepared to cater to code I can't see - taking the time to push your 
work to gerrit will get my attention, and:

1. Help me appreciate your use-cases
2. Help you reduce your maintenance burden, and
3. Help others who might share your use-cases.

It's always possible that others will pick your patches up and get them merged 
for you.

Andrew
