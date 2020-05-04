Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A614A1C462E
	for <lists+openbmc@lfdr.de>; Mon,  4 May 2020 20:43:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GBZB6RtBzDqX9
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 04:43:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GBY237tSzDqR0
 for <openbmc@lists.ozlabs.org>; Tue,  5 May 2020 04:42:12 +1000 (AEST)
IronPort-SDR: d2j3zpH09qUa71iblyI6WcnboCX20EXSfrtz4kVNyBMyLc/Iu3DbUeRy3kB+olSd4qzfybcHzP
 9r0Mg8PnTK7Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2020 11:42:08 -0700
IronPort-SDR: j5+KW8SnInh3yLwv4ZCb+F0NPZ7lnGkH/+Bgq1OlYff5MPCqlrYm/EHa4/j3CX7CBv1rqWdBys
 Ogv/iDyezS4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,353,1583222400"; d="scan'208";a="460763423"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 04 May 2020 11:41:49 -0700
Received: from [10.251.78.225] (jmbills-mobl.amr.corp.intel.com
 [10.251.78.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 472A858048A;
 Mon,  4 May 2020 11:41:46 -0700 (PDT)
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogUmVnYXJkaW5nIHBvd2VyIGNvbnRyb2w=?=
To: Patrick Williams <patrick@stwcx.xyz>,
 "zhouyuanqing8@outlook.com" <zhouyuanqing8@outlook.com>
References: <HK2PR04MB38261661F9BD9194120C795CFEAA0@HK2PR04MB3826.apcprd04.prod.outlook.com>
 <20200504160030.GA7000@heinlein>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <75f5ee02-7822-6bf3-2259-40d2f3f7d59e@linux.intel.com>
Date: Mon, 4 May 2020 11:41:42 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200504160030.GA7000@heinlein>
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
Cc: "uperic@163.com" <uperic@163.com>, openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 5/4/2020 9:00 AM, Patrick Williams wrote:
> Jason,
> 
> Can you give some suggestion on if this is something where
> x86-power-control should be modified to support?
x86-power-control was created mainly because of the tight timing 
requirements around the GPIOs to track host power state.  It could be 
adapted, but may not make sense if the GPIO layout isn't the same.

phosphor-state-manager 
(https://github.com/openbmc/phosphor-state-manager) is the OpenBMC 
community power state manager.  It is designed for flexibility in how 
different systems change power state, so I believe it is probably better 
suited to adapt to this configuration.

> 
> 
> On Thu, Apr 30, 2020 at 01:58:58AM +0000, zhouyuanqing8@outlook.com wrote:
>> Hi Patrick Williams，
>>
>>       My board hardware is connected to CPLD through I2C of AST2500, BMC reads and writes CPLD register through I2C, and then CPLD controls power on and off.
>>
>>      So, I think The x86-power-control implementation cannot be directly adapted to my board.
>>
>>       Please help me to suggest what to do next, which can solve this problem and adapt well to the code of openbmc community.
>>
>> Thanks
>> Harley
>> ________________________________
>> 发件人: Patrick Williams
>> 已发送: 2020 年 4 月 30 日 星期四 0:04
>> 收件人: zhouyuanqing8@outlook.com
>> 抄送: openbmc; uperic@163.com
>> 主题: Re: Regarding power control
>>
>> On Wed, Apr 29, 2020 at 01:50:09PM +0000, zhouyuanqing8@outlook.com wrote:
>>
>>> Regarding power control, I read the codes in the following two directories(github.com/openbmc/x86-power-control.git & github.com/openbmc/skeleton/tree/master/op-pwrctl). The power control is controlled by GPIO, but the power of my board is controlled by CPLD.
>>
>> The x86-power-control implementation uses GPIOs from the BMC, but those
>> GPIOs are wired to a CPLD for the signalling.  The CPLD monitors the
>> GPIOs to know when to begin the power sequence.  This is what we use on
>> Tiogapass.
>>
>> --
>> Patrick Williams
> 
