Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E24C136C9CD
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 18:55:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FV7F26pTQz2yyv
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 02:55:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Wed, 28 Apr 2021 02:55:40 AEST
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FV7Dr2Y1Bz2yYd
 for <openbmc@lists.ozlabs.org>; Wed, 28 Apr 2021 02:55:40 +1000 (AEST)
IronPort-SDR: MAWJhkMGgUiZQbPba3ZjwnmgMO0CIgzCTbqIaLt453YWMSvvOEcmdy/tR6nUu2ITERburH6jhG
 4ZAUfBv9i6qQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9967"; a="196660816"
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; d="scan'208";a="196660816"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 09:54:29 -0700
IronPort-SDR: ZQhlETvwjcPEN7yzKc9DAV7H5do4jSg/lD7eoEGjcI/yBbozdtDRSbMYpyyikLAdxDZe9Bfaxj
 rLn85XpxIYiQ==
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; d="scan'208";a="526165229"
Received: from rthomaiy-mobl.gar.corp.intel.com (HELO [10.213.94.227])
 ([10.213.94.227])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 09:54:27 -0700
Subject: Re: Need help with service-config-manager and socket activated
 services
To: Joseph Reynolds <jrey@linux.ibm.com>, openbmc <openbmc@lists.ozlabs.org>, 
 "Puli, Apparao" <apparao.puli@linux.intel.com>
References: <53032e76-bee4-9f04-231e-762c0c1b8e06@linux.ibm.com>
 <015eaa30-1803-20ea-2360-6819bef1221e@linux.ibm.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <0e963efc-bc9e-b765-e3a6-80117c1dd661@linux.intel.com>
Date: Tue, 27 Apr 2021 22:24:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <015eaa30-1803-20ea-2360-6819bef1221e@linux.ibm.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joseph,

Service config manager currently is not designed to monitor the new 
service instantiated dynamically. It lists all the objects instantiated 
when BMC FW starts and not after that.

ssh service will be started dynamically based on user connection to the 
SSH port. Hence following 2 things are possible

1. Control only socket attributes

2. Update service config manager to monitor signal for new unit service 
and accordingly update the attributes as needed.

Left comments in review.

Regards,

Richard

On 4/19/2021 8:16 PM, Joseph Reynolds wrote:
> On 4/7/21 6:04 PM, Joseph Reynolds wrote:
>> We are adding a new function to allow the BMC admin to disable the 
>> dropbear SSH server [issue 1763][]. This consists of a D-Bus 
>> interface controlled by [service-config-manager][] and an enhanced 
>> Redfish REST API.
>
> Richard and AppaRao,
>
> We are enhancing service-config-manager so it can control the dropbear 
> SSH server.  See [gerrit review 42072][].  The problem with this 
> patchset are:
> - It always reports dropbear as disabled.
> - When we enable dropbear via this service, it reports dropbear as 
> enabled for a few seconds, then it reports dropbear as disabled.
>
> I believe the underlying issue is that dropbear is socket activated 
> service.  Does service-config-manager understand how to control socket 
> activated services like dropbear server?
> - If so, can you help us debug what is going wrong?
> - If not, can you point us to what code needs to be enhanced to make 
> this work?
>
> Thanks,
> - Joseph
>
>>
>> We need help to understand how to enhance service-config-manager to 
>> work with socket activated services such as dropbear.  For example, 
>> to disable dropbear, is the correct action to perform something like 
>> this?:
>>   systemctl stop dropbear.socket
>>   systemctl disable dropbear.socket
>>
>> - Joseph
>>
>> [issue 1763]: https://github.com/ibm-openbmc/dev/issues/1763
>> [service-config-manager]: 
>> https://github.com/openbmc/service-config-manager
> [gerrit review 42072]: 
> https://gerrit.openbmc-project.xyz/c/openbmc/service-config-manager/+/42072
>
