Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EE930B43F
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 01:43:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DV5dq6VVdzDr22
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 11:43:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DV5cw74TfzDq8x
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2021 11:42:40 +1100 (AEDT)
IronPort-SDR: D+fEctGHaKWG4JCrGbi9wJXD1N0j1lqLgt4WG2HAiet+58Hvsi2U+p9EqEpTfYhfe34T5282aj
 TWRglJPAGpHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="265607643"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="265607643"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 16:42:34 -0800
IronPort-SDR: 2dpAsZBcXZtIgDdPk5f3QRzbavemz5ETKRr8DuUUxgAysrrWRkPuBHOEkSeMSCyF/nyRwt/Dj8
 RVW24EGSnDMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="370175202"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga008.fm.intel.com with ESMTP; 01 Feb 2021 16:42:34 -0800
Received: from [10.251.23.150] (jmbills-MOBL.amr.corp.intel.com
 [10.251.23.150])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 0A2B35807FF
 for <openbmc@lists.ozlabs.org>; Mon,  1 Feb 2021 16:42:34 -0800 (PST)
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: Sensor Value PropertiesChanged Events
Message-ID: <31abd546-4538-ecf0-134e-b8e48e75b3ad@linux.intel.com>
Date: Mon, 1 Feb 2021 16:42:33 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
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

Hi All,

There is an issue and idea that James Feist and I chatted about to maybe 
relieve some of our D-Bus traffic.

A major contributor to our D-Bus traffic (as seen in dbus-monitor) is 
the polling sensors updating the xyz.openbmc_project.Sensor.Value.Value 
property on each polling loop, which generates a PropertiesChanged 
signal for every sensor on every polling loop (once per second?).

The concern is that more important D-Bus messages could be getting 
delayed as D-Bus processes these Sensor Value signals.

The idea to fix this is to change the sensors with a custom getter on 
the Value property, so the last read can be pulled from D-Bus using a 
get-property call, but it would no longer signal a PropertiesChanged event.

I pushed a proposed change here: 
https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/40199.

Our original assumption was that nobody was matching on this 
PropertiesChanged signal for the Value property; however, it was pointed 
out to me today, that PID control has a match for it and may be using it.

So, I wanted to start a broader community discussion about this issue:

1. Is this a real concern or are PropertiesChanged signals so 
lightweight that removing them won't help with D-Bus load?

2. Does anyone need to match on sensor Value property updates or is 
reading them with get-property enough?

3. Does PID control use the Value match?  If so and there are benefits 
to removing these signals, could PID control manage without them?


As a side note, I still have two remaining services that publish 
PropertiesChanged events on sensor Value properties:

PWM Sensors.  I have a proposed (and untested) change here: 
gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/40200.

A Power sensor, that I will track down based on this discussion.

Thanks!
-Jason
