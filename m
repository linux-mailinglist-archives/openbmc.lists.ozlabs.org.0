Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE9A26C4A2
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 17:56:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bs4Sx5hPtzDqK5
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 01:56:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bs4Rs2fZbzDqWW
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 01:55:04 +1000 (AEST)
IronPort-SDR: bv4NHjbxR6kmwdH2YqF4xuc6TJjIGycoBmEeye32EdP3VHZAX/l+AJRTNVN1hm4Sl3Ft5Ed+JC
 CF4v2/A9IVVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="223681194"
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; d="scan'208";a="223681194"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 08:54:55 -0700
IronPort-SDR: jyNVbAr/S98dRxXvTEQq3geaXoqmt09b1FVCIm6E15R2oqEKRgLa1jp9LM3lvscQ3sKtGzt64l
 M/LcDYwK3cxw==
X-IronPort-AV: E=Sophos;i="5.76,433,1592895600"; d="scan'208";a="483360403"
Received: from rthomaiy-mobl.gar.corp.intel.com (HELO [10.213.94.87])
 ([10.213.94.87])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 08:54:52 -0700
Subject: Re: Enhance Redfish to allow IPMI users
To: Joseph Reynolds <jrey@linux.ibm.com>, openbmc <openbmc@lists.ozlabs.org>
References: <ad18636c-c817-c5c6-5d17-a41d137f56d7@linux.ibm.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <eaa5b696-3b78-bdda-354f-7234666fb3ad@linux.intel.com>
Date: Wed, 16 Sep 2020 21:24:48 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ad18636c-c817-c5c6-5d17-a41d137f56d7@linux.ibm.com>
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

Yes, phosphor-user-management supports the same. i.e. Users can be 
created with different groups and they can also change group after 
creation, Password restrictions apply accordingly.

IPMI doesn't have OEM Commands for this, but How about adding community 
based OEM commands to support these in IPMI as well, along with Redfish 
enhancements. Vernon / Tom ?

Note: One of the problem we still need to solve is how to deploy user 
account Out of the box. Current solutions are

1. Default user account built in with common password (security 
concern)/ Unique password (Still some concerns)

2. Deploy with no default user account in BMC. First user will be 
created through Host interface (BIOS setup option), through host IPMI 
(Again some concerns here).

#2 can't work directly on Redfish as we don't have host interface 
communicating to Redfish, and the current concern of the WG is it still 
requires authentication mechanism for deployment.

Regards,

Richard

On 9/16/2020 1:08 AM, Joseph Reynolds wrote:
>
> I am working on a new feature so the BMC admin can use Redfish 
> operations to allow or deny specific users to use the BMC's network 
> IPMI interface.
> The goal is to be able to configure the BMC out of the box with no 
> users authorized to use the IPMI network service, and then as needed 
> enable network IPMI and allow specific users to use that service.
>
<Richard> : This can be achieved even today, by having IPMI network 
service disabled by default, and then enabling it through 
ManagerNetworkProtocol (IPMI) in Redfish (Irrespective of user account 
group restrictions).
> The direction for this seems to be adding the IPMI enum to the 
> ManagerAccount AccountTypes array.
> https://redfishforum.com/thread/219/account-groups-property?page=1&scrollTo=1289 
>
>
> If we had this, the BMC admin could allow someuser to use IPMI like 
> this: PATCH /redfish/v1/AccountService/Account/someuser with 
> {AccountTypes: [...,IPMI,...]} and possibly also changing the password.
>
> Would this work with OpenBMC phosphor user management?  The forum 
> thread has additional considerations.  Will the IPMI maintainers 
> please comment here or on the forum?
>
> - Joseph
>
