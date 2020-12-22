Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D942E0EA0
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 20:15:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0mJJ0RdfzDqKr
	for <lists+openbmc@lfdr.de>; Wed, 23 Dec 2020 06:15:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=bewilderbeest.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=ew1Ghxxc; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0mHQ61GzzDqRD;
 Wed, 23 Dec 2020 06:14:42 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown
 [IPv6:2600:6c44:7f:ba20:1c66:ab2d:5a3:5a9e])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id AF267806F7;
 Tue, 22 Dec 2020 11:14:39 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 thorn.bewilderbeest.net AF267806F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1608664480;
 bh=M5Opg5R/38DkRwnOgdlxD0B9jj1MfxC+605df+mJ9y0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ew1GhxxcyeI5UqiQoh9P4V+yGGrE9TOA+ZB/fGc/VpWZ8Fglsm6z44PYyx49FCHI2
 WXoowMLbDeHdvfw51KVjVk7K9SHI9NtoycPMYFqI+ccZWF1DIFAHQQ4PKeiuTDPmIG
 ukjUraBzf9y7PL1ny35Vb/vYoZPCa6BbJJ+JFG9I=
Date: Tue, 22 Dec 2020 13:14:33 -0600
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 2/3] aspeed-video: clear spurious interrupt bits
 unconditionally
Message-ID: <20201222191433.3dgnfwyrod4tnvaf@hatter.bewilderbeest.net>
References: <20201215024542.18888-1-zev@bewilderbeest.net>
 <20201215024542.18888-3-zev@bewilderbeest.net>
 <CACPK8XczCUgqOENABoDbc-qwbMxOh=1OUyBtuHSmDG_Zo571Wg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACPK8XczCUgqOENABoDbc-qwbMxOh=1OUyBtuHSmDG_Zo571Wg@mail.gmail.com>
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Dec 21, 2020 at 10:47:37PM CST, Joel Stanley wrote:
>On Tue, 15 Dec 2020 at 02:46, Zev Weiss <zev@bewilderbeest.net> wrote:
>>
>> Instead of testing and conditionally clearing them one by one, we can
>> instead just unconditionally clear them all at once.
>>
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>
>I had a poke at the assembly and it looks like GCC is clearing the
>bits unconditionally anyway, so removing the tests provides no change.
>
>Combining them is a good further optimization.
>
>Reviewed-by: Joel Stanley <joel@jms.id.au>
>
>A question unrelated to this patch: Do you know why the driver doesn't
>clear the status bits in the interrupt handler? I would expect it to
>write the value of sts back to the register to ack the pending
>interrupt.
>

No, I don't, and I was sort of wondering the same thing actually -- I'm 
not deeply familiar with this hardware or driver though, so I was a bit 
hesitant to start messing with things.  (Though maybe doing so would 
address the "stickiness" aspect when it does manifest.)  Perhaps Eddie 
or Jae can shed some light here?


Zev

