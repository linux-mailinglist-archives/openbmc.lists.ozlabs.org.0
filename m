Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CF12FCA68
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 06:17:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLDL538MJzDqlW
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 16:17:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=cWi81Ojs; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=K1fxRdrn; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLDK53rBrzDqDN;
 Wed, 20 Jan 2021 16:16:41 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id CE60D580661;
 Wed, 20 Jan 2021 00:16:38 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 20 Jan 2021 00:16:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=PcJyYtudzRQd2L7XJQWnv/OgA9ryKAZ
 hSUK7NWDCh0I=; b=cWi81OjsDif1cVZ7S8+BWWAVbWdcEHBCqCrm9Xp+QUm6HOq
 sfiFSIX8cm0VccSlAfNmDYFq+Szus38GXIkPPpw23Nj9hxwDfjX98BnJvPbQUQ76
 /HQharncbffM3e8xIs59cu1iy407oekr3Z/5VqI+TyqgQKn27vgJVdwA5+orKIx9
 63RIplLN9PRFm9RlgL0X3y5frdNsV3SzTrRYl/NR+VO4onc2q0HPL8MlV1Dp9zhU
 18UU83GNxqDLq+YN1wv7pUJ/JhitHEwEqKCgTs3WS2mGOvpcKXr2mN6nJNOh2pB8
 UX2ikxtDNf/1I1ypA21Jzlt2Y0F9mkQyAebYtOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PcJyYt
 udzRQd2L7XJQWnv/OgA9ryKAZhSUK7NWDCh0I=; b=K1fxRdrnOOc61H9m8BCmDb
 GG3R7CjsKc28FwokFYFG3UkxrEIfWUGnZSkw1mXsYHGvUtlgfnUjbY+QMm++G1rC
 az5n9Kd0RR4Hp7VaM1RQzlAU/tGau0jIecWKjb2JHnbxXXFv6evAucXF6BwdzvhX
 4sD8uaJRIJokqY65oDA3H0Td8osqBguuo8oUOlFfhTQecrJW//3fEEJ28mGfiHF/
 8v9SkxPfaXxPpzDg4WBTonp/+uULDSgPcUEtyeMzqXdH8yELYAgNLFMsJX/GvGpE
 UAC2NN9KQjR2wfzHQihT+3vCqCfPQZNyAsfEtXN9wTmkHS9Ws6Zfrj5rVO1og+sQ
 ==
X-ME-Sender: <xms:tbwHYIAIcw2LOkd_I7SK2TU8Svrum1u-2h6UKb3hG-X4gpPqXG6hpQ>
 <xme:tbwHYKi6kzFS-V-qjI-mn6ASUhiYZsD8JoRN7WMRIBG3FH5Ie8EATeVQ1-lK5eYyT
 XnD2xzmtuBAvzjw5Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddugdekvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:tbwHYLnB2Y-nirGUZ7xMqPF8nXtZDW74QbigPk8g0N5MM_BsOZZJ8w>
 <xmx:tbwHYOwdMy2-DPJkI4nnmt-kfzK4b_ZT6D6b_8F85j8HDdEYIOwftQ>
 <xmx:tbwHYNSJeaXFN8CEf__8lNVsoRVnKwIEdr-5CE5vhbJ36rdmUvv_rQ>
 <xmx:trwHYIGKUJnsUL5rwG-NXci40q4d_QHHHX0gVXBRwo7hNRjSgVZopA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A9351A0005D; Wed, 20 Jan 2021 00:16:37 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-78-g36b56e88ef-fm-20210120.001-g36b56e88
Mime-Version: 1.0
Message-Id: <2bf67d3a-cd5f-4f9c-b043-709b18a759d5@www.fastmail.com>
In-Reply-To: <20210118065059.2478078-5-troy_lee@aspeedtech.com>
References: <20210118065059.2478078-1-troy_lee@aspeedtech.com>
 <20210118065059.2478078-5-troy_lee@aspeedtech.com>
Date: Wed, 20 Jan 2021 15:46:17 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Troy Lee" <troy_lee@aspeedtech.com>, openbmc@lists.ozlabs.org,
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
 Ryan Chen <ryan_chen@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 kbuild test robot <lkp@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Troy,

On Mon, 18 Jan 2021, at 17:20, Troy Lee wrote:
> Add Aspeed AST2600 PWM/Fan tacho driver. AST2600 has 16 PWM channel and
> 16 FAN tacho channel.
> 
> Changes since v2:
>  - declare local function as static function
> 
> Changes since v1:
>  - fixed review comments
>  - fixed double-looped calculation of div_h and div_l
>  - moving configuration to device tree
>  - register hwmon driver with devm_hwmon_device_register_with_info()
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  drivers/hwmon/Kconfig                |  10 +
>  drivers/hwmon/Makefile               |   1 +
>  drivers/hwmon/aspeed2600-pwm-tacho.c | 756 +++++++++++++++++++++++++++
>  3 files changed, 767 insertions(+)
>  create mode 100644 drivers/hwmon/aspeed2600-pwm-tacho.c

...

> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 09a86c5e1d29..1a415d493ffc 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -52,6 +52,7 @@ obj-$(CONFIG_SENSORS_ARM_SCPI)	+= scpi-hwmon.o
>  obj-$(CONFIG_SENSORS_AS370)	+= as370-hwmon.o
>  obj-$(CONFIG_SENSORS_ASC7621)	+= asc7621.o
>  obj-$(CONFIG_SENSORS_ASPEED)	+= aspeed-pwm-tacho.o
> +obj-$(CONFIG_SENSORS_ASPEED2600_PWM_TACHO)	+= aspeed2600-pwm-tacho.o

Why does this have to be a separate implementation from the existing ASPEED 
PWM/Tacho driver? Is there really nothing in common?

Andrew
