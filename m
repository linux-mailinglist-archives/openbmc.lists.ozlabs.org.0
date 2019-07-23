Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D005F725C6
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 06:14:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45thnm4r13zDqCB
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 14:14:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tQ5s5562zDqPK
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 03:12:49 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 10:12:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,299,1559545200"; d="scan'208";a="368458866"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.251.18.151])
 ([10.251.18.151])
 by fmsmga005.fm.intel.com with ESMTP; 23 Jul 2019 10:12:46 -0700
Subject: Re: Could phosphor-hwmon support peci-sensors
To: =?UTF-8?B?RHVrZSBEdSAo5p2c56Wl5ZiJKQ==?= <Duke.Du@quantatw.com>
References: <7297d188594b4d83a1f32f87b54db2dc@quantatw.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <d2e652b7-9fea-e6a0-eafa-3f0c12008cfc@linux.intel.com>
Date: Tue, 23 Jul 2019 10:12:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7297d188594b4d83a1f32f87b54db2dc@quantatw.com>
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

On 7/22/2019 2:49 AM, Duke Du (杜祥嘉) wrote:
> Hi James,
>     I have some problems with cpusensor in package dbus-sensors. When I set temperatures of critical and warning high for DIMM is work, but Core is not. Could I set temperatures of critical and warning high for Core by json file in entity-manager ?

Jae is the implementer of this sensor.

Jae, can you please help? I believe this is because the thresholds are 
read from the CPU.

Thanks,

-James


> (There is my josn file for cpu in package entity-manager)
> 
>              "Thresholds": [
>                  {
>                      "Direction": "greater than",
>                      "Label": "Core",
>                      "Name": "upper critical",
>                      "Severity": 1,
>                      "Value": 75
>                  },
>                  {
>                      "Direction": "greater than",
>                      "Label": "Core",
>                      "Name": "upper non critical",
>                      "Severity": 0,
>                      "Value": 70
>                  },
>                  {
>                      "Direction": "greater than",
>                      "Label": "DIMM",
>                      "Name": "upper critical",
>                      "Severity": 1,
>                      "Value": 85
>                  },
>                  {
>                      "Direction": "greater than",
>                      "Label": "DIMM",
>                      "Name": "upper non critical",
>                      "Severity": 0,
>                      "Value": 80
>                  }
>              ],
> 
> Thanks.
> Duke, Du
> 
>> -----Original Message-----
>> From: openbmc
>> [mailto:openbmc-bounces+will.liang=quantatw.com@lists.ozlabs.org] On
>> Behalf Of Vijay Khemka
>> Sent: Wednesday, July 10, 2019 4:20 AM
>> To: James Feist <james.feist@linux.intel.com>; Brad Bishop
>> <bradleyb@fuzziesquirrel.com>; Duke Du (杜祥嘉)
>> <Duke.Du@quantatw.com>
>> Cc: openbmc@lists.ozlabs.org; Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> Subject: Re: Could phosphor-hwmon support peci-sensors
>>
>>
>>
>> ﻿On 7/8/19, 11:29 AM, "openbmc on behalf of James Feist"
>> <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org on behalf of
>> james.feist@linux.intel.com> wrote:
>>
>>      On 7/8/19 10:52 AM, Brad Bishop wrote:
>>      > On Mon, Jul 08, 2019 at 12:33:21PM +0000, Duke Du (杜祥嘉) wrote:
>>      >> Hi All,
>>      >>  I have some problems with phosphor-hwmon.
>>      >> Could package phosphor-hwmon supports peci sensors such as cpu
>> and
>>      >> dimm tempatures ?
>>      >> If yes, could you give me some hints that how do I write configuration
>>      >> for peci sensors, please :).
>>      >>
>>      >> Thanks.
>>      >> Duke, Du
>>      >
>>      > phosphor-hwmon should work with anything that implements the
>> hwmon ABI.
>>      > So I think to make PECI sensors work with phosphor-hwmon, you need
>> hwmon
>>      > drivers for PECI sensors.  I don't know if anyone is working on that.
>>      >
>>      > I suspect the other sensor application - dbus-sensors supports PECI just
>>      > fine.  But I don't know how it works, if it can be used without entity
>>      > manager,  and/or if it can be run in parallel with phosphor-hwmon.
>>
>>      + Jae, CPU Sensor Author
>>
>>
>> https://github.com/openbmc/dbus-sensors/blob/master/src/CPUSensorMain.
>> cpp
>>
>>      CPU sensor currently supports PECI sensors
>>
>> https://github.com/openbmc/dbus-sensors/blob/master/src/CPUSensor.cpp
>>
>>
>> https://github.com/openbmc/entity-manager/blob/f861da89ed03f9ec556c5e
>> d6ac819988c0c1f498/configurations/WFT%20Baseboard.json#L2181
>>
>>      It does require entity-manager currently, but it could be run in
>>      parallel with phosphor-hwmon.
>>
>> There is peci driver along with hwmon peci driver available in openbmc linux
>> kernel 5.3 which will take care of hwmon interface. And there are also
>> peci-dimm and peci-cpu driver to read cpu and dimm sensors. Once these
>> drivers enabled, it sould work with phosphor-hwmon without entity manager
>> and dbus-sensors.
>>
>> Regards
>> -Vijay
>>
>>      -James
>>
> 
