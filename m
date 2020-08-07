Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D82223F1AA
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 19:07:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNWxZ3LtDzDqvD
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 03:07:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNWwh1C4lzDqQ6
 for <openbmc@lists.ozlabs.org>; Sat,  8 Aug 2020 03:06:27 +1000 (AEST)
IronPort-SDR: LX1ncGEA8KoLXQLbYr63RC8Sn1CFA2cv5cUNCUs/J1unAt6vDSJ2QzHzy9K1/5mnZo9qa5v1D1
 w4V0s8pOLQpA==
X-IronPort-AV: E=McAfee;i="6000,8403,9706"; a="153112261"
X-IronPort-AV: E=Sophos;i="5.75,446,1589266800"; d="scan'208";a="153112261"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2020 10:06:24 -0700
IronPort-SDR: IdYD6p3HEI0C54S3tyXLVXokTbx5Uhd0uHmip1FsIMJVfcCuZvhIikhTbXJrBNthEONiJNcI7g
 qWrLqLdTzTOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,446,1589266800"; d="scan'208";a="333600170"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.209.36.209])
 ([10.209.36.209])
 by orsmga007.jf.intel.com with ESMTP; 07 Aug 2020 10:06:24 -0700
Subject: Re: dbus-sensors:hwmontemp: additional attribute proposal
To: Jason Ling <jasonling@google.com>, Ed Tanous <ed@tanous.net>
References: <CAHBbfcUoAB_nmsaCh2-vAEAjE7Fuu3MNydHLUwBS7zkt7pcPkw@mail.gmail.com>
 <f1b0300f-06ac-c350-8fcc-24eae806cdb2@linux.intel.com>
 <CAHBbfcUXLueZ3MZAP9b38B-fXyrNCMAeZcC7uk8uPrR5gw=3xQ@mail.gmail.com>
 <2bb88ede-4d35-8b9c-936f-be8dc9a453e5@linux.intel.com>
 <CAHBbfcUDMOZjxSvy8wVW_F9f3+NaX-WU3G5PF1oUoRx5VP7ZoQ@mail.gmail.com>
 <CACWQX82KAhmRbg-CYa8+Yjd8mE7qCM_vG_Q1_hYZVR77c3gdtw@mail.gmail.com>
 <CAHBbfcUJGnsW_dxONwjsT=w3ZM453-o0Ubc7DE7oOJQ8u28=ww@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <5a59238b-7653-b11f-701b-039d57dd5b98@linux.intel.com>
Date: Fri, 7 Aug 2020 10:06:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAHBbfcUJGnsW_dxONwjsT=w3ZM453-o0Ubc7DE7oOJQ8u28=ww@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/7/2020 9:54 AM, Jason Ling wrote:
>> What about making the device/type lists in PSUSensors extendable using JSON?
> 
>     Say more about what you're wanting to do here..... 
> 
>   Take 
> https://github.com/openbmc/dbus-sensors/blob/master/src/PSUSensorMain.cpp#L43 and 
> https://github.com/openbmc/dbus-sensors/blob/master/src/PSUSensorMain.cpp#L59 and 
> make it so those can be extended using (for example) without an upstream 
> code change. I picked JSON as the easiest example.
> IIRC PSUSensors does validity checks to make sure that the device emits 
> a name in its 'permit list' (hwmontempsensor is less picky) so tricking 
> PSUSensors into gathering telemetry for a non-public device is tricky.

I feel like this approach already isn't optimal as in reality most 
systems aren't going to have half of those sensors, and you're then 
creating useless matches for things that don't matter to your platform. 
Maybe something like allowing a device to be exported with a different 
keyword other then 'type' in Entity Manager would allow us to just use 
one PSUSensor config type, then your export could be hidden in your EM 
config?


> 
>     Can you give an
>     example of what you would use it for?
> 
> Sure, the primary use case would be
> It's a non public device. Would rather not broadcast information about 
> it or have to obfuscate the device name. Really would rather not 
> maintain patches until the device is made public.
> 
> 
> 
> On Fri, Aug 7, 2020 at 9:39 AM Ed Tanous <ed@tanous.net 
> <mailto:ed@tanous.net>> wrote:
> 
>     On Fri, Aug 7, 2020 at 9:36 AM Jason Ling <jasonling@google.com
>     <mailto:jasonling@google.com>> wrote:
>      >
>      > Slightly different topic:
>      > What about making the device/type lists in PSUSensors extendable
>     using JSON?
>      >
> 
>     Say more about what you're wanting to do here.....  Can you give an
>     example of what you would use it for?
> 
