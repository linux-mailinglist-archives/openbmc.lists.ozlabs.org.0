Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 174ED5435D3
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 17:02:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJ9SR6n0Yz3blw
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 01:02:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GqJ+iPrL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GqJ+iPrL;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJ9Rz2lXhz3blW
	for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2022 01:02:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654700527; x=1686236527;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=b+O4OzY68yd6Z/OEp9hkxYTP/R9S+bsWbEcPAmay3ug=;
  b=GqJ+iPrLEgrEycvxKe+u/kjJfMr3+5EErz1Tpfjr8ITkJEAoj+6AfHVa
   PfOy7L/Upo1XQDWUMCD/chgyJ4vlKYkU2jaLB1bf056RbGM0KaIY8zC7C
   dXd8iCqN4b64A8X4tJYYEDvvCLtGZMgFxXhZzptWduOhOe4Ix4k0TMEYK
   cqVW3lC/68bErESoK3QseWqOfBTKcFss8BbSoayCaCXRgMf7vONZHeEjU
   6ynmj5tibmIeEoxuBFERyW9N27N+WpTdreZ08BdOmJ61Y0KvSnr6oHm/a
   4PQJwD/HHJMKCP5blpV5xO3nA66moq3hqXEnjY7iXcUwQHWscc07o8B27
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="257355280"
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; 
   d="scan'208";a="257355280"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2022 08:01:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; 
   d="scan'208";a="584935536"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga007.fm.intel.com with ESMTP; 08 Jun 2022 08:01:54 -0700
Received: from [10.212.63.139] (jmbills-MOBL.amr.corp.intel.com [10.212.63.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 09B2858094D
	for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2022 08:01:53 -0700 (PDT)
Message-ID: <24b63477-119d-0d43-e494-4a79f0ad91fc@linux.intel.com>
Date: Wed, 8 Jun 2022 09:01:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: x86-power-control question: front panel buttons dont work
Content-Language: en-US
To: openbmc@lists.ozlabs.org
References: <1790304102.3756861.1651157909253.ref@mail.yahoo.com>
 <1790304102.3756861.1651157909253@mail.yahoo.com>
 <MW3PR11MB4732097DE3322E07CD2F99C2A3FD9@MW3PR11MB4732.namprd11.prod.outlook.com>
 <667725503.727721.1651325136829@mail.yahoo.com>
 <93960ad8-105b-fc06-b5e8-a4f2c443c473@linux.intel.com>
 <1672954866.3142932.1652256355764@mail.yahoo.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <1672954866.3142932.1652256355764@mail.yahoo.com>
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

Sorry for the delay on this as I was on leave.  Did this get resolved?

On 5/11/2022 2:05 AM, Nikita Pavlov wrote:
> Hi Jason,
> 
> Front panel stop working from there until the next reboot even after 
> stopping gpioset.
It sounds like something in the pinctrl muxing is not behaving as expected.

Do you use Aspeed?  What version of Aspeed chip are you using? (This 
will help find the pinctrl info in the kernel which is hardware-specific.)

> 
> I test it with getting POWER_OUT line value and then released line like 
> this:
> 
> #include <gpiod.hpp>
> 
> #include <iostream>
> 
> int main(int argc, char** argv)
> {
>      gpiod::line line = gpiod::find_line("POWER_OUT");
>      if (!line)
>      {
>          std::cerr << "find line error\n";
>          return -1;
>      }
> 
>      try
>      {
>          line.request({"pwr", gpiod::line_request::EVENT_BOTH_EDGES, {}});
>      }
>      catch (const std::exception& ec)
>      {
>          std::cerr << ec.what();
>      }
> 
>      int state = line.get_value();
>      std::cout << state << '\n';
>      line.release();
> 
>      return 0;
> }
> 
> 
> But front panel button also doesnt work with getting value.
> 
> --
> Best regards,
> Nikita Pavlov,
> NUST MISiS Student
> 
> 
> 
> понедельник, 2 мая 2022 г., 18:36:24 GMT+3, Bills, Jason M 
> <jason.m.bills@linux.intel.com> написал(-а):
> 
> 
> Hi Nikita,
> 
> On 4/30/2022 7:25 AM, Nikita Pavlov wrote:
>  > Hi Jason, thank you for your response. In my platform I have
>  > power-control gpios in GPIOD group like this:
>  >
>  > /*D0-D7*/ "POWER_BUTTON","POWER_OUT","RESET_BUTTON","RESET_OUT",
>  >
>  > Also I configurate pass-through mode in dts:
>  >
>  >          pinctrl-names = "pass-through";
>  >          pinctrl-0 = <&pinctrl_gpid0_default
>  >                              &pinctrl_gpid2_default>;
> 
> Could you please share what is your BMC hardware version?
>  >
>  > After update and reboot platform I have same problem - front panel
>  > buttons dont enable (front panel buttons dont enable if I use
>  > x86-power-control module or manually set gpio values by gpioset utility).
>  > But if I dont use any impacts on gpio (disable x86-power-control module
>  > and dont use gpio utilities like gpioset/get) front panel buttons 
> work well.
>  >
>  > What are your assumptions about this ?
> 
> The pass-through is set up as a mux in pinctrl.  If I remember
> correctly, the output pin has GPIO output and pass-through mode as two
> different options in the pinctrl mux.
> 
> So, when you request the output pin using libgpiod, it automatically
> configures the pinctrl to disable the pass-through. You should be able
> to re-enable pass-through by simply releasing control of the output pin
> in libgpiod.
> 
> For simplicity, let's work with just the gpioset utility and not use
> x86-power-control.  So, when you initially boot, the pass-through is
> working. You then use gpioset to change the output pin (which will
> switch the pinctrl mux and disable pass-through mode causing the front
> panel to stop working). When you stop gpioset, it should release the
> gpio and switch the mux back to enable pass-through mode for the front
> panel to work again.
> 
> In your test does the front panel start working again after stopping
> gpioset? Or does the front panel stop working from there until the next
> reboot even after stopping gpioset?
> 
> Thanks,
> 
> -Jason
> 
>  >
>  >
>  >
>  > --
>  > Best regards,
>  > Nikita Pavlov,
>  > NUST MISiS Student
>  >
>  >
>  >
>  > четверг, 28 апреля 2022 г., 23:01:13 GMT+3, Bills, Jason M
>  > <jason.m.bills@intel.com <mailto:jason.m.bills@intel.com>> написал(-а):
>  >
>  >
>  > Hi Nikita,
>  >
>  > In the hardware, we have the power button routed through a GPIO
>  > pass-through on the Aspeed chip.  If that pass-through is disabled, it
>  > will prevent the physical front panel button signal from getting past
>  > the BMC.  That is the first thing I would check.
>  >
>  > Also, it is better to send these kinds of questions to the OpenBMC
>  > mailing list as there may be others in the community in a similar 
> situation.
>  >
>  > Thanks,
>  >
>  > -Jason
>  >
>  > *From:* Nikita Pavlov <niikita@yahoo.com <mailto:niikita@yahoo.com>>
>  > *Sent:* Thursday, April 28, 2022 8:58 AM
>  > *To:* Bills, Jason M <jason.m.bills@intel.com 
> <mailto:jason.m.bills@intel.com>>; kuiying.wang@intel.com 
> <mailto:kuiying.wang@intel.com>
>  > *Subject:* x86-power-control question: front panel buttons dont work
>  >
>  > Hi, I user x86-power-control module for my test intel platform. Its
>  > module works in webui but front panel physical buttons doesnt work. I
>  > think that it interface describe in this fragment
>  > 
> https://github.com/openbmc/x86-power-control/blob/master/src/power_control.cpp#L3072 
> <https://github.com/openbmc/x86-power-control/blob/master/src/power_control.cpp#L3072 
>  >
>  > 
> <https://github.com/openbmc/x86-power-control/blob/master/src/power_control.cpp#L3072 
> <https://github.com/openbmc/x86-power-control/blob/master/src/power_control.cpp#L3072>> but 
> 
>  > I cant understand this logic.
>  >
>  > Say me pls, why front panel buttons dont work ?
>  >
>  > --
>  > Best regards,
>  > Nikita Pavlov,
>  > NUST MISiS Student
>  >
