Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A4523F1C4
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 19:12:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNX3H5YZCzDqk9
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 03:12:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNX2F23hfzDqL5
 for <openbmc@lists.ozlabs.org>; Sat,  8 Aug 2020 03:11:16 +1000 (AEST)
IronPort-SDR: hH5A7DhuBt2fdXJ0BeeFM4iXFgXrX61JhysEhTmqUhySPa5/J6qW+G+2tMwepGrQKwcSTqs7IM
 nbaj0t9xaTLA==
X-IronPort-AV: E=McAfee;i="6000,8403,9706"; a="150860117"
X-IronPort-AV: E=Sophos;i="5.75,446,1589266800"; d="scan'208";a="150860117"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2020 10:11:13 -0700
IronPort-SDR: TQeMcD1F9FVX0RqhXfRt0AyVGYA6j0SEDwyaj/bjETw8Xa8g8PKMiZ/kXoKwXVl760/jxFeEYS
 BX+dOes7pqWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,446,1589266800"; d="scan'208";a="437963382"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga004.jf.intel.com with ESMTP; 07 Aug 2020 10:11:13 -0700
Received: from [10.251.4.23] (jmbills-MOBL.amr.corp.intel.com [10.251.4.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 43B79580765
 for <openbmc@lists.ozlabs.org>; Fri,  7 Aug 2020 10:11:13 -0700 (PDT)
Subject: Re: system power control
To: openbmc@lists.ozlabs.org
References: <BYAPR14MB2342FEAAE4DBA6383E3885FFCF490@BYAPR14MB2342.namprd14.prod.outlook.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <2b9f359f-019a-c6b4-d200-357124649cd7@linux.intel.com>
Date: Fri, 7 Aug 2020 10:11:12 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <BYAPR14MB2342FEAAE4DBA6383E3885FFCF490@BYAPR14MB2342.namprd14.prod.outlook.com>
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



On 8/6/2020 11:43 PM, Zhao Kun wrote:
> Hi,
> 
> I’m new to learn how to make OpenBMC work on a X86 based system. 
> Currently I met a problem of mapping the GPIOs about power 
> on/off/reset/status into OpenBMC logic. I understand when user issue a 
> power on request through any user interfaces like RESTful, IPMI, etc., 
> some service (phosphor-state-manager?) will be triggered to check 
> current status and roll out corresponding systemd services to do the 
> job. (please correct me if I’m wrong)
> 
> But I’m just confused on how those services actually toggle or check the 
> GPIOs, there seems be many choices,
> 
>  1. Device tree?
>  2. Using Workbook gpio_defs.json?
>  3. Create some services calling platform specific scripts to operate
>     GPIO or I2C devices?
>  4. Using x86-power-control?
> 
> So what’s the most recommended way to do it? Really appreciated If 
> anyone can share some lights.
On Intel reference platforms, we use x86-power-control and configure the 
GPIO names using device tree.

> 
> I thought there must be a mechanism to consume some kind of 
> configuration file as the hardware abstraction layer. So I guess it 
> might be gpio_defs.json or device tree.
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
