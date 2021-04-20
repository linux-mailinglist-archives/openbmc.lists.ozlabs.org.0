Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DF2365B78
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 16:51:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPmqK58rbz304Q
	for <lists+openbmc@lfdr.de>; Wed, 21 Apr 2021 00:51:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPmq82bQBz2xgJ
 for <openbmc@lists.ozlabs.org>; Wed, 21 Apr 2021 00:51:47 +1000 (AEST)
IronPort-SDR: s1Yw5cFpmGOtBS68fnCj6aeVyQTrNFStQ/5oVB14PoYpnjvaYRTixC+1LozBJB3TXEK3roO+3d
 B8b1IhAf/lHw==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="259475151"
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="259475151"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 07:51:43 -0700
IronPort-SDR: HwODOSH3xPx1bwxsOFBQZYZmAOfedcigrRtPSD58ewei2bXudc9ORwWJ6z6unAj7B+5e8qzyXY
 ZPbuNI1jPHXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="426995226"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 20 Apr 2021 07:51:43 -0700
Received: from [10.212.185.9] (jmbills-MOBL.amr.corp.intel.com [10.212.185.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 640C25807FF
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 07:51:43 -0700 (PDT)
Subject: Re: x86-power-control: make the timeout configurable
To: openbmc@lists.ozlabs.org
References: <SG2PR04MB2298402C7E2E3DB9E522CDB58A489@SG2PR04MB2298.apcprd04.prod.outlook.com>
 <SG2PR04MB22980CBD819B3CC6ACF5D7F38A489@SG2PR04MB2298.apcprd04.prod.outlook.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <03ae1b79-8fbc-2048-1324-81994bddd32f@linux.intel.com>
Date: Tue, 20 Apr 2021 07:51:42 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <SG2PR04MB22980CBD819B3CC6ACF5D7F38A489@SG2PR04MB2298.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=big5; format=flowed
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



On 4/20/2021 5:24 AM, Charles Hsu (®}¥ÃÁÃ) wrote:
> 
> 
>> -----Original Message-----
>> From: openbmc
>> <openbmc-bounces+charles.hsu=quantatw.com@lists.ozlabs.org> On Behalf Of
>> Charles Hsu (®}¥ÃÁÃ)
>> Sent: Tuesday, April 20, 2021 8:19 PM
>> To: openbmc@lists.ozlabs.org
>> Cc: jason.m.bills@intel.com; kuiying.wang@intel.com
>> Subject: x86-power-control: make the timeout configurable
>>
>> Hi ,
>> 	In my case, these timers will be designed according to different hardware.
>> I want to make these timers configurable and put them into
>> power-config-host0.json.
>> If you have any suggestion or this modification is not needed, please tell me.
Depending on the situation, there may be alternatives to modify these 
through other ways such as patch files.

However, since power-config-host0.json already exists for this purpose 
for signal names, I think it makes sense to put the timing configuration 
there, too.

>>
> 
> X86-power-control commit 92caa4c639903ef076e2f09e985291781edd927d link:
> https://github.com/openbmc/x86-power-control/blob/92caa4c639903ef076e2f09e985291781edd927d/power-control-x86/src/power_control.cpp#L72-L80
> 
>> Thanks.
>> Best regards,
>> Charles
> 
