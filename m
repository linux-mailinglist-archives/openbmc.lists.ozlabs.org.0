Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9DC8DFAD
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 23:18:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4682W52QDlzDqyq
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 07:18:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4682VT1jD4zDqs3
 for <openbmc@lists.ozlabs.org>; Thu, 15 Aug 2019 07:17:52 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Aug 2019 14:17:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,386,1559545200"; d="scan'208";a="260623442"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga001.jf.intel.com with ESMTP; 14 Aug 2019 14:17:49 -0700
Subject: Re: mixing phosphor-dbus-interfaces and intel-dbus-interfaces
To: Patrick Venture <venture@google.com>, "Tanous, Ed" <ed.tanous@intel.com>, 
 Nancy Yuen <yuenn@google.com>
References: <CAO=notwDmu0Xz4usK1aZQg39V3vT9ZBOt7L7zDp8zRN+5dMcvw@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <990303f2-4434-f098-1f2c-af3bd4ffa075@linux.intel.com>
Date: Wed, 14 Aug 2019 14:17:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAO=notwDmu0Xz4usK1aZQg39V3vT9ZBOt7L7zDp8zRN+5dMcvw@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/14/19 2:09 PM, Patrick Venture wrote:
> I was curious how you guys mixed your dbus-interfaces repos.  it looks
> like at least in dbus-sensors that you approach the use of them
> differently.  So there's no incompatibility -- for instance, between
> the two sensor value interfaces?
> 

sdbusplus asio doesn't require any yaml files, it lets you create the 
interface on the fly.

Examples are here:
https://github.com/openbmc/sdbusplus/blob/4212292bcf136d04b38ba5116aa568b0fa312798/example/asio-example.cpp#L206

So to create the sensor interface one just calls:

  auto server = sdbusplus::asio::object_server(conn);
   std::shared_ptr<sdbusplus::asio::dbus_interface> iface =
      server.add_interface("/xyz/openbmc_project/Sensor/Value",
			    "xyz.openbmc_project.SomeType.SensorName");

Then if you want a double you call.

double value = 3;

iface->register_property("Value", value);

and it adds it to the vtable.

Then just call iface->initialize();


So for adc sensor it gets created on the fly here: 
https://github.com/openbmc/dbus-sensors/blob/7fa475d3f27ec6c37503ff7ec0496acc2215da29/src/ADCSensor.cpp#L57


and the double is added here:


https://github.com/openbmc/dbus-sensors/blob/7fa475d3f27ec6c37503ff7ec0496acc2215da29/include/sensor.hpp#L62


-James


> Patrick
> 
