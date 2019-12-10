Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB5F119F22
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 00:14:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XbVD22JJzDqd3
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 10:14:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="b8iWcOwb"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="WLwKsUb7"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XbTP435YzDqZX
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 10:13:28 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 50B6DE87;
 Tue, 10 Dec 2019 18:13:25 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 10 Dec 2019 18:13:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=rdmSnVUC5YBs87meErYRdhFx5Qx5CsE
 Q2+Ssj35rvJw=; b=b8iWcOwbJnsNKx2IJtUsyc+S6rWEx/0iAwzba7GYnuqoP+F
 Na1BxYznPLYJp73j5HUduSnb5gsYoMOVkOFlDYUH3dOI4KflAKyBBuHVj6QerhhI
 H15vFehxDlURtZYOUOUPT6n1qk8I9Hlx8H6aC2jivoAXmv+5K8U4IRGB+qVcSkm7
 iW8+AQRYGC/yBwNrz2zwOWD9kjOZXSH8b2ie0le7ZkdVdlBVqP+W5Znfa3DN3MeB
 LfUr3hxYLEnt22u/hVIDc6i6n0WLQ/U4sk2ymIW0fnBAM+elifQoBdynOuWRpO2b
 tavGqivSEaPTl4+lVfVEb94ejTR4mW2E+asmLfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=rdmSnV
 UC5YBs87meErYRdhFx5Qx5CsEQ2+Ssj35rvJw=; b=WLwKsUb7GovHgM5kKAVJIr
 D1j8Y4sozyR+gYUKUEuJIs3n7tolDyfbIMhFabTORENawLdV1d6g3FLAkByJpdDX
 zx55ScqTtTkwRJXVirRqu/fWzwLTP91AYfDg2NUT/bVFGC50Q7KEK1FCNMQg18MF
 XnPaaYRU2BoBdTs+HphrASm8fqMhLi9PK+h5sLYhdis2o9vvIWOfW3MPelbxlWf+
 oeJaVFjLth/iFRXKR/8ZB0mnJUK3P7TAikEMNtMwNZLAZWWGdbRItLwcdFRT9Rqt
 V/ctGP899RFRQmmvUVCrZDLg2r6DCvG3kYFsrJOKHvZpRKSYSOmcE+wpYpPvUwkg
 ==
X-ME-Sender: <xms:lCbwXeg51_aVIWtm4SYjR2qUOSrWSb8ZmGF42NjUR35iU084l06GXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelgedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehgihhthhhusgdrtghomhenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
 vgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:lCbwXbUENctGO2HZwYmqUdsY6bgqy5x90P46QMqivigkkg-eVJiuyw>
 <xmx:lCbwXY2oqIMmknPTF2J1Btnb6RMZcEmPKC1zuTAT4Km_GdZX1gmjGQ>
 <xmx:lCbwXZERzhb_m8AVL8t_PDs-quk-mUN4heIuIxdUqKVbM4THTzhxfQ>
 <xmx:lCbwXZXPoW6aT8gJ_uOfrZGLi7zmsO7_sPmjT8dT5hRkt6WxKSBS8g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A2B70E00A2; Tue, 10 Dec 2019 18:13:24 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-679-g1f7ccac-fmstable-20191210v1
Mime-Version: 1.0
Message-Id: <8d4e9e9c-2568-4ab0-960c-7383a981fbbe@www.fastmail.com>
In-Reply-To: <391eaabe-6ade-e23d-97ef-a0c1d6630f8c@gmail.com>
References: <CAG5OiwjaiBnGw17NZdW4=XDmiWpuEM=z5_jsTcJ8ws=p1umeRQ@mail.gmail.com>
 <1fdc7be1-71f7-4926-83aa-a531de6d5b81@www.fastmail.com>
 <477d3fbb-5aa8-d4e8-958c-62fb94e2acc7@gmail.com>
 <b9ef7897-f4a7-445d-a79b-289b399528ee@www.fastmail.com>
 <391eaabe-6ade-e23d-97ef-a0c1d6630f8c@gmail.com>
Date: Wed, 11 Dec 2019 09:45:03 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Kurt Taylor" <kurt.r.taylor@gmail.com>,
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Project metrics
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

On Tue, 10 Dec 2019, at 04:54, krtaylor wrote:
> On 12/8/19 6:06 PM, Andrew Jeffery wrote:
> > On Sat, 7 Dec 2019, at 00:03, krtaylor wrote:
> >> Measuring a project always improves it. That, and I have been
> >> asked to start gathering metrics from several of our contributing
> >> companies.
> > 
> > Where did this discussion occur? Can you provide a link?
> 
> The conversations have happen many times over the last 2 years.
> 
> At TSC and community meetings (not recorded in the meeting minutes that 
> I could find, but it was discussed)
> 
> At release planning meetings (see minutes):
> https://github.com/openbmc/openbmc/wiki/Release-Planning

Ah, okay, but it just briefly talks about metrics directly and not about the
questions we're trying to answer with the metrics?

> 
> I would rather not disclose email (without consent) that I have received 
> privately from several companies supporting this work.

That's okay, but I'm still trying to understand motivations here.

> 
> No one has ever had any objection to gathering this information (until 
> now). Remember, anyone can go see this information any time they want.

I'm not objecting to gathering it at all, I'm objecting to the lack of context in
presentation of the data. Why are we gathering it? What questions are we
answering? "Who commits the most" is the first order question, but why are
we asking it? Are we trying to establish the breadth of contributing companies?
Are we trying to identify first time contributions from companies and work with
them to drive further participation?

> > 
> > I'm concerned that we're trying to create a stick to beat contributing companies with
> > rather than working to find ways increase contributions for mutual benefit. Competition
> > works as a motivator when community members feel safe to take it on but I'm not sure
> > the community is mature enough for that to be true. Adding the context for your
> > statistics might help remove my concerns.
> 
> Honestly I'm surprised at this reaction to a *potential* situation I 
> have never witnessed

This is the problem with the lack of context. We can both have different
ideas about the motivations because they aren't written down anywhere.
It was just a concern of mine, I'm not claiming that it _is_ the motivation,
and I certainly hope that it's not. My concern could be eliminated if we
wrote down why we're gathering the metrics.

> but, I am willing to add any wording that you feel 
> is necessary to create a safe development environment.

I don't think it's about adding words here to create a safe environment, just
I don't expect everyone engaging with the project has 20+ years of experience
in open source software development. Open source work can be intimidating
with scrutiny that can be applied through code review and other interactions,
and not everyone is comfortable with that out of the gate. Certainly we've
done a lot of work internal to IBM to help people become comfortable with
working in open source. What I'd hate to see is people being discouraged from
interacting in the upstream community through metrics that don't have clear
goals.

OpenBMC is flipping the switch on what was a very propriety ecosystem, and
we will have contributors that don't have strong backgrounds in open source.
If the metrics have been discussed in meetings that's fine, but I'd hope the
context would make its way out as well and be attached to the data that we've
collected.

> 
> I value your feedback. When do you feel we as a community are mature 
> enough to start monitoring reviews, commits, and other project data? 

As above I don't think that we can pick a point on a timeline, and I don't
think that's even the point. I think that there should be engagement through
the general project channels (mailing list, IRC, not targeted meetings with
limited audiences) to determine what we're trying to measure, gather the
data, and then _present the data in the context of the question we're trying
to answer_. My consistent complaint is the lack of context.

> Should we hide this "early" data until some future time when it 
> represents everyone equally? 

No, I think you have a misunderstanding of my point here. We just need
to make the question that we're answering is provided with the view of
the data. Context is important.

> Personally, I don't feel like we will ever 
> get to that place. There will always be people that contribute more in 
> one particular area than others and they just can't be upset that they 
> may have done less. Open Source requires thick skin.

It shouldn't necessarily, and we need to work at making sure we're
approachable as a community. Providing context with metrics will give
people the information they need to know how the metrics are being
used by the project.

> 
> Eventually, I'd like to break this data down by project and individual, 
> not just company.

But why? I keep asking this. It's not because there's not a valid answer
and I'm trying to trap you, I just want to understand what the motivations
are.

Anyway, Github provides some of this information for us already. For
example:

https://github.com/openbmc/openbmc/graphs/contributors

Cheers,

Andrew
