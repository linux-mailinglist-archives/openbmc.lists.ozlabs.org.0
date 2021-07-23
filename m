Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFC43D41A7
	for <lists+openbmc@lfdr.de>; Fri, 23 Jul 2021 22:38:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWh3T07kjz3dGM
	for <lists+openbmc@lfdr.de>; Sat, 24 Jul 2021 06:38:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWh3F6sbNz30GM
 for <openbmc@lists.ozlabs.org>; Sat, 24 Jul 2021 06:37:59 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="191538247"
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="191538247"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 13:36:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="496477804"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 23 Jul 2021 13:36:54 -0700
Received: from [10.251.19.142] (jmbills-MOBL.amr.corp.intel.com
 [10.251.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id B8553580684
 for <openbmc@lists.ozlabs.org>; Fri, 23 Jul 2021 13:36:53 -0700 (PDT)
Subject: Re: [x86-power-control]: press the power button for a long time that
 can't force turn off system power
To: openbmc@lists.ozlabs.org
References: <DM6PR08MB55145CD3DC0AD96D30B70771DCE59@DM6PR08MB5514.namprd08.prod.outlook.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <8fcc9529-0f7b-df46-aa28-1569d254eb20@linux.intel.com>
Date: Fri, 23 Jul 2021 14:36:52 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <DM6PR08MB55145CD3DC0AD96D30B70771DCE59@DM6PR08MB5514.namprd08.prod.outlook.com>
Content-Type: text/plain; charset=big5; format=flowed
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



On 7/23/2021 4:28 AM, Chris Chen (TPI) wrote:
> Hi all,
> 
> I am working on an ast2600 with Intel CPU.
> The system power currently is able to turn on during Phosphor OpenBMC 
> boot up after I completed works following:
> 
>  1. enable ACPI in u-boot
>  2. set GPIOP0 ~ P3 pass-through in u-boot
>  3. porting ESPI driver from AST SDK v6.01 to linux-aspeed repository
>  4. add "&gpio0" with gpio-line-names which has POWER_BUTTON, POWER_OUT,
>     SIO_S3, SIO_S5, etc. defintion in the dts, I think the
>     "x86-power-control" repository required these.
>  5. append "x86-power-control" and "intel-ipmi-oem" repositories to image
> 
> However, I always only got the following logs when I pressed the power 
> button for a long time (> 4s).
> =====
> power-control[263]: PowerControl: power button pressed
> power-control[263]: powerStateOn: power button pressed event received
> power-control[263]: Host0: Moving to "Graceful Transition to Off" state
> power-control[263]: Graceful power-off timer started
> =====
> 
> It doesn't occur "SIO_ONCONTROL value changed: 1 -> SIO power good 
> de-assert event received", etc. operations and then to turn off the power.
> 
> Can anyone do me a favor to give me some clues for what I was wrong?
Hi Chris,

Holding the power button should force a hardware shutdown.  The BMC only 
monitors this flow and doesn't participate.

Did your system shut down correctly and you just not see the logs in 
BMC?  Or, did the system stay on?

Thanks,
-Jason
> 
> 
> Thank you in advance for your help.
> 
> Regards,
> Chris Chen
> 
> Legal Disclaimer :
> The information contained in this message may be privileged and 
> confidential.
> It is intended to be read only by the individual or entity to whom it is 
> addressed
> or by their designee. If the reader of this message is not the intended 
> recipient,
> you are on notice that any distribution of this message, in any form,
> is strictly prohibited. If you have received this message in error,
> please immediately notify the sender and delete or destroy any copy of 
> this message!
