Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2863C5F7F3E
	for <lists+openbmc@lfdr.de>; Fri,  7 Oct 2022 22:49:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MkgQv0Y2Hz3dsL
	for <lists+openbmc@lfdr.de>; Sat,  8 Oct 2022 07:49:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=178.32.125.2; helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 1127 seconds by postgrey-1.36 at boromir; Sat, 08 Oct 2022 07:49:01 AEDT
Received: from smtpout1.mo529.mail-out.ovh.net (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MkgQP65NNz3cfN
	for <openbmc@lists.ozlabs.org>; Sat,  8 Oct 2022 07:48:59 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.125])
	by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 94A661303F460;
	Fri,  7 Oct 2022 22:30:05 +0200 (CEST)
Received: from kaod.org (37.59.142.106) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Fri, 7 Oct
 2022 22:30:04 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-106R006ae27c1e1-0ba7-49ef-b5c0-50886aca72bf,
                    72EF84A86A0CAB1F8CEB0FBBC9371DA6A893A50B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <c1bfbadf-0989-329b-308e-1a3c79ca2caa@kaod.org>
Date: Fri, 7 Oct 2022 22:29:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [v2] spi: aspeed: Fix typo in mode_bits field for AST2600
 platform
Content-Language: en-US
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, <broonie@kernel.org>,
	<joel@jms.id.au>, <andrew@aj.id.au>, <linux-aspeed@lists.ozlabs.org>,
	<openbmc@lists.ozlabs.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <BMC-SW@aspeedtech.com>,
	<steven_lee@aspeedtech.com>
References: <20221005083209.222272-1-chin-ting_kuo@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221005083209.222272-1-chin-ting_kuo@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 61269dbd-0814-42ac-865a-8955e68af19d
X-Ovh-Tracer-Id: 10109736741803953074
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeijedgudehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepshhtvghvvghnpghlvggvsegrshhpvggvughtvggthhdrtghomhdpoffvtefjohhsthepmhhohedvle
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

On 10/5/22 10:32, Chin-Ting Kuo wrote:
> Both quad SPI TX and RX modes can be supported on AST2600.
> Correct typo in mode_bits field in both ast2600_fmc_data
> and ast2600_spi_data structs.
> 
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   drivers/spi/spi-aspeed-smc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
> index a334e89add86..33cefcf18392 100644
> --- a/drivers/spi/spi-aspeed-smc.c
> +++ b/drivers/spi/spi-aspeed-smc.c
> @@ -1163,7 +1163,7 @@ static const struct aspeed_spi_data ast2500_spi_data = {
>   static const struct aspeed_spi_data ast2600_fmc_data = {
>   	.max_cs	       = 3,
>   	.hastype       = false,
> -	.mode_bits     = SPI_RX_QUAD | SPI_RX_QUAD,
> +	.mode_bits     = SPI_RX_QUAD | SPI_TX_QUAD,
>   	.we0	       = 16,
>   	.ctl0	       = CE0_CTRL_REG,
>   	.timing	       = CE0_TIMING_COMPENSATION_REG,
> @@ -1178,7 +1178,7 @@ static const struct aspeed_spi_data ast2600_fmc_data = {
>   static const struct aspeed_spi_data ast2600_spi_data = {
>   	.max_cs	       = 2,
>   	.hastype       = false,
> -	.mode_bits     = SPI_RX_QUAD | SPI_RX_QUAD,
> +	.mode_bits     = SPI_RX_QUAD | SPI_TX_QUAD,
>   	.we0	       = 16,
>   	.ctl0	       = CE0_CTRL_REG,
>   	.timing	       = CE0_TIMING_COMPENSATION_REG,

