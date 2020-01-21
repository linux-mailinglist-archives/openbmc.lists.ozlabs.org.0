Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEDD144892
	for <lists+openbmc@lfdr.de>; Wed, 22 Jan 2020 00:51:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482QKy3k1VzDqQd
	for <lists+openbmc@lfdr.de>; Wed, 22 Jan 2020 10:51:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482QKH2TJxzDqNZ
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2020 10:50:57 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 15:50:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,347,1574150400"; d="scan'208";a="275448884"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Jan 2020 15:50:53 -0800
Subject: Re: No sensors displayed in webUI
To: Gunnar Mills <gmills@linux.vnet.ibm.com>,
 Max Power <max_power2005-openbmc@yahoo.com>, openbmc@lists.ozlabs.org
References: <138261238.19427827.1579077694127.ref@mail.yahoo.com>
 <138261238.19427827.1579077694127@mail.yahoo.com>
 <454935377.24643249.1579594638683@mail.yahoo.com>
 <a91d25dc-9435-63e2-8611-bee8c80c8e2d@linux.intel.com>
 <39f5ca46-9617-c233-a6ed-30e6b978572d@linux.vnet.ibm.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <12692413-81f7-01ef-a99d-122746dc7405@linux.intel.com>
Date: Tue, 21 Jan 2020 15:50:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <39f5ca46-9617-c233-a6ed-30e6b978572d@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

On 1/21/20 3:00 PM, Gunnar Mills wrote:
> 
> On 1/21/2020 1:02 PM, James Feist wrote:
>> On 1/21/20 12:17 AM, Max Power wrote:
>>>
>>> Any chance to get the "bug in dbus-sensors" fixed in the near future?
>>
>> I have no plans on changing dbus-sensors, since this works with 
>> Redfish, and Redfish is the future back-end for the WebUI. I'd be fine 
>> if someone wants to add unit support for an intermediate fix. That or 
>> we could finish this patch and get the WebUI moved over.
>>
>> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/28342
>>
> 
> I support moving the WebUI to Redfish but moving the sensor page to 
> Redfish, I feel hides the actual problem.
> I think we should follow the phosphor-dbus-interfaces.

I tried to update the interface, but last time I got hit with that I had 
to prove that witherspoon fan control still worked without having access 
to such a system, and the Qemu model didn't offer sensor scanning. This 
was after I'd already spent a large amount of time getting buy-in.

> 
> If we don't follow the interfaces, how when writing code, whether 
> phoshor-webui code or bmcweb code, do you know what to expect?
> 
> If "Unit" is redundant information, then I feel it should be removed 
> from phosphor-dbus-interfaces and stricter requirements on the sensor 
> path should be added.

I'm fine with someone adding Unit if they need it.

> 
> See https://lists.ozlabs.org/pipermail/openbmc/2020-January/020207.html
> 
> Thanks!
> Gunnar
