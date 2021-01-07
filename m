Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E3F2EE759
	for <lists+openbmc@lfdr.de>; Thu,  7 Jan 2021 22:01:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DBdvg2zsdzDqpp
	for <lists+openbmc@lfdr.de>; Fri,  8 Jan 2021 08:01:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DBdtW4HlQzDqJ2
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jan 2021 08:00:50 +1100 (AEDT)
IronPort-SDR: vy6NpvSh+Xvj/3NkOfqz9WR86AXV9d16JUYFyq4an6awMnV+IL9b/HG1/Lje7+D0mS0gfE2EKc
 CM+HmRJYknRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="174915291"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; d="scan'208";a="174915291"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2021 13:00:47 -0800
IronPort-SDR: Os7tf5To9fAThMtj6bSJGeBku5V0er3zOCU8damB2cdZjCokeWGy9CLhD8CT0cfFtlxat1l0L7
 pObujWmb0KLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; d="scan'208";a="362100936"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga002.jf.intel.com with ESMTP; 07 Jan 2021 13:00:46 -0800
Received: from [10.209.27.59] (jmbills-MOBL.amr.corp.intel.com [10.209.27.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id B5028580409
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jan 2021 13:00:46 -0800 (PST)
Subject: Re: Changing LEDs status in response to Power Events
To: openbmc@lists.ozlabs.org
References: <CAFR_W8pjBgn=V9ye-R9ThvyvqwxqYnY94vAX0q1h4sVEaLWN2Q@mail.gmail.com>
 <X/c7dM7/uDIDTlFI@heinlein>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <4a31f202-e038-a9cd-687b-25b572dedae4@linux.intel.com>
Date: Thu, 7 Jan 2021 13:00:45 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <X/c7dM7/uDIDTlFI@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 1/7/2021 8:48 AM, Patrick Williams wrote:
> On Wed, Jan 06, 2021 at 04:52:32PM -0800, Maxim Sloyko wrote:
>> Hi all,
>>
>> We would like to change the state of some of the LEDs in response to some
>> power events. For example, if the system goes from Standby to On, the LED
>> needs to change from blinking fast to blinking slowly.  The way we are
>> doing it right now is we have a script that runs every second, polls system
>> state over D-Bus (xyz.openbmc_project.State.Chassis and
>> xyz.openbmc_project.State.Host) and then, again over D-Bus, ask
>> phosphor-led-manager to switch LED into a new state. This does not sound
>> like a good solution to me, so I have a few questions:
>>
>> 0. Did I miss some existing way to do it in OpenBMC?
>> 1. If not, does anybody have the same problem and how do you solve this?
>> 2. If not, Is anybody working on a solution for this?
>> 3. If not, any thoughts on what's the best way to handle this? I can see at
>> least two approaches:
>>     a) Implement some callbacks in x86-power-control, so that one can
>> register their services/targets to be notified of the event.
>>     b) Implement this in phosphor-led-manager, so that it can listen to
>> D-Bus events and respond to them.
> 
> This usecase is one of the reasons phosphor-state-manager was
> implemented using systemd targets (or at least one of the nice fallouts
> of that design).  The intention was that system-specific things like
> this could easily install themselves into dependencies on the state
> transition targets.
> 
> Unfortunately, if you're using x86-power-control as your state-manager
> I don't think you get this feature.

x86-power-control was built to solve a very specific problem to get some 
of our power-up timing and error-handling issues solved that we couldn't 
figure out how to do with systemd targets in phosphor-state-manager. 
Because of that, it wasn't designed to be very flexible or extensible.

I've thought about how we might be able to improve that but don't want 
to re-invent the wheel where phosphor-state-manager has already solved 
the flexibility and extensibility problem.

I have wanted to get back and spend some more time to see if I can get 
the same reliability, timing and error-handling using systemd targets 
with phosphor-state-manager, but have not had a chance.

For this issue, another option instead of the polling script may be to 
have a new daemon that matches on the Host state property changes and 
updates the LED.

We can consider adding callbacks to x86-power-control, but it may not be 
worth it if phosphor-state-manager can already handle it or there is a 
simpler alternative.

Thanks,
-Jason
> 
