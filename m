Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E781A18AD
	for <lists+openbmc@lfdr.de>; Wed,  8 Apr 2020 01:38:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xkNv3YJ1zDr34
	for <lists+openbmc@lfdr.de>; Wed,  8 Apr 2020 09:38:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=76.164.61.194; helo=kernel.crashing.org;
 envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xkMW3dctzDqN2;
 Wed,  8 Apr 2020 09:36:55 +1000 (AEST)
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 037NaIP6017886
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 7 Apr 2020 18:36:22 -0500
Message-ID: <93ae433317a82de86ff5e9c8485563b78656b615.camel@kernel.crashing.org>
Subject: Re: [PATCH v3] usb: gadget: aspeed: improve vhub port irq handling
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Tao Ren <rentao.bupt@gmail.com>
Date: Wed, 08 Apr 2020 09:36:16 +1000
In-Reply-To: <20200407060242.GA15050@taoren-ubuntu-R90MNF91>
References: <20200315191430.12379-1-rentao.bupt@gmail.com>
 <20200401215826.GA8248@taoren-ubuntu-R90MNF91>
 <512d625e45ea953d722bb7ea73c3619730312284.camel@kernel.crashing.org>
 <20200403064826.GA10866@taoren-ubuntu-R90MNF91>
 <20200407060242.GA15050@taoren-ubuntu-R90MNF91>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Felipe Balbi <balbi@kernel.org>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, taoren@fb.com,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2020-04-06 at 23:02 -0700, Tao Ren wrote:
> I ran some testing on my ast2400 and ast2500 BMC and looks like the
> for() loop runs faster than for_each_set_bit_from() loop in my
> environment. I'm not sure if something needs to be revised in my test
> code, but please kindly share your suggestions:
> 
> I use get_cycles() to calculate execution time of 2 different loops, and
> ast_vhub_dev_irq() is replaced with barrier() to avoid "noise"; below
> are the results:
> 
>   - when downstream port number is 5 and only 1 irq bit is set, it takes
>     ~30 cycles to finish for_each_set_bit() loop, and 20-25 cycles to
>     finish the for() loop.
> 
>   - if downstream port number is 5 and all 5 bits are set, then
>     for_each_set_bit() loop takes ~50 cycles and for() loop takes ~25
>     cycles.
> 
>   - when I increase downsteam port number to 16 and set 1 irq bit, the
>     for_each_set_bit() loop takes ~30 cycles and for() loop takes 25
>     cycles. It's a little surprise to me because I thought for() loop
>     would cost 60+ cycles (3 times of the value when port number is 5).
> 
>   - if downstream port number is 16 and all irq status bits are set,
>     then for_each_set_bit() loop takes 60-70 cycles and for() loop takes
>     30+ cycles.

I suspect the CPU doesn't have an efficient find-zero-bit primitive,
check the generated asm. In that case I would go back to the simple for
loop.

Cheers,
Ben.


