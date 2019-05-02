Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E569E12140
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 19:48:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44w2mg49b0zDqND
	for <lists+openbmc@lfdr.de>; Fri,  3 May 2019 03:48:19 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44w2lN1DPBzDq8v
 for <openbmc@lists.ozlabs.org>; Fri,  3 May 2019 03:47:11 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Thu, 2 May 2019 13:47:56 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ed Tanous <ed.tanous@intel.com>
Subject: Re: Redfish OEM commands in OpenBMC
Message-ID: <20190502174756.iphbts62ttebgq63@thinkpad.dyn.fuzziesquirrel.com>
References: <CALLMt=qEtkfBwBcV1WzsGuCozyT1Fs8+1d+nUPPScxq1ZpihJQ@mail.gmail.com>
 <5978896f-712d-a2b7-3f94-3a23e7a86003@intel.com>
 <20190423135100.aelbc4w2np4lepjc@thinkpad.dyn.fuzziesquirrel.com>
 <060e7ffe-6953-c66b-483a-4600b64c7556@intel.com>
 <20190423175218.fe6rmtxrqrq35pu2@thinkpad.dyn.fuzziesquirrel.com>
 <488e0e73-76d0-977e-6f20-ff91e35f6cfa@intel.com>
 <20190424181851.fzfkef4ycqy3yuws@thinkpad.dyn.fuzziesquirrel.com>
 <36d7934c-4870-8ed9-a61f-a4fe69a6e76b@intel.com>
 <20190501180547.kzgnxxsfv2tkgr6x@thinkpad.dyn.fuzziesquirrel.com>
 <b1c7f041-66ed-f4ba-97fd-39269ea0221d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
In-Reply-To: <b1c7f041-66ed-f4ba-97fd-39269ea0221d@intel.com>
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

On Thu, May 02, 2019 at 09:09:08AM -0700, Ed Tanous wrote:
>On 5/1/19 11:05 AM, Brad Bishop wrote:
>> On Mon, Apr 29, 2019 at 10:32:36AM -0700, Ed Tanous wrote:
>>
>>> On the nose, it sounds ok, but it would be good to see a proposal
>>> that's a little more detailed.=A0
>> I put a proposal here:
>> https://lists.ozlabs.org/pipermail/openbmc/2019-April/016126.html
>>
>>>> Agreed on option #2.=A0 However I still think you should consider
>>>> runtime pluggable dynamic resolution.
>>>
>>> None of the features I've heard so far necessitates the use of runtim=
e
>>> discovery, or even fall outside what configurability is available in
>>> bmcweb today.=A0 "runtime pluggable" on an embedded system is a stran=
ge
>>> concept, given that all uses I know of today are really just an
>>> extension of compile time plugability, using the rootfs as the medium
>>> for "discovery".=A0 With that said, I'm imagining you're thinking
>>> something like what IPMI has today, which I might be misinterpreting
>>> based on our discussion this morning?
>> Yes, this is what I was thinking.=A0 I agree with you that we don't ha=
ve
>> features that require the use of runtime discovery.=A0 My reasoning is
>> rooted in concerns around code maintanence and adoption.
>>
>> maintanence:=A0 I don't think code with a bunch of #ifdefs is desired =
or
>> readable.=A0 It might not be too bad starting out.
>
>I think the above statement would be a lot more productive if you had a
>patchset that removed some of the existing ifdefs, so we can see what
>you're thinking. =20
Haha now you are asking me to do real work, so its time for me to drop
the point.

>> adoption:=A0 Do you recall how one of Michael Brown's issues with bmcw=
eb
>> was that there wasn't "any way to extend or replace functions without
>> forking the codebase?"=A0 I believe this is exactly what he was talkin=
g
>> about.=A0 I suspect he didn't even consider compile time plugins becau=
se
>> in my experience maintaining codebases structured that way is painful.
>
>I do recall, and I recall his attempted solution to it with go-redfish
>was difficult to understand and modify, and had some CPU usage penalties
>due to its caching and plugin requirements.  If plugins met the exact
>intent of what the framework intended them to do, then it functioned
>just fine, but the minute it reached past what the interface was able to
>define, things got very complicated very quickly IMHO.
>With respect to that, the primary goal of that plugin interface was an
>issue that I don't think OpenBMC cares about: the ability to take
>OpenBMC components (in this case redfish) and integrate them into
>private, non-OpenBMC codebases.  If you're integrating with a private
>codebase, you're forking either way.
I don't understand "non-OpenBMC codebase."  How many lines of code does
one have to change before a fork is no longer an OpenBMC codebase?

I also don't understand how "OpenBMC" can care about something.  OpenBMC
is me, you, IBM, Intel, and whole host of others that all care about
lots of different, conflicting even, things.

If we structure the code in such a way that it enables product teams
with "non-OpenBMC codebases" to make use of and therefore have a
motivation to contribute back to and share in the development and
maintanence burden of the shared pieces of code then that is something
that I very much care about.

>> This thread raises an important design point or "community norm" being
>> established for OpenBMC.=A0 IMO it has the potential to impact
>> participation rates and cost of maintanence in the future.=A0 It would=
 be
>> nice to get some opinions from more than just two people.=A0 Anyone ca=
re
>> to chime in?
>>
>Agreed, would love to hear more opinions on this.
