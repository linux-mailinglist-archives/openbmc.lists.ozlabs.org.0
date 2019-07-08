Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEEC62858
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2019 20:28:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jDVK2gv1zDqRp
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2019 04:28:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jDTr4pxFzDqND
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jul 2019 04:28:15 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jul 2019 11:28:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,466,1557212400"; d="scan'208";a="248901050"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga001.jf.intel.com with ESMTP; 08 Jul 2019 11:28:12 -0700
Subject: Re: Could phosphor-hwmon support peci-sensors
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 =?UTF-8?B?RHVrZSBEdSAo5p2c56Wl5ZiJKQ==?= <Duke.Du@quantatw.com>
References: <79563bbd625f412ab4695049df92a0bd@quantatw.com>
 <20190708175241.nem73wmy27itc72p@thinkpad.dyn.fuzziesquirrel.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <b6bc00d5-e093-c9c1-0456-1e3f02ce6059@linux.intel.com>
Date: Mon, 8 Jul 2019 11:28:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190708175241.nem73wmy27itc72p@thinkpad.dyn.fuzziesquirrel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 7/8/19 10:52 AM, Brad Bishop wrote:
> On Mon, Jul 08, 2019 at 12:33:21PM +0000, Duke Du (杜祥嘉) wrote:
>> Hi All,
>>  I have some problems with phosphor-hwmon.
>> Could package phosphor-hwmon supports peci sensors such as cpu and 
>> dimm tempatures ?
>> If yes, could you give me some hints that how do I write configuration 
>> for peci sensors, please :).
>>
>> Thanks.
>> Duke, Du
> 
> phosphor-hwmon should work with anything that implements the hwmon ABI. 
> So I think to make PECI sensors work with phosphor-hwmon, you need hwmon 
> drivers for PECI sensors.  I don't know if anyone is working on that.
> 
> I suspect the other sensor application - dbus-sensors supports PECI just 
> fine.  But I don't know how it works, if it can be used without entity 
> manager,  and/or if it can be run in parallel with phosphor-hwmon.

+ Jae, CPU Sensor Author

https://github.com/openbmc/dbus-sensors/blob/master/src/CPUSensorMain.cpp

CPU sensor currently supports PECI sensors 
https://github.com/openbmc/dbus-sensors/blob/master/src/CPUSensor.cpp

https://github.com/openbmc/entity-manager/blob/f861da89ed03f9ec556c5ed6ac819988c0c1f498/configurations/WFT%20Baseboard.json#L2181

It does require entity-manager currently, but it could be run in 
parallel with phosphor-hwmon.

-James
