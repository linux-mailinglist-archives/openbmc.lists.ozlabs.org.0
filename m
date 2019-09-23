Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4492CBBAAE
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 19:46:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cWwZ2V6SzDqLb
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 03:46:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cWvy2wjKzDqLY
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 03:46:20 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Sep 2019 10:46:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,541,1559545200"; d="scan'208";a="182619101"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.150])
 ([10.7.153.150])
 by orsmga008.jf.intel.com with ESMTP; 23 Sep 2019 10:46:17 -0700
Subject: Re: PECI sensor rename
To: Derek Lin23 <dlin23@lenovo.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <f59e0897a48c4922b82ff0110df5a33c@lenovo.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <a839bcf7-630d-2767-d5e0-ac53d42b5ba5@linux.intel.com>
Date: Mon, 23 Sep 2019 10:46:17 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f59e0897a48c4922b82ff0110df5a33c@lenovo.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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

Hi Derek,

On 9/19/2019 11:21 PM, Derek Lin23 wrote:
> Hi Team:
> 
>            I have a question for how to rename PECI sensor in cpu-sensor.
> 
>            Currently, I am using peci-dimmtemp & peci-cputemp drivers 
> under Kernel to read DIMM and CPU temperatures.
> 
>            So, under /sys/class/hwmon directories, I can find the 
> corresponding CPU & DIMM label names and temperatures.
> 
>            Now, my question is how do I change the label names of each 
> corresponding temperature in cpu-sensor component.
> 
>            Here is the snapshot of my cpu-sensor using busctl. My goal 
> is to show temperature name to be something else other than “Die_CPU1” 
> or “DIMM_C1_CPU1”.
> 
>                      root@abc/sys/class/hwmon/hwmon23# busctl tree 
> --no-page xyz.openbmc_project.CPUSensor
>                     …
> 
>                     /xyz/openbmc_project/sensors
> 
>        mq/xyz/openbmc_project/sensors/temperature
> 
>          tq/xyz/openbmc_project/sensors/temperature/Core_0_CPU1
> 
>          tq/xyz/openbmc_project/sensors/temperature/Core_10_CPU1
> 
>          tq/xyz/openbmc_project/sensors/temperature/Core_11_CPU1
> 
>          tq/xyz/openbmc_project/sensors/temperature/Core_12_CPU1
> 
>          tq/xyz/openbmc_project/sensors/temperature/Core_13_CPU1
> 
>          tq/xyz/openbmc_project/sensors/temperature/Core_14_CPU1
> 
>          tq/xyz/openbmc_project/sensors/temperature/Core_15_CPU1
> 
>          tq/xyz/openbmc_project/sensors/temperature/Core_17_CPU1
> 
>          tq/xyz/openbmc_project/sensors/temperature/Core_2_CPU1
> 
>          tq/xyz/openbmc_project/sensors/temperature/Core_3_CPU1
> 
>          tq/xyz/openbmc_project/sensors/temperature/Core_4_CPU1
> 
>          tq/xyz/openbmc_project/sensors/temperature/Core_5_CPU1
> 
>          tq/xyz/openbmc_project/sensors/temperature/Core_6_CPU1
> 
>          tq/xyz/openbmc_project/sensors/temperature/Core_7_CPU1
> 
>          tq/xyz/openbmc_project/sensors/temperature/Core_9_CPU1
> 
>          tq/xyz/openbmc_project/sensors/temperature/DIMM_C1_CPU1
> 
>          tq/xyz/openbmc_project/sensors/temperature/DIMM_C2_CPU1
> 
>          mq/xyz/openbmc_project/sensors/temperature/Die_CPU1
> 
>                     …
> 
>            I understand that “Die” comes from peci-cputemp driver and 
> “DIMM_C1” comes from peci-dimmtemp driver. Besides rewriting the label 
> names in the drivers, do I have other options?

DBus names of CPU and DIMM sensors will be named by this code in
dbus-sensor repository.

https://github.com/openbmc/dbus-sensors/blob/de5e9705ff9d75dd5db2ea76d649c9bbba9f5e7a/src/CPUSensorMain.cpp#L266

You might need to change the logic if you are going to customize the
sensor names.

Cheers,

Jae
