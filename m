Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDB91E5D0A
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 12:22:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XkJy62ZkzDqT3
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 20:22:10 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XkJG5fbXzDqBr
 for <openbmc@lists.ozlabs.org>; Thu, 28 May 2020 20:21:34 +1000 (AEST)
IronPort-SDR: IVU5QAe/1pTQT/X3aVAQ7u/Rh+w0ehBDvBCCg0/hgSgdGvZ/pI56ChGOvpIzh32E9O03HevCVk
 KGfkN4stFKxg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 03:21:31 -0700
IronPort-SDR: uLQ55GkiFvFKqJEWqv7VpaT/DEH7HfwigNNfYE1yUBsYCMxQlzqPARAucx+T9GX+H3lerdMW9U
 jG1CaPrpMIWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,444,1583222400"; d="scan'208";a="469066565"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.69.146])
 ([10.252.69.146])
 by fmsmga005.fm.intel.com with ESMTP; 28 May 2020 03:21:29 -0700
Subject: Re: Question of ipmi command "Set User Access" in phosphor-host-ipmid
To: =?UTF-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
References: <e46d19fbea37479ca10df26e35d474b2@quantatw.com>
 <e4c12ff6-3387-3dc6-eafa-42e5ac830079@linux.intel.com>
 <420a769b740b4ec58c5f4702c5bb2fc2@quantatw.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <fe7a616c-bb9e-596a-ceea-940f00b052c4@linux.intel.com>
Date: Thu, 28 May 2020 15:51:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <420a769b740b4ec58c5f4702c5bb2fc2@quantatw.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Tony,

Yes, that's correct. We already support  channel configuration using 
json(channel_config.json under phosphor-ipmi-config), and sync channel 
can be identified by the first LAN medium channel number - else we can 
add one more configuration as well).

I am ok if you want to go ahead and fix it, else will try to fix the 
same in couple of weeks.

Regards,

Richard

On 5/28/2020 1:39 PM, Tony Lee (李文富) wrote:
> Hi Richard,
>
> So, it need to check the request channel number before setting the dbus
> because it has to be in sync with system user privilege level.
>
> Since my LAN1 and the request channel number are both 2.
> Once we can get LAN1 channel number dynamically
> https://github.com/openbmc/phosphor-host-ipmid/blob/master/user_channel/user_mgmt.cpp#L512
>
> This issue will be solved right?
>
>> From: Thomaiyar, Richard Marian <richard.marian.thomaiyar@linux.intel.com>
>> Sent: Tuesday, May 26, 2020 12:28 AM
>> To: Tony Lee (李文富) <Tony.Lee@quantatw.com>
>> Cc: openbmc@lists.ozlabs.org
>> Subject: Re: Question of ipmi command "Set User Access" in
>> phosphor-host-ipmid
>>
>> Hi Tony,
>>
>> Only IPMI offers channel based user level privilege as of now, Redfish uses
>> single privilege across all channels. OpenBMC user management is designed to
>> have single user level privilege. IPMI is designed to bind one of the channel
>> privilege user to the user management, and rest maintain in it's own database.
>> LAN 1 is used for that sync.
>>
>> Note: Discussion started in Redfish forum to have a channel based restriction,
>> but it's not yet materialized and requires more takers.
>>
>> Regards,
>>
>> Richard
>>
>> On 5/25/2020 12:58 PM, Tony Lee (李文富) wrote:
>>> In the process of creating an user,
>>> I used the ipmi command "ipmitool priv <user id> <privilege level>
>> [<channel number>]".
>>> The "UserPrivilege" of the user I created in dbus is empty. Because my LAN
>> channel number is not 1.
>>>
>> https://github.com/openbmc/phosphor-host-ipmid/blob/master/user_chann
>> e
>>> l/user_mgmt.cpp#L878
>>>
>>> Why did it need to check the request channel number before setting the
>> dbus?
>>> I can't find the related restriction of it in "Set User Access Command" in IPMI
>> SPEC.
>>> Thanks
>>> Best Regards,
>>> Tony
