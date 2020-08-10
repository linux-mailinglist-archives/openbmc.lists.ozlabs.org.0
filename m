Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50778240C15
	for <lists+openbmc@lfdr.de>; Mon, 10 Aug 2020 19:34:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQNQ26m5vzDqT8
	for <lists+openbmc@lfdr.de>; Tue, 11 Aug 2020 03:34:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQNP26X0PzDqS7
 for <openbmc@lists.ozlabs.org>; Tue, 11 Aug 2020 03:33:57 +1000 (AEST)
IronPort-SDR: 7gDTCtwPAPCKA2C1ZMb+yvQMqVNjfXWKf1XcVoxG+8JVTmw6SACUOTmkC2Awt9D6iHvHiENYO0
 +fkZMLbKEY/Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9709"; a="154703415"
X-IronPort-AV: E=Sophos;i="5.75,458,1589266800"; d="scan'208";a="154703415"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2020 10:33:53 -0700
IronPort-SDR: tD51LpNfN7UzfOnv4bnuc3u0NY4z2i+l7ciFZMTwVqXADN242Xfql6L9Zr9vA/F/2NElVWqUCy
 O9Zl1lOvL2KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,458,1589266800"; d="scan'208";a="317432337"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 10 Aug 2020 10:33:49 -0700
Received: from [10.212.34.83] (jmbills-mobl.amr.corp.intel.com [10.212.34.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id B0C5A580223
 for <openbmc@lists.ozlabs.org>; Mon, 10 Aug 2020 10:33:49 -0700 (PDT)
Subject: Re: system power control
To: openbmc@lists.ozlabs.org
References: <BYAPR14MB2342FEAAE4DBA6383E3885FFCF490@BYAPR14MB2342.namprd14.prod.outlook.com>
 <2b9f359f-019a-c6b4-d200-357124649cd7@linux.intel.com>
 <BYAPR14MB23424B7B0D6A450C52235EC2CF490@BYAPR14MB2342.namprd14.prod.outlook.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <79b66c10-9391-f040-356e-19d37cbf1f15@linux.intel.com>
Date: Mon, 10 Aug 2020 10:33:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <BYAPR14MB23424B7B0D6A450C52235EC2CF490@BYAPR14MB2342.namprd14.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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



On 8/7/2020 6:19 PM, Zhao Kun wrote:
> Thank you, Jason. Could you share with me any example of defining those 
> GPIOs in device tree for x86-power-control? I can’t find any in 
> aspeed-bmc-intel-s2600wf.dts.

Sorry for not sending link before.  You can find our DTS implementation 
here: 
https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-kernel/linux/linux-aspeed/0001-arm-dts-add-DTS-for-Intel-ast2500-platforms.patch.

> 
> Thanks.
> 
> Best regards,
> 
> Kun Zhao
> 
> /*
> 
> zkxz@hotmail.com <mailto:zkxz@hotmail.com>
> 
> */
> 
> *From: *Bills, Jason M <mailto:jason.m.bills@linux.intel.com>
> *Sent: *Friday, August 7, 2020 10:12 AM
> *To: *openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>
> *Subject: *Re: system power control
> 
> 
> 
> On 8/6/2020 11:43 PM, Zhao Kun wrote:
>  > Hi,
>  >
>  > I’m new to learn how to make OpenBMC work on a X86 based system.
>  > Currently I met a problem of mapping the GPIOs about power
>  > on/off/reset/status into OpenBMC logic. I understand when user issue a
>  > power on request through any user interfaces like RESTful, IPMI, etc.,
>  > some service (phosphor-state-manager?) will be triggered to check
>  > current status and roll out corresponding systemd services to do the
>  > job. (please correct me if I’m wrong)
>  >
>  > But I’m just confused on how those services actually toggle or check the
>  > GPIOs, there seems be many choices,
>  >
>  >  1. Device tree?
>  >  2. Using Workbook gpio_defs.json?
>  >  3. Create some services calling platform specific scripts to operate
>  >     GPIO or I2C devices?
>  >  4. Using x86-power-control?
>  >
>  > So what’s the most recommended way to do it? Really appreciated If
>  > anyone can share some lights.
> On Intel reference platforms, we use x86-power-control and configure the
> GPIO names using device tree.
> 
>  >
>  > I thought there must be a mechanism to consume some kind of
>  > configuration file as the hardware abstraction layer. So I guess it
>  > might be gpio_defs.json or device tree.
>  >
>  > Thanks.
>  >
>  > Best regards,
>  >
>  > Kun Zhao
>  >
>  > /*
>  >
>  > zkxz@hotmail.com <mailto:zkxz@hotmail.com>
>  >
>  > */
>  >
> 
