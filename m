Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D1DA55A0A
	for <lists+openbmc@lfdr.de>; Thu,  6 Mar 2025 23:44:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z84GH1BbBz3cfB
	for <lists+openbmc@lfdr.de>; Fri,  7 Mar 2025 09:43:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741281775;
	cv=none; b=gegBkQYVKHRAFMK+7FH3vPc0V7Nk3cIM4BCaJvRShsOOwt6kOiKCpgVgoGV04qbuM7wPg8SRumE3gVModAZ32TlAtRpvKKUc++y1+TQACOkarXHwQu3LnImPbAKfbem5tDhfwRyxq5QV8zrIFjhS/D4zEvtAw8DStvRUUUm9PKrGdHPBmU53vNC15JXMgQ3n/n25/uPw6kxkH1DC1I0mLrrHxK8QoHHc2FcuaL44I9FOz0CwGNsZ3aJ0ue1oRJS5R47nUXsOHXxHUHeZl4bJRE/4pWupR02Xr6ezMFyyVolYS3tA/mp6hsH6C/w2DrZjQwCK0rktBq6EZmRzPpp5Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741281775; c=relaxed/relaxed;
	bh=mRtVMgZ55zLMGI/NlOCcgv9aGOQgHktJls4Rai2LzFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BAZtk72DBrUK+24lH7/ghZNiJWpB5vB1V19esvQlpmgLW/PD5fiR8ss+CG0otesZAOn9MowZOmRVjuSntvIckiqCsTNp+K3XvN3QtNwmu/wBo/YaR5tXAhauz5MxPH3kOt8U91nquVibhBxhS09Uf1B/noGb8LaAtZXEKNVgO27NjJTPtCWqulW0DXfgK1HTZw6DCzED7ZJAL2YPRH5k7xfmKSgyT8PxaGcYkOAgQGn4YLYsu9EKljHBX0L3Bm+NnF3kzel0eoTHfKrNUUkwAkVYMWnuHRtewMB5T/hK8HkZg1+5uMCP1sG5NRKClz25TtppPTiMHU1BBxV9f9Chng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=av3GA+WR; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=av3GA+WR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z7x7x5yJLz3bwX;
	Fri,  7 Mar 2025 04:22:52 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2235189adaeso16282165ad.0;
        Thu, 06 Mar 2025 09:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741281770; x=1741886570; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRtVMgZ55zLMGI/NlOCcgv9aGOQgHktJls4Rai2LzFE=;
        b=av3GA+WRtlkb3tCXCayW9FUURM1IJfasCxvab/KNRxEtPZNx501UcPx8UglbPww6PV
         dsR96yAFmS0pntRBKO7IK9ZKi/GAK8sJbL4//4OrNdh5g17uryrooYLwc8H9CG0G5uPn
         AUfj5Gs9EWMiCqc5T465alINupSuQxI74E/el09Ke4dDRqg4gjs84TJgQlyFt3SCzo0x
         qDDtC8VmS9vYh6lBKqIBm3hvr7GJn++3/wVJhOb3wSqnWtsrihQvG83VdEpNrTmdz3EW
         aGyC1gb4g+0VHzsCcPgJ9gyo7mokUj4ZsC6dm3wfpL3/3qgV0r7ML1SVAQ/MGDo5gNeU
         Y4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741281770; x=1741886570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mRtVMgZ55zLMGI/NlOCcgv9aGOQgHktJls4Rai2LzFE=;
        b=tqF91XYm4rTcY+9aDtxkRfsUprgDA3zRJTWnME8XM3QA5jHS2f2iFL7OVMBKDhx1Dr
         js1bENpp5lesim+c16AHVt1t5kjvLo692zX/4eJSLkOWh82KUPmqO87tCvvagOM/69tB
         NwSkue2vVxgZv5Lr8Sh2k9NX+GkRazD10xMBDV7sdG4IAnkJDdkrtNKzRwsELDD6MW7u
         a3Wz9iruqIcmhfeOTFr2KNStDMmqFUjPeBNfMvXk7kBKL/uu2nAgnV9vYIZziksBoTzy
         buCpW05YEAn5cGi+9esCuPJn55Z29kwrob3O/edUB9y9D9SePSEvYGUmQeMq/VMisMjx
         rfjA==
X-Forwarded-Encrypted: i=1; AJvYcCVcWXSVp+1x4kYQ3HH5Vr/TGP9yRXI1wVJ9A91HsBEP3FmxrOBKMREb9AjkUig0cteomStugwTBb4L81ks=@lists.ozlabs.org, AJvYcCXceBcz6Fn1EgragyUk5FzIa0NGJ992qSohE9CNMEMHNNaMYDDJROBxr50rn9pu+B2bga8VXXXT+w==@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx3DPPo9lKiODs4htYjyyyq+yE3nR75bFc+4giw5yTrmMJ4hw+H
	Q5AIyF920HJdKxEZBdbDW8LgXPtd091fToRwYFdXhJypLk6/7//1
X-Gm-Gg: ASbGncu9xpbINC+Z+76mkSw4hOMY/x1eLLsp+gSEee27ME1OeCVFbSOc582nLPCuAcr
	0ST66rvYMRcLFxB0RnmZ484BWCWsz0WQqUbI4H8q606Xzvb6Ms6b5E7+XDY2/K/MYZDoWgng2nr
	tr7NiIdm6Yc8QuVMhwC5V8vO3o4WfdgNjifNeYh88/5LC4L8dqExvEbGRfTZZdVe3EXbSY27MGH
	Y4umdaATeCi8rOsN2FAEAldZEw1hrlL4xGjN6U5pPZCe0XkESqyHq3XXTsPSwYc7K87Pw+PgbBN
	+xMM+G/bE/UqdlshzghSt/+5yHv33Cb5dlr83aOKH4VwyH5lMLXUkmsxSg==
X-Google-Smtp-Source: AGHT+IH26VxHQcLOQhDT0ENeuoRX0h2QLaU456Pm5UWb84f30oMCU5DkYbKfP44zoaE1dDrw9v5TnA==
X-Received: by 2002:a17:902:e845:b0:215:a56f:1e50 with SMTP id d9443c01a7336-22426fd8a0cmr4582335ad.8.1741281769817;
        Thu, 06 Mar 2025 09:22:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410aa4f83sm15011285ad.217.2025.03.06.09.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:22:49 -0800 (PST)
Date: Thu, 6 Mar 2025 09:22:47 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: George Cherian <gcherian@marvell.com>
Subject: Re: [EXTERNAL] Re: [PATCH v4 1/2] watchdog: Add a new flag
 WDIOF_STOP_MAYSLEEP
Message-ID: <925869a6-7563-459b-b42b-b7b9b8ea0b0a@roeck-us.net>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <20250305101025.2279951-2-george.cherian@marvell.com>
 <irmewriceyzxr6jvbiao5vqrvelpftbjalmheodx5w63zi6k2y@dg3wlvs6zryd>
 <PH8PR18MB538122CE6706872B8A836A94C5CB2@PH8PR18MB5381.namprd18.prod.outlook.com>
 <7ac2b8db-22c7-4168-b1b7-4f9f0ab10531@pengutronix.de>
 <28a711e5-b2cb-4d5f-bb78-259a01cd4bcc@roeck-us.net>
 <PH8PR18MB53812FCAE180303E5D434275C5CA2@PH8PR18MB5381.namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH8PR18MB53812FCAE180303E5D434275C5CA2@PH8PR18MB5381.namprd18.prod.outlook.com>
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Fri, 07 Mar 2025 09:43:18 +1100
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
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>, "mwalle@kernel.org" <mwalle@kernel.org>, "tmaimon77@gmail.com" <tmaimon77@gmail.com>, "hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>, "alexander.usyskin@intel.com" <alexander.usyskin@intel.com>, "tali.perry1@gmail.com" <tali.perry1@gmail.com>, "paul@crapouillou.net" <paul@crapouillou.net>, "daniel@thingy.jp" <daniel@thingy.jp>, "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>, "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>, "festevam@gmail.com" <festevam@gmail.com>, Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>, "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, "benjaminfair@google.com" <benjaminfair@google.com>, "lma@chromium.org" <lma@chromium.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "krzk@kernel.org" <krzk@kernel.org>, "evanbenn@chromium.org" <evanbenn@chromium.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "naveen@kernel.org" <naveen@kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "xingyu.wu@starfivetech.com" <xingyu.wu@starfivetech.com>, "ziv.xu@starfivetech.com" <ziv.xu@starfivetech.com>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "bleung@chromium.org" <bleung@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "andy@kernel.org" <andy@kernel.org>, "support.opensource@diasemi.com" <support.opensource@diasemi.com>, "andreas.werner@men.de" <andreas.werner@men.de>, "avifishman70@gmail.com" <avifishman70@gmail.com>, "thomas.richard@bootlin.com" <thomas.richard@bootlin.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mhiramat@kernel.org" <mhiramat@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "venture@google.com" <venture@google.com>, "jwerner@chromium.org" <jwerner@chromium.org>, "romain.perier@gmail.com" <romain.perier@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Mar 06, 2025 at 12:18:20PM +0000, George Cherian wrote:
> Hi Guenter,
> 
> I am summarizing the topics we discussed in multiple threads here.
> 
> >>On 3/5/25 03:01, Ahmad Fatoum wrote:
> >> Hi George,
> >> Hi Guenter,
> >> 
> >> On 05.03.25 11:34, George Cherian wrote:
> >>>> why is armada_37xx_wdt also here?
> >>>> The stop function in that driver may not sleep.
> >>> Marek,
> >>>
> >>> Thanks for reviewing.
> >>> Since the stop function has a regmap_write(), I thought it might sleep.
> >>> Now that you pointed it out, I assume that it is an MMIO based regmap being used for armada.
> >>> I will update the same in the next version
> >> 
> >> Failure to add WDIOF_STOP_MAYSLEEP when it's needed can lead to
> >> kernel hanging. Failure to add an alternative WDIOF_STOP_ATOMIC
> >> would lead to the kernel option being a no-op.
> >> 
> >> I think a no-op stop_on_panic (or reset_on_panic) is a saner default.
> >> 
> >
> >Agreed. Also, I like WDIOF_STOP_ATOMIC more than the WDIOF_STOP_NOSLEEP
> >I had suggested in my other response.
> 
> 1. Instead of blacklisting drivers as WDIOF_STOP_MAYSLEEP, the option will an opt-in.
> 2. This may not be WDIOF_STOP_AOMIC, instead would be a generic flag not limited to STOP
>     operation. May be WDIOF_OPS_ATOMIC (OPS include - .start, .stop, .set_timeout, .ping)

I don't see a value in this because AFAICS atomic operation is only needed when
stopping the watchdog. At least in theory, some watchdogs might need to sleep
for other functions, but not for the stop operation. Please provide a rationale.

> 3. Remove the kernel command line option (stop_on_panic) and have a generic reset_on_panic.
> 4. reset_on_panic=60 (by default )  meaning on a panic the wdog timeout is updated to 60sec
>      or the clamp_t(reset_on_panic, min, max_hw_heartbeat_ms).

Default should be the current behavior, that the watchdog keeps running with the
configured timeout.

> 5. if reset_on_panic=0, it means the watchdog is stopped on panic.

If we need both a panic timeout and the ability to disable the watchdog entirely
on panic, there should be two parameters - one to select the watchdog timeout
on panic, and one to disable the watchdog entirely on panic. If there is only
one parameter, it should be the watchdog timeout on panic, with ==0 meaning
"keep the configured timeout" (i.e., the current behavior).

Thanks,
Guenter
