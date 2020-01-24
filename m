Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 998B3148FD4
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 21:56:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 484BJH3YjLzDqgL
	for <lists+openbmc@lfdr.de>; Sat, 25 Jan 2020 07:56:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 484BHP5bsgzDqgC
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jan 2020 07:55:28 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2020 12:55:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,358,1574150400"; d="scan'208";a="276423369"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Jan 2020 12:55:20 -0800
Received: from [10.241.245.109] (unknown [10.241.245.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 24C2458053B;
 Fri, 24 Jan 2020 12:55:20 -0800 (PST)
Subject: Re: power button override
To: Vijay Khemka <vijaykhemka@fb.com>,
 James Feist <james.feist@linux.intel.com>
References: <98EE6AEE-9440-4AA5-971A-833EA0342226@fb.com>
 <d01cf897-0c23-35dc-5f81-aca67d31b98a@linux.intel.com>
 <0017A7FA-E86C-4524-B53B-9129A968C7DB@fb.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <563c3b07-d5f5-1897-404b-ceb97f713610@linux.intel.com>
Date: Fri, 24 Jan 2020 12:55:19 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0017A7FA-E86C-4524-B53B-9129A968C7DB@fb.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 1/24/2020 10:29 AM, Vijay Khemka wrote:
> 
> 
> ﻿On 1/23/20, 4:36 PM, "Bills, Jason M" <jason.m.bills@linux.intel.com> wrote:
> 
>      
>      
>      On 1/23/2020 4:13 PM, Vijay Khemka wrote:
>      > Hi Jason,
>      >
>      > We have a requirement of power button override. I don’t see x86-power
>      > control doesn’t support this currently. Do you need this features or do
>      > you have any local patch for this.
>      Hi Vijay,
>      
>      power button override is used for the "Force Off" actions in power control:
>      https://github.com/openbmc/x86-power-control/blob/master/power-control-x86/src/power_control.cpp#L50.
> 
> This will not work if current status is off. This should just send pulse in any status on/off.
Correct.  Force Off is not done if the current status is off.
>      >
>      > Regards
>      >
>      > -Vijay
>      >
>      
> 
