Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 010ED16C3AE
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 15:18:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RgyZ2ZpvzDqB7
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 01:18:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Rgxp1VpmzDq8W
 for <openbmc@lists.ozlabs.org>; Wed, 26 Feb 2020 01:17:49 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 06:17:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; d="scan'208";a="284680879"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.78.118])
 ([10.252.78.118])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Feb 2020 06:17:44 -0800
Subject: Re: System Firmware states on D-Bus
To: Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <9CA8B63A-991B-49C2-A8D1-83D1CCB6C46A@gmail.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <4fd6c84c-8d57-b907-5aad-9057476a3be8@linux.intel.com>
Date: Tue, 25 Feb 2020 19:47:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <9CA8B63A-991B-49C2-A8D1-83D1CCB6C46A@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Prefer D-Bus conveying details in finer / better manner, rather than 
tying it towards any user facing application like Redfish / IPMI.

i.e. We can define all possible values in D-Bus interface, so that any 
application (common / oem), can try to use the value, rather than value 
not being available in D-Bus. Redfish / IPMI can have conversion logic 
to group the values as per the need.

Regards,

Richard

On 2/24/2020 10:57 PM, Andrew Geissler wrote:
> I sent an email[1] out a while ago about mapping Redfish Host states to
> PLDM Boot values.
>
> Now that we have that design moving, the next question is whether we want
> to try and map these to our current IPMI-based state sensors[2]
> (OperatingSystemState and BootProgress)? These are currently displayed when
> a user does a "obmcutil state" and I see a few other repositories reference
> them for boot status. The openbmc-test suite also uses them fairly extensively
> to verify different boot tests.
>
> If we want to maintain backwards compatibility then we should map the new PLDM
> based boot progress to these two. Mapping them does not seem too difficult.
> I could have phosphor-host-state-manager (which hosts these D-Bus properties)
> listen for changes to the PLDM property and update the two properties
> appropriately. This assumes a system where the system firmware is only
> IPMI or PLDM (not both) since they would not play all that well together.
>
>  From a Redfish API perspective, it will just directly look at the PLDM
> property.
>
> Thoughts?
>
> [1]: https://lists.ozlabs.org/pipermail/openbmc/2020-February/020417.html
> [2]: https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/State/Boot/Progress.interface.yaml
>       https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/State/OperatingSystem/Status.interface.yaml
