Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA48EDCD37
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 20:01:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vv3l3bm2zDqlW
	for <lists+openbmc@lfdr.de>; Sat, 19 Oct 2019 05:01:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vv2x0GPWzDqhk
 for <openbmc@lists.ozlabs.org>; Sat, 19 Oct 2019 05:00:39 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Oct 2019 11:00:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,312,1566889200"; d="scan'208";a="190438485"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 18 Oct 2019 11:00:20 -0700
Received: from [10.255.64.186] (jmbills-mobl.amr.corp.intel.com
 [10.255.64.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id AE702580107
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 11:00:19 -0700 (PDT)
Subject: Re: x86-power-control
To: openbmc@lists.ozlabs.org
References: <EA590716-271A-4F5C-9B36-80260B7F35B6@fb.com>
 <66afaaab-baee-fc02-371b-2ef4a9f0d1ee@linux.intel.com>
 <37843B68-8D1C-48EB-B4B6-64CBC8F62F77@fb.com>
 <79190494-f452-286b-e304-7a901a3db26c@linux.intel.com>
 <8F55F038-A6E7-46A4-8C27-93C738AFEBDC@fb.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <5d43146c-b8b9-164e-ed54-33df4bae6dce@linux.intel.com>
Date: Fri, 18 Oct 2019 11:00:18 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8F55F038-A6E7-46A4-8C27-93C738AFEBDC@fb.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 10/17/2019 4:52 PM, Vijay Khemka wrote:
> 
> 
> ﻿On 10/17/19, 4:27 PM, "openbmc on behalf of Bills, Jason M" <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org on behalf of jason.m.bills@linux.intel.com> wrote:
> 
>      
>      
>      On 10/17/2019 3:32 PM, Vijay Khemka wrote:
>      >
>      > On 10/17/19, 9:03 AM, "openbmc on behalf of Bills, Jason M" <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org on behalf of jason.m.bills@linux.intel.com> wrote:
>      >
>      >      Hi Vijay
>      >
>      >      On 10/16/2019 6:13 PM, Vijay Khemka wrote:
>      >      > One more question on code, I see following code requires powerButtonMask
>      >      > to be set before aquiring GPIO line. Please let me know who sets this
>      >      > powerButtonMask to true. I know this is related to GPIO passthrough but
>      >      > still couldn’t understand where in code it gets set until someone call
>      >      > set-property of dbus.
>      >
>      >      powerButtonMask is a gpiod::line object that returns true if it
>      >      references a GPIO line and false otherwise.
>      >
>      > I understood code but my point here is there will not be any
>      > gpiod::line object if powerButtonMask is defined as false. And
>      > initially it is defined as false means tehre will not be any line
>      > object created until someone sets it to true. And I don't see it
>      > any way to set it true other than set-property through dbus.
>      
>      That's correct.  Masking the power button is something that is done by
>      some component outside of power-control.
>      
>      For example, we currently use it with the Set Front Panel Button Enables
>      IPMI command to enable/disable the power button.  So, it is only masked
>      when requested.
> So to use x-86-power-control, either we need to have IPMI command to enable
> this or some other daemon has to set this property. Can we have this feature
> optional. I guess this is a prt og GPIO passthrough.

Yes, this is part of GPIO passthrough.  When the GPIO is requested, 
passthrough is disabled in the pinctrl driver.  So, to mask the power 
button (disable passthrough), power-control requests and holds the 
"POWER_OUT" GPIO line.

It should behave normally without this property ever getting set.

>      
>      The actual "POWER_OUT" line for power-control is not permanently
>      created, but is asserted using temporary calls like this one:
>      setGPIOOutputForMs("POWER_OUT", 0, powerPulseTimeMs);
> 
> This function will not run power on/off sequence until button mask is set. It
> Will only set GPIO value which is not enough for powering on/off.

Something else is going on, here.  The powerButtonMask is a separate 
feature from driving the "POWER_OUT" pin.  If powerButtonMask is not 
set, then the power on/off should function normally.  There is a special 
case in the setGPIOOutputForMs() code to handle when "POWER_OUT" is 
driven while powerButtonMask is true:

     // If the requested GPIO is masked, use the mask line to set the output
     if (powerButtonMask && name == "POWER_OUT")
     {
         return setMaskedGPIOOutputForMs(powerButtonMask, name, value,
                                         durationMs);
     }
     ...
     // No mask set, so request and set the GPIO normally

So, "POWER_OUT" should work either way, but the default behavior is to 
function without powerButtonMask set.  Are you seeing failures on your 
platform when powerButtonMask is false?
