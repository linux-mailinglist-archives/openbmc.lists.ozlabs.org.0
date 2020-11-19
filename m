Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 193572B9C48
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 21:52:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcX1C3tnhzDqpJ
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 07:52:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcWzy1DgMzDqpK
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2020 07:51:08 +1100 (AEDT)
IronPort-SDR: aCHTyExLoZlj3+eVtPL7VK5Ba73Pr2p/HW9hP9wXnT07u6d0ZNxlwzcUiOS/1A5PA0pAxOLJ2+
 YY+t4b/YUyxA==
X-IronPort-AV: E=McAfee;i="6000,8403,9810"; a="167852427"
X-IronPort-AV: E=Sophos;i="5.78,354,1599548400"; d="scan'208";a="167852427"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2020 12:51:05 -0800
IronPort-SDR: nxT3pUol4KVt9CrHI7Cp3HKd+5bHXFQrPHHf4TN4zN6C4bw4EDYryGivAnPARrn6os8EFyDLDK
 yZxXnThKw87w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,354,1599548400"; d="scan'208";a="360156686"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 19 Nov 2020 12:51:05 -0800
Received: from [10.251.21.62] (jmbills-MOBL.amr.corp.intel.com [10.251.21.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 99FEB580409
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 12:51:05 -0800 (PST)
Subject: Re: [Announce] OpenBMC Discord Community
To: openbmc@lists.ozlabs.org
References: <20201112145740.GB4495@heinlein>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <5cf1d3c7-d871-103f-f518-9a88a5d0edd4@linux.intel.com>
Date: Thu, 19 Nov 2020 12:51:05 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20201112145740.GB4495@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 11/12/2020 6:57 AM, Patrick Williams wrote:
> Greetings,
> 
> TL;DR: I have created an OpenBMC Discord community as a modern alternative to
> IRC.  Please join at https://discord.gg/69Km47zH98 .  I've included some FAQs
> below.
> 
I successfully joined the Discord community using the link above. 
Joining was easy, and so far (first impressions), the app looks good and 
seems to have some really nice features.

However, I hit a situation today that was unexpected.  At its prompting, 
I installed the desktop app and got connected there instead of through 
the browser.  From there, I noticed that the app allows voice chatting 
that appears to be always enabled, but my microphone was muted, so I 
didn't think anything of it.

I booted my system today and Discord started up and connected on its own 
which I expected.  However, I was halfway through an internal meeting 
when I realized that the microphone had defaulted to unmuted.  I don't 
know if it was broadcasting.

Looking through the settings, I don't see a way to disable audio by 
default or an easy way to switch it on and off.  While looking for the 
audio settings, I also found settings for screen capturing but no clear 
way to disable it.

Does anyone have recommendations on how to configure Discord to allow 
the communication features we want but disable any background sharing or 
broadcasting?  Maybe using only the browser would disable some of the 
sharing features I see in the app?

Thanks!
-Jason

> ---
> 
> Recently Kurt sent out a survey about messaging (IRC) and the results
> suggested that using IRC is an impediment to a large segment of our
> community[1].  75% of responders suggested "IRC is too confusing" and 65%
> responded they were unwilling to use IRC even if someone help them set it up.
> I was also told privately that there are some people who, due to corporate or
> country network restrictions, are unable to access IRC.  It seems that
> exclusively using IRC is putting a constraint on the collaboration of the
> community and so I am willing to try something different.
> 
> I did a simple investigation of the options available to us and usages of
> other similar communities and came to the conclusion that Discord would
> likely be a good fit for our needs.  A few of us have been experimenting with
> it and there do not seem to be any pervasive issues, so I am hereby announcing
> it to the community at-large.
> 
> Discord is widely used in the video gaming community and by some other open
> source communities.  It has a modern Slack-like interface, but has much better
> Free-tier limits compared to similar alternatives.  Discord also has built-in
> voice / video / screen sharing, which could be very beneficial for impromptu
> hands-on problem solving and hosting "Office Hours".  Like many alternatives,
> there is a browser, stand-alone, and mobile app options and sign-up is a
> simple email-verification process.
> 
> I'm pretty excited about the possibilities for our community and look forward
> to seeing many of you join!
> 
> ---
> 
> # Q&As
> 
> ## What are the rules?
> 
> We've never explicitly stated the rules for IRC, but IRC was set up before we
> had a Code of Conduct.  I have created a #rules channel in Discord and posted
> a link to our CoC; they should all be assumed to apply on Discord.
> 
> Discord does support private messages, but they are set up in a different way
> from some alternatives.  With Discord, PMs take place outside of our community
> but within Discord itself and we have no direct way to directly monitor or
> police.  You can choose to block all private messages, allow all private
> messages, or accept PMs from a subset of people.  This is similar to what we
> have today with IRC, so I expect there to be no issues, but if anyone feels
> they are on the receiving end of unwanted behavior please report by following
> the procedures outlined in the CoC.
> 
> 
> ## Can I use my existing Discord account?
> 
> Yes, but... since Discord is widely used in a less-professional setting
> (Gaming), I feel it is important to point something out.
> 
> With Discord you have a Username for your account and a Nickname within the
> community.  Your Nickname is displayed in chats, but it is easy to see your
> Username within your profile.  If you do not everyone to know your alter-ego
> as F0rtN1ghtKing007, you may want to create a separate account or change your
> Username.  (If your existing Username might be construed as a CoC violation,
> please change it or create a separate account before joining.)
> 
> 
> ## Won't this split the community into two messaging systems?  What happens
> with IRC?
> 
> Hopefully not, but maybe.  Just like software, sometimes someone comes along
> and refactors the solution to make it better.  Sometimes the new solution
> loses a few features along the way.  Sometimes the new solution doesn't pan
> out and it isn't fully adopted.  I don't see this as any different; if it is
> better, people will adopt it, and if not so be it.
> 
> The survey results and sentiment I have heard from some TSC members indicate
> to me that IRC might be an impediment to bettering the community.  So, this is
> an option for us to try.
> 
> For the time being, I personally will be on both IRC and Discord.  We can
> revisit in the future to decide if one should be deprecated.
> 
> 
> ## Why didn't you choose Slack?
> 
> Some companies have chosen Slack as their internal messaging solution as have
> some open source communities.  It is, overall, a good offering in many
> settings.
> 
> For open source communities, the Free-tier of Slack has some limitations that
> I feel make it difficult to build a community around.  The biggest is a limit
> of 10,000 messages in the history.  After 10k messages, Slack starts deleting
> older messages.  In one community I participate in less-active channels end up
> losing their messages in only a few days, which means that meaningful
> conversations can only take place in the most active channels among the most
> active users.  That community has recently moved off Slack and onto Discord
> for this reason.
> 
> The paid-tiers of Slack are pretty expensive for our community.  We typically
> have ~75 active participants on IRC.  Assuming we grow this engagement and we
> count transient users, we'd probably be looking at $10,000 per year for the
> lowest tier of Slack.  Not only do we not have a budget as a community but
> that does not, to me, seem like a very effective use of any funds we might
> have.
> 
> Discord is as good or better than Slack, as best I can tell, in every way
> except one: threaded messages.  Hopefully, Discord will add that as a feature
> in the future.  I feel the elimination of Free-tier limits and voice/video
> features of Discord will make it a better choice for us.
> 
> A reasonably objective article as a comparison between the two suggests that
> Discord is better for large open source communities[2].
> 
> ## Why didn't you choose <X>?
> 
> Whatever option we pick some people will be pleased and some will not.
> Looking at the TSC member companies, I think each company has chosen a
> different product as their internal messaging solution.  Some of them have
> their own competitive offering to Slack.  I did not do an exhaustive
> feature-by-feature comparison of all competitive offerings.
> 
> In terms of Open Source communities, and similar communities utilizing a free
> or low-priced option, Discord and Slack seem to have the most usage.  Many
> other large open source have Discord communities as well (some official and
> some unofficial).  Rust, Vue, Angular, Fedora, OpenSUSE, and Electron are a
> few I recognized on a list by Discord[3].  The Python Discord community has
> over 100,000 members.
> 
> There are some fully open source alternatives to Discord.  The two most
> popular are Riot.IM and Mattermost.  Mattermost would require us to host the
> service, similar to what we do for Gerrit.  We have an existing Riot.IM bridge
> to IRC but we have had reliability issues with it.
> 
> If something better comes along and/or Discord presents problems for us, I
> suspect the community will be nimble enough to move along to the next great
> thing.
> 
> 
> ## Does this mean _you_ control the Discord community?
> 
> I originally created the existing IRC set up and have given some of the other
> long-time members administration on it.  The permissions I set up on Discord
> are identical and two other people currently have administrator-level
> permissions there as well.  If the TSC decides on a particular governance of
> our communities, such as IRC or Discord, I'll happily transfer ownership as
> requested.  Discord ownership can be transferred to another account very
> easily.
> 
> As stated earlier, no one with admin-level access has the ability to read
> private messages either on IRC or Discord.
> 
> ---
> 
> 1. https://lore.kernel.org/openbmc/bb565e15-f5a7-b0b2-d987-41b1a5e9acbb@gmail.com/
> 2. https://droplr.com/how-to/productivity-tools/slack-vs-discord/
> 3. https://discord.com/open-source
> 
