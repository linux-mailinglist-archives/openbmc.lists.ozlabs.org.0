Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8CF35E546
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 19:44:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKXzs682Dz3bnH
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 03:44:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKXzj065Pz2yxx
 for <openbmc@lists.ozlabs.org>; Wed, 14 Apr 2021 03:44:31 +1000 (AEST)
IronPort-SDR: EC3r2xRAHMMfXTxRkZRku2W326FGV/MHvslA6w04hlxZCYx47B6xaGIAJ5OQqwirXPAcJnbalh
 94i7R1h2u3DQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="174568946"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; d="scan'208";a="174568946"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 10:44:24 -0700
IronPort-SDR: I4890AEddeIKUDrc/PXS2RJ7Q4HwZnF/nQQlSdw5dWHyuUxAEiplpX2YjWKy9RwcGNouXdQSLd
 dcNXMq+0ko0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; d="scan'208";a="424353992"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 13 Apr 2021 10:44:24 -0700
Received: from [10.212.186.170] (jmbills-MOBL.amr.corp.intel.com
 [10.212.186.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3136B580021
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 10:44:24 -0700 (PDT)
Subject: Re: Lost the threshold redfish log when update phosphor-sel-logger.
To: openbmc@lists.ozlabs.org
References: <E89303EA-4B66-4BAB-9A8B-C68EA398DA63@amperemail.onmicrosoft.com>
 <94EE2CFC-1679-492D-9EF8-D7A8F24BF086@amperemail.onmicrosoft.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <c19528bc-815b-cf38-b07a-ea5e84529232@linux.intel.com>
Date: Tue, 13 Apr 2021 10:44:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <94EE2CFC-1679-492D-9EF8-D7A8F24BF086@amperemail.onmicrosoft.com>
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



On 4/13/2021 12:51 AM, Thu Nguyen OS wrote:
> Dear Zhikui Ren, Patrick Williams and Jason M. Bills,
> 
> Do you have any comment in this?
> 
> Dear Zhikui Ren,
> 
> Do you verify this commit with the sensors which added thru phosphor-hwmon?
This issue was recently discussed here: 
https://lore.kernel.org/openbmc/TY2PR04MB3712DCE11C578706F5F6401F88639@TY2PR04MB3712.apcprd04.prod.outlook.com/.

Since that discussion, this change to phosphor-dbus-interfaces was 
merged to add support for new threshold signals that contain the sensor 
value: 
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/39899.

I believe that corresponding changes can now be added to dbus-sensors, 
hwmon, and sel-logger to correctly handle these new signals to resolve 
the issue you see here.
> 
> Regards.
> 
> Thu Nguyen.
> 
> *From: *Thu Nguyen OS <thu@os.amperecomputing.com>
> *Date: *Monday, 5 April 2021 at 22:28
> *To: *"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
> *Subject: *Lost the threshold redfish log when update phosphor-sel-logger.
> 
> Hi All,
> 
> After updating the base code of our openBmc source for Mt Jade platform 
> to new version, I saw all of threshold warning/error of hwmon are losted.
> 
> Below is the sensor value and the configured thresholds.
> 
> Check in the web, the sensor value is bigger than warning threshold, but 
> there are no log SEL entry in Redfish log.
> 
> After spending some time on debugging, I found that the below commit is 
> the cause:
> 
> https://github.com/openbmc/phosphor-sel-logger/commit/25b26e162bd109b51aa09b16f26f9aa3d9d940fa
> 
> Remove this commit in phosphor-sel-logger, I can see the warning log in 
> Redfish.
> 
> Do I need any configuration in phosphor-sel-logger to make this commit work?
> 
> Thanks.
> 
> Thu Nguyen.
> 
