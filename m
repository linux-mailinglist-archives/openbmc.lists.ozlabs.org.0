Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB7275FA19
	for <lists+openbmc@lfdr.de>; Mon, 24 Jul 2023 16:44:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8jcT62cpz30MD
	for <lists+openbmc@lfdr.de>; Tue, 25 Jul 2023 00:44:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8jc84PFDz2y3Y
	for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2023 00:44:40 +1000 (AEST)
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 7C34961E5FE01;
	Mon, 24 Jul 2023 16:44:10 +0200 (CEST)
Message-ID: <45cf294e-3124-9a0d-864f-ba7c605405c0@molgen.mpg.de>
Date: Mon, 24 Jul 2023 16:44:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 1/3] gpio: nuvoton: Add Nuvoton NPCM sgpio driver
Content-Language: en-US
To: Jim Liu <jim.t90615@gmail.com>
References: <20230314092311.8924-1-jim.t90615@gmail.com>
 <20230314092311.8924-2-jim.t90615@gmail.com>
 <519312b6-f28c-7482-21c1-d9628f0295cb@molgen.mpg.de>
 <CAKUZ0+FGSEgzbK6H_sHaGpP9JnvrLeBRQViqmViR1OVXoVs7vA@mail.gmail.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <CAKUZ0+FGSEgzbK6H_sHaGpP9JnvrLeBRQViqmViR1OVXoVs7vA@mail.gmail.com>
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
Cc: KWLIU@nuvoton.com, devicetree@vger.kernel.org, linus.walleij@linaro.org, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, brgl@bgdev.pl
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Jim,


Am 24.07.23 um 05:04 schrieb Jim Liu:

> sorry for reply late.

No problem. Thank you for your reply. Some minor comments below.

> First, thanks for your review.
> 
> the description is as below:
> 
> The SGPIO module can be programmed to support from zero (none) to
> eight external output ports ,

No space before the comma.

> each with eight output pins (for a total of 64 output pins). The
> output ports must be serial-to-parallel devices (such as the HC595 or
> a faster equivalent).
> 
> The SGPIO can be programmed to accept from zero to eight external
> input ports (IXPp), each with eight input pins, supporting a total of
> 64 input pins. The input ports must be parallel-to-serial devices
> (such as the HC165 or a faster equivalent).
> 
> you can add hc595 and hc165 ic to get the serial data from BMC and
> send serial data to BMC.
> This driver can expand  extra gpio pins up to 64 input and 64 output.

One space before “extra”. Maybe:

hc595 and c165 ic allow to transmit serial data from and to the BMC. 
This driver can expand extra GPIO pins up to 64 inputs and 64 outputs.

> i will use jim.t90615@gmail.com this mail to upstream this driver not
> company mail.

If this is paid work, using your company email address should be 
preferred in my opinion.

> The driver needs to fix the length of the variables, because the reg
> size is one byte.

One byte would also fit into `unsigned int`, wouldn’t it?

> I will follow your suggestion to modify and upstream again. If you
> have any questions please let me know.

If you could use Mozilla Thunderbird to reply easily in interleaved 
style, that would great.

Otherwise, I am looking forward to the next revision.


Kind regards,

Paul
