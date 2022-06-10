Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0084D546275
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 11:32:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKG2S66Rkz3c7p
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 19:32:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=188.165.49.222; helo=6.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 6.mo552.mail-out.ovh.net (6.mo552.mail-out.ovh.net [188.165.49.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKG276JVnz3000
	for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 19:31:56 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.84])
	by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 916AD23C5E;
	Fri, 10 Jun 2022 09:31:50 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 10 Jun
 2022 11:31:49 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-102R004ba814379-8fc6-4c9c-82f3-a1daf5cd5c38,
                    47EE32455EA4CDBAEFF6DF707BD4A273D3E287E7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <6c3afc64-f046-6708-1248-980202cedff1@kaod.org>
Date: Fri, 10 Jun 2022 11:31:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 4/4] config: aspeed: Enable
 NCSI support
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, <openbmc@lists.ozlabs.org>
References: <20220610080059.2333501-1-joel@jms.id.au>
 <20220610080059.2333501-5-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220610080059.2333501-5-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d8e45a1d-0f4a-4949-ae44-829b5fc205e5
X-Ovh-Tracer-Id: 1118581558826535901
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopeeuofevqdfuhgesrghsphgvvgguthgvtghhrdgtohhmpdfovfetjfhoshhtpehmohehhedv
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
Cc: BMC-SW@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/10/22 10:00, Joel Stanley wrote:
> Now that NCSI can be enabled without breaking non-NCSI systems, enable
> it in all defconfigs.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

You should add :

CONFIG_CMD_NCSI=y

C.

> ---
>   configs/ast2600-pfr_defconfig            | 1 +
>   configs/ast2600_openbmc_defconfig        | 1 +
>   configs/evb-ast2400_defconfig            | 1 +
>   configs/evb-ast2500-spl_defconfig        | 1 +
>   configs/evb-ast2500_defconfig            | 1 +
>   configs/evb-ast2600-cot_defconfig        | 1 +
>   configs/evb-ast2600_defconfig            | 1 +
>   configs/evb-ast2600a0-cot_defconfig      | 1 +
>   configs/evb-ast2600a0-spl_defconfig      | 1 +
>   configs/evb-ast2600a0_defconfig          | 1 +
>   configs/evb-ast2600a1-cot_defconfig      | 1 +
>   configs/evb-ast2600a1-ecc_defconfig      | 1 +
>   configs/evb-ast2600a1-emmc-cot_defconfig | 1 +
>   configs/evb-ast2600a1-emmc_defconfig     | 1 +
>   configs/evb-ast2600a1-spl-ecc_defconfig  | 1 +
>   configs/evb-ast2600a1-spl_defconfig      | 1 +
>   configs/evb-ast2600a1_defconfig          | 1 +
>   17 files changed, 17 insertions(+)
> 
> diff --git a/configs/ast2600-pfr_defconfig b/configs/ast2600-pfr_defconfig
> index 398e55d0f3d4..dbe87e35a635 100644
> --- a/configs/ast2600-pfr_defconfig
> +++ b/configs/ast2600-pfr_defconfig
> @@ -120,6 +120,7 @@ CONFIG_SPI_FLASH_STMICRO=y
>   CONFIG_SPI_FLASH_WINBOND=y
>   CONFIG_PHY_BROADCOM=y
>   CONFIG_PHY_REALTEK=y
> +CONFIG_PHY_NCSI=y
>   CONFIG_DM_ETH=y
>   CONFIG_PHY_GIGE=y
>   CONFIG_FTGMAC100=y
> diff --git a/configs/ast2600_openbmc_defconfig b/configs/ast2600_openbmc_defconfig
> index de8fca770674..4565c2953460 100644
> --- a/configs/ast2600_openbmc_defconfig
> +++ b/configs/ast2600_openbmc_defconfig
> @@ -116,6 +116,7 @@ CONFIG_SPI_FLASH_STMICRO=y
>   CONFIG_SPI_FLASH_WINBOND=y
>   CONFIG_PHY_BROADCOM=y
>   CONFIG_PHY_REALTEK=y
> +CONFIG_PHY_NCSI=y
>   CONFIG_DM_ETH=y
>   CONFIG_PHY_GIGE=y
>   CONFIG_FTGMAC100=y
> diff --git a/configs/evb-ast2400_defconfig b/configs/evb-ast2400_defconfig
> index f92dbfd668cd..46f9a9467929 100644
> --- a/configs/evb-ast2400_defconfig
> +++ b/configs/evb-ast2400_defconfig
> @@ -56,6 +56,7 @@ CONFIG_SPI_FLASH_SPANSION=y
>   CONFIG_SPI_FLASH_STMICRO=y
>   CONFIG_SPI_FLASH_WINBOND=y
>   CONFIG_PHY_REALTEK=y
> +CONFIG_PHY_NCSI=y
>   CONFIG_DM_ETH=y
>   CONFIG_PHY_GIGE=y
>   CONFIG_FTGMAC100=y
> diff --git a/configs/evb-ast2500-spl_defconfig b/configs/evb-ast2500-spl_defconfig
> index 0f6780b5e4e8..3467ae6cda2d 100644
> --- a/configs/evb-ast2500-spl_defconfig
> +++ b/configs/evb-ast2500-spl_defconfig
> @@ -70,6 +70,7 @@ CONFIG_SPI_FLASH_MACRONIX=y
>   CONFIG_SPI_FLASH_SPANSION=y
>   CONFIG_SPI_FLASH_WINBOND=y
>   CONFIG_PHY_REALTEK=y
> +CONFIG_PHY_NCSI=y
>   CONFIG_DM_ETH=y
>   CONFIG_PHY_GIGE=y
>   CONFIG_FTGMAC100=y
> diff --git a/configs/evb-ast2500_defconfig b/configs/evb-ast2500_defconfig
> index 91921cf76e62..d692a0811109 100644
> --- a/configs/evb-ast2500_defconfig
> +++ b/configs/evb-ast2500_defconfig
> @@ -57,6 +57,7 @@ CONFIG_SPI_FLASH_SPANSION=y
>   CONFIG_SPI_FLASH_STMICRO=y
>   CONFIG_SPI_FLASH_WINBOND=y
>   CONFIG_PHY_REALTEK=y
> +CONFIG_PHY_NCSI=y
>   CONFIG_DM_ETH=y
>   CONFIG_PHY_GIGE=y
>   CONFIG_FTGMAC100=y
> diff --git a/configs/evb-ast2600-cot_defconfig b/configs/evb-ast2600-cot_defconfig
> index b656e528c855..06fc84b139a4 100644
> --- a/configs/evb-ast2600-cot_defconfig
> +++ b/configs/evb-ast2600-cot_defconfig
> @@ -105,6 +105,7 @@ CONFIG_SPI_FLASH_STMICRO=y
>   CONFIG_SPI_FLASH_WINBOND=y
>   CONFIG_PHY_BROADCOM=y
>   CONFIG_PHY_REALTEK=y
> +CONFIG_PHY_NCSI=y
>   CONFIG_DM_ETH=y
>   CONFIG_PHY_GIGE=y
>   CONFIG_FTGMAC100=y
> diff --git a/configs/evb-ast2600_defconfig b/configs/evb-ast2600_defconfig
> index 3e302e51ef2f..d0d867adb0e8 100644
> --- a/configs/evb-ast2600_defconfig
> +++ b/configs/evb-ast2600_defconfig
> @@ -75,6 +75,7 @@ CONFIG_SPI_FLASH_STMICRO=y
>   CONFIG_SPI_FLASH_WINBOND=y
>   CONFIG_PHY_BROADCOM=y
>   CONFIG_PHY_REALTEK=y
> +CONFIG_PHY_NCSI=y
>   CONFIG_DM_ETH=y
>   CONFIG_PHY_GIGE=y
>   CONFIG_FTGMAC100=y
> diff --git a/configs/evb-ast2600a0-cot_defconfig b/configs/evb-ast2600a0-cot_defconfig
> index 1a377736ea4a..826e7b34e22a 100644
> --- a/configs/evb-ast2600a0-cot_defconfig
> +++ b/configs/evb-ast2600a0-cot_defconfig
> @@ -91,6 +91,7 @@ CONFIG_SPI_FLASH_STMICRO=y
>   CONFIG_SPI_FLASH_WINBOND=y
>   CONFIG_PHY_BROADCOM=y
>   CONFIG_PHY_REALTEK=y
> +CONFIG_PHY_NCSI=y
>   CONFIG_DM_ETH=y
>   CONFIG_PHY_GIGE=y
>   CONFIG_FTGMAC100=y
> diff --git a/configs/evb-ast2600a0-spl_defconfig b/configs/evb-ast2600a0-spl_defconfig
> index 69548bcddeda..a88a14411f7b 100644
> --- a/configs/evb-ast2600a0-spl_defconfig
> +++ b/configs/evb-ast2600a0-spl_defconfig
> @@ -92,6 +92,7 @@ CONFIG_SPI_FLASH_STMICRO=y
>   CONFIG_SPI_FLASH_WINBOND=y
>   CONFIG_PHY_BROADCOM=y
>   CONFIG_PHY_REALTEK=y
> +CONFIG_PHY_NCSI=y
>   CONFIG_DM_ETH=y
>   CONFIG_PHY_GIGE=y
>   CONFIG_FTGMAC100=y
> diff --git a/configs/evb-ast2600a0_defconfig b/configs/evb-ast2600a0_defconfig
> index 51cf6ac3ca35..358c31511297 100644
> --- a/configs/evb-ast2600a0_defconfig
> +++ b/configs/evb-ast2600a0_defconfig
> @@ -69,6 +69,7 @@ CONFIG_SPI_FLASH_STMICRO=y
>   CONFIG_SPI_FLASH_WINBOND=y
>   CONFIG_PHY_BROADCOM=y
>   CONFIG_PHY_REALTEK=y
> +CONFIG_PHY_NCSI=y
>   CONFIG_DM_ETH=y
>   CONFIG_PHY_GIGE=y
>   CONFIG_FTGMAC100=y
> diff --git a/configs/evb-ast2600a1-cot_defconfig b/configs/evb-ast2600a1-cot_defconfig
> index b656e528c855..06fc84b139a4 100644
> --- a/configs/evb-ast2600a1-cot_defconfig
> +++ b/configs/evb-ast2600a1-cot_defconfig
> @@ -105,6 +105,7 @@ CONFIG_SPI_FLASH_STMICRO=y
>   CONFIG_SPI_FLASH_WINBOND=y
>   CONFIG_PHY_BROADCOM=y
>   CONFIG_PHY_REALTEK=y
> +CONFIG_PHY_NCSI=y
>   CONFIG_DM_ETH=y
>   CONFIG_PHY_GIGE=y
>   CONFIG_FTGMAC100=y
> diff --git a/configs/evb-ast2600a1-ecc_defconfig b/configs/evb-ast2600a1-ecc_defconfig
> index c637bac65472..cda88addfa43 100644
> --- a/configs/evb-ast2600a1-ecc_defconfig
> +++ b/configs/evb-ast2600a1-ecc_defconfig
> @@ -70,6 +70,7 @@ CONFIG_SPI_FLASH_STMICRO=y
>   CONFIG_SPI_FLASH_WINBOND=y
>   CONFIG_PHY_BROADCOM=y
>   CONFIG_PHY_REALTEK=y
> +CONFIG_PHY_NCSI=y
>   CONFIG_DM_ETH=y
>   CONFIG_PHY_GIGE=y
>   CONFIG_FTGMAC100=y
> diff --git a/configs/evb-ast2600a1-emmc-cot_defconfig b/configs/evb-ast2600a1-emmc-cot_defconfig
> index 68ac56cf170c..552bb6b104a3 100644
> --- a/configs/evb-ast2600a1-emmc-cot_defconfig
> +++ b/configs/evb-ast2600a1-emmc-cot_defconfig
> @@ -101,6 +101,7 @@ CONFIG_SPI_FLASH_STMICRO=y
>   CONFIG_SPI_FLASH_WINBOND=y
>   CONFIG_PHY_BROADCOM=y
>   CONFIG_PHY_REALTEK=y
> +CONFIG_PHY_NCSI=y
>   CONFIG_DM_ETH=y
>   CONFIG_PHY_GIGE=y
>   CONFIG_FTGMAC100=y
> diff --git a/configs/evb-ast2600a1-emmc_defconfig b/configs/evb-ast2600a1-emmc_defconfig
> index ce3bd5e07dba..b7e4e9df9646 100644
> --- a/configs/evb-ast2600a1-emmc_defconfig
> +++ b/configs/evb-ast2600a1-emmc_defconfig
> @@ -102,6 +102,7 @@ CONFIG_SPI_FLASH_STMICRO=y
>   CONFIG_SPI_FLASH_WINBOND=y
>   CONFIG_PHY_BROADCOM=y
>   CONFIG_PHY_REALTEK=y
> +CONFIG_PHY_NCSI=y
>   CONFIG_DM_ETH=y
>   CONFIG_PHY_GIGE=y
>   CONFIG_FTGMAC100=y
> diff --git a/configs/evb-ast2600a1-spl-ecc_defconfig b/configs/evb-ast2600a1-spl-ecc_defconfig
> index 245dee329eb7..530199913d28 100644
> --- a/configs/evb-ast2600a1-spl-ecc_defconfig
> +++ b/configs/evb-ast2600a1-spl-ecc_defconfig
> @@ -119,6 +119,7 @@ CONFIG_SPI_FLASH_STMICRO=y
>   CONFIG_SPI_FLASH_WINBOND=y
>   CONFIG_PHY_BROADCOM=y
>   CONFIG_PHY_REALTEK=y
> +CONFIG_PHY_NCSI=y
>   CONFIG_DM_ETH=y
>   CONFIG_PHY_GIGE=y
>   CONFIG_FTGMAC100=y
> diff --git a/configs/evb-ast2600a1-spl_defconfig b/configs/evb-ast2600a1-spl_defconfig
> index be6a1d8a2328..4be5b6c95b41 100644
> --- a/configs/evb-ast2600a1-spl_defconfig
> +++ b/configs/evb-ast2600a1-spl_defconfig
> @@ -119,6 +119,7 @@ CONFIG_SPI_FLASH_STMICRO=y
>   CONFIG_SPI_FLASH_WINBOND=y
>   CONFIG_PHY_BROADCOM=y
>   CONFIG_PHY_REALTEK=y
> +CONFIG_PHY_NCSI=y
>   CONFIG_DM_ETH=y
>   CONFIG_PHY_GIGE=y
>   CONFIG_FTGMAC100=y
> diff --git a/configs/evb-ast2600a1_defconfig b/configs/evb-ast2600a1_defconfig
> index 68ff5547b789..c0db1d56db26 100644
> --- a/configs/evb-ast2600a1_defconfig
> +++ b/configs/evb-ast2600a1_defconfig
> @@ -73,6 +73,7 @@ CONFIG_SPI_FLASH_STMICRO=y
>   CONFIG_SPI_FLASH_WINBOND=y
>   CONFIG_PHY_BROADCOM=y
>   CONFIG_PHY_REALTEK=y
> +CONFIG_PHY_NCSI=y
>   CONFIG_DM_ETH=y
>   CONFIG_PHY_GIGE=y
>   CONFIG_FTGMAC100=y

