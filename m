Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E0CDB1DA
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 18:04:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vDWL2SKjzDqcn
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 03:04:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vDSh74dwzDqcY
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 03:02:12 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Oct 2019 09:02:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,308,1566889200"; d="scan'208";a="195201296"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga008.fm.intel.com with ESMTP; 17 Oct 2019 09:02:07 -0700
Received: from [10.251.15.178] (jmbills-mobl.amr.corp.intel.com
 [10.251.15.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 8912258048F;
 Thu, 17 Oct 2019 09:02:07 -0700 (PDT)
Subject: Re: x86-power-control
To: Oskar Senft <osk@google.com>, Michael Richardson <mcr@sandelman.ca>
References: <EA590716-271A-4F5C-9B36-80260B7F35B6@fb.com>
 <21807.1571306216@dooku.sandelman.ca>
 <CABoTLcTWzDmn+up4Qq_h=X+YNty=XyTQqHKRDr6N+5ELY=xOZg@mail.gmail.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <cd3563fd-47bb-2c09-beda-5ce5ba8c8aa0@linux.intel.com>
Date: Thu, 17 Oct 2019 09:02:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CABoTLcTWzDmn+up4Qq_h=X+YNty=XyTQqHKRDr6N+5ELY=xOZg@mail.gmail.com>
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



On 10/17/2019 6:38 AM, Oskar Senft wrote:
> Hi Michael
> 
>     Why in a target system wouldn't naming it in DTS be the most
>     reliable and
>     most easily accessible mechanism?  I can see that in development
>     being able to define
>     things helps, but it is not like the production systems would have
>     wire-wrap
>     where the GPIO pin might change.
> 
> 
> I totally agree. I was actually experimenting on our platform (TYAN 
> S7106) to name GPIO pins in the DTS, but I couldn't figure out how to 
> read those names from userspace.
> 
> Here's what I tried in the DTS:
> 
> &gpio {
>          pin_gpio_d2 {
>                  gpios = <ASPEED_GPIO(D, 2) GPIO_ACTIVE_HIGH>;
>                  input;
>                  line-name = "SYS_PWROK_BUF";
>          };
> ...
> 
> However, from what I can tell line-name is actually only relevant when 
> used together with "gpiohog", which is not what we want.
> 
> Did you manage to make this work?

In our DTS we use gpio-line-names to name all of the GPIOs in one block:

&gpio {
	status = "okay";
	gpio-line-names =
	/*A0-A7*/	"","","","","","","","",
	/*B0-B7*/	"","","","","","","","",
	/*C0-C7*/	"","","","","","","","",
	/*D0-D7*/	"","","","","","","","",
	/*E0-E7*/ 
"RESET_BUTTON","RESET_OUT","POWER_BUTTON","POWER_OUT","","","","",
	/*F0-F7*/	"NMI_OUT","","","","CPU_ERR0","CPU_ERR1","","",
	/*G0-G7*/	"CPU_ERR2","CPU_CATERR","PCH_BMC_THERMTRIP","","","","","",
	/*H0-H7*/	"","","","","","","","",
	/*I0-I7*/	"","","","","","","","",
	/*J0-J7*/	"","","","","","","","",
	/*K0-K7*/	"","","","","","","","",
	/*L0-L7*/	"","","","","","","","",
	/*M0-M7*/	"","","","","","","","",
	/*N0-N7*/	"","","","","","","","",
	/*O0-O7*/	"","","","","","","","",
	/*P0-P7*/	"","","","","","","","",
	/*Q0-Q7*/	"","","","","","","","",
	/*R0-R7*/	"","","","","","","","",
	/*S0-S7*/	"","","","","","","","",
	/*T0-T7*/	"","","","","","","","",
	/*U0-U7*/	"","","","","","","","",
	/*V0-V7*/	"","","","","","","","",
	/*W0-W7*/	"","","","","","","","",
	/*X0-X7*/	"","","","","","","","",
	/*Y0-Y7*/	"SIO_S3","SIO_S5","","SIO_ONCONTROL","","","","",
	/*Z0-Z7*/	"","SIO_POWER_GOOD","","","","","","",
	/*AA0-AA7*/	"P3VBAT_BRIDGE_EN","","","","","","SMI","POST_COMPLETE",
	/*AB0-AB7*/	"","NMI_BUTTON","ID_BUTTON","PS_PWROK","","","","",
	/*AC0-AC7*/	"","","","","","","","";
};

https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-ast2500/recipes-kernel/linux/linux-aspeed/0001-arm-dts-add-DTS-for-Intel-platforms.patch#L144

Then, in user space, libgpiod has a gpiod::find_line() function that 
takes the GPIO name and returns a gpiod::line object that can request 
various functions from the GPIO.

Here is an example of requesting GPIO edge events in x86-power-control:
https://github.com/openbmc/x86-power-control/blob/master/power-control-x86/src/power_control.cpp#L805

> 
> Thanks
> Oskar.
