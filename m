Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAAF4D113F
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 08:45:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCS5z38fwz3bWd
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 18:44:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.37.156; helo=8.mo552.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 4690 seconds by postgrey-1.36 at boromir;
 Tue, 08 Mar 2022 18:44:42 AEDT
Received: from 8.mo552.mail-out.ovh.net (8.mo552.mail-out.ovh.net
 [46.105.37.156])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCS5k0rrfz2x9b
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2022 18:44:38 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.2])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id A1DAA23567;
 Tue,  8 Mar 2022 06:26:25 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 8 Mar
 2022 07:26:24 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004772dd874-7347-4ca0-8a76-f68c866fda61,
 03E3C14593CA27F822F61C3AD678835CDD198C87) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e340428e-7ea3-222a-3cc5-b3d7d0ef760b@kaod.org>
Date: Tue, 8 Mar 2022 07:26:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [SPAM] [PATCH 1/1] mtd: spi-nor: aspeed: set the decoding size to
 at least 2MB for AST2600
Content-Language: en-US
To: =?UTF-8?B?UG90aW4gTGFpICjos7Tmn4/lu7cp?= <Potin.Lai@quantatw.com>, Joel
 Stanley <joel@jms.id.au>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, Patrick Williams <patrick@stwcx.xyz>
References: <20220304170757.16924-1-potin.lai@quantatw.com>
 <67004879-96ab-33b5-f389-bbe0005d78ef@kaod.org>
 <6ed257f7-ae87-e2fe-26ed-9db300f5ebcc@kaod.org>
 <efeac1dc-0762-b6d3-e03b-dffc2c76d756@quantatw.com>
 <4d072c43-a766-9ce4-a629-a3ed095663a4@kaod.org>
 <e10877f9-57f7-7019-b9ca-0812a60cdea9@kaod.org>
 <597dcccf-f01a-92b5-9b62-72580660a1c5@quantatw.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <597dcccf-f01a-92b5-9b62-72580660a1c5@quantatw.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: bbcb5458-91c4-4130-a552-c6bef25d52ad
X-Ovh-Tracer-Id: 17803010805389560739
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudduhedgleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgrthhrihgtkhesshhtfigtgidrgiihii
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> Thanks for taking this patch into spi-mem driver, the tested log as below.
> 
> [    1.945705] spi-nor spi1.0: mx25l8005 (1024 Kbytes)
> [    1.945926] spi-aspeed-smc 1e630000.spi: CE0 window resized to 2MB (AST2600 Decoding)
> aspeed_smc_flash_set_segment CS0 segreg=0x100000 [ 0x30000000 - 0x30200000 ]
> aspeed_smc_flash_set_segment CS1 segreg=0x7f00020 [ 0x30200000 - 0x38000000 ]
> [    1.953083] spi-aspeed-smc 1e630000.spi: Calibration area too uniform, using low speed
> [    1.953409] spi-aspeed-smc 1e630000.spi: CE0 read buswidth:1 [0x000b0041]

Thanks for the test !
  
> By the way, there is a small error when compiling kernel, it needs forward declare for both ast2600_spi_data & ast2600_fmc_data.

Ah yes ! Sorry, I pushed a wrong version. I just did an update on my tree.

May be we should introduce some helpers to identify the SoC.

> Also, I saw you add ast2600_fmc_data for resize checking as well, should I add it in aspeed-smc.c and resend the patch?

Both AST2600 controllers have the same encoding of the flash window
range, so, yes the old driver needs it.

Thanks,

C.
