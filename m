Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D29A3142EA2
	for <lists+openbmc@lfdr.de>; Mon, 20 Jan 2020 16:19:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481b0y2MVhzDqlB
	for <lists+openbmc@lfdr.de>; Tue, 21 Jan 2020 02:18:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481b0F1rMfzDqFh
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jan 2020 02:18:19 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jan 2020 07:18:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,342,1574150400"; d="scan'208";a="219675281"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.73.70])
 ([10.252.73.70])
 by orsmga008.jf.intel.com with ESMTP; 20 Jan 2020 07:18:13 -0800
Subject: Re: Verify Privilege For Different Channels in openbmc-test-automation
To: =?UTF-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>,
 Rahul Maheshwari <rahulmaheshwari01@gmail.com>
References: <10cf015965644daf9cfae7421e9f4710@quantatw.com>
 <CAAMkS132O2MB4myFcwPo0NQNf=hzvLYXgqoLXOxCcJe6mqHEMQ@mail.gmail.com>
 <0ebd5d88a9ea46328db578849d4b061b@quantatw.com>
 <CAAMkS12VRBFU77D50z0z4MHDeSG6pdOwU2MeBPO0K7TG6arTvA@mail.gmail.com>
 <d5f1c07fa629476798196f9490574c7c@quantatw.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <5cb636bb-0d14-89c9-42b4-1d20d410ea82@linux.intel.com>
Date: Mon, 20 Jan 2020 20:48:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <d5f1c07fa629476798196f9490574c7c@quantatw.com>
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

Are you saying that with NoAcess for channel x, you are able to get the 
IPMI response.

please note: -H x.x.x.x  determines, which channel you are trying to 
communicate. Try the other IP address (because not sure, which channel 
is configured to what IP).

Regards,

Richard

On 1/20/2020 8:11 AM, Tony Lee (李文富) wrote:
> Yes, It also is working.
> I think this lan print command doesn't represent running IPMI command with channel 1. It get channel 1 info with the LAN channel.
> Thanks for your kind help. I'll check with Richard regarding this problem.
>
> Regards,
> Tony
>
> From: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
> Sent: Friday, January 17, 2020 7:02 PM
> To: Tony Lee (李文富) <Tony.Lee@quantatw.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: Verify Privilege For Different Channels in openbmc-test-automation
>
> That seem to be an issue. Can you also check output for below lan print command? If that also is working, check with Richard regarding this problem.
>
> ipmitool -I lanplus -C 3 -p 623 -U DD -P 0penBmc1 -H x.x.x.x lan print 1
>
> On Fri, Jan 17, 2020 at 11:09 AM Tony Lee (李文富) <mailto:Tony.Lee@quantatw.com> wrote:
> Got it. Another question, at the last two "Verify" steps.
> Can the user run out-of-band IPMI commands with the specified channel?
> (e.g ipmitool -I lanplus -C 3 -p 623 -U YmRBwDUS -P 0penBmc1 -H x.x.x.x -L Administrator sel info 1)
>
> Is there a description or SPEC about it? It doesn't work on my system.
> For example:
> I created a user name DD and gave it different privilege for different channels.
>
> ipmitool user list 1
> ID  Name             Callin  Link Auth  IPMI Msg   Channel Priv Limit
> 1   root             false   true       true       ADMINISTRATOR
> ...
> ...
> 6   DD               true    false      false      NO ACCESS
>
> ipmitool user list 2
> ID  Name             Callin  Link Auth  IPMI Msg   Channel Priv Limit
> 1   root             false   true       true       ADMINISTRATOR
> ...
> ...
> 6   DD               true    false      true       ADMINISTRATOR
>
> As expected, it should not work if user run out-of-band IPMI commands with the channel 1.
> Howerver it still work.
> $ipmitool -I lanplus -C 3 -p 623 -U DD -P 0penBmc1 -H x.x.x.x sel info 1
>
> SEL Information
> Version          : 1.5 (v1.5, v2 compliant)
> Entries          : 6
> Free Space       : 0 bytes
> Percent Used     : 100%
> Last Add Time    : 01/06/1970 00:13:18
> Last Del Time    : Not Available
> Overflow         : false
> Supported Cmds   : 'Reserve'
>
> Thanks
> Best Regards,
> Tony
>
> From: Rahul Maheshwari <mailto:rahulmaheshwari01@gmail.com>
> Sent: Thursday, January 16, 2020 7:15 PM
> To: Tony Lee (李文富) <mailto:Tony.Lee@quantatw.com>
> Subject: Re: Verify Privilege For Different Channels in openbmc-test-automation
>
> Hi Tony
> These test cases are expected to fail if your system's BMC has only one LAN channel support. In case of your BMC has 2 LAN channel support, then these tests should pass.
>
> Thanks
> Rahul
>
> On Tue, Jan 14, 2020 at 2:52 PM Tony Lee (李文富) <mailto:mailto:Tony.Lee@quantatw.com> wrote:
> Hi Rahul,
>
> I meet with difficulties for the cases "Verify Administrator And No Access Privilege For Different Channels" and
> "Verify Operator And User Privilege For Different Channels" in test_ipmi_user.robot.
>
> Refer to https://github.com/openbmc/openbmc-test-automation/issues/1523
> According to Richard's comment: "Channel command privilege are working as per the channel (but at this point of time this differentiation can't be made due to architecture limitations, but ok to write test case and mark it as failed, rather than skipping the same)"
>
> Are these two cases be expected to fail?
>
> Thanks
> Best Regards,
> Tony
