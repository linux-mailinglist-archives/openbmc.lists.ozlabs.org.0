Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE3910C90
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 20:05:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vRCM2R8XzDqMt
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 04:05:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vRBR65nczDqJm
 for <openbmc@lists.ozlabs.org>; Thu,  2 May 2019 04:05:02 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Wed, 1 May 2019 14:05:47 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ed Tanous <ed.tanous@intel.com>
Subject: Re: Redfish OEM commands in OpenBMC
Message-ID: <20190501180547.kzgnxxsfv2tkgr6x@thinkpad.dyn.fuzziesquirrel.com>
References: <CALLMt=qEtkfBwBcV1WzsGuCozyT1Fs8+1d+nUPPScxq1ZpihJQ@mail.gmail.com>
 <5978896f-712d-a2b7-3f94-3a23e7a86003@intel.com>
 <20190423135100.aelbc4w2np4lepjc@thinkpad.dyn.fuzziesquirrel.com>
 <060e7ffe-6953-c66b-483a-4600b64c7556@intel.com>
 <20190423175218.fe6rmtxrqrq35pu2@thinkpad.dyn.fuzziesquirrel.com>
 <488e0e73-76d0-977e-6f20-ff91e35f6cfa@intel.com>
 <20190424181851.fzfkef4ycqy3yuws@thinkpad.dyn.fuzziesquirrel.com>
 <36d7934c-4870-8ed9-a61f-a4fe69a6e76b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
In-Reply-To: <36d7934c-4870-8ed9-a61f-a4fe69a6e76b@intel.com>
Content-Transfer-Encoding: quoted-printable
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

On Mon, Apr 29, 2019 at 10:32:36AM -0700, Ed Tanous wrote:

>On the nose, it sounds ok, but it would be good to see a proposal
>that's a little more detailed. =20
I put a proposal here:
https://lists.ozlabs.org/pipermail/openbmc/2019-April/016126.html

>>Agreed on option #2.=A0 However I still think you should consider
>>runtime pluggable dynamic resolution.
>
>None of the features I've heard so far necessitates the use of runtime
>discovery, or even fall outside what configurability is available in
>bmcweb today.  "runtime pluggable" on an embedded system is a strange
>concept, given that all uses I know of today are really just an
>extension of compile time plugability, using the rootfs as the medium
>for "discovery".  With that said, I'm imagining you're thinking
>something like what IPMI has today, which I might be misinterpreting
>based on our discussion this morning?
Yes, this is what I was thinking.  I agree with you that we don't have
features that require the use of runtime discovery.  My reasoning is
rooted in concerns around code maintanence and adoption.

maintanence:  I don't think code with a bunch of #ifdefs is desired or
readable.  It might not be too bad starting out.

adoption:  Do you recall how one of Michael Brown's issues with bmcweb
was that there wasn't "any way to extend or replace functions without
forking the codebase?"  I believe this is exactly what he was talking
about.  I suspect he didn't even consider compile time plugins because
in my experience maintaining codebases structured that way is painful.

>It should be noted, we also have DBus "plugin" capability with the dbus
>interface already: anyone can host logs on dbus, and redfish will
>populate them.  That option doesn't really get to the core of the OEM
>issue though, but is certainly an option in the PEL log case that I
>didn't think of right away.
This is an interesting thought.  We could put OEM things on DBus and
maybe bmcweb looks at those to fill out OEM properties?

>>It sounds like you want everyone to put their implementations of OEM
>>properties right next to each other in bmcweb and surround them with
>>ifdefs.=A0 Do I have that right
> Yes, I believe you have that right.

>>Shouldn't we allow the OEM to maintain their own implementation?=A0
>>Also, when you (the bmcweb maintainer) look at the core bmcweb/redfish
>>code, do you want to be distracted by the twenty implementations of an
>>OEM property?
>
>If my goal is to make my changes without breaking any of the other
>twenty implementations at the same time, absolutely, I want to be
>"distracted" by them. =20
Right.  This is the fallout of choosing to not have a framework/have an
unstable API.  This is also what makes this approach not scale very well
from a maintanence POV, IMO.

>>Does it make sense for you to be the maintainer of code you have
>>zero investment in?
>We can definitely both agree that me personally maintaining all Redfish
>code is unmaintainable in the long term.  I don't want to be the
>maintainer of code that I have no investment in, but I'm not sure how
>you came to the "Ed is the only maintainer of bmcweb for all time"
>conclusion.  The current maintainer files have provisions for layering
>just like the Kernel does.  Long-term, we can split maintainership on
>whatever lines are appropriate.
Sounds good!

>>This is just the reality of the world we live in...=A0 It is precisely
>>why we need robust (yes, sometimes complicated, sometimes performance
>>impacting, sometimes harder to read) frameworks and abstractions that
>>allow us to share and collaborate where it makes sense and to move
>>quickly where it does not.
>I would argue that the kernel driver interface is a great example of
>how this should be done, and handles scales that we could only hope to
>get to get to.  The kernel doesn't publish a "stable" driver interface
>internally, but does publish a concrete user-facing API. =20
It may not be a stable interface but there _is_ an interface to which
out of tree modules for instance can plug into.  And those modules could
implement a custom, OEM ABI via sysfs or ioctls.

>somewhat what bmcweb has attempted to model in its design;  User facing
>code should be able to be concrete, while keeping the internals
>flexible enough to make changes as better patterns emerge.

This thread raises an important design point or "community norm" being
established for OpenBMC.  IMO it has the potential to impact
participation rates and cost of maintanence in the future.  It would be
nice to get some opinions from more than just two people.  Anyone care
to chime in?

-brad
