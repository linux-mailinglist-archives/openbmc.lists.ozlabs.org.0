Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C91744943E0
	for <lists+openbmc@lfdr.de>; Thu, 20 Jan 2022 00:31:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfMN94V3vz30RD
	for <lists+openbmc@lfdr.de>; Thu, 20 Jan 2022 10:31:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=jF+jVGKy;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=oMzzRl5W;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=jF+jVGKy; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=oMzzRl5W; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JfMMl3781z2ynM
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jan 2022 10:30:59 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 3C1DC3201E3E;
 Wed, 19 Jan 2022 18:30:55 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute3.internal (MEProxy); Wed, 19 Jan 2022 18:30:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=Dp7rM1sYQJHamEK93u3o03G57/Ftvn0
 rsbtmv/MkR4Y=; b=jF+jVGKyiFdzu+qtO+SIiLDHIcLVQA0HDae7LXuwpzTE3QG
 4Ma+r4vRfBjMNsIoQw1CQQBBdrjq24RgALuChRg8yXUxGvfyUXbvZHobmOmVNcAk
 KU2NnRu2bvP9ZIbCe7YstPEqDHXYzOp9w8o76Mzt/6P1kjPzFsW1932Xxqsvl+Kb
 jMU83FbJ5KrHC5xh5GjbtW/PJPLPwN6H6/d5vEuEOlPbQdCSEhDY0YuGNy4B8Ocz
 cDp8dhS8bdD2SDOKyJMRoirPZhNUnWLCY74wA5y57xDIlowgLU+K4q58c2cGOvIc
 WxGPZuLnJGwe7qn5zMayMEY7OOwxpW7N1hjHkjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Dp7rM1
 sYQJHamEK93u3o03G57/Ftvn0rsbtmv/MkR4Y=; b=oMzzRl5WSxxmmiXFUmTwLF
 MyPYG8uIKrwuRoYt0WH4ZFgXuG5sbqV4I3l2m7laqYe2BYPzMcvat/vFybtyXR7m
 A//XYEq/4B4LQvQTwX1a/jsUJsdMSGMR4K8bClfgFTQdImBT3aWlorBR42HytUqF
 GyblG7tF3d5HiawNjgNmuSf6x8dHd1pj0k7Xkcgef1lUKEVB/BMT2HRDASZcj0zY
 j/WwsPQFGHMpBSADQiP+mYn6MDjgZW9h0DzoQB9PRmG2gY1IgMSp3LOeYTP7tEcO
 6yylmtK/LKsgoQ4nsNC5GUNnmpzwBTFtFKuOOn38hqvDFsLi07aQlLewtNS3+ujw
 ==
X-ME-Sender: <xms:Lp_oYSRr7AMMZLuwT3q05CQ-aRqfwyayEbmZg-pdYxyTw6R2pKE7Hw>
 <xme:Lp_oYXwSElnEW81-Mtky7SjW9U54vsxvgoZTNQ9fZNGkMSRfThdWf9b3ZYUzq9ZDe
 u-341NGOTI8PULFKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejgdduudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:Lp_oYf2e_bK13xCXrzOEtVY6-Hle7efo4yr-lneWo8BTbZj7FfPilA>
 <xmx:Lp_oYeBr805eR4AbYbRCWmxE3Np7QYENwr_7jaXhasjSG7EyUZYbKg>
 <xmx:Lp_oYbjyUz_sB42JcTyjQFGhCeC-0-0TjzbxP7K6V4A_b6eh2oQCFw>
 <xmx:Lp_oYdeYf9QV3h11gBFnsdOrLnx2XvrtFjWLC77TmIk7z5678D8JDA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5292FAC0E99; Wed, 19 Jan 2022 18:30:54 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4585-ga9d9773056-fm-20220113.001-ga9d97730
Mime-Version: 1.0
Message-Id: <61e076fe-d490-4034-933e-d821d9123001@www.fastmail.com>
In-Reply-To: <YeH5uCwUQ02RrGok@heinlein>
References: <YdiCUiwh1iD4ycr8@heinlein> <YeH2OHImO/oRgkjN@heinlein>
 <YeH5uCwUQ02RrGok@heinlein>
Date: Thu, 20 Jan 2022 10:00:32 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Williams" <patrick@stwcx.xyz>,
 "OpenBMC List" <openbmc@lists.ozlabs.org>
Subject: Re: TOF Nominations
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



On Sat, 15 Jan 2022, at 09:01, Patrick Williams wrote:
> On Fri, Jan 14, 2022 at 04:16:24PM -0600, Patrick Williams wrote:
>> On Fri, Jan 07, 2022 at 12:11:30PM -0600, Patrick Williams wrote:
> 
>> > * Jan 30th:	Nominations (self or peer) for TOF seats must be sent to the mailing
>> >             list.
>
> I'll be the first to nominate myself for participating in the TOF as my 
> current term is one of the 4 up for election.

I'm also nominating myself.

>
> I suspect most developers know me already.  I've been around the project since
> the beginning (other than a 2 year break where I didn't work on BMCs) and I'm
> a very active contributor, reviewer, and Discordian.

For the same reasons, sans the 2 year break :)

Andrew
