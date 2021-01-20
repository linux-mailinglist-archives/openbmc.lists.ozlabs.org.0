Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9079A2FCB08
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 07:39:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLG986XmJzDqmT
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 17:39:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=p1hdjXq+; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=bO79YdT1; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLG7X6XJ4zDqCg;
 Wed, 20 Jan 2021 17:38:31 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id B7B2558059E;
 Wed, 20 Jan 2021 01:38:28 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 20 Jan 2021 01:38:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=xYUL5Lpkut2ajLp2HHqqFc/SO8e3GAJ
 6jWEOsfPOZpo=; b=p1hdjXq+NLGlOJ4czoa6dwjGUO5OGNYmlHtjm3JBlgy+JCy
 tD6nT+jWB1/UKVhmd9CJoY8w5ryNLpuL9w7PEDlcKnjj4d81Gl3EnB++2ggXYEQr
 7YtIaUKtbgm/shMqUS1qVh/aOChv6HGuzYWMasXRlfflS1yUY0h9jEdgHF3w7TRL
 URgjSiPFf1M6yfHHx+2l37e1pKHiaxdzx8zSYPD/a8YHy7F+v/bYJs9SigmI+2wl
 HWRavrLO+/6VpplWIwATICiW9A2YpoGAkZY8W5C0WyPs2LxBOlUC/4+G8baGACq5
 FzWK1pSYLl0PHShwjCeKZzV9K4AxlIs9ZfdggYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=xYUL5L
 pkut2ajLp2HHqqFc/SO8e3GAJ6jWEOsfPOZpo=; b=bO79YdT1bsyMWvDdKYh9ML
 DsInCKRvaXWLHrSeQ6YhvAJ0uoQKqzydkV2GjWUbYzgkfMRRd+J1g/Yr45wRhqR2
 kEvLLMNZvCa3BCstI+LK2n/EYbOABXb0VDkyDmQPVCOXiON13vuaQNO0mfpm9/My
 x1lCSX015WUKMw2Sb1YLSDBMOlUk1UDjlZsCDwZvjUskLjMWEiwEhFgPXHBTNY68
 tZwuLHC46W6MtVSo2VYdkssaqdVMuB620bX5b73/+yhei2MA6IzWETaoZAz4xlEK
 Q6n+ao9AQT4PB9+TiV2m1C7mKVgpf/y0r8OfKKkJDuOZGtSYTnjAVuNBKwz204EA
 ==
X-ME-Sender: <xms:488HYJbXAAgIO0dlci19mWnBZXJ_9jETfMgs5s-dv-uIEf30xyWkxA>
 <xme:488HYAarSkQr7hoIhxll6Y0FvIHkD_x4w_SCk3D-MNJvdogs-IP8c5RybPiPwoD37
 fzT2TzAi2Zlq9eccA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddugdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:488HYL-NWv62iCUU5NisdF3zxkmPHkbkpTmwAzWgdbWfQGW8EMBKKg>
 <xmx:488HYHpg3zoSWPWueb8BBXT7r7h43kEAwA58ln1in7bc6QjyuNn4UQ>
 <xmx:488HYEp0hbpMShYzLDPs7yRrCDW8h-hFrYcufgiAVtniMjwWMzuZVg>
 <xmx:5M8HYAdkVFxYV8_e-1GJT0YVGc3E7JiO_ESn6pUkuUmjKxZ35TPwuw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0481AA0005D; Wed, 20 Jan 2021 01:38:27 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-78-g36b56e88ef-fm-20210120.001-g36b56e88
Mime-Version: 1.0
Message-Id: <31ea8453-bbb1-4e68-8ee4-f7e524e38b88@beta.fastmail.com>
In-Reply-To: <HK0PR06MB338019E403823F0BF9962FE3F2A20@HK0PR06MB3380.apcprd06.prod.outlook.com>
References: <20210118065059.2478078-1-troy_lee@aspeedtech.com>
 <20210118065059.2478078-5-troy_lee@aspeedtech.com>
 <2bf67d3a-cd5f-4f9c-b043-709b18a759d5@www.fastmail.com>
 <HK0PR06MB338019E403823F0BF9962FE3F2A20@HK0PR06MB3380.apcprd06.prod.outlook.com>
Date: Wed, 20 Jan 2021 17:07:56 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ryan Chen" <ryan_chen@aspeedtech.com>,
 "Troy Lee" <troy_lee@aspeedtech.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Joel Stanley" <joel@jms.id.au>, "Philipp Zabel" <p.zabel@pengutronix.de>,
 "open list" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>
Subject: Re: [PATCH v3 4/4] hwmon: Support Aspeed AST2600 PWM/Fan tachometer
Content-Type: text/plain
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
Cc: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, kbuild test robot <lkp@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 20 Jan 2021, at 15:53, Ryan Chen wrote:
> > -----Original Message-----
> > From: Andrew Jeffery <andrew@aj.id.au>
> > Sent: Wednesday, January 20, 2021 1:16 PM
> > To: Troy Lee <troy_lee@aspeedtech.com>; openbmc@lists.ozlabs.org; Joel
> > Stanley <joel@jms.id.au>; Philipp Zabel <p.zabel@pengutronix.de>; open list
> > <linux-kernel@vger.kernel.org>; moderated list:ARM/ASPEED MACHINE
> > SUPPORT <linux-arm-kernel@lists.infradead.org>; moderated
> > list:ARM/ASPEED MACHINE SUPPORT <linux-aspeed@lists.ozlabs.org>
> > Cc: Ryan Chen <ryan_chen@aspeedtech.com>; ChiaWei Wang
> > <chiawei_wang@aspeedtech.com>; Troy Lee <leetroy@gmail.com>; kbuild
> > test robot <lkp@intel.com>
> > Subject: Re: [PATCH v3 4/4] hwmon: Support Aspeed AST2600 PWM/Fan
> > tachometer
> > 
> > Hi Troy,
> > 
> > On Mon, 18 Jan 2021, at 17:20, Troy Lee wrote:
> > > Add Aspeed AST2600 PWM/Fan tacho driver. AST2600 has 16 PWM channel
> > > and
> > > 16 FAN tacho channel.
> > >
> > > Changes since v2:
> > >  - declare local function as static function
> > >
> > > Changes since v1:
> > >  - fixed review comments
> > >  - fixed double-looped calculation of div_h and div_l
> > >  - moving configuration to device tree
> > >  - register hwmon driver with devm_hwmon_device_register_with_info()
> > >
> > > Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > ---
> > >  drivers/hwmon/Kconfig                |  10 +
> > >  drivers/hwmon/Makefile               |   1 +
> > >  drivers/hwmon/aspeed2600-pwm-tacho.c | 756
> > > +++++++++++++++++++++++++++
> > >  3 files changed, 767 insertions(+)
> > >  create mode 100644 drivers/hwmon/aspeed2600-pwm-tacho.c
> > 
> > ...
> > 
> > > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile index
> > > 09a86c5e1d29..1a415d493ffc 100644
> > > --- a/drivers/hwmon/Makefile
> > > +++ b/drivers/hwmon/Makefile
> > > @@ -52,6 +52,7 @@ obj-$(CONFIG_SENSORS_ARM_SCPI)	+=
> > scpi-hwmon.o
> > >  obj-$(CONFIG_SENSORS_AS370)	+= as370-hwmon.o
> > >  obj-$(CONFIG_SENSORS_ASC7621)	+= asc7621.o
> > >  obj-$(CONFIG_SENSORS_ASPEED)	+= aspeed-pwm-tacho.o
> > > +obj-$(CONFIG_SENSORS_ASPEED2600_PWM_TACHO)	+=
> > aspeed2600-pwm-tacho.o
> > 
> > Why does this have to be a separate implementation from the existing ASPEED
> > PWM/Tacho driver? Is there really nothing in common?
> > 
> Hello Andrew,
> 	The register set is fully re-arrange. And it is new design at AST2600, 
> can't be compatible with older PWM.  
>

Ah, okay. I hadn't looked. Thanks Ryan.

Andrew
