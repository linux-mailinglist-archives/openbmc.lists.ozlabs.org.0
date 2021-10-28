Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B524B43F328
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 01:00:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgLdG2BSMz3bjP
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 10:00:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgLcx5H9Sz2yLq
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 10:00:32 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="316738689"
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="316738689"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 15:56:51 -0700
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="498613146"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.54.51.82])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 15:56:50 -0700
Date: Thu, 28 Oct 2021 15:56:49 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Ed Tanous <edtanous@google.com>
Subject: Re: bmcweb non-standard OEM integration
Message-ID: <20211028225649.GD1786414@mauery.jf.intel.com>
References: <20211027043751.GB1786414@mauery.jf.intel.com>
 <CAH2-KxDa=vPjOxpq9fnC85azUTmdre1TaxEtb8m7isaTU0Fhpw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAH2-KxDa=vPjOxpq9fnC85azUTmdre1TaxEtb8m7isaTU0Fhpw@mail.gmail.com>
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
Cc: Development list for OpenBMC <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 27-Oct-2021 09:22 AM, Ed Tanous wrote:
>On Tue, Oct 26, 2021 at 9:37 PM Vernon Mauery
><vernon.mauery@linux.intel.com> wrote:
>>
>> I can't imagine that Intel is the only company on this project that has
>> a set of patches against bmcweb. Some of these are for features that
>> have not yet been released. Some of these are for OEM things that don't
>> fit any of the Redfish-OEM schemas. Some are for features that are
>> long-standing upstream reviews that have not yet been merged for
>> whatever reason.
>>
>> We want to move away from patches.
>
>
>As an attempt to make this more concrete, I tried to look at Intel-BMC
>to figure out what you're talking about.  The only OEM schema I see is
>0001-Firmware-update-configuration-changes.patch, which adds support
>for defaulting the setup on a firmware update.  DMTF has been
>discussing this idea of defaulting a setup very recently (I think we
>talked about it last week), so that will hopefully be in the standard
>soon, and if you're interested in particular properties of it, you
>might want to participate there.
>
>That's the only OEM patch I see;  Is there more?

All the patches that make changes are OEM patches. Just because they 
don't have an OEM schema, that doesn't mean they are not OEM patches. I 
see OEM patches as a patch written by an OEM. In this case, Intel.

>> We want to be able to share our
>> changes with the community. Right now, there is not a way for this sort
>> of OEM changes getting into bmcweb.
>
>I'm not sure why you think this, but the current policy is definitely
>not "no way".  Have you read the doc on this?
>https://github.com/openbmc/bmcweb/blob/master/OEM_SCHEMAS.md
>
>To paraphrase, the above doesn't say "no OEM schemas in
>upstream".  It says "OEM schema features need to be discussed in the
>relevant communities".  This policy as written was attempting to be
>similar to our policy on systemd, linux, ect.

Discussing things in relevant communities is good for when it comes time 
to actually upstream a patch and make it public. But there are patches 
that are not yet public because of pre-release hardware/specs/features 
that will eventually get upstreamed. Those are in a really tricky 
position because they might actually need to get re-architected and 
re-written as part of this discussion process during the upstream 
process. I agree that might be part of a calculated risk that we would 
have to take on weighing the benefit of getting the feature working vs. 
the risk of possibly needing to rework it in the future. But in the 
meantime, it would be advantageous for Intel to be able to keep it in a 
format that does not break every time it has to be rebased on top of the 
latest bmcweb.

>> I know not everyone is a huge fan of
>> the way that the ipmi-providers code works, but it does work. Companies
>> need to be able to have those changes that allow them to differentiate
>> from the common phosphor core. I am proposing that we make changes to
>> bmcweb that would allow this sort of OEM customization.
>
>Intentionally avoiding the comparison with ipmi-oem for a moment,
>let's see if we can agree on some things:
>1. We should implement Redfish schemas (be they OEM or not) to the
>standard, with the same level of quality as the standard.

I understand that the IPMI spec is dated and unclear in many cases, but 
even with a standard that is still 'living', there will always be cases 
where something does not fit into the standard. It may be a 'not yet' 
situation where a future version adds the feature, or it may be a 
scenario that does not really fit the standard and they don't want it 
but we do. In either case, the implementation needs to exist from the 
point of requirement forward. In the former case, it will eventually get 
merged with bmcweb. In the latter case, it still needs a home.

>2. The OpenBMC community has a track record of writing incorrect
>schemas, then abandoning them (there are positive examples as well).

I feel like this is normal and part of growing pains. How many times has 
any given line in the Linux kernel been rewritten? Projects grow and 
change. If we are waiting for the perfect schema before implementation 
of a feature we will never get there. And then who will pay the bills? I 
am not suggesting that we just throw everything at the wall and see what 
sticks, but have some faith in organizations to come up with at least 
a first good step to appease their customers that have needs.

>3. We should avoid duplicating code between schemas in as many cases
>as possible.

Sure. No argument here.

>Now jumping into the comparison, I would posit that Redfish is
>different from IPMI:
>1. There is a very active standards body, with new spec changes coming
>every few months.  IPMI has no such standards body at this point, so
>even if you wanted to get a change in, there's no path forward.
>2. Redfish has a configurable privilege system, and its interfaces are
>reflectable.  This significantly complicates any runtime-dynamic
>plugin solution, given that previously static resources would now have
>to be generated at startup, which would be quite a bit of code.

It is just code. With code anything is possible. :)

>None of this is to say "no OEM schemas", more to point out that in
>terms of engineering and code, they're not very similar problem
>spaces.

So they will have different solutions. I didn't expect it would be a cut 
and paste situation.

>>
>> I don't have a full proposal yet. But I wanted to get this concept out
>> in the open before diving headlong into a metaphorical brick wall. While
>> I compared what I would like to the ipmi-providers mechanism, there are
>> other ways to do this that can work around many of the objections that
>> have been raised to that architecture.
>>
>
>I'm not against having OEM schemas, but I do think we need some
>guardrails to keep them useful and maintained in the long run, and
>there's a good bit of architecture work to make them possible.
>
>Some things to consider in your proposal:
>1. Redfish requires a PrivilegeRegistry.  The moment you implement an
>OEM resource, you now need an OEM privilege registry to manage the
>privileges for it.  Up until my patch recently, bmcweb had a hardcoded
>privilege map, which didn't allow for modification on a per-system
>basis.  After a few patches, we're at least generating our privilege
>tables now, but this would need to be significantly improved to handle
>OEM schemas privileges properly.

This is good to keep in mind; like I said, so far, only the desire to do 
this is present, not a plan.

>2. Redfish requires schema files.  In general for company-specific OEM
>registries, it's not desirable to have another company's OEM schemas
>show up on your systems (and for all I know, might be a copyright
>violation, but I'm not a lawyer).  This requires some mechanism to
>switch features on and off, which bmcweb already has, in the form of
>the meson options.  If we're going to allow OEM options in a lot more
>places, we'll need an engineering solution for this that scales
>better.

Yes. Nobody wants to endure that sort of embarrassment.

>3. Redfish schemas are VERY difficult to write, and the current batch
>of maintainers (myself especially) is not up to the task of reviewing
>schema file submissions at this time.  I'm personally working to get
>better, but at this point every single OEM schema that we've accepted
>has bugs.  Side note, I tried to generate type-safe client bindings
>for a project recently, and I ended up having to comment out all the
>OEM schemas, given how broken they are, so this has real-world effects
>on clients usage.

This is not my area of expertise, but it sounds like generating valid 
schemas is the sort of thing that needs to be automated to let the 
computer do the work or something. Mere humans are not up to the task.

>3. As it's in one piece of code, bmcweb can make changes to internal
>details, clean up code, and make things more usable over time by
>simplifying and reducing code.  Some examples of this include
>readJson, boost-dbus to sdbusplus conversion, variable naming,
>clang-tidy and many more.  Any change to how we inject OEM handlers
>should understand that and make sure it's still possible in the
>future.

Yup.

>4. Functionally, code shouldn't be duplicated.  Please plan on your
>design doc covering how we're going to deal with that functionally
>when others want to reuse OEM code.

Yes. This is one of my dislikes of the ipmi-oem situation.

>5. In your proposal, please plan to propose a set of guidelines for
>determining which things should be upstreamed to DMTF, which things
>should remain as OpenBMC OEM, and which should remain company specific
>OEM.  There are definitely examples that should be each of the three,
>but the vast majority of things that I get asked about belong in DMTF
>upstream, and I struggle as a maintainer when the DMTF community tells
>me they want more participation, but OpenBMC OEM schemas immediately
>bifurcate the conversation to a much smaller audience.  IMO in many
>cases, OEM resources are used as a trapdoor to avoid having to
>upstream things, which is not a pattern we should promote.

Sure. And given those three scenarios, it might also change where the 
code lives. I agree that OEMs should not use this as just a carte 
blanche approval to do whatever they want.

>6. Given that we've had problems in the webui with hardcoding
>resources, please plan on coming up with similar client usage
>guidelines to avoid similar problems as we've had with uid handling in
>our clients, as well as deprecation policies when things do get
>supported in upstream.

I am not sure I grok this section...

>In short, I don't see a "metaphorical brick wall", but a gentle set of
>rolling hills to climb.  If you can point to something specifically
>you'd like to see made OEM that we can use as an example for this kind
>of thing to work through the engineering and process changes, please
>do.

Thanks for your detailed response.

--Vernon
