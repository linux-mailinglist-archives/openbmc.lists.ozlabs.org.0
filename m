Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B07A3732A6
	for <lists+openbmc@lfdr.de>; Wed,  5 May 2021 01:14:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZbK64Nz6z302H
	for <lists+openbmc@lfdr.de>; Wed,  5 May 2021 09:14:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZbJr43cHz2xgJ
 for <openbmc@lists.ozlabs.org>; Wed,  5 May 2021 09:14:35 +1000 (AEST)
IronPort-SDR: pIkjgdpVClUw6QhlO3D4ciDVeoEhwUNJ5VWAF3Vqyaa2dLH4hcuUpwceYu9fCTawkG+vNkU3zl
 ATxz0W9ZCs0Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="197714073"
X-IronPort-AV: E=Sophos;i="5.82,273,1613462400"; d="scan'208";a="197714073"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 16:14:31 -0700
IronPort-SDR: FjqMx/sIRaitZcZtyvnQXNspRZi5iQ2sWUjPzqkucHDPqu6G7Fg7r2Y1g6c/V9//MepAy7btar
 L2BkqNl6xioQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,273,1613462400"; d="scan'208";a="390125031"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga006.jf.intel.com with ESMTP; 04 May 2021 16:14:31 -0700
Received: from [10.212.251.97] (jmbills-MOBL.amr.corp.intel.com
 [10.212.251.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 4A818580932
 for <openbmc@lists.ozlabs.org>; Tue,  4 May 2021 16:14:31 -0700 (PDT)
Subject: Re: How to add Redfish EventLog using commands
To: openbmc@lists.ozlabs.org
References: <11e4ee9d-d19c-dd79-aedd-8104a7ad081b@os.amperecomputing.com>
 <CACWQX81-6+PTTzFe6o5d6wvF99ELn-KTL8Or53fGXkKkKaUUEA@mail.gmail.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <b952c2d9-a35b-b802-0942-ffb05a1cd3d5@linux.intel.com>
Date: Tue, 4 May 2021 16:14:30 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACWQX81-6+PTTzFe6o5d6wvF99ELn-KTL8Or53fGXkKkKaUUEA@mail.gmail.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 5/4/2021 1:01 PM, Ed Tanous wrote:
> On Tue, May 4, 2021 at 2:54 AM Thang Nguyen
> <thang@os.amperecomputing.com> wrote:
>>
>> Hi,
>>
>> I am looking for the mechanism to add events to Redfish EventLog. I
>> checked on the Redfish EventService design
>> (https://github.com/openbmc/docs/blob/master/designs/redfish-eventservice.md)
>> and it seems only has C++ functional calls (sd_journal_send(),
>> phosphor::logging::log(), ...) but not user commands that can be used in
>> the shell script.
> 
> This kind of logging and handling would imply that your script has
> outlived what should realistically be put in a bash script, and should
> be rewritten in something compiled (probably c++).  Redfish logs
> require string and variable manipulation that is generally not well
> defined in bash scripts.
> 
>>
>> There are many use cases for adding EventLogs:
>>
>> 1. Use phosphor-gpio-monitor to monitor signals like power/reset,
>> button, ... and log the event
> 
> Considering that Redfish event log is for high level things, I suspect
> this isn't a great fit.  power/reset would be handled within whatever
> state system you're using (phosphor-state-manager or
> x86-power-control), right?
> 
>>
>> 2. Use phosphor-gpio-monitor to check if the Host boot fail, control the
>> mux to switch to other boot devices, along with logging events.
> 
> This seems like something that shouldn't be done from bash;
> 
>>
>> 3. Check device presences (from /sys interfaces) and log events, ...
> 
> Redfish itself should have no knowledge of specific linux interfaces,
> or linux at all.  Dependent on the actual /sys device you're looking
> for, there's probably already daemons that expose those types of
> events.  Without going into more specifics, I'm not sure this is
> advised.
> 
>>
>>
>> I checked on existing repositories like phosphor-sel-logger,
>> dbus-sensors, ... and they only support events for their features (like
>> power dc on/off, sensor threshold, inventory data added/removed, ...)
>> and the Redfish events added in C++.
> 
> Which is I think the right design choice.
> 
>>
>> I can have a C++ codes to just support options to add different EventLog
>> data with parameters. But it can't be inside meta- folder so need a
>> repository for it.
> 
> For what it's worth, the bash scripts shouldn't be going in the meta
> repo either.
> 
>> I think it's not worth for creating a new repo just
>> to support an application with dozen like of codes to just add EventLog.
> 
> Disagree about whether it's worth it.  WIth that said, depending on
> what you're trying to do, there's likely already a repo for the
> feature you're trying to implement.
> 
>>
>> Do you have any idea of any existing repo support adding Redfish
>> EventLog from script/command line or any repo that we can extend to
>> support such command?
I completely agree with Ed on making sure it's the right thing to do 
before doing it, but I wanted to share the tool we use in case it's helpful.

For journal-based logging we use 'logger-systemd --journald' in some of 
our scripts to add Redfish event messages to the journal: 
https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-core/fw-update/files/fwupd.sh#L33

>>
>>
>> Best Regards,
>>
>> Thang Q. Nguyen -
>>
