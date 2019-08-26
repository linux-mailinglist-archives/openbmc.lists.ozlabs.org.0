Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD5B9D72F
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2019 22:06:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HNL34qxGzDqQM
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 06:06:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HNHh0rcszDqQM
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 06:03:53 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 13:03:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="182551114"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga003.jf.intel.com with ESMTP; 26 Aug 2019 13:03:50 -0700
Subject: Re: Virtual sensors
To: openbmc@lists.ozlabs.org
References: <CB9FB78A-5D6B-42AD-98CF-DD2CC3B43958@fb.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <8fbdf5a7-2d24-6d1a-80e1-3ab79da8cb6a@intel.com>
Date: Mon, 26 Aug 2019 13:03:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CB9FB78A-5D6B-42AD-98CF-DD2CC3B43958@fb.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/26/19 12:47 PM, Wilfred Smith wrote:
> Is there currently a virtual sensor implementation? If not, is anyone working on one?
> 
> Virtual sensors allow you to define a sensor as an equation atop other sensors, with each dependent sensor specifying its polling rate. For example: PeakDriveBayTemperature = Max(DriveBayTemperature[1…4,20Hz]) would poll the temperature of sensors 1-4 at 20 Hz and promote the max temperature seen.
> 

I don't believe there's anything that implements that feature exactly,
but dbus-sensors has the CFM and Exit air sensors, which do essentially
what you describe, watch for other sensors values, and post a value of
their own after running some math on it.  In the exit air case, it's
looking at power readings as well as fan speeds to generate CFM and Exit
air temperature sensors.

https://github.com/openbmc/dbus-sensors/blob/master/src/ExitAirTempSensor.cpp

It would be easy enough to use that as a model to add your math driven
sensors above, and add the appropriate definitions to entity manager to
enable it for tioga.

One thing to know, at this point none of the virtual sensors poll on a
timer, they add a watch and receive all sensor updates based on that,
which reduces the dbus traffic a little, as events are only sent on
value change, not every time the sensor is polled.

You could certainly poll them, but I think the match expression is easier.
