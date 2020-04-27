Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 729501BADBB
	for <lists+openbmc@lfdr.de>; Mon, 27 Apr 2020 21:19:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499vjb2BQ9zDq5t
	for <lists+openbmc@lfdr.de>; Tue, 28 Apr 2020 05:19:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499vbP38JDzDqdw
 for <openbmc@lists.ozlabs.org>; Tue, 28 Apr 2020 05:14:23 +1000 (AEST)
IronPort-SDR: nSgUyB9+npp3R8zQ1L1P+AlEMnkrjFPbTvjf82/bxngBCcJvLu25QdRyS9QwEsc6gC3yPxXLwc
 UORWhUPIXJSA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 12:14:21 -0700
IronPort-SDR: PT3mjWsiWtGWvFG3KDZJClDqGa3PMoZruFRxEp3H+IDgZJ8Mb6v6dHDGypA6vXiGYn+2+ab0Xu
 cT1P8TUzpXsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,325,1583222400"; d="scan'208";a="246242019"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 27 Apr 2020 12:14:21 -0700
Received: from [10.213.65.25] (jmbills-mobl.amr.corp.intel.com [10.213.65.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 953B15807CA;
 Mon, 27 Apr 2020 12:14:19 -0700 (PDT)
Subject: Re: question about sensor sel
To: =?UTF-8?B?6Zi/5qGC?= <guilin1985@126.com>, openbmc@lists.ozlabs.org
References: <4a3fdbed.27ba.171b49628cc.Coremail.guilin1985@126.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <3c8e7eae-a345-702e-4fff-d04010de7594@linux.intel.com>
Date: Mon, 27 Apr 2020 12:14:14 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4a3fdbed.27ba.171b49628cc.Coremail.guilin1985@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 4/25/2020 8:44 PM, 阿桂 wrote:
> Hi, all:
> 
> Why is the result empty when I run 'ipmitool sel list', as follows:
> root@lon:/var/log# ipmitool sel list
> SEL has no entries
> 
> Below is what I changed:
> 
> 1. I added yaml config file of those sensors 'ipmi-sensors.yaml'
> 
> 2. I added below compling option to module 'phosphor-sel-logger'';
> EXTRA_OECMAKE += "-DSEL_LOGGER_MONITOR_THRESHOLD_EVENTS=ON"
> 
> 3. I modified the config settings of rsyslog as 
> https://lists.ozlabs.org/pipermail/openbmc/2019-November/019619.html 
> refer to.
>      so, I can see a journalctl log,  ipmi_sel and redfish file at /var/log;
> 
> 
> Below two commands can get wanted results. But why the command 'ipmitool 
> sel list' can't? what else should I modify?
It looks like the only thing missing is the override to the IPMI Get SEL 
Entry command to make it look in the /var/log/ipmi_sel file instead of 
on D-Bus.

You can find the override implemented in intel-ipmi-oem, here: 
https://github.com/openbmc/intel-ipmi-oem/blob/master/src/storagecommands.cpp#L827.

> root@lon:/var/log# ipmitool sensor list
> ambient_temp     | na         |            | na    | na        | na      
>    | na        | na        | na        | na
> cpu0_temp          | na         |            | na    | na        | na    
>      | na        | na        | na        | na
> cpu1_temp          | na         |            | na    | na        | na    
>      | na        | na        | na        | na
> psu_vol_in          | 12.031     | Volts      | ok    | 0.000     | 
> 10.971    | 11.448    | 12.985    | 13.462    | 0.000
> psu_curr_in         | 0.275      | Amps       | ok    | 0.000     | 
> 0.275     | 0.550     | 49.775    | 69.850    | 0.000
> psu_power_in     | 3.150      | Watts      | ok    | 0.000     | 3.150  
>     | 6.300     | 497.700   | 796.950   | 0.000
> battery         | 0.345      | Volts      | ok    | 0.000     | 1.995    
>   | 2.490     | 3.300     | 3.495     | 0.000
> fan1             | na         |            | na    | na        | na      
>    | na        | na        | na        | na
> fan2             | na         |            | na    | na        | na      
>    | na        | na        | na        | na
> fan3             | na         |            | na    | na        | na      
>    | na        | na        | na        | na
> fan4             | na         |            | na    | na        | na      
>    | na        | na        | na        | na
> fan5             | na         |            | na    | na        | na      
>    | na        | na        | na        | na
> fan6             | na         |            | na    | na        | na      
>    | na        | na        | na        | na
> fan7             | na         |            | na    | na        | na      
>    | na        | na        | na        | na
> fan8             | na         |            | na    | na        | na      
>    | na        | na        | na        | na
> 
> root@lon:/var/log# journalctl |grep sel
> Apr 25 15:16:36 lon sel-logger[240]: battery sensor crossed a warning 
> low threshold going low. Reading=0.344000 Threshold=2.500000.
> Apr 25 15:16:36 lon sel-logger[240]: battery sensor crossed a critical 
> low threshold going low. Reading=0.344000 Threshold=2.000000.
> Apr 25 15:16:36 lon sel-logger[240]: psu_curr_in sensor crossed a 
> warning low threshold going low. Reading=0.361000 Threshold=0.600000.
> Apr 25 15:16:36 lon sel-logger[240]: psu_power_in sensor crossed a 
> warning low threshold going low. Reading=4.667744 Threshold=6.500000.
> 
> root@lon:/var/log# ls
> ipmi_sel          lastlog           obmc-console.log  private/          
> redfish           state             tallylog
> 
> root@lon:/var/log# cat ipmi_sel
> 2020-04-25T15:16:36.125187+00:00 
> 1,2,50FFFF,20,/xyz/openbmc_project/sensors/voltage/battery,1
> 2020-04-25T15:16:36.245679+00:00 
> 1,2,52FFFF,20,/xyz/openbmc_project/sensors/voltage/battery,1
> 2020-04-25T15:16:36.705420+00:00 
> 2,2,50FFFF,20,/xyz/openbmc_project/sensors/current/psu_curr_in,1
> 2020-04-25T15:16:36.764327+00:00 
> 3,2,50FFFF,20,/xyz/openbmc_project/sensors/power/psu_power_in,1
> root@lon:/var/log# cat redfish
> 2020-04-25T15:16:19.003251+00:00 
> OpenBMC.0.1.ServiceFailure,phosphor-pid-control.service
> 2020-04-25T15:16:36.125187+00:00 
> OpenBMC.0.1.SensorThresholdWarningLowGoingLow,battery,0.344000,2.500000
> 2020-04-25T15:16:36.245679+00:00 
> OpenBMC.0.1.SensorThresholdCriticalLowGoingLow,battery,0.344000,2.000000
> 2020-04-25T15:16:36.705420+00:00 
> OpenBMC.0.1.SensorThresholdWarningLowGoingLow,psu_curr_in,0.361000,0.600000
> 2020-04-25T15:16:36.764327+00:00 
> OpenBMC.0.1.SensorThresholdWarningLowGoingLow,psu_power_in,4.667744,6.500000
> 2020-04-25T15:16:51.611885+00:00 
> OpenBMC.0.1.ServiceFailure,obmc-read-eeprom@system-chassis-motherboard.service
> 
> 
> 
> 
> 
> 
