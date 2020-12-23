Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FF12E17E0
	for <lists+openbmc@lfdr.de>; Wed, 23 Dec 2020 04:55:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0zr04mjnzDqSW
	for <lists+openbmc@lfdr.de>; Wed, 23 Dec 2020 14:55:12 +1100 (AEDT)
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
 header.a=rsa-sha256 header.s=thorn header.b=EuqG2WVF; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0zpm1XbqzDqSk;
 Wed, 23 Dec 2020 14:54:06 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown
 [IPv6:2600:6c44:7f:ba20:1c66:ab2d:5a3:5a9e])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id B2D99806F7;
 Tue, 22 Dec 2020 19:53:58 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 thorn.bewilderbeest.net B2D99806F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1608695639;
 bh=UkEGylhrdt8z9hX+GY1d6wW/RLqoqo23ET3G6KBW12A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EuqG2WVFsZMIebMeVg+hIzhIuIBAWpjuaouck7qEvF+MZ4Knw2bS2SxoWuw+Gf2pF
 Lpc901GW0brm5cmwHVKXs+GqZuK+BLqwsmWLZ0EVI7umLbp5Vl6x5e4oRCIpjSposk
 NYe/dao6uzh8gknvwxu/Bo3+7Lx1mioJfQ4hVIBo=
Date: Tue, 22 Dec 2020 21:53:53 -0600
From: Zev Weiss <zev@bewilderbeest.net>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH 2/3] aspeed-video: clear spurious interrupt bits
 unconditionally
Message-ID: <20201223035353.omn5ebut62sb7mxh@hatter.bewilderbeest.net>
References: <20201215024542.18888-1-zev@bewilderbeest.net>
 <20201215024542.18888-3-zev@bewilderbeest.net>
 <CACPK8XczCUgqOENABoDbc-qwbMxOh=1OUyBtuHSmDG_Zo571Wg@mail.gmail.com>
 <20201222191433.3dgnfwyrod4tnvaf@hatter.bewilderbeest.net>
 <CACPK8XeOZEkpAKcyhZLeMdGzbwtFmdGEnL6QXp0VK1HL_O2pSg@mail.gmail.com>
 <HK0PR06MB338018668005D679C51EF69AF2DE0@HK0PR06MB3380.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <HK0PR06MB338018668005D679C51EF69AF2DE0@HK0PR06MB3380.apcprd06.prod.outlook.com>
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
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Dec 22, 2020 at 08:53:33PM CST, Ryan Chen wrote:
>> -----Original Message-----
>> From: Joel Stanley <joel@jms.id.au>
>> Sent: Wednesday, December 23, 2020 9:07 AM
>> To: Zev Weiss <zev@bewilderbeest.net>; Ryan Chen
>> <ryan_chen@aspeedtech.com>
>> Cc: Eddie James <eajames@linux.ibm.com>; Mauro Carvalho Chehab
>> <mchehab@kernel.org>; Andrew Jeffery <andrew@aj.id.au>;
>> linux-media@vger.kernel.org; OpenBMC Maillist <openbmc@lists.ozlabs.org>;
>> Linux ARM <linux-arm-kernel@lists.infradead.org>; linux-aspeed
>> <linux-aspeed@lists.ozlabs.org>; Linux Kernel Mailing List
>> <linux-kernel@vger.kernel.org>; Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> Subject: Re: [PATCH 2/3] aspeed-video: clear spurious interrupt bits
>> unconditionally
>>
>> On Tue, 22 Dec 2020 at 19:14, Zev Weiss <zev@bewilderbeest.net> wrote:
>> >
>> > On Mon, Dec 21, 2020 at 10:47:37PM CST, Joel Stanley wrote:
>> > >On Tue, 15 Dec 2020 at 02:46, Zev Weiss <zev@bewilderbeest.net> wrote:
>> > >>
>> > >> Instead of testing and conditionally clearing them one by one, we
>> > >> can instead just unconditionally clear them all at once.
>> > >>
>> > >> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>> > >
>> > >I had a poke at the assembly and it looks like GCC is clearing the
>> > >bits unconditionally anyway, so removing the tests provides no change.
>> > >
>> > >Combining them is a good further optimization.
>> > >
>> > >Reviewed-by: Joel Stanley <joel@jms.id.au>
>> > >
>> > >A question unrelated to this patch: Do you know why the driver
>> > >doesn't clear the status bits in the interrupt handler? I would
>> > >expect it to write the value of sts back to the register to ack the
>> > >pending interrupt.
>> > >
>> >
>> > No, I don't, and I was sort of wondering the same thing actually --
>> > I'm not deeply familiar with this hardware or driver though, so I was
>> > a bit hesitant to start messing with things.  (Though maybe doing so
>> > would address the "stickiness" aspect when it does manifest.)  Perhaps
>> > Eddie or Jae can shed some light here?
>>
>> I think you're onto something here - this would be why the status bits seem to
>> stick until the device is reset.
>>
>> Until Aspeed can clarify if this is a hardware or software issue, I suggest we ack
>> the bits and log a message when we see them, instead of always ignoring them
>> without taking any action.
>>
>> Can you write a patch that changes the interrupt handler to ack status bits as it
>> handles each of them?
>>
>Hello Zev, before the patch, do you met issue with irq handler? [continuous incoming?]
>
>In aspeed_video_irq handler should only handle enable interrupt expected.
>   u32 sts = aspeed_video_read(video, VE_INTERRUPT_STATUS);
> + sts &= aspeed_video_read(video, VE_INTERRUPT_CTRL);
>
>Ryan
>

Hi Ryan,

Prior to any of these patches I encountered a problem pretty much 
exactly like what Jae described in his commit message in 65d270acb2d 
(but the kernel I was running included that patch).  Adding the 
diagnostic in patch #1 of this series showed that it was apparently the 
same problem, just with a different interrupt that Jae's patch didn't 
include.

 From what you wrote above, I gather that it is in fact expected for the 
hardware to assert interrupts that aren't enabled in VE_INTERRUPT_CTRL?  
If so, I guess something like that would obviate the need for both Jae's 
earlier patch and this whole series.

I think the question Joel raised is somewhat independent though -- if 
the VE_INTERRUPT_STATUS register asserts interrupts we're not actually 
using, should the driver acknowledge them anyway or just leave them 
alone?  (Though if we're just going to ignore them anyway maybe it 
doesn't ultimately matter very much.)


Zev

