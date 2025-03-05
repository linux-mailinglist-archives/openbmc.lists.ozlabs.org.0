Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDAFA50F33
	for <lists+openbmc@lfdr.de>; Wed,  5 Mar 2025 23:54:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7SX62NGHz3fsm
	for <lists+openbmc@lfdr.de>; Thu,  6 Mar 2025 09:53:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741172602;
	cv=none; b=eQtgAu7+QxmwDw5RzDNnJfKbv9ZMiRAzfuZUSr/Nu5VMJ1ZkdjTQWC6aGk1iliHwO1hhq+HOEL7AHrnRF1ftrmEdrN2Y62O8oP+d4nve3aBdZOnjW1WGVPobdC+HyC5rmrf/hvSIlQd0QtDWasdXbD3WQFiIwiKhAS2hyeSy/3mbY3sE73cpeG5TrTR7NGFat+yjjcS4GBgbmG1B2yIUCQoTe1ed3qkeMEc75PnDN8zh9jCGvlM55LAgy3cuCw9yyuZnKUM5RxobWX/DHZVMBxIxokZWV9e1LEVsxsl8RPLcyyleMQVckG/Q+KZxgoydyMZdyRIRBOmcJR/MXQRNUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741172602; c=relaxed/relaxed;
	bh=XYwUJolyoOPbR7D8nnIUzaN6rOxA1WavGxSIMheTrQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CDkpyLympPyoCRFXQKeczMtXW1ATq92GOwy05HkWM0VYTANo14TbnBhpaAjzVTPvqnpYBSqLi75Qsa/YimGJu3nEjGHOMHew1xm3MeUAPfMVKN+JdVm6Wda7JDLpdY707Ym47WHL8PbXyNSX5L6vtkscuXsITd39WiURzFRymVsAqn3DMZKAQh8UpG7H86lorsAe5UqZry667obWOG++WsA83k/DOzWgYWF/ukp4TwfvBEdwOjVRFrWnv9AfNZYIPZouo4CEseNQeka5xeLGBdi90JZTeKvqAQykxJDUo3Ub56KCHnLI4rNcy3ODrnbxwAyZXqlVN5mSPhzpbEkNnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=a.fatoum@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=a.fatoum@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z78mS31qyz2yvs
	for <openbmc@lists.ozlabs.org>; Wed,  5 Mar 2025 22:03:20 +1100 (AEDT)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tpmVq-0008LI-3s; Wed, 05 Mar 2025 12:02:06 +0100
Message-ID: <7ac2b8db-22c7-4168-b1b7-4f9f0ab10531@pengutronix.de>
Date: Wed, 5 Mar 2025 12:01:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
To: George Cherian <gcherian@marvell.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <20250305101025.2279951-2-george.cherian@marvell.com>
 <irmewriceyzxr6jvbiao5vqrvelpftbjalmheodx5w63zi6k2y@dg3wlvs6zryd>
 <PH8PR18MB538122CE6706872B8A836A94C5CB2@PH8PR18MB5381.namprd18.prod.outlook.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <PH8PR18MB538122CE6706872B8A836A94C5CB2@PH8PR18MB5381.namprd18.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openbmc@lists.ozlabs.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 06 Mar 2025 09:52:58 +1100
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
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>, "mwalle@kernel.org" <mwalle@kernel.org>, "tmaimon77@gmail.com" <tmaimon77@gmail.com>, "hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>, "alexander.usyskin@intel.com" <alexander.usyskin@intel.com>, "tali.perry1@gmail.com" <tali.perry1@gmail.com>, "paul@crapouillou.net" <paul@crapouillou.net>, "daniel@thingy.jp" <daniel@thingy.jp>, "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>, "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>, "festevam@gmail.com" <festevam@gmail.com>, =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "benjaminfair@google.com" <benjaminfair@google.com>, "lma@chromium.org" <lma@chromium.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "krzk@kernel.org" <krzk@kernel.org>, "evanbenn@chromium.org" <evanbenn@chromium.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "naveen@kernel.org" <naveen@kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "xingyu.wu@starfivetech.com" <xingyu.wu@starfivetech.com>, "ziv.xu@starfivetech.com" <ziv.xu@starfivetech.com>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "bleung@chromium.org" <bleung@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "andy@kernel.org" <andy@kernel.org>, "support.opensource@diasemi.com" <support.opensource@diasemi.com>, "andreas.werner@men.de" <andreas.werner@men.de>, "avifishman70@gmail.com" <avifishman70@gmail.com>, "thomas.richard@bootlin.com" <thomas.richard@bootlin.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mhiramat@kernel.org" <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, "venture@google.com" <venture@google.com>, "jwerner@chromium.org" <jwerner@chromium.org>, "romain.perier@gmail.com" <romain.perier@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi George,
Hi Guenter,

On 05.03.25 11:34, George Cherian wrote:
>> why is armada_37xx_wdt also here?
>> The stop function in that driver may not sleep.
> Marek,
> 
> Thanks for reviewing.
> Since the stop function has a regmap_write(), I thought it might sleep.
> Now that you pointed it out, I assume that it is an MMIO based regmap being used for armada.
> I will update the same in the next version

Failure to add WDIOF_STOP_MAYSLEEP when it's needed can lead to
kernel hanging. Failure to add an alternative WDIOF_STOP_ATOMIC
would lead to the kernel option being a no-op.

I think a no-op stop_on_panic (or reset_on_panic) is a saner default.

Cheers,
Ahmad

> 
>>
>> Marek
> 
> -George


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
