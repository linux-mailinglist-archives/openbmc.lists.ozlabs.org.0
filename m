Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35471DBA20
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 01:26:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vQKK3g6bzDq9Q
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 10:26:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vQJL0QgwzDqcc
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 10:25:37 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Oct 2019 16:25:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,309,1566889200"; d="scan'208";a="347915736"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga004.jf.intel.com with ESMTP; 17 Oct 2019 16:25:33 -0700
Received: from [10.241.245.161] (unknown [10.241.245.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 962B758049A
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 16:25:33 -0700 (PDT)
Subject: Re: x86-power-control
To: openbmc@lists.ozlabs.org
References: <EA590716-271A-4F5C-9B36-80260B7F35B6@fb.com>
 <66afaaab-baee-fc02-371b-2ef4a9f0d1ee@linux.intel.com>
 <37843B68-8D1C-48EB-B4B6-64CBC8F62F77@fb.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <79190494-f452-286b-e304-7a901a3db26c@linux.intel.com>
Date: Thu, 17 Oct 2019 16:25:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <37843B68-8D1C-48EB-B4B6-64CBC8F62F77@fb.com>
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



On 10/17/2019 3:32 PM, Vijay Khemka wrote:
> 
> ﻿On 10/17/19, 9:03 AM, "openbmc on behalf of Bills, Jason M" <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org on behalf of jason.m.bills@linux.intel.com> wrote:
> 
>      Hi Vijay
>      
>      On 10/16/2019 6:13 PM, Vijay Khemka wrote:
>      > One more question on code, I see following code requires powerButtonMask
>      > to be set before aquiring GPIO line. Please let me know who sets this
>      > powerButtonMask to true. I know this is related to GPIO passthrough but
>      > still couldn’t understand where in code it gets set until someone call
>      > set-property of dbus.
>      
>      powerButtonMask is a gpiod::line object that returns true if it
>      references a GPIO line and false otherwise.
> 
> I understood code but my point here is there will not be any
> gpiod::line object if powerButtonMask is defined as false. And
> initially it is defined as false means tehre will not be any line
> object created until someone sets it to true. And I don't see it
> any way to set it true other than set-property through dbus.

That's correct.  Masking the power button is something that is done by 
some component outside of power-control.

For example, we currently use it with the Set Front Panel Button Enables 
IPMI command to enable/disable the power button.  So, it is only masked 
when requested.

The actual "POWER_OUT" line for power-control is not permanently 
created, but is asserted using temporary calls like this one:
setGPIOOutputForMs("POWER_OUT", 0, powerPulseTimeMs);

https://github.com/openbmc/x86-power-control/blob/master/power-control-x86/src/power_control.cpp#L946

>      
>      >
>      > power_control::powerButtonIface->register_property(
>      >
>      > "ButtonMasked", false, [](constboolrequested, bool& current) {
>      >
>      > if(requested)
>      >
>      > {
>      >
>      > if(power_control::powerButtonMask)
>      >
>      > {
>      This will return if powerButtonMask already references a GPIO.
>      
>      >
>      > return1;
>      >
>      > }
>      >
>      > if(!power_control::setGPIOOutput(
>      >
>      > "POWER_OUT", 1, power_control::powerButtonMask))
>      Otherwise, this will request the "POWER_OUT" GPIO and assign it to
>      powerButtonMask (which will make it return true).
>      
>      >
>      > {
>      >
>      > throwstd::runtime_error("Failed to request GPIO");
>      >
>      > return0;
>      >
>      > }
>      >
>      > std::cerr << "Power Button Masked.\n";
>      >
>      > }
>      >
>      > else
>      >
>      > {
>      >
>      > if(!power_control::powerButtonMask)
>      >
>      > {
>      This will return if powerButtonMask does not reference a GPIO line.
>      
>      >
>      > return1;
>      >
>      > }
>      >
>      > std::cerr << "Power Button Un-masked\n";
>      >
>      > power_control::powerButtonMask.reset();
>      Otherwise this will reset powerButtonMask to release the "POWER_OUT"
>      GPIO (which will make it return false).
>      
>      >
>      > }
>      >
>      > Regards
>      >
>      > -Vijay
>      >
>      
> 
