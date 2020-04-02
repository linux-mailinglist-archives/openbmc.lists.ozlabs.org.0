Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D596F19CC3A
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 23:09:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tbK70RlPzDqyb
	for <lists+openbmc@lfdr.de>; Fri,  3 Apr 2020 08:08:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tbJQ4VDyzDqB7
 for <openbmc@lists.ozlabs.org>; Fri,  3 Apr 2020 08:08:20 +1100 (AEDT)
IronPort-SDR: oFq95ZHYDeAbt/cJKLvQjF4EQpg0nwqNUA5rvLfvrbfwdfydAWI1hp0ILyYBWmX0LE7nbEcEs0
 kpjUs0mMkfgQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2020 14:08:16 -0700
IronPort-SDR: yA/mHyrlbfSFcdQW2TieB+8ntSaEAJ1zPetdAKzoUSwwKiLKm3K1bb1FbnCgxELSisTAejR241
 1K6C9qaQn/tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,336,1580803200"; d="scan'208";a="268151436"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga002.jf.intel.com with ESMTP; 02 Apr 2020 14:08:16 -0700
Received: from [10.251.12.50] (jmbills-mobl.amr.corp.intel.com [10.251.12.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id B4C5058077B
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 14:08:16 -0700 (PDT)
Subject: Re: power policy restore
To: openbmc@lists.ozlabs.org
References: <420CA5B5-8C0F-4ACD-84E8-8FD374B7F1C7@fb.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <549a530c-cc7f-287e-d4b6-8c97eef9194f@linux.intel.com>
Date: Thu, 2 Apr 2020 14:08:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <420CA5B5-8C0F-4ACD-84E8-8FD374B7F1C7@fb.com>
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



On 4/2/2020 10:55 AM, Vijay Khemka wrote:
> Hi Jason,
> 
> I see power policy restore is implemented in chassis handler of main 
> ipmid daemon. And I don’t see any implementation of ac_boot dbus 
> interface addition which is required by x86-power-control to start 
> restorePowerPolicy. I do see that this interface is being added in 
> intel-ipmi-oem. Does it mean that phosphor-host-ipmid has incomplete 
> implementation, and if it is incomplete by ipmi standard then can we add 
> code in ipmid.
The IPMI maintainers will need to comment, but the IPMI spec states "The 
power restore policy determines how the system or chassis behaves when 
AC power returns after an AC power loss."

On our systems, the BMC also loses power on AC loss, so we added the 
ACBoot property to determine if the BMC is booting due to AC loss and 
can apply the power restore policy.

I don't know if ipmid is the right place to determine if the system is 
returning from an AC power loss, but if it could be standardized that 
would be great.

> 
> Is there any other platform using restorePowerPolicy features without 
> ac_boot features?
> 
> Regards
> 
> -Vijay
> 
