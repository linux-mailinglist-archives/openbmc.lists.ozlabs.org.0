Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D9411FC0
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 18:10:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44w0bQ1NVZzDqN6
	for <lists+openbmc@lfdr.de>; Fri,  3 May 2019 02:10:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44w0ZK0YjWzDq61
 for <openbmc@lists.ozlabs.org>; Fri,  3 May 2019 02:09:11 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 May 2019 09:09:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,422,1549958400"; d="scan'208";a="154179555"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by FMSMGA003.fm.intel.com with ESMTP; 02 May 2019 09:09:08 -0700
Subject: Re: Redfish OEM commands in OpenBMC
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <CALLMt=qEtkfBwBcV1WzsGuCozyT1Fs8+1d+nUPPScxq1ZpihJQ@mail.gmail.com>
 <5978896f-712d-a2b7-3f94-3a23e7a86003@intel.com>
 <20190423135100.aelbc4w2np4lepjc@thinkpad.dyn.fuzziesquirrel.com>
 <060e7ffe-6953-c66b-483a-4600b64c7556@intel.com>
 <20190423175218.fe6rmtxrqrq35pu2@thinkpad.dyn.fuzziesquirrel.com>
 <488e0e73-76d0-977e-6f20-ff91e35f6cfa@intel.com>
 <20190424181851.fzfkef4ycqy3yuws@thinkpad.dyn.fuzziesquirrel.com>
 <36d7934c-4870-8ed9-a61f-a4fe69a6e76b@intel.com>
 <20190501180547.kzgnxxsfv2tkgr6x@thinkpad.dyn.fuzziesquirrel.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <b1c7f041-66ed-f4ba-97fd-39269ea0221d@intel.com>
Date: Thu, 2 May 2019 09:09:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190501180547.kzgnxxsfv2tkgr6x@thinkpad.dyn.fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/1/19 11:05 AM, Brad Bishop wrote:
> On Mon, Apr 29, 2019 at 10:32:36AM -0700, Ed Tanous wrote:
> 
>> On the nose, it sounds ok, but it would be good to see a proposal
>> that's a little more detailed.  
> I put a proposal here:
> https://lists.ozlabs.org/pipermail/openbmc/2019-April/016126.html
> 
>>> Agreed on option #2.  However I still think you should consider
>>> runtime pluggable dynamic resolution.
>>
>> None of the features I've heard so far necessitates the use of runtime
>> discovery, or even fall outside what configurability is available in
>> bmcweb today.  "runtime pluggable" on an embedded system is a strange
>> concept, given that all uses I know of today are really just an
>> extension of compile time plugability, using the rootfs as the medium
>> for "discovery".  With that said, I'm imagining you're thinking
>> something like what IPMI has today, which I might be misinterpreting
>> based on our discussion this morning?
> Yes, this is what I was thinking.  I agree with you that we don't have
> features that require the use of runtime discovery.  My reasoning is
> rooted in concerns around code maintanence and adoption.
> 
> maintanence:  I don't think code with a bunch of #ifdefs is desired or
> readable.  It might not be too bad starting out.

I think the above statement would be a lot more productive if you had a
patchset that removed some of the existing ifdefs, so we can see what
you're thinking.  I personally don't find them unreadable or
undesirable, and significantly less confusing than the runtime plugin
system in ipmi.  Given that several people, from several companies have
been able to extend them without a lot of documentation or handholding
makes me think that they're meeting the intended purpose, although to a
much lower scale than IPMI.

With that said, the ifdef feature model works at much higher scales in
the Kernel, so there was an assumption it could scale to whatever we need.

Of the half-dozen or so implementations of Redfish that started out,
there were several that didn't use ifdefs for configuration.

> 
> adoption:  Do you recall how one of Michael Brown's issues with bmcweb
> was that there wasn't "any way to extend or replace functions without
> forking the codebase?"  I believe this is exactly what he was talking
> about.  I suspect he didn't even consider compile time plugins because
> in my experience maintaining codebases structured that way is painful.

I do recall, and I recall his attempted solution to it with go-redfish
was difficult to understand and modify, and had some CPU usage penalties
due to its caching and plugin requirements.  If plugins met the exact
intent of what the framework intended them to do, then it functioned
just fine, but the minute it reached past what the interface was able to
define, things got very complicated very quickly IMHO.
With respect to that, the primary goal of that plugin interface was an
issue that I don't think OpenBMC cares about: the ability to take
OpenBMC components (in this case redfish) and integrate them into
private, non-OpenBMC codebases.  If you're integrating with a private
codebase, you're forking either way.

> 
>> It should be noted, we also have DBus "plugin" capability with the dbus
>> interface already: anyone can host logs on dbus, and redfish will
>> populate them.  That option doesn't really get to the core of the OEM
>> issue though, but is certainly an option in the PEL log case that I
>> didn't think of right away.
> This is an interesting thought.  We could put OEM things on DBus and
> maybe bmcweb looks at those to fill out OEM properties?

Isn't this already how phosphor-logging was defined?  (on second
thought, this discussion is probably better had in your other thread
about logging)

> 
>>> It sounds like you want everyone to put their implementations of OEM
>>> properties right next to each other in bmcweb and surround them with
>>> ifdefs.  Do I have that right
>> Yes, I believe you have that right.
> 
>>> Shouldn't we allow the OEM to maintain their own implementation? 
>>> Also, when you (the bmcweb maintainer) look at the core bmcweb/redfish
>>> code, do you want to be distracted by the twenty implementations of an
>>> OEM property?
>>
>> If my goal is to make my changes without breaking any of the other
>> twenty implementations at the same time, absolutely, I want to be
>> "distracted" by them.  
> Right.  This is the fallout of choosing to not have a framework/have an
> unstable API.  This is also what makes this approach not scale very well
> from a maintenance POV, IMO.

At the end of the day IMO, the API that matters is the one the system
user sees out the HTTP port.  All else is secondary.  Given the wide
range of things HTTP is capable of, I didn't see a way to define a
concrete API that was extensible in the features that we knew the
specifications supported and we knew were coming, while keeping the
performance and size guarantees required to run on the system.
The other thing to remember is that the #ifdef features apply to more
than just redfish, so unless you define a full concrete HTTP api, not
just redfish, you end up back in the same boat where you started when
non-redfish protocol needs come up.
Also, so far as I know, the Redfish "Node" class API hasn't been broken
since it was first committed by Lukasz, so to call it an "unstable" API
is a bit of a misnomer.  "Unspecified" API, I could accept.

> 
>>> Does it make sense for you to be the maintainer of code you have
>>> zero investment in?
>> We can definitely both agree that me personally maintaining all Redfish
>> code is unmaintainable in the long term.  I don't want to be the
>> maintainer of code that I have no investment in, but I'm not sure how
>> you came to the "Ed is the only maintainer of bmcweb for all time"
>> conclusion.  The current maintainer files have provisions for layering
>> just like the Kernel does.  Long-term, we can split maintainership on
>> whatever lines are appropriate.
> Sounds good!
> 
>>> This is just the reality of the world we live in...  It is precisely
>>> why we need robust (yes, sometimes complicated, sometimes performance
>>> impacting, sometimes harder to read) frameworks and abstractions that
>>> allow us to share and collaborate where it makes sense and to move
>>> quickly where it does not.
>> I would argue that the kernel driver interface is a great example of
>> how this should be done, and handles scales that we could only hope to
>> get to get to.  The kernel doesn't publish a "stable" driver interface
>> internally, but does publish a concrete user-facing API.  
> It may not be a stable interface but there _is_ an interface to which
> out of tree modules for instance can plug into.  And those modules could
> implement a custom, OEM ABI via sysfs or ioctls.
> 
>> somewhat what bmcweb has attempted to model in its design;  User facing
>> code should be able to be concrete, while keeping the internals
>> flexible enough to make changes as better patterns emerge.
> 
> This thread raises an important design point or "community norm" being
> established for OpenBMC.  IMO it has the potential to impact
> participation rates and cost of maintanence in the future.  It would be
> nice to get some opinions from more than just two people.  Anyone care
> to chime in?
> 
Agreed, would love to hear more opinions on this.

> -brad
