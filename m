Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1BAE928
	for <lists+openbmc@lfdr.de>; Mon, 29 Apr 2019 19:33:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tBbF737jzDqSV
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 03:33:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tBZ64WnVzDqJB
 for <openbmc@lists.ozlabs.org>; Tue, 30 Apr 2019 03:32:39 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Apr 2019 10:32:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,410,1549958400"; d="scan'208";a="165985125"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga002.fm.intel.com with ESMTP; 29 Apr 2019 10:32:36 -0700
Subject: Re: Redfish OEM commands in OpenBMC
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <CALLMt=qEtkfBwBcV1WzsGuCozyT1Fs8+1d+nUPPScxq1ZpihJQ@mail.gmail.com>
 <5978896f-712d-a2b7-3f94-3a23e7a86003@intel.com>
 <20190423135100.aelbc4w2np4lepjc@thinkpad.dyn.fuzziesquirrel.com>
 <060e7ffe-6953-c66b-483a-4600b64c7556@intel.com>
 <20190423175218.fe6rmtxrqrq35pu2@thinkpad.dyn.fuzziesquirrel.com>
 <488e0e73-76d0-977e-6f20-ff91e35f6cfa@intel.com>
 <20190424181851.fzfkef4ycqy3yuws@thinkpad.dyn.fuzziesquirrel.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <36d7934c-4870-8ed9-a61f-a4fe69a6e76b@intel.com>
Date: Mon, 29 Apr 2019 10:32:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190424181851.fzfkef4ycqy3yuws@thinkpad.dyn.fuzziesquirrel.com>
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

On 4/24/19 11:18 AM, Brad Bishop wrote:
> On Tue, Apr 23, 2019 at 03:12:55PM -0700, Ed Tanous wrote:
>> On 4/23/19 10:52 AM, Brad Bishop wrote:
>>> On Tue, Apr 23, 2019 at 09:27:36AM -0700, Ed Tanous wrote:
>>>> On 4/23/19 6:51 AM, Brad Bishop wrote:
>>>>> On Mon, Apr 22, 2019 at 09:19:37AM -0700, Ed Tanous wrote:
> 
>>>> 2. Use LogEntry and LogService to log your PEL entries like the other
>>>> 3-4 examples of logging do today.  Given that schema is very broad it
>>>> allows you to log essentially whatever you want into the message field.
>>>> This would also give the easiest time for people to port, and give
>>>> you a
>>>> "standard Redfish" way to download your PEL logs.
>>>
>>> This might be feasible.  I just don't know enough about the logging
>>> schema.  I'll have to do some reading.
> 
> I asked around here and this is actually what we intend to do.  Create
> "Event" type instances of LogEntry, and put our PEL stuff in the OEM
> property.  It sounds like this is ok with you.  Can you confirm?
> 

On the nose, it sounds ok, but it would be good to see a proposal that's
a little more detailed.  Also, like we talked about this morning, we
need to figure out how to make this work in the long run.

>>>> 3. (Really not preferred) Use one of the other open source Redfish
>>>> servers that supports runtime pluggable endpoints. 
>>>
>>> I guess option 3 prime is we fork bmcweb, and implement pluggable OEM
>>> callbacks there :wink:
>>
>> This was originally listed as option seven, but I realized if you wanted
>> to do this, you would've already, and likely wouldn't be bringing it up
>> on the mailing list.  I'm happy to be proven wrong here that pluggable
>> callbacks could be done in a non-complicated easy to follow way, but
>> every option I've seen makes some really unfortunate tradeoffs in
>> readability, complexity, or performance.
> 
> I don't understand what is so hard here.  Vernon was able to pull this
> off with IPMI...why does this have to be any different (and in the same
> vein, why is the flexibility offered and required in our IPMI core but
> not our Redfish core?)
> 

Flexibility is required in the IPMI core because of its pedigree and
interfaces.  Today, OpenBMC doesn't own or maintain code for our
respective host systems pre-boot, which means that to actually boot a
useful system you need to be able to publish a specific interface
matching what the "old" system did;  Some of that includes OEM commands,
and everyone has implemented them differently.
Redfish isn't encumbered by that baggage (yet).  In all the examples
I've heard about in an OpenBMC context, we're creating something "new",
and don't yet have backward compatibility concerns, which is what makes
it different.  Redfish is also introspectable, which gives clients a way
to understand what features/commands/properties are supported by a given
implementation at runtime, which reduces (but doesn't completely remove)
the need for that level of flexibility.
If someone came in with an incumbent set of Redfish schemas, and they
needed the interfaces to match, that's a very different discussion than
I think we're having now, and it would (likely) have my full support.
In theory that's what I was trying to get at with the part about if it's
in an existing specification.

On the note about Vernon: ask him how difficult it was (and still is) to
be able to pull this interface change off with IPMI.  There were quite a
few gymnastics required, and at this point, we haven't "fixed" the
interface so much as gave a more modern option.  The process of
deprecating the old interface is still in process and will be for a long
time.

>>>> The point here is mostly that all the servers that defined endpoints
>>>> that were "pluggable" the way it was described ended up becoming overly
>>>> complicated, and IMHO lost a lot of battles because of said complexity.
>>>> This is not to say bmcweb is "simple" by any means.
>>>>
>>>> 4. Implement it as an odata endpoint, not necessarily in the Redfish
>>>> tree.  If your goal isn't industry compliance and acceptance, you might
>>>> consider moving a level up, and simply define your endpoints as odata
>>>> endpoints under a different URL tree.  This would depend on your end
>>>> goals, that I don't fully understand at this point.
>>>
>>> This is the closest thing to what I had in mind.  But how is this not a
>>> a pluggable OEM handler?  Are you saying pluggable OEM handlers in
>>> bmcweb are OK as long as the route being handled is outside the /redfish
>>> namespace?
>>
>> AH, I see the confusion.  When I hear "pluggable" I assume that means
>> runtime-pluggable dynamic resolution of plugins and interfaces.  If I
>> understand you correctly, that's not what the "plugin" discussion was.
>> We can certainly enable/disable features using the existing configure
>> mechanisms at compile time.  There are already a dozen or so examples of
>> enabling/disabling features at compile time, including the existing
>> logging implementations.
>> https://github.com/openbmc/bmcweb/blob/424c4176bbbc55c0cfd08f273b7e4500c977a138/CMakeLists.txt#L11
>>
>>
>> We could certainly add another custom URL handler for PEL logs if that's
>> the route you want to go down, although I'd personally still prefer
>> option 2, as we can at least keep it somewhat in the standard.
> 
> Agreed on option #2.  However I still think you should consider runtime
> pluggable dynamic resolution.

None of the features I've heard so far necessitates the use of runtime
discovery, or even fall outside what configurability is available in
bmcweb today.  "runtime pluggable" on an embedded system is a strange
concept, given that all uses I know of today are really just an
extension of compile time plugability, using the rootfs as the medium
for "discovery".  With that said, I'm imagining you're thinking
something like what IPMI has today, which I might be misinterpreting
based on our discussion this morning?

It should be noted, we also have DBus "plugin" capability with the dbus
interface already: anyone can host logs on dbus, and redfish will
populate them.  That option doesn't really get to the core of the OEM
issue though, but is certainly an option in the PEL log case that I
didn't think of right away.

> 
> It sounds like you want everyone to put their implementations of OEM
> properties right next to each other in bmcweb and surround them with
> ifdefs.  Do I have that rightYes, I believe you have that right.

> Shouldn't we allow the OEM to maintain
> their own implementation?  Also, when you (the bmcweb maintainer) look
> at the core bmcweb/redfish code, do you want to be distracted by the
> twenty implementations of an OEM property?

If my goal is to make my changes without breaking any of the other
twenty implementations at the same time, absolutely, I want to be
"distracted" by them.  Also, if I see similarities between interfaces, I
want to be able to reduce/reuse/recycle that code without having to go
across a library boundary.  If they become too distracting to be in the
same file, they can certainly be put in a different file, or organized
in a way that makes sense.

>  Does it make sense for you
> to be the maintainer of code you have zero investment in?

We can definitely both agree that me personally maintaining all Redfish
code is unmaintainable in the long term.  I don't want to be the
maintainer of code that I have no investment in, but I'm not sure how
you came to the "Ed is the only maintainer of bmcweb for all time"
conclusion.  The current maintainer files have provisions for layering
just like the Kernel does.  Long-term, we can split maintainership on
whatever lines are appropriate.

> 
> This is just the reality of the world we live in...  It is precisely why
> we need robust (yes, sometimes complicated, sometimes performance
> impacting, sometimes harder to read) frameworks and abstractions that
> allow us to share and collaborate where it makes sense and to move
> quickly where it does not.

I would argue that the kernel driver interface is a great example of how
this should be done, and handles scales that we could only hope to get
to get to.  The kernel doesn't publish a "stable" driver interface
internally, but does publish a concrete user-facing API.  That's
somewhat what bmcweb has attempted to model in its design;  User facing
code should be able to be concrete, while keeping the internals flexible
enough to make changes as better patterns emerge.

