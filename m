Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7638014F526
	for <lists+openbmc@lfdr.de>; Sat,  1 Feb 2020 00:16:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 488Y5F0mWdzDqhF
	for <lists+openbmc@lfdr.de>; Sat,  1 Feb 2020 10:16:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 488Y4c0W90zDqfs
 for <openbmc@lists.ozlabs.org>; Sat,  1 Feb 2020 10:16:14 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 15:16:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,387,1574150400"; d="scan'208";a="233624323"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga006.jf.intel.com with ESMTP; 31 Jan 2020 15:16:11 -0800
Received: from [10.241.246.17] (unknown [10.241.246.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3986D58043A;
 Fri, 31 Jan 2020 15:16:11 -0800 (PST)
Subject: Re: power button override
To: Vijay Khemka <vijaykhemka@fb.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <98EE6AEE-9440-4AA5-971A-833EA0342226@fb.com>
 <d01cf897-0c23-35dc-5f81-aca67d31b98a@linux.intel.com>
 <0017A7FA-E86C-4524-B53B-9129A968C7DB@fb.com>
 <563c3b07-d5f5-1897-404b-ceb97f713610@linux.intel.com>
 <1b72ee84-6ad3-f5bb-bfed-2f6487893f59@linux.intel.com>
 <3AC1554A-4B97-45CA-BDE2-299AD172A9FD@fb.com>
 <698a1a8e-786e-3713-4b94-da7cf7864406@linux.intel.com>
 <01CE1094-7B1C-44F5-8580-C0098391EA6F@fb.com>
 <da001fe8-31f4-4343-a711-a91e44c0a22c@linux.intel.com>
 <A81FB058-4102-4774-B238-2C5484BCF938@fb.com>
 <65B9F3C8-1066-449B-B0AE-928ED1455687@fb.com>
 <0e9dbc2f-3dba-ebb7-4acc-28b43cf4e480@linux.intel.com>
 <72D25FAF-9E04-4459-90C5-910AD4E59B9D@fb.com>
 <874c4922-5d73-bcb3-5594-0f3bd36c4fee@linux.intel.com>
 <5C6D5FE2-C4FF-49F7-91E7-58FF3EA10CFA@fb.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <ed3a6d14-13dc-2ab2-b52d-c19c24765c5b@linux.intel.com>
Date: Fri, 31 Jan 2020 15:16:11 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5C6D5FE2-C4FF-49F7-91E7-58FF3EA10CFA@fb.com>
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



On 1/31/2020 2:53 PM, Vijay Khemka wrote:
> 
> 
> ﻿On 1/31/20, 2:41 PM, "Bills, Jason M" <jason.m.bills@linux.intel.com> wrote:
> 
>      
>      
>      On 1/30/2020 1:38 PM, Vijay Khemka wrote:
>      >
>      >
>      > On 1/30/20, 1:10 PM, "Bills, Jason M" <jason.m.bills@linux.intel.com> wrote:
>      >
>      >
>      >
>      >      On 1/30/2020 10:53 AM, Vijay Khemka wrote:
>      >      > And it is inconsistent as 2 times works out of 5 time loop with 30 second delay.
>      >      >
>      >      > Regards
>      >      > -Vijay
>      >      >
>      >      > On 1/30/20, 10:49 AM, "Vijay Khemka" <vijaykhemka@fb.com> wrote:
>      >      >
>      >      >      Hi Jason,
>      >      >      The problem I am seeing as I am unable to send reset ipmi command to ME via IPMB on i2c bus. I tried to give 30 second delay after power off and setting in ME recovery mode. Once I do force poweroff then only I am able to send any command to ME. I don't know what is the relation of power to ME access on i2c bus.
>      >      I have been told that this is not expected behavior and that you can
>      >      file an IPS ticket for support.
>      >
>      >      The biggest issue with force poweroff using the power button while the
>      >      system is off is that it will first start booting the system then
>      >      immediately shut it down which is not desired behavior.
>      >
>      >      What happens if you try to power on in the failure?  Will it go to the
>      >      On state where you can issue a ForceOff?
>      >
>      > No, this is also intermittent. And sometimes it powers on and sometimes it gets stuck on TransitionToOnFailed. This is very dangerous state as no power command works after this, not even poweroff. Then I have to leave a system for some time and try many other things or sled cycle the system.
>      
>      Vijay,
>      
>      Will this change help fix the issue you are seeing?
>      
>      diff --git a/power-control-x86/src/power_control.cpp
>      b/power-control-x86/src/power_control.cpp
>      index 20ea9cd..eecc10a 100644
>      --- a/power-control-x86/src/power_control.cpp
>      +++ b/power-control-x86/src/power_control.cpp
>      @@ -1518,6 +1518,10 @@ static void powerStateOff(const Event event)
>                    setPowerState(PowerState::waitForPSPowerOK);
>                    powerOn();
>                    break;
>      +        case Event::powerOffRequest:
>      +            setPowerState(PowerState::transitionToOff);
>      +            forcePowerOff();
>      +            break;
>                default:
>                    std::cerr << "No action taken.\n";
>                    break;
>     
>      This adds support for powerOffRequest to the Off state.  So even when
>      the host is off, the force off command will still hold the power button
>      until the power good signal deasserts (on my system it asserts followed
>      by a deassert).  This will more closely follow the Chassis.State
>      definition of allowing a Chassis.Off request even while the Host.State
>      is Off.
> 
> You don't get deassert signal as it is already deasserted by previous power off.
> Currently I have abandoned my patch. But following change would help
it doesn't assert again when the power button is pressed at the start of 
forcePowerOff()?
> 
> --- a/power-control-x86/src/power_control.cpp
> +++ b/power-control-x86/src/power_control.cpp
> @@ -1470,6 +1470,10 @@ static void powerStateFailedTransitionToOn(const Event event)
>               setPowerState(PowerState::waitForPSPowerOK);
>               powerOn();
>               break;
> +        case Event::powerOffRequest:
> +            setPowerState(PowerState::off);
> +            forcePowerOff();
> +            break;
>           default:
>               std::cerr << "No action taken.\n";
>               break;
> @@ -1496,6 +1500,9 @@ static void powerStateOff(const Event event)
>               setPowerState(PowerState::waitForPSPowerOK);
>               powerOn();
>               break;
> +        case Event::powerOffRequest:
> +            forcePowerOff();
> +            break;
My concern with this is there is nothing to cancel the timer to release 
the power button so it will be held for the full 15-second timeout 
followed by the failure handling.

There would have to be some event to indicate that the power button has 
been held long enough and can be released.  Currently that is power good 
deasserting.

>           default:
>               std::cerr << "No action taken.\n";
>               break;
> 
> Regards
> -Vijay
>      
>      >
>      >      Thanks,
>      >      -Jason
>      >
>      >      >
>      >      >      Regards
>      >      >      -Vijay
>      >      >
>      >      >      On 1/28/20, 12:50 PM, "Bills, Jason M" <jason.m.bills@linux.intel.com> wrote:
>      >      >
>      >      >
>      >      >
>      >      >          On 1/27/2020 12:31 PM, Vijay Khemka wrote:
>      >      >          >
>      >      >          >
>      >      >          > On 1/27/20, 10:52 AM, "Bills, Jason M" <jason.m.bills@linux.intel.com> wrote:
>      >      >          >
>      >      >          >
>      >      >          >
>      >      >          >      On 1/24/2020 2:01 PM, Vijay Khemka wrote:
>      >      >          >      >
>      >      >          >      >
>      >      >          >      > On 1/24/20, 1:13 PM, "openbmc on behalf of Bills, Jason M" <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org on behalf of jason.m.bills@linux.intel.com> wrote:
>      >      >          >      >
>      >      >          >      >
>      >      >          >      >
>      >      >          >      >      On 1/24/2020 12:55 PM, Bills, Jason M wrote:
>      >      >          >      >      >
>      >      >          >      >      >
>      >      >          >      >      > On 1/24/2020 10:29 AM, Vijay Khemka wrote:
>      >      >          >      >      >>
>      >      >          >      >      >>
>      >      >          >      >      >> On 1/23/20, 4:36 PM, "Bills, Jason M" <jason.m.bills@linux.intel.com>
>      >      >          >      >      >> wrote:
>      >      >          >      >      >>
>      >      >          >      >      >>      On 1/23/2020 4:13 PM, Vijay Khemka wrote:
>      >      >          >      >      >>      > Hi Jason,
>      >      >          >      >      >>      >
>      >      >          >      >      >>      > We have a requirement of power button override. I don’t see
>      >      >          >      >      >> x86-power
>      >      >          >      >      >>      > control doesn’t support this currently. Do you need this
>      >      >          >      >      >> features or do
>      >      >          >      >      >>      > you have any local patch for this.
>      >      >          >      >      >>      Hi Vijay,
>      >      >          >      >      >>      power button override is used for the "Force Off" actions in
>      >      >          >      >      >> power control:
>      >      >          >      >      >>
>      >      >          >      >      >> https://github.com/openbmc/x86-power-control/blob/master/power-control-x86/src/power_control.cpp#L50.
>      >      >          >      >      >>
>      >      >          >      >      >>
>      >      >          >      >      >> This will not work if current status is off. This should just send
>      >      >          >      >      >> pulse in any status on/off.
>      >      >          >      >      > Correct.  Force Off is not done if the current status is off.
>      >      >          >      >      Do you have more details on the power button override behavior that you
>      >      >          >      >      need?
>      >      >          >      >
>      >      >          >      > Yes, This is required to bring ME back to operation mode from recovery. How are you handling ME for Bios upgrade.
>      >      >          >      When in recovery mode, the ME will accept a reset command (IPMI raw 0x6
>      >      >          >      0x2) to reset to operational mode.
>      >      >          >
>      >      >          > Bill, I tried this and see inconsistent behavior from host. Sometime it refuse to power on. So PBO resolves this.
>      >      >          I checked with the ME team and ME reset to move from recovery mode to
>      >      >          operational mode should work.  You can file a ticket with Intel support
>      >      >          to help resolve the inconsistent behavior that you see when doing this.
>      >      >
>      >      >          In the meantime, I will look over your patch.
>      >      >
>      >      >          Thanks,
>      >      >          -Jason
>      >      >
>      >      >          >
>      >      >          >      >
>      >      >          >      >      >>      >
>      >      >          >      >      >>      > Regards
>      >      >          >      >      >>      >
>      >      >          >      >      >>      > -Vijay
>      >      >          >      >      >>      >
>      >      >          >      >      >>
>      >      >          >      >
>      >      >          >      >
>      >      >          >
>      >      >          >
>      >      >
>      >      >
>      >      >
>      >      >
>      >
>      >
>      
> 
