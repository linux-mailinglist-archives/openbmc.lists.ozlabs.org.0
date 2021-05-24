Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD0838F20F
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 19:11:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpkK41SKwz306h
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 03:11:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpkJq3YQ4z2yWx
 for <openbmc@lists.ozlabs.org>; Tue, 25 May 2021 03:11:38 +1000 (AEST)
IronPort-SDR: YzeRQKwcnAWS4UtCDklIgr1r+Dj4/XTKMXFu08zKwvZtqzzJK8P5XaQSindfmBeHZ1vib0EySE
 vjiHBIMkeqFA==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="201729911"
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="201729911"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 10:11:35 -0700
IronPort-SDR: DKU/aF7X1TED64l7Zypglo43wGVTzAew0oCzVuXo0AqVPc7AdAbuWRIb17bpsDeWZYoYQ1enUa
 WDH4PCu5c2fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="413672980"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga002.jf.intel.com with ESMTP; 24 May 2021 10:11:35 -0700
Received: from [10.209.35.231] (jmbills-MOBL.amr.corp.intel.com
 [10.209.35.231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id EF0D15805A3
 for <openbmc@lists.ozlabs.org>; Mon, 24 May 2021 10:11:34 -0700 (PDT)
Subject: Re: SEL Event logs in Redfish
To: openbmc@lists.ozlabs.org
References: <SG2PR04MB30939A6EEB04348FF51EAC5AE1269@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <bf927ab3-636a-7d25-e42e-1f5335b4201c@linux.vnet.ibm.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <360ae7ee-b341-0233-6d24-36a91706654a@linux.intel.com>
Date: Mon, 24 May 2021 10:11:34 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <bf927ab3-636a-7d25-e42e-1f5335b4201c@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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



On 5/24/2021 8:15 AM, Bruce Mitchell wrote:
> On 5/24/2021 06:41, Jayashree D wrote:
>> Classification: Confidential
>> Hi Team,
>>
>> I need some clarification on SEL Logs.
>> In SEL Event logs, when the error is injected manually , I can able to 
>> see the error logs in "ipmitool sel list" command.
>> Whether it will also reflect in Redfish API ?
I am mostly familiar with the journal-bases SEL logging.  In that case, 
phosphor-sel-logger will detect the error and log it to both IPMI SEL 
and Redfish at the same time: 
https://github.com/openbmc/phosphor-sel-logger/blob/master/include/threshold_event_monitor.hpp#L272.

It may also depend on how you are manually injecting the error.

>>
>> Could you please help me in this.
>>
>> Thanks,
>> Jayashree
>>
>> ::DISCLAIMER::
>> ________________________________
>> The contents of this e-mail and any attachment(s) are confidential and 
>> intended for the named recipient(s) only. E-mail transmission is not 
>> guaranteed to be secure or error-free as information could be 
>> intercepted, corrupted, lost, destroyed, arrive late or incomplete, or 
>> may contain viruses in transmission. The e mail and its contents (with 
>> or without referred errors) shall therefore not attach any liability 
>> on the originator or HCL or its affiliates. Views or opinions, if any, 
>> presented in this email are solely those of the author and may not 
>> necessarily reflect the views or opinions of HCL or its affiliates. 
>> Any form of reproduction, dissemination, copying, disclosure, 
>> modification, distribution and / or publication of this message 
>> without the prior written consent of authorized representative of HCL 
>> is strictly prohibited. If you have received this email in error 
>> please delete it and notify the sender immediately. Before opening any 
>> email and/or attachments, please check them for viruses and other 
>> defects.
>> ________________________________
>>
> 
> Hi Jayashree,
> 
> I suggest you connect with Jason Bills on SEL.
> 
> 
