Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C07D24A7ED6
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 06:06:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jq6893Ccdz3bcK
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 16:06:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=J7aagVqH;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=oteBBRhI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=J7aagVqH; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=oteBBRhI; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jq67h1PWwz30hh
 for <openbmc@lists.ozlabs.org>; Thu,  3 Feb 2022 16:05:51 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 2AA4532023CC;
 Thu,  3 Feb 2022 00:05:47 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute3.internal (MEProxy); Thu, 03 Feb 2022 00:05:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=MVGjWeyFEvMc+loqSHC+tUzlIpNShDldaLFRRS
 Mvbno=; b=J7aagVqHghmy7FHL4r8TQYC6DS/tg9A8VDfo4rJYqvhlCu8Dwsy08F
 5JOklYNQGBMoi4xvq+RM1Wme/8oB9JRLa8utEhPWjY3vqCQ7CgjDlEEDE56h0rpH
 kdBt+4E/IwUP1WA2P+1PQ5UjgycXRb/sfDCdCEbI7louvh+5ulEiWjYP88xMx//Y
 g7hfRC+TusmVfIVziS0cQf5DD7iKqc6Nsfg2Zsp3O4wXLXgC5JF2pnFNIAUZCT+P
 tetGuO5RLN6/m6OvlBSMCG1h9Bxckn25qb8LBqIwcr6LlN4KDjDiD/GsNQD7LOBa
 dlXu3IECPvpaohI9brPpxsP9Ljs3XjlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=MVGjWeyFEvMc+loqS
 HC+tUzlIpNShDldaLFRRSMvbno=; b=oteBBRhIg0r6AK8oAVKkEekCX8cEP2i18
 sGnO/LtnkpLO2ADUCSZzln+UdFGsu+lDWBbjr9SPCNVEEN6BUeV76KYq5vy3njHs
 GW+GJflu292q/e6lsvxyYtMTscjDZaLfmvYtwPur5mUsnlR5mOPA35e0catKFcjn
 POCgTJ7JbhxWdjNkmJTs3oi4DCFMKGvYB61QxmA7+ar5+EP4wyY89/o593XgEMyV
 Hxq9hQ4I12GYJy1GLM96WEH80w/S3nP7l1hNXFyESWNFrycn1V1ioCuyKxBWKWPN
 HW1rD939aJvJAU0XRc9J8lcTAw35AgOMZJAg0IIjp0VbBmPWHCvJw==
X-ME-Sender: <xms:qmL7YZb_HSSJj8NECfqVTwLb7JgfYKZKXQnAHCMTJNPLPWV_QJWCJA>
 <xme:qmL7YQazpE5YAMeU-bWFR9iUAnWRPqcoQhzlIBo8suhAeCJ3pmWfSdU-PCV-q2qa6
 sb24iho9J0tKPrZaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeeigdejkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:qmL7Yb_136monVbMmTroi9ROi6-wK1dkaRfitNpbjDooMFM40U4_oA>
 <xmx:qmL7YXqoHP7Af7I1IvPhUe9ydi9VHOtfqUGUHhDhquOdSfkKU05g1g>
 <xmx:qmL7YUocTUo2vO9WOo_k3CZn3F-fYsZRsmlnboiF1UfVT9DZamnysw>
 <xmx:qmL7YRCJTsk_-trJaY6BHl4GymnP7ABrntic0ysDk8JqrrFkMrT8IA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 096F3AC0E99; Thu,  3 Feb 2022 00:05:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4585-ga9d9773056-fm-20220113.001-ga9d97730
Mime-Version: 1.0
Message-Id: <7d64f6f1-6fb0-4eae-8610-1e15b6e39827@www.fastmail.com>
In-Reply-To: <c5034623-a22e-47f9-b997-9e22cd00118e@www.fastmail.com>
References: <5516f17c-5fb4-875f-fae1-00d86923bdae@linux.ibm.com>
 <de58b515-0f0b-4e49-4955-f9144896d313@linux.ibm.com>
 <c5034623-a22e-47f9-b997-9e22cd00118e@www.fastmail.com>
Date: Thu, 03 Feb 2022 15:35:25 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joseph Reynolds" <jrey@linux.ibm.com>, openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Security Working Group meeting - Wednesday February 2
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
Cc: Christopher J Engel <cjengel@us.ibm.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 3 Feb 2022, at 10:01, Andrew Jeffery wrote:
>
> SOCSEC_SIGN_ENABLE: command not found

I did say something else here but it got eaten by my awful 
line-wrapping strategy :(

I think it was pointing out that you just need to set

SOCSEC_SIGN_ENABLE = "1"

to enable SPL signing.

Andrew
