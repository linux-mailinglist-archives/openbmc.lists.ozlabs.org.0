Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE4214C1CE
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 21:51:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486f0d1j3mzDqMr
	for <lists+openbmc@lfdr.de>; Wed, 29 Jan 2020 07:51:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486dzm4XPMzDqFG
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jan 2020 07:50:26 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 12:50:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,375,1574150400"; d="scan'208";a="429456458"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 28 Jan 2020 12:50:22 -0800
Received: from [10.241.246.17] (unknown [10.241.246.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id BCEFF5803C1;
 Tue, 28 Jan 2020 12:50:22 -0800 (PST)
Subject: Re: power button override
To: Vijay Khemka <vijaykhemka@fb.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <98EE6AEE-9440-4AA5-971A-833EA0342226@fb.com>
 <d01cf897-0c23-35dc-5f81-aca67d31b98a@linux.intel.com>
 <0017A7FA-E86C-4524-B53B-9129A968C7DB@fb.com>
 <563c3b07-d5f5-1897-404b-ceb97f713610@linux.intel.com>
 <1b72ee84-6ad3-f5bb-bfed-2f6487893f59@linux.intel.com>
 <3AC1554A-4B97-45CA-BDE2-299AD172A9FD@fb.com>
 <698a1a8e-786e-3713-4b94-da7cf7864406@linux.intel.com>
 <01CE1094-7B1C-44F5-8580-C0098391EA6F@fb.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <da001fe8-31f4-4343-a711-a91e44c0a22c@linux.intel.com>
Date: Tue, 28 Jan 2020 12:50:22 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <01CE1094-7B1C-44F5-8580-C0098391EA6F@fb.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 1/27/2020 12:31 PM, Vijay Khemka wrote:
> 
> 
> ﻿On 1/27/20, 10:52 AM, "Bills, Jason M" <jason.m.bills@linux.intel.com> wrote:
> 
>      
>      
>      On 1/24/2020 2:01 PM, Vijay Khemka wrote:
>      >
>      >
>      > On 1/24/20, 1:13 PM, "openbmc on behalf of Bills, Jason M" <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org on behalf of jason.m.bills@linux.intel.com> wrote:
>      >
>      >
>      >
>      >      On 1/24/2020 12:55 PM, Bills, Jason M wrote:
>      >      >
>      >      >
>      >      > On 1/24/2020 10:29 AM, Vijay Khemka wrote:
>      >      >>
>      >      >>
>      >      >> On 1/23/20, 4:36 PM, "Bills, Jason M" <jason.m.bills@linux.intel.com>
>      >      >> wrote:
>      >      >>
>      >      >>      On 1/23/2020 4:13 PM, Vijay Khemka wrote:
>      >      >>      > Hi Jason,
>      >      >>      >
>      >      >>      > We have a requirement of power button override. I don’t see
>      >      >> x86-power
>      >      >>      > control doesn’t support this currently. Do you need this
>      >      >> features or do
>      >      >>      > you have any local patch for this.
>      >      >>      Hi Vijay,
>      >      >>      power button override is used for the "Force Off" actions in
>      >      >> power control:
>      >      >>
>      >      >> https://github.com/openbmc/x86-power-control/blob/master/power-control-x86/src/power_control.cpp#L50.
>      >      >>
>      >      >>
>      >      >> This will not work if current status is off. This should just send
>      >      >> pulse in any status on/off.
>      >      > Correct.  Force Off is not done if the current status is off.
>      >      Do you have more details on the power button override behavior that you
>      >      need?
>      >
>      > Yes, This is required to bring ME back to operation mode from recovery. How are you handling ME for Bios upgrade.
>      When in recovery mode, the ME will accept a reset command (IPMI raw 0x6
>      0x2) to reset to operational mode.
> 
> Bill, I tried this and see inconsistent behavior from host. Sometime it refuse to power on. So PBO resolves this.
I checked with the ME team and ME reset to move from recovery mode to 
operational mode should work.  You can file a ticket with Intel support 
to help resolve the inconsistent behavior that you see when doing this.

In the meantime, I will look over your patch.

Thanks,
-Jason

>      
>      >
>      >      >>      >
>      >      >>      > Regards
>      >      >>      >
>      >      >>      > -Vijay
>      >      >>      >
>      >      >>
>      >
>      >
>      
> 
