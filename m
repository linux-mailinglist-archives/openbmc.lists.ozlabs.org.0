Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B61136E1A0
	for <lists+openbmc@lfdr.de>; Thu, 29 Apr 2021 00:44:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVtwK0Vhcz2xg6
	for <lists+openbmc@lfdr.de>; Thu, 29 Apr 2021 08:44:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=RDb+MEXF;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ogARXKC3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=RDb+MEXF; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ogARXKC3; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVtw46GwXz2xZR
 for <openbmc@lists.ozlabs.org>; Thu, 29 Apr 2021 08:43:48 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 0A6855C00E8
 for <openbmc@lists.ozlabs.org>; Wed, 28 Apr 2021 18:43:46 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 28 Apr 2021 18:43:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=+/vyfVjWrZLageWCV5m7aEC+l5TJ24s
 n4KNIwJ3QUeE=; b=RDb+MEXFT/4hvHfj2HitBAFbSsGeuZinbcjShUfbczXgRzu
 NgNg2cVZ2hADq0BHj2XcuBGr8HyHxfpx6M3sDKgDQ86SceacXV15WD1zkBOczMMc
 k8XoUI3BXG55OzFXG4nbzMojurJV7UhbMpd9T6crtDv6dPvbiihE2WR3DZBAM9l/
 lf5xcFLp2dJEAQaF3Cfu79jiS6Sn3jH0HYWxoctMxbhrqePeR8jZ4gJXqAQq1iL+
 llfhqgGXNlf1XsehokXHfD8GtAj3pDzVjFGtvv3nXKt2L0rqOE/h+rwhRarq7vC7
 /GMbDPREhWB6fwEjDpf73EZPzpFNglyHjj5DRIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+/vyfV
 jWrZLageWCV5m7aEC+l5TJ24sn4KNIwJ3QUeE=; b=ogARXKC3CA8p34+EHbZ6yO
 RsEexPd8rmDBrat1jtabLSX/25BH3b74Fvm74k9vt/o+TRnxoz1v/RoRX4nZCmzA
 L5gv+5/mWJ56IrneCDnY+QnKi2s9WyRQEHYtKzjc8Mm5CazAmUAiE3ATQBYo0mpG
 Q6DHbOvWKDSr51xxvzj4l2GJJVEw9Z+13k5xm+LslQsjDwVZBr928myV/f1moru7
 ZAyUyVfFkKUXPimBbDdi0L8AcfLHorAl1gY5yXNm/UQ0ajJaNaagOiL5N5S2mcM4
 VQZ6Q/M9JzVi2bxt5ENuq2Ky6kkKEeLt98TxZOjMq21o2o+V2fIo1yJO1hUpCVlQ
 ==
X-ME-Sender: <xms:IeWJYBgB3yZm0t0cGHjL_JlE3BEmwKB5xc7dB7Wu2bz-Ih7YsWfMIw>
 <xme:IeWJYGAjBQIxRuhrpJtrFAPlxnoNfyDORYUi6viM5aa0AhKzrndKy0zDXaKXE-Em6
 f2AmZakQPPjf8TQ9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvfedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgoufhushhpvggtthffohhmrghinhculdegledmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepffevtdetleelvedvgfekueevueehffekfffgudelhefgudduveejgfek
 ueduffefnecuffhomhgrihhnpehgohhoghhlvgdrtghomhenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:IeWJYBGo2E2b6n9wsPhFVLz3ynPh1i6zWmkFMb0Tp3tpwdexdXnV1Q>
 <xmx:IeWJYGRBzr7EVDAjCc55yZykZ96No8kbzmoefhNWjVZ-lcjr27RiYA>
 <xmx:IeWJYOxzBcmqKEl9oFxckis_1rPQUpK5VAQL-oroRFRR1WJLlf0WaQ>
 <xmx:IuWJYN92NSE17QKKfU4YlTyHAoEaqMBQJt-MwVXufV8-V5oX6qE_2A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 43381A0007A; Wed, 28 Apr 2021 18:43:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-403-gbc3c488b23-fm-20210419.005-gbc3c488b
Mime-Version: 1.0
Message-Id: <deebe338-fd6c-442a-a965-b51614a0d971@beta.fastmail.com>
In-Reply-To: <314a9521-c6f1-0951-15ea-2556ebcd5cbb@linux.vnet.ibm.com>
References: <965c9157-c64b-6594-fbdf-bd2a44c795a1@linux.ibm.com>
 <41c03072-6e30-a9bd-be1a-d74dafd9c3e1@linux.ibm.com>
 <abd0e8ef-3a1b-4f9a-851a-0663f02977ed@www.fastmail.com>
 <6a444a52-0123-e81c-fcb1-3748b4692547@linux.vnet.ibm.com>
 <63563e1e-446f-4ad6-a104-728bdaa20577@beta.fastmail.com>
 <314a9521-c6f1-0951-15ea-2556ebcd5cbb@linux.vnet.ibm.com>
Date: Thu, 29 Apr 2021 08:13:22 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: Re: Security Working Group - Wednesday April 28 - results
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



On Thu, 29 Apr 2021, at 08:04, Bruce Mitchell wrote:
> On 4/28/2021 15:28, Andrew Jeffery wrote:
> > 
> > 
> > On Thu, 29 Apr 2021, at 07:55, Bruce Mitchell wrote:
> >> On 4/28/2021 15:20, Andrew Jeffery wrote:
> >>>
> >>>
> >>> On Thu, 29 Apr 2021, at 07:01, Joseph Reynolds wrote:
> >>>> On 4/27/21 4:48 PM, Joseph Reynolds wrote:
> >>>>> This is a reminder of the OpenBMC Security Working Group meeting
> >>>>> scheduled for this Wednesday April 28 at 10:00am PDT.
> >>>>>
> >>>>> We'll discuss the following items on the agenda
> >>>>> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>,
> >>>>> and anything else that comes up:
> >>>>>
> >>>>> 1. passwordless sudo access to members of the wheel group
> >>>> This customization does not match the common OpenBMC use cases.
> >>>> Abandoning this commit.
> >>>>
> >>>> Bonus topics:
> >>>>
> >>>> 2. Intel Hack-a-Thon 2021 results are coming soon.
> >>>
> >>> What does this mean?
> >>>
> >>
> >> I believe Intel is trying publishing the results of
> >> their "Intel (security) Hack-a-Thon 2021" by the end
> >> of next week.
> >>
> > 
> > Okay, but what does that mean? Are they pushing patches? Announcing CVEs? Opening bugs?
> > 
> > What can we expect?
> > 
> 
> OpenBMC Security Working Group Meeting Notes and Agenda are here:
> https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit#heading=h.8bihrhc0925u

Okay, so:

> 2 Intel HaT2021 results are being reviewed 
> internally and are planned to be sent to the 
> OpenBMC security response team.

So nothing is being made public yet it seems?
