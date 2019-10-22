Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A31E0B1A
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 19:56:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yLmg0n7qzDqK5
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 04:56:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yLlz3xD1zDqDS
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 04:56:13 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 10:56:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,217,1569308400"; d="scan'208";a="372612992"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga005.jf.intel.com with ESMTP; 22 Oct 2019 10:56:11 -0700
Subject: Re: x86-power-control
To: Vijay Khemka <vijaykhemka@fb.com>,
 "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <EA590716-271A-4F5C-9B36-80260B7F35B6@fb.com>
 <66afaaab-baee-fc02-371b-2ef4a9f0d1ee@linux.intel.com>
 <37843B68-8D1C-48EB-B4B6-64CBC8F62F77@fb.com>
 <79190494-f452-286b-e304-7a901a3db26c@linux.intel.com>
 <8F55F038-A6E7-46A4-8C27-93C738AFEBDC@fb.com>
 <5d43146c-b8b9-164e-ed54-33df4bae6dce@linux.intel.com>
 <F590F665-9327-4C8D-8C23-C317DA71D7F0@fb.com>
 <54c375be-e45e-fc2a-dd31-6c9d61158169@linux.intel.com>
 <6DA89556-AD25-4BEE-AF40-9D7A129B7CB9@fb.com>
 <548712d2-820b-7c20-f05e-fbd80ab38c62@linux.intel.com>
 <4230479D-77FD-4073-B478-2D0B34C2927A@fb.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <286a9c11-565f-35f7-bdd6-2099e926bf5a@linux.intel.com>
Date: Tue, 22 Oct 2019 10:56:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <4230479D-77FD-4073-B478-2D0B34C2927A@fb.com>
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

On 10/22/19 10:46 AM, Vijay Khemka wrote:
> 
> 
> ﻿On 10/22/19, 10:16 AM, "openbmc on behalf of Bills, Jason M" <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org on behalf of jason.m.bills@linux.intel.com> wrote:
> 
>      
>      
>      On 10/21/2019 6:15 PM, Vijay Khemka wrote:
>      >
>      >
>      > On 10/21/19, 4:04 PM, "Bills, Jason M" <jason.m.bills@linux.intel.com> wrote:
>      >
>      >
>      >
>      >      On 10/18/2019 4:04 PM, Vijay Khemka wrote:
>      >      >
>      >      >
>      >      > On 10/18/19, 11:02 AM, "openbmc on behalf of Bills, Jason M" <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org on behalf of jason.m.bills@linux.intel.com> wrote:
>      >      >
>      >      >
>      >      >
>      >      >      On 10/17/2019 4:52 PM, Vijay Khemka wrote:
>      >      >      >
>      >      >      >
>      >      >      > On 10/17/19, 4:27 PM, "openbmc on behalf of Bills, Jason M" <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org on behalf of jason.m.bills@linux.intel.com> wrote:
>      >      >      >
>      >      >      >
>      >      >      >
>      >      >      >      On 10/17/2019 3:32 PM, Vijay Khemka wrote:
>      >      >      >      >
>      >      >      >      > On 10/17/19, 9:03 AM, "openbmc on behalf of Bills, Jason M" <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org on behalf of jason.m.bills@linux.intel.com> wrote:
>      >      >      >      >
>      >      >      >      >      Hi Vijay
>      >      >      >      >
>      >      >      >      >      On 10/16/2019 6:13 PM, Vijay Khemka wrote:
>      >      >      >      >      > One more question on code, I see following code requires powerButtonMask
>      >      >      >      >      > to be set before aquiring GPIO line. Please let me know who sets this
>      >      >      >      >      > powerButtonMask to true. I know this is related to GPIO passthrough but
>      >      >      >      >      > still couldn’t understand where in code it gets set until someone call
>      >      >      >      >      > set-property of dbus.
>      >      >      >      >
>      >      >      >      >      powerButtonMask is a gpiod::line object that returns true if it
>      >      >      >      >      references a GPIO line and false otherwise.
>      >      >      >      >
>      >      >      >      > I understood code but my point here is there will not be any
>      >      >      >      > gpiod::line object if powerButtonMask is defined as false. And
>      >      >      >      > initially it is defined as false means tehre will not be any line
>      >      >      >      > object created until someone sets it to true. And I don't see it
>      >      >      >      > any way to set it true other than set-property through dbus.
>      >      >      >
>      >      >      >      That's correct.  Masking the power button is something that is done by
>      >      >      >      some component outside of power-control.
>      >      >      >
>      >      >      >      For example, we currently use it with the Set Front Panel Button Enables
>      >      >      >      IPMI command to enable/disable the power button.  So, it is only masked
>      >      >      >      when requested.
>      >      >      > So to use x-86-power-control, either we need to have IPMI command to enable
>      >      >      > this or some other daemon has to set this property. Can we have this feature
>      >      >      > optional. I guess this is a prt og GPIO passthrough.
>      >      >
>      >      >      Yes, this is part of GPIO passthrough.  When the GPIO is requested,
>      >      >      passthrough is disabled in the pinctrl driver.  So, to mask the power
>      >      >      button (disable passthrough), power-control requests and holds the
>      >      >      "POWER_OUT" GPIO line.
>      >      >
>      >      >      It should behave normally without this property ever getting set.
>      >      >
>      >      >      >
>      >      >      >      The actual "POWER_OUT" line for power-control is not permanently
>      >      >      >      created, but is asserted using temporary calls like this one:
>      >      >      >      setGPIOOutputForMs("POWER_OUT", 0, powerPulseTimeMs);
>      >      >      >
>      >      >      > This function will not run power on/off sequence until button mask is set. It
>      >      >      > Will only set GPIO value which is not enough for powering on/off.
>      >      >
>      >      >      Something else is going on, here.  The powerButtonMask is a separate
>      >      >      feature from driving the "POWER_OUT" pin.  If powerButtonMask is not
>      >      >      set, then the power on/off should function normally.  There is a special
>      >      >      case in the setGPIOOutputForMs() code to handle when "POWER_OUT" is
>      >      >      driven while powerButtonMask is true:
>      >      >
>      >      >           // If the requested GPIO is masked, use the mask line to set the output
>      >      >           if (powerButtonMask && name == "POWER_OUT")
>      >      >           {
>      >      >               return setMaskedGPIOOutputForMs(powerButtonMask, name, value,
>      >      >                                               durationMs);
>      >      >           }
>      >      >           ...
>      >      >           // No mask set, so request and set the GPIO normally
>      >      >
>      >      >      So, "POWER_OUT" should work either way, but the default behavior is to
>      >      >      function without powerButtonMask set.  Are you seeing failures on your
>      >      >      platform when powerButtonMask is false?
>      >      >
>      >      > No, It is not working because it simplpy sets power_out to '0'. But to power on
>      >      > it should got down as 0 and come back to 1 after a delay. Which happens only
>      >      > in case of powerButtonMask set to true. I guess we may need to fix this.
>      >
>      >      Ahh, okay.  I think I see the issue now.
>      >
>      >      The issue is that because releasing the GPIO on a system with
>      >      pass-through, sets the power button back to the hardware default
>      >      automatically, the software setting doesn't matter, so it is left at 0.
>      >
>      >      If you don't need to keep holding the GPIO line for POWER_OUT, I think
>      >      you can just add the code to revert the POWER_OUT value when the timer
>      >      expires.
>      >
>      >      Take this line:
>      >                   // Set the masked GPIO line back to the opposite value
>      >                   maskedGPIOLine.set_value(!value);
>      >       From here:
>      >      https://github.com/openbmc/x86-power-control/blob/master/power-control-x86/src/power_control.cpp#L891
>      >
>      >      And add it here:
>      >      https://github.com/openbmc/x86-power-control/blob/master/power-control-x86/src/power_control.cpp#L932
>      >
>      > I already did that as a work around, testing different scenario. Will send patch once I see it working.
>      >
>      > I also want to make these timeout values as configurable, either I can add these as a property in dbus interface or
>      > Entity-manager or have a separate config json file. What would you prefer.
>      Another option that may be simpler is to move the values that you want
>      to configure out to a header file and then override the header in a
>      bbappend.  Then you don't need to read or parse any additional
>      configuration information at run time.
>      
> I can do that but bbappend for patch is not accepted in any repository.

Don't patch, simply copy over your new header into the correct directory 
in a do_configure_prepend (I think that's the right yocto step to 
overwrite, but I might be off).

>      >
>      >
>      >      >
>      >      >
>      >
>      >
>      
> 
