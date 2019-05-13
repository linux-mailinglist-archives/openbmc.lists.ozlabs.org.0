Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D09A91BC03
	for <lists+openbmc@lfdr.de>; Mon, 13 May 2019 19:33:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452nvw0nyrzDqH6
	for <lists+openbmc@lfdr.de>; Tue, 14 May 2019 03:33:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452nv029sgzDqGN
 for <openbmc@lists.ozlabs.org>; Tue, 14 May 2019 03:32:06 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 May 2019 10:32:02 -0700
X-ExtLoop1: 1
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga006.jf.intel.com with ESMTP; 13 May 2019 10:32:02 -0700
Subject: Re: pid control configuration
To: Patrick Venture <venture@google.com>, Vijay Khemka <vijaykhemka@fb.com>
References: <96A52DC2-7B18-4F69-B8E8-3B489BDA84C6@fb.com>
 <1c5566ba-696e-42eb-c193-22eaca33a1db@intel.com>
 <7D337AEA-CB20-4E39-8A9A-58E21EDA0F31@fb.com>
 <1b82951d-4293-0525-a562-000899544c2e@intel.com>
 <14F05B01-0B7D-44D1-A599-5EDD8CC3A6C8@fb.com>
 <CAO=notzQc2CX9Dx4gjX6HwnuCKnjmD_3ek+tv-XAfO+LxdQ3WA@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <b058940e-ae1b-d238-c9b1-885252ba2464@intel.com>
Date: Mon, 13 May 2019 10:32:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAO=notzQc2CX9Dx4gjX6HwnuCKnjmD_3ek+tv-XAfO+LxdQ3WA@mail.gmail.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/13/19 9:32 AM, Patrick Venture wrote:
> On Fri, May 10, 2019 at 2:21 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>>
>>
>>
>> ﻿On 5/6/19, 9:20 AM, "Ed Tanous" <ed.tanous@intel.com> wrote:
>>
>>     On 5/2/19 4:24 PM, Vijay Khemka wrote:
>>     >  My understanding here is pid data are only defined for temp sensors which will generate pwm values for fan.
>>     >
>>
>>     The above is not how phosphor pid control operates.  The temperature
>>     controllers "request" a given fan RPM, then the fan PID controller
>>     (which is scanned much more quickly than the temperature controllers)
>>     attempts to drive the fan to that speed.  This ends up being a two stage
>>     feedback loop that can perform better than a single PID loop.
>>
>> Ed, we are not using cascade control here in facebook. We only use outer loop which gives data for fan to drive.
>> Is it possible to still run Phosphor pid controller with single loop?
> 
> Your cascade PID could be a pass-through -- so that it receives the
> set-point from the sensor PID and then just sets it directly within
> that loop..  It may require a new PID controller that is just a
> pass-through to explicitly exist -- i haven't dove into
> phosphor-pid-control in a while, but you probably need to write a
> basically empty PID controller object type.
> 

+1  That is an option for you.

>>
>> Regards
>> -Vijay
>>
