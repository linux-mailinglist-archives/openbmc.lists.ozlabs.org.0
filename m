Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C92BF3732DF
	for <lists+openbmc@lfdr.de>; Wed,  5 May 2021 01:39:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZbs961bhz301N
	for <lists+openbmc@lfdr.de>; Wed,  5 May 2021 09:39:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=oc9AUNWe;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Qi6gSTCu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=oc9AUNWe; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Qi6gSTCu; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZbrq6nxgz2xgJ
 for <openbmc@lists.ozlabs.org>; Wed,  5 May 2021 09:38:51 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 4B99F5C002F;
 Tue,  4 May 2021 19:38:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 04 May 2021 19:38:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm2; bh=7jR
 /Tz9mTO+4DbBx4phrmPk78NBI8VDwlZ9Z5VECyzE=; b=oc9AUNWeKbXZGU0x4PC
 Pt6dL528jL+nlggDO5rqeX6UCvXiS8+Arfpi4KRIS0/R0+l/uecjn4CfkXPZ6nKf
 bf1XZE2frmlLbpsR4KHO5QcgLb4VUl6sM2wjQMKUgZk3FTEVnhCpaIMEUqPihrJO
 wFx9Rn1P77pqsz0nh0S3cUjouB1CuCc4xphKEV/XmqsyYROlvpYIH+QT75eQlrwZ
 BFQ62y0IKPqAtlE4Lo7n6/ByLjqstUDD6KC/n+RwAhTVypGR/zLLKx/gO0NixcX9
 QgH3U5a81QVN3zqgLxaNOuoefKadQYHTdo4RLkp1Iyl5AVUCRYGLegnAOEzf8nWA
 vag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=7jR/Tz
 9mTO+4DbBx4phrmPk78NBI8VDwlZ9Z5VECyzE=; b=Qi6gSTCuzoqNlVB8RlvtU4
 V286M01YBNMtfNkrzMOJpx7oKdLYz8fmWJOkrX+0z2+mYTlPdi4ySFCgHj8H6Zx0
 3DkkV2f7RyAN5/pw3dsI9lzzSIeAIPyTxGSG69+9M+ibGyDnyIh4Dtb6L22eqf/A
 e6MI93i3PaAkZGKcl+82nQiJJp0RCzsDrVUSRs8yZ9qGUHLkwuBlTR+78OpRp1pt
 7zfjN+EgG42Ew3FmugUTf3uzfcaBPMk3mtwonlm61wtBrLFrTzAi+l3aab/NrtsA
 z6TuMwqBK7B2vvtuPNnxjW4OhBf1BANRQBVv2NR9XHJ2k4dAlwJ68bvHqp65xI6Q
 ==
X-ME-Sender: <xms:BduRYCI0c1brHpicQQJt15xVH6LePFOnSISuEAy_v32BMHnHdJ3I1w>
 <xme:BduRYKLaMSP-01rvPGQIYXC81Z8pLJ569Cm6dQNoftwzOnGxWAM3pwaEtkfG0QSfh
 fiQZO1jW5bE2ZRCjLY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefjedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepfeffhfefheeguddtvddtueeihfduieefkeefieefkeef
 udefueevudelgfekffefnecukfhppedujeefrdduieejrdefuddrudeljeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsges
 fhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:BduRYCv7X8ew7cepfjxHj22R549eVVHJUiyrlQMo6BqZggSOB-Ztgg>
 <xmx:BduRYHb_DTrRxXPn6d03BFVGFm3vEakwsSitm3a7pXpqlciaaRBxlQ>
 <xmx:BduRYJaNhVzYjKgCoUwK9gRn0b6ME1OOolLjpVgilQF-MP2vX8WCFQ>
 <xmx:BtuRYKAy43rZj2YAPLCVdf-qHA6x-yefnv2hzCmThboe86hGmGWteg>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue,  4 May 2021 19:38:45 -0400 (EDT)
Date: Tue, 4 May 2021 19:38:43 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ed Tanous <ed@tanous.net>
Subject: Re: D-bus model proposal for pay for access features
Message-ID: <20210504233843.hvuvmebaznanqnlv@thinkpad.fuzziesquirrel.com>
References: <CAMhqiMoFAHcUk0nO_xoOubcZqF_dPDFweqsttTULRJK38o1Ung@mail.gmail.com>
 <CACWQX83=CG_H8YUvEYj4BpDWFPoYkVLdpxo6n9V5LneTeeM7Bw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACWQX83=CG_H8YUvEYj4BpDWFPoYkVLdpxo6n9V5LneTeeM7Bw@mail.gmail.com>
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
Cc: Ratan Gupta <ratankgupta31@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, May 04, 2021 at 10:02:19AM -0700, Ed Tanous wrote:
>> Content-Type: text/html; charset="UTF-8"
>
>First of all, please avoid sending html emails if you can. They don't
>render properly on everyone's workflows.

+1

>
>On Fri, Apr 30, 2021 at 11:15 AM Ratan Gupta <ratankgupta31@gmail.com> wrote:
>>
>> Hi All,
>>
>> I would like to introduce a dbus model proposal around pay for access features.Normally IBM system ships with more hardware than was purchased, which can be unlocked later.
>
>It would be great to get a lot more background here.  
I will try to provide that here and in follow up discussion.

>On its nose,
>this seems like this polar opposite of open firmware 
You certainly aren't alone having this kind of a reaction to ideas like 
this and I can understand that point of view.  More on this below...

>and something
>that, if done wrong, could be very harmful to the goals of the
>project.
Can you elaborate on the goals of the project that would be harmed?

> Assuming you did this, wouldn't anyone be able to simply
>recompile the code with the license checks disabled, load it on the
>system
In our system design, the BMC is not doing the actual license 
verification.  It is only a proxy, providing an interface to a user 
interface application.

Further, we don't allow BMC code to be loaded that isn't signed by IBM, 
so unless I'm really missing something I don't think this can happen 
even, if the validation was being done on the BMC.

> and enable whatever they want without licenses?  That seems
>like something you didn't intend, and something that's less likely on
>closed source firmware, but probably needs considered in this design.
>
>As-is, I'm not sure which side of the line I come down on, but my two
>initial thoughts are:
>1. I don't want to support it or help the code in any way, but IBM can
>check this into their own specific interfaces.
We are happy to do this for now if that is the will of the community.  
The impetus is certainly on me to show that this is in fact a feature 
that server OEMs care about (if any of you are lurking, please jump in).

I'm pretty certain this is something many server OEMs do and will 
continue to do.  So let me ask you what is better?  A single place for 
those with the common use case to collaborate, or a bunch of one-offs, 
likely full of bugs and security problems.

>2. This is harmful to the intent of OpenBMC and open source firmware
>as a whole, and shouldn't be supported in any capacity in the OpenBMC
>codebase.
If you don't mind I would like to hear more about the intent of OpenBMC,
and how any of this harms those intents.

>
>I think a lot more background and details than what was provided in
>the initial email are needed before jumping to "what does the dbus
>interface look like" type discussions.
Happy to provide more background and details but I'm not sure where to 
begin.  Any hints?

>
>How would open firmware principals be retained 
Can you elaborate on these principles?  I'm curious.  I may even 
document the answers :-)

>if we're now supporting firmware locking down systems?
Don't we already lock down systems with things like secure or verified 
boot?  Can you help me understand lock down better?

>Are patches allowed to circumvent the license checks?
I think I covered this above but for completeness, on IBM systems the 
checks are not be done by the BMC and only IBM signed firmware is 
allowed.

>Does IBM intend to not allow loading self-compiled firmware on their
>systems to support this feature?
That's correct - IBM only allows firmware signed by IBM to be installed 
on IBM systems.

>What is and isn't allowed to be locked down?
Maybe another question is why would we disallow anything here?

>Can the license checks be entirely compiled out?
Again in an IBM design the checks aren't done on the BMC.  But if 
someone had a design like that, and they contributed that code to 
OpenBMC I don't see any problem with compiling it out.

>Do these licenses appear on any public interfaces?  
Right, the whole point is to show these on some kind of external 
interface.

>How do we ensure
>that the public interfaces aren't misused?  
How do we ensure _any_ public interface isn't misused?  Why would 
ensuring that they aren't misued for these public interfaces be any 
different than any other?  I don't think I understand this question.

>How do we keep standards
>compliance (or do we not care)?
This is something that many server OEMs do so I would not be terribly 
suprised to see it find its way into a standard management interface 
someday.

>How does this affect our standing in things like OCP open system
>firmware groups?  
I wouldn't expect this to affect our standing in OCP in any way.

>Does this OpenBMC systems that enable this feature
>ineligible?
Do you mean to ask, do systems that configure OpenBMC with something 
like this enabled make them ineligible for some kind of OCP compliance?  
Probably, but isn't that a problem for those configuring OpenBMC in that 
way?  I would say if you are looking for OCP compliance, don't use this 
feature.

thx - brad
