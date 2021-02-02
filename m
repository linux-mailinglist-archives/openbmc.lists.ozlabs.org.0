Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A307E30D1C9
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 03:50:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVmPT3GskzDwmf
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 13:50:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVcB43g8WzDqbk
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2021 07:39:39 +1100 (AEDT)
IronPort-SDR: kT4DxRl9tTvUO4qfplIHeEZ7j3hrE39TdSvw5YfQjbBP/nA6McHH9PBH+YLQOTkIT3lKOIlDvU
 PFDgMiE7VEvg==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="181073478"
X-IronPort-AV: E=Sophos;i="5.79,396,1602572400"; d="scan'208";a="181073478"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 12:39:33 -0800
IronPort-SDR: 7ZsDED+RDfPRmP5jygC/371wVzBkmv1tumMhIIf+0gW+OdpfCbdmcATLFLefDkGkAQ+8B1gc89
 AsAan3fFvg5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,396,1602572400"; d="scan'208";a="370943906"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga008.fm.intel.com with ESMTP; 02 Feb 2021 12:39:32 -0800
Received: from [10.212.238.16] (jmbills-MOBL.amr.corp.intel.com
 [10.212.238.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id ED2415802A4;
 Tue,  2 Feb 2021 12:39:31 -0800 (PST)
Subject: Re: Sensor Value PropertiesChanged Events
To: Ed Tanous <ed@tanous.net>
References: <31abd546-4538-ecf0-134e-b8e48e75b3ad@linux.intel.com>
 <CACWQX83KhqORsx-Gm4CCEndADO-GEgNHtxPpHR2ptsgzmtU9xA@mail.gmail.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <f6ed3a5f-2d4c-e554-400f-ba7caaae316e@linux.intel.com>
Date: Tue, 2 Feb 2021 12:39:31 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACWQX83KhqORsx-Gm4CCEndADO-GEgNHtxPpHR2ptsgzmtU9xA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 2/1/2021 5:26 PM, Ed Tanous wrote:
> On Mon, Feb 1, 2021 at 4:44 PM Bills, Jason M
> <jason.m.bills@linux.intel.com> wrote:
>>
>> Hi All,
>>
>> There is an issue and idea that James Feist and I chatted about to maybe
>> relieve some of our D-Bus traffic.
>>
>> A major contributor to our D-Bus traffic (as seen in dbus-monitor) is
>> the polling sensors updating the xyz.openbmc_project.Sensor.Value.Value
>> property on each polling loop, which generates a PropertiesChanged
>> signal for every sensor on every polling loop (once per second?).
>>
>> The concern is that more important D-Bus messages could be getting
>> delayed as D-Bus processes these Sensor Value signals.
>>
>> The idea to fix this is to change the sensors with a custom getter on
>> the Value property, so the last read can be pulled from D-Bus using a
>> get-property call, but it would no longer signal a PropertiesChanged event.
> 
> Doesn't this break..... like... everything that relies on sensor
> values changing over time?

I think this was my incorrect assumption that the PropertiesChanged 
signal for sensor value updates was not used and could be removed 
without significant impact.  I will abandon my proposed change, but I'm 
glad there are other thoughts and discussion around this issue.

Thanks!
-Jason

> 
>>
>> I pushed a proposed change here:
>> https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/40199.
>>
>> Our original assumption was that nobody was matching on this
>> PropertiesChanged signal for the Value property; however, it was pointed
>> out to me today, that PID control has a match for it and may be using it.
> 
snip...
