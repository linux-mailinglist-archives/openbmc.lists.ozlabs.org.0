Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E1D57A98D
	for <lists+openbmc@lfdr.de>; Tue, 19 Jul 2022 23:59:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnXn70Djdz3byL
	for <lists+openbmc@lfdr.de>; Wed, 20 Jul 2022 07:59:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CRER/NXr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CRER/NXr;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnXmg27JGz2yLT
	for <openbmc@lists.ozlabs.org>; Wed, 20 Jul 2022 07:59:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658267971; x=1689803971;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=OqHp0wW8AgNBZoWl6wm2JNKWP8Fm+tusrmOshiIawcM=;
  b=CRER/NXr7xPcSxqpjQF+H9g+qNOmqkqCKXbBmWqJs8x9pZdKmWMCB3EX
   w2Js2dqpPvJpA6r4Nh7Wca6Q3xRsc8HMu++m2guGNxuziWlFjBAYB1jUj
   qoQ4S8qTDINNBVodFzK+20sQ3L6BOQZ6FvtR3F7ZQF7cDYfjd2NeKU1FT
   ZrzB0jZn1+4GZSaa0WkDePAeOPgU80basq1Vsc8vOTdmClcVXKmLIR77R
   o+y6OfVS4Mq8WWuENMQZvYwfNwdvCnXj70FTlJqmtvtrsnq0S1wsSIfCK
   ftMQzK/RMFje3TzRB8ld+KGpojNMNp4CWU7Fe0PAuEEJ4jV5FwYd2btFT
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="350602411"
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; 
   d="scan'208";a="350602411"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 14:59:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; 
   d="scan'208";a="597838946"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga002.jf.intel.com with ESMTP; 19 Jul 2022 14:59:26 -0700
Received: from [10.212.84.11] (jmbills-mobl1.amr.corp.intel.com [10.212.84.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 3668A5804D9
	for <openbmc@lists.ozlabs.org>; Tue, 19 Jul 2022 14:59:26 -0700 (PDT)
Message-ID: <c7139346-f979-ff72-2d60-4108b3abdaf2@linux.intel.com>
Date: Tue, 19 Jul 2022 15:59:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: x86-power-control question: front panel buttons dont work
To: openbmc@lists.ozlabs.org
References: <1790304102.3756861.1651157909253.ref@mail.yahoo.com>
 <1790304102.3756861.1651157909253@mail.yahoo.com>
 <MW3PR11MB4732097DE3322E07CD2F99C2A3FD9@MW3PR11MB4732.namprd11.prod.outlook.com>
 <667725503.727721.1651325136829@mail.yahoo.com>
 <93960ad8-105b-fc06-b5e8-a4f2c443c473@linux.intel.com>
 <1672954866.3142932.1652256355764@mail.yahoo.com>
 <24b63477-119d-0d43-e494-4a79f0ad91fc@linux.intel.com>
 <885011375.8771261.1655477722721@mail.yahoo.com>
Content-Language: en-US
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <885011375.8771261.1655477722721@mail.yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Nikita,

Sorry for the delay.

On 6/17/2022 8:55 AM, Nikita Pavlov wrote:
> Hi Jason,
> 
> I still have this problem. After power off board I cant run it from 
> physical buttons.
> Pass-through mode configured in kernel like CONFIG_ or it comes as a 
> kernel patch ?
This looks like it may be the AST2500 since the pass-through GPIO banks 
are GPIOD and GPIOE.

To get pass-through working on the AST2500, we had to add some (hacky) 
patches.  The patches are available here:
https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-ast2500/recipes-bsp/u-boot/files/0005-enable-passthrough-in-uboot.patch
https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-wht/recipes-kernel/linux/linux-aspeed/0001-Enable-GPIOE0-and-GPIOE2-pass-through-by-default.patch
https://github.com/Intel-BMC/linux/commit/7571cc86cbb4eded29aa70dbcffe84a02a22ee08
https://github.com/Intel-BMC/linux/commit/11113c101eee286a779e9fd2c106efd3c4d4ae84

Please note that we have GPIOE2 for power button and GPIOE3 for power 
out, so you may need to adjust some of the patches to work on GPIOD0 and 
GPIOD1.

> 
> I have GPIOD0 power button GPIOD1 power out. Kernel show this debug 
> information in sysfs 
> /sys/kernel/debug/pinctrl/1e6e2080.pinctrl-aspeed-g5-pinctrl/pingroups:
> 
> group: GPID0
> pin 24 (F19)
> pin 25 (E21)
> 
> group: GPID2
> pin 26 (F20)
> pin 27 (D20)
> 
> group: GPID4
> pin 28 (D21)
> pin 29 (E20)
> 
> group: GPID6
> pin 30 (G18)
> pin 31 (C21)
> 
> group: GPIE0
> pin 32 (B20)
> pin 33 (C20)
> 
> group: GPIE2
> pin 34 (F18)
> pin 35 (F17)
> ......
> 
> I cant understand what it mean but in this debug file among all gpios 
> there are only GPIOD and GPIOE gpio banks.

Only GPIOD and GPIOE banks support pass-through, so that may be why they 
are the only banks listed with pin groupings.
> 
> 
> 
> --
> Best regards,
> Nikita Pavlov,
> NUST MISiS Student
> 
> 
> 
> среда, 8 июня 2022 г., 18:04:16 GMT+3, Bills, Jason M 
> <jason.m.bills@linux.intel.com> написал(-а):
> 
> 
> Hi Nikita,
> 
> Sorry for the delay on this as I was on leave.  Did this get resolved?
> 
> On 5/11/2022 2:05 AM, Nikita Pavlov wrote:
>  > Hi Jason,
>  >
>  > Front panel stop working from there until the next reboot even after
>  > stopping gpioset.
> It sounds like something in the pinctrl muxing is not behaving as expected.
> 
> Do you use Aspeed?  What version of Aspeed chip are you using? (This
> will help find the pinctrl info in the kernel which is hardware-specific.)
> 
>  >
>  > I test it with getting POWER_OUT line value and then released line like
>  > this:
>  >
>  > #include <gpiod.hpp>
>  >
>  > #include <iostream>
>  >
>  > int main(int argc, char** argv)
>  > {
>  >      gpiod::line line = gpiod::find_line("POWER_OUT");
>  >      if (!line)
>  >      {
>  >          std::cerr << "find line error\n";
>  >          return -1;
>  >      }
>  >
>  >      try
>  >      {
>  >          line.request({"pwr", gpiod::line_request::EVENT_BOTH_EDGES, 
> {}});
>  >      }
>  >      catch (const std::exception& ec)
>  >      {
>  >          std::cerr << ec.what();
>  >      }
>  >
>  >      int state = line.get_value();
>  >      std::cout << state << '\n';
>  >      line.release();
>  >
>  >      return 0;
>  > }
>  >
>  >
>  > But front panel button also doesnt work with getting value.
>  >
>  > --
>  > Best regards,
>  > Nikita Pavlov,
>  > NUST MISiS Student
>  >
>  >
>  >
>  > понедельник, 2 мая 2022 г., 18:36:24 GMT+3, Bills, Jason M
>  > <jason.m.bills@linux.intel.com 
> <mailto:jason.m.bills@linux.intel.com>> написал(-а):
>  >
>  >
>  > Hi Nikita,
>  >
>  > On 4/30/2022 7:25 AM, Nikita Pavlov wrote:
>  >  > Hi Jason, thank you for your response. In my platform I have
>  >  > power-control gpios in GPIOD group like this:
>  >  >
>  >  > /*D0-D7*/ "POWER_BUTTON","POWER_OUT","RESET_BUTTON","RESET_OUT",
>  >  >
>  >  > Also I configurate pass-through mode in dts:
>  >  >
>  >  >          pinctrl-names = "pass-through";
>  >  >          pinctrl-0 = <&pinctrl_gpid0_default
>  >  >                              &pinctrl_gpid2_default>;
>  >
>  > Could you please share what is your BMC hardware version?
>  >  >
>  >  > After update and reboot platform I have same problem - front panel
>  >  > buttons dont enable (front panel buttons dont enable if I use
>  >  > x86-power-control module or manually set gpio values by gpioset 
> utility).
>  >  > But if I dont use any impacts on gpio (disable x86-power-control 
> module
>  >  > and dont use gpio utilities like gpioset/get) front panel buttons
>  > work well.
>  >  >
>  >  > What are your assumptions about this ?
>  >
>  > The pass-through is set up as a mux in pinctrl.  If I remember
>  > correctly, the output pin has GPIO output and pass-through mode as two
>  > different options in the pinctrl mux.
>  >
>  > So, when you request the output pin using libgpiod, it automatically
>  > configures the pinctrl to disable the pass-through. You should be able
>  > to re-enable pass-through by simply releasing control of the output pin
>  > in libgpiod.
>  >
>  > For simplicity, let's work with just the gpioset utility and not use
>  > x86-power-control.  So, when you initially boot, the pass-through is
>  > working. You then use gpioset to change the output pin (which will
>  > switch the pinctrl mux and disable pass-through mode causing the front
>  > panel to stop working). When you stop gpioset, it should release the
>  > gpio and switch the mux back to enable pass-through mode for the front
>  > panel to work again.
>  >
>  > In your test does the front panel start working again after stopping
>  > gpioset? Or does the front panel stop working from there until the next
>  > reboot even after stopping gpioset?
>  >
>  > Thanks,
>  >
>  > -Jason
>  >
>  >  >
>  >  >
>  >  >
>  >  > --
>  >  > Best regards,
>  >  > Nikita Pavlov,
>  >  > NUST MISiS Student
>  >  >
>  >  >
>  >  >
>  >  > четверг, 28 апреля 2022 г., 23:01:13 GMT+3, Bills, Jason M
>  >  > <jason.m.bills@intel.com <mailto:jason.m.bills@intel.com> 
> <mailto:jason.m.bills@intel.com <mailto:jason.m.bills@intel.com>>> 
> написал(-а):
>  >  >
>  >  >
>  >  > Hi Nikita,
>  >  >
>  >  > In the hardware, we have the power button routed through a GPIO
>  >  > pass-through on the Aspeed chip.  If that pass-through is disabled, it
>  >  > will prevent the physical front panel button signal from getting past
>  >  > the BMC.  That is the first thing I would check.
>  >  >
>  >  > Also, it is better to send these kinds of questions to the OpenBMC
>  >  > mailing list as there may be others in the community in a similar
>  > situation.
>  >  >
>  >  > Thanks,
>  >  >
>  >  > -Jason
>  >  >
>  >  > *From:* Nikita Pavlov <niikita@yahoo.com 
> <mailto:niikita@yahoo.com> <mailto:niikita@yahoo.com 
> <mailto:niikita@yahoo.com>>>
>  >  > *Sent:* Thursday, April 28, 2022 8:58 AM
>  >  > *To:* Bills, Jason M <jason.m.bills@intel.com 
> <mailto:jason.m.bills@intel.com>
>  > <mailto:jason.m.bills@intel.com <mailto:jason.m.bills@intel.com>>>; 
> kuiying.wang@intel.com <mailto:kuiying.wang@intel.com>
>  > <mailto:kuiying.wang@intel.com <mailto:kuiying.wang@intel.com>>
> 
>  >  > *Subject:* x86-power-control question: front panel buttons dont work
>  >  >
>  >  > Hi, I user x86-power-control module for my test intel platform. Its
>  >  > module works in webui but front panel physical buttons doesnt work. I
>  >  > think that it interface describe in this fragment
>  >  >
>  > 
> https://github.com/openbmc/x86-power-control/blob/master/src/power_control.cpp#L3072 <https://github.com/openbmc/x86-power-control/blob/master/src/power_control.cpp#L3072 >
>  > 
> <https://github.com/openbmc/x86-power-control/blob/master/src/power_control.cpp#L3072 <https://github.com/openbmc/x86-power-control/blob/master/src/power_control.cpp#L3072 >
>  >  >
>  >  >
>  > 
> <https://github.com/openbmc/x86-power-control/blob/master/src/power_control.cpp#L3072 <https://github.com/openbmc/x86-power-control/blob/master/src/power_control.cpp#L3072 >
>  > 
> <https://github.com/openbmc/x86-power-control/blob/master/src/power_control.cpp#L3072 <https://github.com/openbmc/x86-power-control/blob/master/src/power_control.cpp#L3072>>> but
>  >
>  >  > I cant understand this logic.
>  >  >
>  >  > Say me pls, why front panel buttons dont work ?
>  >  >
>  >  > --
>  >  > Best regards,
>  >  > Nikita Pavlov,
>  >  > NUST MISiS Student
>  >  >
