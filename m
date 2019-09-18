Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8245DB6864
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 18:44:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YQmz0SJkzF4Cb
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 02:44:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.47.167; helo=11.mo5.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1500 seconds by postgrey-1.36 at bilbo;
 Thu, 19 Sep 2019 02:43:43 AEST
Received: from 11.mo5.mail-out.ovh.net (11.mo5.mail-out.ovh.net
 [46.105.47.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YQlz0ggQzF1fQ
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 02:43:38 +1000 (AEST)
Received: from player761.ha.ovh.net (unknown [10.109.146.166])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 640C124F072
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 17:57:28 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player761.ha.ovh.net (Postfix) with ESMTPSA id EF3759F9C2A0;
 Wed, 18 Sep 2019 15:57:24 +0000 (UTC)
Subject: Re: [PATCH linux dev-5.2 v2 3/4] ARM: dts: Aspeed: ast2600: Add I2C
 busses
To: Eddie James <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <1568391353-32584-1-git-send-email-eajames@linux.ibm.com>
 <1568391353-32584-4-git-send-email-eajames@linux.ibm.com>
 <9f747c91-0988-2eb1-7387-6bb5edff8611@kaod.org>
 <7079ed45-7bfe-f580-2829-5d984c520608@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <41fe74ea-4186-e059-401d-f6a6ed39e4ec@kaod.org>
Date: Wed, 18 Sep 2019 17:57:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7079ed45-7bfe-f580-2829-5d984c520608@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6045801027229420459
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudekgdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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

On 18/09/2019 16:53, Eddie James wrote:
> 
> On 9/18/19 5:18 AM, Cédric Le Goater wrote:
>> On 13/09/2019 18:15, Eddie James wrote:
>>> Add all the I2C busses to the AST2600 dtsi and set their required
>>> properties.
>>>
>> The DT defines an interrupt per I2C bus but this is not how the I2C
>> driver operates. It still uses the old mode from the Aspeed AST2500.
> 
> 
> Oh? The I2C interrupt controller driver is a separate driver, which I didn't include a node for in the AST2600 dts. As far as I can tell the I2C bus driver just asks for it's interrupt and uses it, so by setting each bus to it's GIC interrupt line (instead of the line from the I2C interrupt controller like in the AST2500), the I2C driver receives the correct interrupt.

ok. I am seeing this from the I2C model side and that is where the 
problem must be. I will dig in QEMU.

Thanks,

C. 
