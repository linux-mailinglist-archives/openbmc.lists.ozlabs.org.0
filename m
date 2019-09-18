Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4066B6C8F
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 21:30:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YVSZ0kr5zF4jx
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 05:30:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=temperror (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=178.32.97.215; helo=14.mo1.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 8841 seconds by postgrey-1.36 at bilbo;
 Thu, 19 Sep 2019 05:29:50 AEST
Received: from 14.mo1.mail-out.ovh.net (14.mo1.mail-out.ovh.net
 [178.32.97.215])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YVRf47b4zF4gP
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 05:29:43 +1000 (AEST)
Received: from player687.ha.ovh.net (unknown [10.108.54.36])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 5D57B18F86E
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 19:02:21 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player687.ha.ovh.net (Postfix) with ESMTPSA id 522F59EDE350;
 Wed, 18 Sep 2019 17:02:18 +0000 (UTC)
Subject: Re: [PATCH linux dev-5.2 v2 3/4] ARM: dts: Aspeed: ast2600: Add I2C
 busses
To: Eddie James <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <1568391353-32584-1-git-send-email-eajames@linux.ibm.com>
 <1568391353-32584-4-git-send-email-eajames@linux.ibm.com>
 <9f747c91-0988-2eb1-7387-6bb5edff8611@kaod.org>
 <7079ed45-7bfe-f580-2829-5d984c520608@linux.ibm.com>
 <41fe74ea-4186-e059-401d-f6a6ed39e4ec@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c5a539f1-2304-0ef3-b6a2-9ee96614924b@kaod.org>
Date: Wed, 18 Sep 2019 19:02:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <41fe74ea-4186-e059-401d-f6a6ed39e4ec@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7141583112286014379
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudekgddutdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
Cc: andrew@aj.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 18/09/2019 17:57, Cédric Le Goater wrote:
> On 18/09/2019 16:53, Eddie James wrote:
>>
>> On 9/18/19 5:18 AM, Cédric Le Goater wrote:
>>> On 13/09/2019 18:15, Eddie James wrote:
>>>> Add all the I2C busses to the AST2600 dtsi and set their required
>>>> properties.
>>>>
>>> The DT defines an interrupt per I2C bus but this is not how the I2C
>>> driver operates. It still uses the old mode from the Aspeed AST2500.
>>
>>
>> Oh? The I2C interrupt controller driver is a separate driver, which I didn't include a node for in the AST2600 dts. As far as I can tell the I2C bus driver just asks for it's interrupt and uses it, so by setting each bus to it's GIC interrupt line (instead of the line from the I2C interrupt controller like in the AST2500), the I2C driver receives the correct interrupt.
> 
> ok. I am seeing this from the I2C model side and that is where the 
> problem must be. I will dig in QEMU.

We now have one irq per bus and the I2C model needs some rework for 
the AST2600 because we only had one with the previous Aspeed SoC.

Are you sure of the I2C IRQ number range ? Shouldn't we using range
142-157 instead ? 

Thanks,

C.
