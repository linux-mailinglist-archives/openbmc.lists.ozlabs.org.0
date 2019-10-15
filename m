Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D76CD7BA4
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 18:31:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46t1Cc5w95zDr42
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 03:31:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46t1Bl13RjzDr42
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 03:30:53 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Oct 2019 09:30:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,300,1566889200"; d="scan'208";a="347127771"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga004.jf.intel.com with ESMTP; 15 Oct 2019 09:30:50 -0700
Received: from [10.241.244.250] (unknown [10.241.244.250])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id B3F23580379;
 Tue, 15 Oct 2019 09:30:50 -0700 (PDT)
Subject: Re: [External] Re: IPMI SEL Event ID
To: Ivan Li11 <rli11@lenovo.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <1082e383cba94367945d14175a0d787b@lenovo.com>
 <38fd5723-9e41-1415-c64b-738981c70f72@linux.intel.com>
 <a65e103c1f874371987a7c9d503c9d2f@lenovo.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <2b122a71-7c8c-70ed-b63b-f0bb2fe35f78@linux.intel.com>
Date: Tue, 15 Oct 2019 09:30:50 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a65e103c1f874371987a7c9d503c9d2f@lenovo.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 10/15/2019 3:11 AM, Ivan Li11 wrote:
> Hi Jason,
> 
> New SEL ID is still not from base number(1) after "sel clear" command with the fix you provided.
> Is there any setting I need to notice that?
> Please help to advise it.

Do you use rsyslog files or DBus entries for the SEL log?  The fix I 
made works only for rsyslog files by checking if the files have been 
deleted (after a SEL Clear) and resets to 1 if they have.

If you are using DBus for SEL log entries, then the logic to initialize 
and increment the SEL Record ID will need to be updated to also check DBus.

Thanks,
-Jason
> 
> Thanks,
> Ivan
>> -----Original Message-----
>> From: openbmc <openbmc-bounces+rli11=lenovo.com@lists.ozlabs.org> On
>> Behalf Of Bills, Jason M
>> Sent: Tuesday, September 24, 2019 1:36 AM
>> To: openbmc@lists.ozlabs.org
>> Subject: [External] Re: IPMI SEL Event ID
>>
>>
>>
>> On 9/22/2019 5:19 AM, Yonghui YH21 Liu wrote:
>>> HI All,
>>>
>>>            I find the new SEL event ID is not from base number(1) after
>>> I run "ipmitool sel clear" command.
>>>
>>>            Is it the OpenBMC default design rule ? If not, any plan to
>>> fix the issue?
>>
>> If you are using phosphor-sel-logger, it is a bug.  The fix for it is up for review
>> here:
>> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-sel-logger/+/24843
>>
>> Thanks!
>> -Jason
>>>
>>> Thanks
>>>
