Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE60725B7
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 06:12:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45thkx33c4zDqQ3
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 14:12:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tPnm1BHBzDqNd
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 02:58:50 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 09:58:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,299,1559545200"; d="scan'208";a="368433641"
Received: from unknown (HELO [10.251.18.151]) ([10.251.18.151])
 by fmsmga005.fm.intel.com with ESMTP; 23 Jul 2019 09:58:46 -0700
Subject: Re: dbus-sensors + phosphor-hwmon
To: Patrick Venture <venture@google.com>, "Tanous, Ed" <ed.tanous@intel.com>
References: <CAO=notxxEHzBeCew3OaGs9E=vvzjf9q2XFD1E0S9aRqxzSSHzQ@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <b6210038-21fb-6e90-fb90-88d5602db81e@linux.intel.com>
Date: Tue, 23 Jul 2019 09:58:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAO=notxxEHzBeCew3OaGs9E=vvzjf9q2XFD1E0S9aRqxzSSHzQ@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ofer Yehielli <ofery@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 7/22/2019 3:26 PM, Patrick Venture wrote:
> I haven't tested yet, but I have a device-tree with a lot of ~40
> hard-coded sensors on it, and then the other sensors will be detected
> with entity-manager (once that's set up).

Entity-manager doesn't detect sensors, it detects removable components 
then expects certain sensors. For our baseboard here: 
https://github.com/openbmc/entity-manager/blob/master/configurations/WFT%20Baseboard.json 
at the bottom of the file there is a dbus-probe for an 
xyz.openbmc_project.FruDevice interface with some specific properties. 
If those match, then entity-manager through sysfs can add some sensors 
https://github.com/openbmc/entity-manager/blob/master/include/devices.hpp

You could also use device tree if you wanted, the export just wouldn't 
succeed. But you would need a json file with the sensors bus and address 
for dbus-sensors to work.

-James


> 
> In this case, will entity-manager populate the dbus configuration with
> those in the device-tree initially making them available to
> dbus-sensors? (or will we or should we, also configure phosphor-hwmon
> for those sensors?)
> 
> Patrick
> 
