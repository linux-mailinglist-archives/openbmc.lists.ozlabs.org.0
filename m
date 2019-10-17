Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1778DB6CE
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 21:06:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vJYR06pmzDqT9
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 06:06:35 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vJXY1klRzDqDt
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 06:05:48 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Oct 2019 12:05:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,308,1566889200"; d="scan'208";a="202475567"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Oct 2019 12:05:45 -0700
Received: from [10.241.245.161] (unknown [10.241.245.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 55E2658048F
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 12:05:45 -0700 (PDT)
Subject: Re: x86-power-control
To: openbmc@lists.ozlabs.org
References: <EA590716-271A-4F5C-9B36-80260B7F35B6@fb.com>
 <21807.1571306216@dooku.sandelman.ca>
 <CABoTLcTWzDmn+up4Qq_h=X+YNty=XyTQqHKRDr6N+5ELY=xOZg@mail.gmail.com>
 <cd3563fd-47bb-2c09-beda-5ce5ba8c8aa0@linux.intel.com>
 <CABoTLcRsJSSeB81jx-7WCXAfrB2CvB+ZbXvnmPxCaikCVpu=0Q@mail.gmail.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <027b9522-95df-a59c-9fb0-d430ca16aab2@linux.intel.com>
Date: Thu, 17 Oct 2019 12:05:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CABoTLcRsJSSeB81jx-7WCXAfrB2CvB+ZbXvnmPxCaikCVpu=0Q@mail.gmail.com>
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

Hi Oskar,

On 10/17/2019 10:21 AM, Oskar Senft wrote:
> Hi Jason
> 
> 
>     In our DTS we use gpio-line-names to name all of the GPIOs in one block:
> 
>     &gpio {
>              status = "okay";
>              gpio-line-names =
>     [...]
>              /*D0-D7*/       "","","","","","","","",
>              /*E0-E7*/     
>       "RESET_BUTTON","RESET_OUT","POWER_BUTTON","POWER_OUT","","","","",
>              /*F0-F7*/       "NMI_OUT","","","","CPU_ERR0","CPU_ERR1","","",
>              /*G0-G7*/     
>       "CPU_ERR2","CPU_CATERR","PCH_BMC_THERMTRIP","","","","","",
> 
> 
> Ugh, ok - that's a nice trick. But it's also a little messy :-/ Is that 
> the "officially recommended" way? I guess, since the other option I 
> tried doesn't work!.
I'm not completely sure.  I remember seeing this approach as an example 
when studying up on libgpiod and a quick search showed this approach 
used for other DTS files such as for Raspberry Pi 
(https://github.com/raspberrypi/linux/blob/e33ef2c4cd5dc96aa05a7d328eff61c183c94748/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts#L37). 
  So, if not "officially recommended" it's at least not unheard of. :)

> 
> Is that purely used for naming lines, or does it have any semantic impact?
As far as I know, this is purely used for naming lines for libpiod and 
associated tools such as 'gpioinfo'.  You can still find and access GPIO 
lines by chip and line number.

> 
> Thanks
> Oskar.
