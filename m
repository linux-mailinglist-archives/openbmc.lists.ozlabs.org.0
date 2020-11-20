Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB642BA334
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 08:32:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcpCk5TlKzDqy1
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 18:32:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=Qcc+0F7K; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcpBr1kyPzDqlh
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2020 18:31:32 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 00BCD41397
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2020 07:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1605857485; x=1607671886; bh=sxo1G3gaveVlJ3ymVKxCZaWTk
 oP5fuXodqLF8vHJ/+U=; b=Qcc+0F7K3UT2FmqyBo4bXqFgnLAYINFHYwlhD413u
 i0CRXjxDO88h1KGsVb+SkNI+4h1Cpa60mmhIKgKklO9YHPjRIBYQuMHcwlk5ZvxV
 ft8lqZfo3fMR45Ati2CgmIPokBBwE7Uv6s0XwnJFiM/0ib5/hrtRKolsYPzVKG1s
 Nw=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qs3KgRwulsZ3 for <openbmc@lists.ozlabs.org>;
 Fri, 20 Nov 2020 10:31:25 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 078964136B
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2020 10:31:25 +0300 (MSK)
Received: from [10.199.0.35] (10.199.0.35) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 20
 Nov 2020 10:31:24 +0300
Message-ID: <2efc5fa8a97e5aa17d8579cd414676bb842367d1.camel@yadro.com>
Subject: Re: [Announce] OpenBMC Discord Community
From: Andrei Kartashev <a.kartashev@yadro.com>
To: <openbmc@lists.ozlabs.org>
Date: Fri, 20 Nov 2020 10:31:23 +0300
In-Reply-To: <20201112145740.GB4495@heinlein>
References: <20201112145740.GB4495@heinlein>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.35]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
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

Hi Patrick, 

Is there a Matrix (Riot.IM) to Discord bridge configured (
https://matrix.org/docs/projects/bridge/matrix-appservice-discord)? Did
you try it? Can we connect Discord channel with IRC channel via the
bridge?
BTW, what was the problem with Matrix-To-IRC? I use it connect the
channel and it works fine to me.

PS: it may be also interesting option is gitter, which going to be
merged with matrix:
https://matrix.org/blog/2020/09/30/welcoming-gitter-to-matrix

On Thu, 2020-11-12 at 08:57 -0600, Patrick Williams wrote:
> Greetings,
> 
> TL;DR: I have created an OpenBMC Discord community as a modern
> alternative to
> IRC.  Please join at https://discord.gg/69Km47zH98 .  I've included
> some FAQs
> below.
> 
> ---
> 
> Recently Kurt sent out a survey about messaging (IRC) and the results
> suggested that using IRC is an impediment to a large segment of our
> community[1].  75% of responders suggested "IRC is too confusing" and
> 65%
> responded they were unwilling to use IRC even if someone help them
> set it up.
> I was also told privately that there are some people who, due to
> corporate or
> country network restrictions, are unable to access IRC.  It seems
> that
> exclusively using IRC is putting a constraint on the collaboration of
> the
> community and so I am willing to try something different.
> 
> I did a simple investigation of the options available to us and
> usages of
> other similar communities and came to the conclusion that Discord
> would
> likely be a good fit for our needs.  A few of us have been
> experimenting with
> it and there do not seem to be any pervasive issues, so I am hereby
> announcing
> it to the community at-large.
> 
> Discord is widely used in the video gaming community and by some
> other open
> source communities.  It has a modern Slack-like interface, but has
> much better
> Free-tier limits compared to similar alternatives.  Discord also has
> built-in
> voice / video / screen sharing, which could be very beneficial for
> impromptu
> hands-on problem solving and hosting "Office Hours".  Like many
> alternatives,
> there is a browser, stand-alone, and mobile app options and sign-up
> is a
> simple email-verification process.
> 
> I'm pretty excited about the possibilities for our community and look
> forward
> to seeing many of you join!
> 
> ---
> 
> # Q&As
> 
> ## What are the rules?
> 
> We've never explicitly stated the rules for IRC, but IRC was set up
> before we
> had a Code of Conduct.  I have created a #rules channel in Discord
> and posted
> a link to our CoC; they should all be assumed to apply on Discord.
> 
> Discord does support private messages, but they are set up in a
> different way
> from some alternatives.  With Discord, PMs take place outside of our
> community
> but within Discord itself and we have no direct way to directly
> monitor or
> police.  You can choose to block all private messages, allow all
> private
> messages, or accept PMs from a subset of people.  This is similar to
> what we
> have today with IRC, so I expect there to be no issues, but if anyone
> feels
> they are on the receiving end of unwanted behavior please report by
> following
> the procedures outlined in the CoC.
> 
> 
> ## Can I use my existing Discord account?
> 
> Yes, but... since Discord is widely used in a less-professional
> setting
> (Gaming), I feel it is important to point something out.
> 
> With Discord you have a Username for your account and a Nickname
> within the
> community.  Your Nickname is displayed in chats, but it is easy to
> see your
> Username within your profile.  If you do not everyone to know your
> alter-ego
> as F0rtN1ghtKing007, you may want to create a separate account or
> change your
> Username.  (If your existing Username might be construed as a CoC
> violation,
> please change it or create a separate account before joining.)
> 
> 
> ## Won't this split the community into two messaging systems?  What
> happens
> with IRC?
> 
> Hopefully not, but maybe.  Just like software, sometimes someone
> comes along
> and refactors the solution to make it better.  Sometimes the new
> solution
> loses a few features along the way.  Sometimes the new solution
> doesn't pan
> out and it isn't fully adopted.  I don't see this as any different;
> if it is
> better, people will adopt it, and if not so be it.
> 
> The survey results and sentiment I have heard from some TSC members
> indicate
> to me that IRC might be an impediment to bettering the
> community.  So, this is
> an option for us to try.
> 
> For the time being, I personally will be on both IRC and Discord.  We
> can
> revisit in the future to decide if one should be deprecated.
> 
> 
> ## Why didn't you choose Slack?
> 
> Some companies have chosen Slack as their internal messaging solution
> as have
> some open source communities.  It is, overall, a good offering in
> many
> settings.
> 
> For open source communities, the Free-tier of Slack has some
> limitations that
> I feel make it difficult to build a community around.  The biggest is
> a limit
> of 10,000 messages in the history.  After 10k messages, Slack starts
> deleting
> older messages.  In one community I participate in less-active
> channels end up
> losing their messages in only a few days, which means that meaningful
> conversations can only take place in the most active channels among
> the most
> active users.  That community has recently moved off Slack and onto
> Discord
> for this reason.
> 
> The paid-tiers of Slack are pretty expensive for our community.  We
> typically
> have ~75 active participants on IRC.  Assuming we grow this
> engagement and we
> count transient users, we'd probably be looking at $10,000 per year
> for the
> lowest tier of Slack.  Not only do we not have a budget as a
> community but
> that does not, to me, seem like a very effective use of any funds we
> might
> have.
> 
> Discord is as good or better than Slack, as best I can tell, in every
> way
> except one: threaded messages.  Hopefully, Discord will add that as a
> feature
> in the future.  I feel the elimination of Free-tier limits and
> voice/video
> features of Discord will make it a better choice for us.
> 
> A reasonably objective article as a comparison between the two
> suggests that
> Discord is better for large open source communities[2].
> 
> ## Why didn't you choose <X>?
> 
> Whatever option we pick some people will be pleased and some will
> not.
> Looking at the TSC member companies, I think each company has chosen
> a
> different product as their internal messaging solution.  Some of them
> have
> their own competitive offering to Slack.  I did not do an exhaustive
> feature-by-feature comparison of all competitive offerings.
> 
> In terms of Open Source communities, and similar communities
> utilizing a free
> or low-priced option, Discord and Slack seem to have the most
> usage.  Many
> other large open source have Discord communities as well (some
> official and
> some unofficial).  Rust, Vue, Angular, Fedora, OpenSUSE, and Electron
> are a
> few I recognized on a list by Discord[3].  The Python Discord
> community has
> over 100,000 members.
> 
> There are some fully open source alternatives to Discord.  The two
> most
> popular are Riot.IM and Mattermost.  Mattermost would require us to
> host the
> service, similar to what we do for Gerrit.  We have an existing
> Riot.IM bridge
> to IRC but we have had reliability issues with it.
> 
> If something better comes along and/or Discord presents problems for
> us, I
> suspect the community will be nimble enough to move along to the next
> great
> thing.
> 
> 
> ## Does this mean _you_ control the Discord community?
> 
> I originally created the existing IRC set up and have given some of
> the other
> long-time members administration on it.  The permissions I set up on
> Discord
> are identical and two other people currently have administrator-level
> permissions there as well.  If the TSC decides on a particular
> governance of
> our communities, such as IRC or Discord, I'll happily transfer
> ownership as
> requested.  Discord ownership can be transferred to another account
> very
> easily.
> 
> As stated earlier, no one with admin-level access has the ability to
> read
> private messages either on IRC or Discord.
> 
> ---
> 
> 1. 
> https://lore.kernel.org/openbmc/bb565e15-f5a7-b0b2-d987-41b1a5e9acbb@gmail.com/
> 2. https://droplr.com/how-to/productivity-tools/slack-vs-discord/
> 3. https://discord.com/open-source
> 
-- 
Best regards,
Andrei Kartashev


