Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4622B12A9
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 18:21:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TkXW0HfmzF4Vr
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 02:20:59 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TkWb2JD5zF49W
 for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2019 02:20:09 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Sep 2019 09:20:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="190038454"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga006.jf.intel.com with ESMTP; 12 Sep 2019 09:20:06 -0700
Subject: Re: Package dbus-sensors build fail
To: =?UTF-8?B?RHVrZSBEdSAo5p2c56Wl5ZiJKQ==?= <Duke.Du@quantatw.com>
References: <76010efa07d040d6abcc5a0b51740cc2@quantatw.com>
 <c8624ef8-6d81-7b8e-9f2a-060a92264add@linux.intel.com>
 <5c90ce87e4fc4cac991dcd6ddeaf7c51@quantatw.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <95803393-67a5-120e-a519-3eecc98fe7b7@linux.intel.com>
Date: Thu, 12 Sep 2019 09:20:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <5c90ce87e4fc4cac991dcd6ddeaf7c51@quantatw.com>
Content-Type: text/plain; charset=big5; format=flowed
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/10/19 7:53 PM, Duke Du (§ù²»¹Å) wrote:
> 
> 
>> -----Original Message-----
>> From: James Feist [mailto:james.feist@linux.intel.com]
>> Sent: Tuesday, September 10, 2019 11:51 PM
>> To: Duke Du (§ù²»¹Å) <Duke.Du@quantatw.com>; openbmc@lists.ozlabs.org
>> Subject: Re: Package dbus-sensors build fail
>>
>> On 9/10/19 2:41 AM, Duke Du (§ù²»¹Å) wrote:
>>> Hi All,
>>>     I bitbake package dbus-sensors in openbmc repo fd4f753 is OK [1], but
>> in openbmc repo c68388f is fail [2]. And I got some errors such as compile
>> errors, for example,
>> tmp/work/armv7a-openbmc-linux-gnueabi/dbus-sensors/0.1+gitAUTOINC+35
>> 46adb92b-r0/recipe-sysroot/usr/include/c++/9.2.0/complex:1955:8: error:
>> expected unqualified-id before 'namespace'
>>> |  1955 | inline namespace literals {
>>> |       |        ^~~~~~~~~
>>> | ninja: build stopped: subcommand failed.
>>>
>>>     Do I lose some settings for dbus-sensors package, could you give me
>> some suggestions, thanks.
>>>
>>> [1]
>>>
>> https://github.com/openbmc/openbmc/commit/fd4f7537ebeee494d4dd91b
>> 7438e
>>> d9512eeda303
>>>
>>> [2]
>>>
>> https://github.com/openbmc/openbmc/commit/c68388fccb8c0b5bf4d6b8eff
>> f91
>>> 203796be98b2
>>
>> Can you prove the commits of dbus-sensors you are using? This issue was
>> fixed quite some time ago I believe. I would suggest trying the latest version
>> of dbus-sensors.
> 
> Hi James,
>    Thanks for your suggestion, I use the latest commit 7fa17c48 of dbus-sensors, but still get the same error as follows :
>         tmp/work/armv7a-openbmc-linux-gnueabi/dbus-sensors/0.1+gitAUTOINC+7fa17c4880-r0/recipe-sysroot/usr/include/c++/9.2.0/complex:1955:8: error: expected unqualified-id before 'namespace'
>   1955 | inline namespace literals {
>        |        ^~~~~~~~~
> ninja: build stopped: subcommand failed.
> WARNING: exit code 1 from a shell command.
> 
> ERROR: Logfile of failure stored in: tmp/work/armv7a-openbmc-linux-gnueabi/dbus-sensors/0.1+gitAUTOINC+7fa17c4880-r0/temp/log.do_compile.6900
> 
> ERROR: Task (openbmc/meta-phosphor/recipes-phosphor/sensors/dbus-sensors_git.bb:do_compile) failed with exit code '1'

I'm based off of
https://github.com/openbmc/openbmc/commit/9d227052bf562afd4d547fbc17ace3202c5cf80c 
and it builds for me. Is the target you're building for upstream? Could 
be some compiler difference.




> 
>>>
>>> Thanks.
>>> Duke, Du
>>>
