Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB5F23F210
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 19:41:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNXjT3hhszDqhY
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 03:41:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNXhT6933zDqc8
 for <openbmc@lists.ozlabs.org>; Sat,  8 Aug 2020 03:40:57 +1000 (AEST)
IronPort-SDR: xDHBPJql+kN9c+4GyeKsBNd7eCwJPIpi13LrmlXMPsRaOv+i0Sl8Q9Pk2pJH3kRGopLhDuMSFY
 XjtPfEMt1/BQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9706"; a="214698579"
X-IronPort-AV: E=Sophos;i="5.75,446,1589266800"; d="scan'208";a="214698579"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2020 10:40:54 -0700
IronPort-SDR: 5uxk5uc2qX8hBHgLTsnBmxyxBO/aDkcaCJyuK+vGYisfdB4zOxHRl/kFSiLkQBSmuoaPGqVRyB
 Qm2Fn5qHRkKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,446,1589266800"; d="scan'208";a="333609071"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.209.36.209])
 ([10.209.36.209])
 by orsmga007.jf.intel.com with ESMTP; 07 Aug 2020 10:40:53 -0700
Subject: Re: dbus-sensors:hwmontemp: additional attribute proposal
To: Jason Ling <jasonling@google.com>
References: <CAHBbfcUoAB_nmsaCh2-vAEAjE7Fuu3MNydHLUwBS7zkt7pcPkw@mail.gmail.com>
 <f1b0300f-06ac-c350-8fcc-24eae806cdb2@linux.intel.com>
 <CAHBbfcUXLueZ3MZAP9b38B-fXyrNCMAeZcC7uk8uPrR5gw=3xQ@mail.gmail.com>
 <2bb88ede-4d35-8b9c-936f-be8dc9a453e5@linux.intel.com>
 <CAHBbfcUDMOZjxSvy8wVW_F9f3+NaX-WU3G5PF1oUoRx5VP7ZoQ@mail.gmail.com>
 <CACWQX82KAhmRbg-CYa8+Yjd8mE7qCM_vG_Q1_hYZVR77c3gdtw@mail.gmail.com>
 <CAHBbfcUJGnsW_dxONwjsT=w3ZM453-o0Ubc7DE7oOJQ8u28=ww@mail.gmail.com>
 <5a59238b-7653-b11f-701b-039d57dd5b98@linux.intel.com>
 <CAHBbfcXRO5ZB3S0T6SyRkWkLLAruKPdS8UhUkyG3qssU5YkHNw@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <9deda21d-aa01-d15e-464e-7ab0fb2f751c@linux.intel.com>
Date: Fri, 7 Aug 2020 10:40:53 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAHBbfcXRO5ZB3S0T6SyRkWkLLAruKPdS8UhUkyG3qssU5YkHNw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/7/2020 10:17 AM, Jason Ling wrote:
>       feel like this approach already isn't optimal as in reality most
>     systems aren't going to have half of those sensors, and you're then
>     creating useless matches for things that don't matter to your platform.
> 
> I'm assuming that you're referring to the general approach of PSUSensors 
> and not referring to extending the list using a config file?
> If so then I agree.
> I'm also a bit confused about scanning every hwmon attribute on the 
> system and seeing if has a name that is in the permit list..then seeing 
> if it has an appropriate configuration. Why not just grab the 
> configuration and using that information navigate to the appropriate 
> hwmon path and take what is there? (Why even bother with validating the 
> driver name?) . Any context would be helpful; I'm trying to grok the design.
> 
>     Maybe something like allowing a device to be exported with a different
>     keyword other then 'type' in Entity Manager would allow us to just use
>     one PSUSensor config type, then your export could be hidden in your EM
>     config?
> 
> Sure, or maybe a catchall type for something PSUSensor can consume (and 
> bypass the name check?)

Yeah that's what I meant, a generic PSUSensor Type with a field called 
'Export' or something that EM can use to get the Export type.

> 
> On Fri, Aug 7, 2020 at 10:06 AM James Feist <james.feist@linux.intel.com 
> <mailto:james.feist@linux.intel.com>> wrote:
> 
>     On 8/7/2020 9:54 AM, Jason Ling wrote:
>      >> What about making the device/type lists in PSUSensors extendable
>     using JSON?
>      >
>      >     Say more about what you're wanting to do here.....
>      >
>      >   Take
>      >
>     https://github.com/openbmc/dbus-sensors/blob/master/src/PSUSensorMain.cpp#L43 and
> 
>      >
>     https://github.com/openbmc/dbus-sensors/blob/master/src/PSUSensorMain.cpp#L59 and
> 
>      > make it so those can be extended using (for example) without an
>     upstream
>      > code change. I picked JSON as the easiest example.
>      > IIRC PSUSensors does validity checks to make sure that the device
>     emits
>      > a name in its 'permit list' (hwmontempsensor is less picky) so
>     tricking
>      > PSUSensors into gathering telemetry for a non-public device is
>     tricky.
> 
>     I feel like this approach already isn't optimal as in reality most
>     systems aren't going to have half of those sensors, and you're then
>     creating useless matches for things that don't matter to your platform.
>     Maybe something like allowing a device to be exported with a different
>     keyword other then 'type' in Entity Manager would allow us to just use
>     one PSUSensor config type, then your export could be hidden in your EM
>     config?
> 
> 
>      >
>      >     Can you give an
>      >     example of what you would use it for?
>      >
>      > Sure, the primary use case would be
>      > It's a non public device. Would rather not broadcast information
>     about
>      > it or have to obfuscate the device name. Really would rather not
>      > maintain patches until the device is made public.
>      >
>      >
>      >
>      > On Fri, Aug 7, 2020 at 9:39 AM Ed Tanous <ed@tanous.net
>     <mailto:ed@tanous.net>
>      > <mailto:ed@tanous.net <mailto:ed@tanous.net>>> wrote:
>      >
>      >     On Fri, Aug 7, 2020 at 9:36 AM Jason Ling
>     <jasonling@google.com <mailto:jasonling@google.com>
>      >     <mailto:jasonling@google.com <mailto:jasonling@google.com>>>
>     wrote:
>      >      >
>      >      > Slightly different topic:
>      >      > What about making the device/type lists in PSUSensors
>     extendable
>      >     using JSON?
>      >      >
>      >
>      >     Say more about what you're wanting to do here.....  Can you
>     give an
>      >     example of what you would use it for?
>      >
> 
