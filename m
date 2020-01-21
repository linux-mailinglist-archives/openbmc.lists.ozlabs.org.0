Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BC0143665
	for <lists+openbmc@lfdr.de>; Tue, 21 Jan 2020 05:59:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481xD13PHLzDqVN
	for <lists+openbmc@lfdr.de>; Tue, 21 Jan 2020 15:59:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481xCK04RszDqS8
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jan 2020 15:59:07 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jan 2020 20:59:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,344,1574150400"; d="scan'208";a="278067455"
Received: from unknown (HELO [10.66.103.72]) ([10.66.103.72])
 by fmsmga001.fm.intel.com with ESMTP; 20 Jan 2020 20:59:03 -0800
Subject: Re: Verify Privilege For Different Channels in openbmc-test-automation
To: =?UTF-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>,
 Rahul Maheshwari <rahulmaheshwari01@gmail.com>
References: <10cf015965644daf9cfae7421e9f4710@quantatw.com>
 <CAAMkS132O2MB4myFcwPo0NQNf=hzvLYXgqoLXOxCcJe6mqHEMQ@mail.gmail.com>
 <0ebd5d88a9ea46328db578849d4b061b@quantatw.com>
 <CAAMkS12VRBFU77D50z0z4MHDeSG6pdOwU2MeBPO0K7TG6arTvA@mail.gmail.com>
 <d5f1c07fa629476798196f9490574c7c@quantatw.com>
 <5cb636bb-0d14-89c9-42b4-1d20d410ea82@linux.intel.com>
 <9f63a6b71e8a485bba08a1bedb1b922c@quantatw.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <c7782b54-da11-953e-815c-8f5a3a6610fc@linux.intel.com>
Date: Tue, 21 Jan 2020 10:29:02 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <9f63a6b71e8a485bba08a1bedb1b922c@quantatw.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Hi Tony / Rahul,

1. sel info 1  (I don't think sel info can get channel number, as sel is 
not based on channel numbers)

2. user list can be queried through channel number i.e. "user list 1" 
will query user privileges as per channel number 1 and "user list 3" 
will query user privileges as per channel number 3. But it doesn't 
determine the incoming channel number.

i.e. if a system is having 2 LAN Channels, then LAN channel privilege is 
based on the IP address of those channels

say channel 1 is having IP x.y.z.1 & channel 3 is having IP x.y.z.3  and 
channel 3 is with NoAccess

then executing following command will pass

ipmitool -I lanplus -H x.y.z.1 -U root -P 0penBmc user list 1

ipmitool -I lanplus -H x.y.z.1 -U root -P 0penBmc user list 3

Following command execution will fail

ipmitool -I lanplus -H x.y.z.3 -U root -P 0penBmc user list 1 --> will 
fail if channel 3 is with NoAccess privilege for user root

ipmitool -I lanplus -H x.y.z.3 -U root -P 0penBmc user list 1 --> will 
fail if channel 3 is with NoAccess privilege for user root

Please update the test case accordingly.

Regards,

Richard

On 1/21/2020 8:39 AM, Tony Lee (李文富) wrote:
>> Are you saying that with NoAcess for channel x, you are able to get the IPMI
>> response.
> Yes.
>
>> please note: -H x.x.x.x  determines, which channel you are trying to
>> communicate. Try the other IP address (because not sure, which channel is
>> configured to what IP).
> This is as I expected!
> However, please look at the cases "Verify Administrator And No Access Privilege For Different Channels"
> and "Verify Operator And User Privilege For Different Channels" in test_ipmi_user.robot.
> For example: case "Verify Administrator And No Access Privilege For Different Channels" at the last two "Verify" steps:
> '''
> # Verify that user is able to run administrator level IPMI command with channel 1.
> Verify IPMI Command  ${random_username}  ${valid_password}  Administrator  1
>
> # Verify that user is unable to run IPMI command with channel 2.
> Run IPMI Standard Command  sel info 2  expected_rc=${1}  U=${random_username}  P=${valid_password}
> '''
>
> In this case, first, there is only one IP address.
> second, I can't find a description or SPEC about command like
> "ipmitool -I lanplus -C 3 -p 623 -U YmRBwDUS -P 0penBmc1 -H x.x.x.x -L Administrator sel info 1"
> which mean user is able to run IPMI command with channel 1.
>
> If the method for out-of-band communication using different channels is the same as you described,
> do we need to fix these two cases?
>
>> Regards,
>>
>> Richard
>>
