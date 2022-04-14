Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44496500B61
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 12:44:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfGLB1WVvz2ynj
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 20:44:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KfGKt0ZK6z2xKW
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2022 20:44:17 +1000 (AEST)
Received: from [192.168.0.2] (ip5f5ae8d7.dynamic.kabel-deutschland.de
 [95.90.232.215])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 8E73C61EA1932;
 Thu, 14 Apr 2022 12:44:13 +0200 (CEST)
Message-ID: <c77b6667-25ff-70c4-2312-9262d88b1859@molgen.mpg.de>
Date: Thu, 14 Apr 2022 12:44:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 3/3] EDAC: nuvoton: Add NPCM memory controller driver
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>
References: <20220322030152.19018-1-ctcchien@nuvoton.com>
 <20220322030152.19018-4-ctcchien@nuvoton.com>
 <a06441fc-85cf-9386-e362-4a90e855aa19@molgen.mpg.de>
 <CAHpyw9fQVbS1Cpv0ULQc2=vK8LsG6n7tgP+J9AboUupDAPT27Q@mail.gmail.com>
 <YlfeXVSkUC2B4xH2@zn.tnic>
 <14d07709-07ef-21a8-ad74-0f56447cf6dd@molgen.mpg.de>
 <Ylf0Sc7fqv25Ay05@zn.tnic>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <Ylf0Sc7fqv25Ay05@zn.tnic>
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
Cc: KWLIU@nuvoton.com, tony.luck@intel.com, rric@kernel.org,
 Benjamin Fair <benjaminfair@google.com>, linux-edac@vger.kernel.org,
 KFTING <KFTING@nuvoton.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, ctcchien@nuvoton.com, Tali Perry <tali.perry1@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 James Morse <james.morse@arm.com>, Medad Young <medadyoung@gmail.com>,
 YSCHU@nuvoton.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Borislav,


Am 14.04.22 um 12:15 schrieb Borislav Petkov:
> On Thu, Apr 14, 2022 at 10:56:43AM +0200, Paul Menzel wrote:
>> No idea, why you had to ask this question, while you statement before
>> already made the point.
> 
> You've told Medad one thing. I told him the complete opposite.

When? I must have missed your comment then?

> Medad as new submitter gets confused. And I don't want patch
> submitters to get confused by review.
> 
> So, if you're unsure about a review feedback, don't give it pls.

Also during review errors can happen, can’t they? I apologized, and then 
you for catching it.

>> Sorry I do not get your point. Would you elaborate on the debug message so
>> it’s more useful?
> 
> Just think of the big picture: is my error message useful enough for
> debugging or would I have to go and add more info to it so that I can
> debug an issue?
> 
> Example:
> 
> There is
> 
> 	edac_dbg(3, "InterruptStatus : 0x%x\n", intr_status);
> 
> now.
> 
> Now, how about this?
> 
>          edac_dbg(3, "dev: %s, id: %s: IRQ: %d, interrupt status: 0x%x\n",
>                   mci->dev_name, mci->ctl_name, irq, intr_status);
> 
> Which one, do you think, is more helpful to a person trying to debug any
> potential issue with the interrupt handler and the ECCs it is supposed
> to issue?

I am all for more elaborate log messages, but have the feeling, you 
think I am not? Where does the misunderstanding come from?


Kind regards,

Paul
