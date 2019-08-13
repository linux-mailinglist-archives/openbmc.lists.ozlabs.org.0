Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 035C98C25A
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 22:55:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467Q2q1DwwzDqhH
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 06:55:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=terry.s.duncan@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467Q293WHqzDqVL
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 06:54:40 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 13:54:37 -0700
X-IronPort-AV: E=Sophos;i="5.64,382,1559545200"; d="scan'208";a="167173049"
Received: from tsduncan-ubuntu.jf.intel.com (HELO [10.7.169.130])
 ([10.7.169.130])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
 13 Aug 2019 13:54:37 -0700
Subject: Re: [PATCH net-next] net/ncsi: allow to customize BMC MAC Address
 offset
To: Tao Ren <taoren@fb.com>
References: <20190807002118.164360-1-taoren@fb.com>
 <20190807112518.644a21a2@cakuba.netronome.com>
 <20190807184143.GE26047@lunn.ch>
 <806a76a8-229a-7f24-33c7-2cf2094f3436@fb.com>
 <20190808133209.GB32706@lunn.ch>
 <77762b10-b8e7-b8a4-3fc0-e901707a1d54@fb.com>
 <20190808211629.GQ27917@lunn.ch>
 <ac22bbe0-36ca-b4b9-7ea7-7b1741c2070d@fb.com>
 <20190808230312.GS27917@lunn.ch>
 <f1519844-4e21-a9a4-1a69-60c37bd07f75@fb.com>
 <10079A1AC4244A41BC7939A794B72C238FCE0E03@fmsmsx104.amr.corp.intel.com>
 <bc9da695-3fd3-6643-8e06-562cc08fbc62@linux.intel.com>
 <dc0382c9-7995-edf5-ee1c-508b0f759c3d@linux.intel.com>
 <faa1b3c9-9ba3-0fff-e1d4-f6dddb60c52c@fb.com>
From: Terry Duncan <terry.s.duncan@linux.intel.com>
Message-ID: <33e3e783-fb93-e628-8baa-a8374540ea25@linux.intel.com>
Date: Tue, 13 Aug 2019 13:54:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <faa1b3c9-9ba3-0fff-e1d4-f6dddb60c52c@fb.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <jakub.kicinski@netronome.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Ben Wei <benwei@fb.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S.Miller" <davem@davemloft.net>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 8/13/19 11:28 AM, Tao Ren wrote:
> On 8/13/19 9:31 AM, Terry Duncan wrote:
>> Tao, in your new patch will it be possible to disable the setting of the BMC MAC?  I would like to be able to send NCSI_OEM_GET_MAC perhaps with netlink (TBD) to get the system address without it affecting the BMC address.
>>
>> I was about to send patches to add support for the Intel adapters when I saw this thread.
>>
>> Thanks,
>>
>> Terry
> 
> Hi Terry,
> 
> Sounds like you are planning to configure BMC MAC address from user space via netlink? Ben Wei <benwei@fb.com> started a thread "Out-of-band NIC management" in openbmc community for NCSI management using netlink, and you may follow up with him for details.
> 
> I haven't decided what to do in my v2 patch: maybe using device tree, maybe moving the logic to uboot, and I'm also evaluating the netlink option. But it shouldn't impact your patch, because you can disable NCSI_OEM_GET_MAC option from your config file.

Thanks Tao. I see now that disabling the NCSI_OEM_GET_MAC option will do 
what I want.

Best,
Terry
