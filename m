Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BF6EE8F4
	for <lists+openbmc@lfdr.de>; Mon,  4 Nov 2019 20:52:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476NkZ30CBzF3b2
	for <lists+openbmc@lfdr.de>; Tue,  5 Nov 2019 06:52:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476Njw4jjQzF3F9
 for <openbmc@lists.ozlabs.org>; Tue,  5 Nov 2019 06:52:19 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Nov 2019 11:52:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,268,1569308400"; d="scan'208";a="401730565"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2019 11:52:15 -0800
Received: from [10.241.244.182] (unknown [10.241.244.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id B668F58045B
 for <openbmc@lists.ozlabs.org>; Mon,  4 Nov 2019 11:52:15 -0800 (PST)
Subject: Re: x86-power-control
To: openbmc@lists.ozlabs.org
References: <D2637F4F-E67C-424E-86FF-D20E0415CB43@fb.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <c663ed26-8d49-b35d-ea8e-d80c04427e00@linux.intel.com>
Date: Mon, 4 Nov 2019 11:52:15 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <D2637F4F-E67C-424E-86FF-D20E0415CB43@fb.com>
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

Hi Vijay,

On 11/1/2019 5:33 PM, Vijay Khemka wrote:
> Hi Jason/James,
> I see some limitation in current x86-power-control as we don’t have NMI_OUT, NMI_BUTTON and ID_BUTTON usage. And I am not sure why these are being used. So if I don’t define these in DTS then this program fails. So Please how to disable these. These should be optional. I have following options to disable these.
> 
> 1. No returning -1 if we don't find line name, simply move on. I have to see impact on rest of code.
> 2. Make it compile time flag and should be included through bbappend like -DNMI_OUT etc.
I chatted with James and I think we like this option the best.  If you 
set a build flag that is enabled by default, it will let you disable the 
features you don't need in a .bbappend.  This will let you remove the 
pins you don't use and still allow for easier detection when an expected 
pin isn't working.

Thanks,
-Jason

> 3. Have config Jason file and enable or disable gpio line to be used.
> 
> 
> Please let us know your thought and how should we approach. I am fine with changing this code and submit patch.
> 
> Regards
> -Vijay
> 
