Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D8D5172C2
	for <lists+openbmc@lfdr.de>; Mon,  2 May 2022 17:36:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KsRyX4JQdz3bb9
	for <lists+openbmc@lfdr.de>; Tue,  3 May 2022 01:36:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IO9TEkYt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IO9TEkYt; dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KsRy33hLwz3bWf
 for <openbmc@lists.ozlabs.org>; Tue,  3 May 2022 01:35:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651505755; x=1683041755;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=8nCg1Sqag1oxJkGf4S+BxKNgsDM/8gpCb64itzkQ4+g=;
 b=IO9TEkYtVxmpAfZzNql1z6r6CIRsA2A1ZadfXwTnc2uiqI9KCLJitAZq
 nm9RN3Os44mrMJOLYwjEsqINp4VNQuioxvMSqD8fvLnh9m8SMXH21Vnb1
 q58QRPOzJIPGS3Oa0lZLqUgSAPtH8w4sDhcrO6r3aEExExcz9KiJKcp6Z
 5uVcC7jRZyTJG0Jxr3xob09O+OeA/pU/4WCNZxaVdQbIa3jPVyIfx3Up6
 ANd3I+IPf4LqPDSR/8TlqnO1CzfXZuKUjiA+dL6/dW17qG/1QD8kLzTeF
 6aOW/mC39KLbxE20mpiKVVP8tO/IAQOceqHk3s9698Ysb9YBKPRbSLjpH w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="292420564"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="292420564"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 08:34:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="598676857"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 02 May 2022 08:34:51 -0700
Received: from [10.212.99.25] (jmbills-MOBL.amr.corp.intel.com [10.212.99.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 1575A580966
 for <openbmc@lists.ozlabs.org>; Mon,  2 May 2022 08:34:51 -0700 (PDT)
Message-ID: <93960ad8-105b-fc06-b5e8-a4f2c443c473@linux.intel.com>
Date: Mon, 2 May 2022 09:34:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: x86-power-control question: front panel buttons dont work
Content-Language: en-US
To: openbmc@lists.ozlabs.org
References: <1790304102.3756861.1651157909253.ref@mail.yahoo.com>
 <1790304102.3756861.1651157909253@mail.yahoo.com>
 <MW3PR11MB4732097DE3322E07CD2F99C2A3FD9@MW3PR11MB4732.namprd11.prod.outlook.com>
 <667725503.727721.1651325136829@mail.yahoo.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <667725503.727721.1651325136829@mail.yahoo.com>
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

On 4/30/2022 7:25 AM, Nikita Pavlov wrote:
> Hi Jason, thank you for your response. In my platform I have 
> power-control gpios in GPIOD group like this:
> 
> /*D0-D7*/ "POWER_BUTTON","POWER_OUT","RESET_BUTTON","RESET_OUT",
> 
> Also I configurate pass-through mode in dts:
> 
>          pinctrl-names = "pass-through";
>          pinctrl-0 = <&pinctrl_gpid0_default
>                              &pinctrl_gpid2_default>;

Could you please share what is your BMC hardware version?
> 
> After update and reboot platform I have same problem - front panel 
> buttons dont enable (front panel buttons dont enable if I use 
> x86-power-control module or manually set gpio values by gpioset utility).
> But if I dont use any impacts on gpio (disable x86-power-control module 
> and dont use gpio utilities like gpioset/get) front panel buttons work well.
> 
> What are your assumptions about this ?

The pass-through is set up as a mux in pinctrl.  If I remember 
correctly, the output pin has GPIO output and pass-through mode as two 
different options in the pinctrl mux.

So, when you request the output pin using libgpiod, it automatically 
configures the pinctrl to disable the pass-through. You should be able 
to re-enable pass-through by simply releasing control of the output pin 
in libgpiod.

For simplicity, let's work with just the gpioset utility and not use 
x86-power-control.  So, when you initially boot, the pass-through is 
working. You then use gpioset to change the output pin (which will 
switch the pinctrl mux and disable pass-through mode causing the front 
panel to stop working). When you stop gpioset, it should release the 
gpio and switch the mux back to enable pass-through mode for the front 
panel to work again.

In your test does the front panel start working again after stopping 
gpioset? Or does the front panel stop working from there until the next 
reboot even after stopping gpioset?

Thanks,
-Jason

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
> четверг, 28 апреля 2022 г., 23:01:13 GMT+3, Bills, Jason M 
> <jason.m.bills@intel.com> написал(-а):
> 
> 
> Hi Nikita,
> 
> In the hardware, we have the power button routed through a GPIO 
> pass-through on the Aspeed chip.  If that pass-through is disabled, it 
> will prevent the physical front panel button signal from getting past 
> the BMC.  That is the first thing I would check.
> 
> Also, it is better to send these kinds of questions to the OpenBMC 
> mailing list as there may be others in the community in a similar situation.
> 
> Thanks,
> 
> -Jason
> 
> *From:* Nikita Pavlov <niikita@yahoo.com>
> *Sent:* Thursday, April 28, 2022 8:58 AM
> *To:* Bills, Jason M <jason.m.bills@intel.com>; kuiying.wang@intel.com
> *Subject:* x86-power-control question: front panel buttons dont work
> 
> Hi, I user x86-power-control module for my test intel platform. Its 
> module works in webui but front panel physical buttons doesnt work. I 
> think that it interface describe in this fragment 
> https://github.com/openbmc/x86-power-control/blob/master/src/power_control.cpp#L3072 
> <https://github.com/openbmc/x86-power-control/blob/master/src/power_control.cpp#L3072> but 
> I cant understand this logic.
> 
> Say me pls, why front panel buttons dont work ?
> 
> --
> Best regards,
> Nikita Pavlov,
> NUST MISiS Student
> 
