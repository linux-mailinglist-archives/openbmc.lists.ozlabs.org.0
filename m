Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F17356213E
	for <lists+openbmc@lfdr.de>; Thu, 30 Jun 2022 19:28:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYlfN44xQz3dqw
	for <lists+openbmc@lfdr.de>; Fri,  1 Jul 2022 03:28:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=188.165.49.222; helo=6.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 6.mo552.mail-out.ovh.net (6.mo552.mail-out.ovh.net [188.165.49.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYlf62gCNz2yMK
	for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2022 03:27:56 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.7])
	by mo552.mail-out.ovh.net (Postfix) with ESMTPS id BF9872531C;
	Thu, 30 Jun 2022 17:22:32 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 30 Jun
 2022 19:22:31 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-99G0033df9bab7-c179-431f-ab5f-dcdc65b7657e,
                    40551C6C823FDDA91B74F5D58A080B55BE22893A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <72b99451-c420-140a-c579-3964130aea42@kaod.org>
Date: Thu, 30 Jun 2022 19:22:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH linux 2/5] spi: aspeed: Introduce a "windows" device
 attribute
Content-Language: en-US
To: <openbmc@lists.ozlabs.org>
References: <20220628162044.1121337-1-clg@kaod.org>
 <20220628162044.1121337-3-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220628162044.1121337-3-clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5c1b3360-6d69-48e2-b5ba-418f749a4980
X-Ovh-Tracer-Id: 15841411692932729824
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudehuddguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegthhhinhdqthhinhhgpghkuhhosegrshhpvggvughtvggthhdrtghomhdpoffvtefjohhsthepmhhoheehvd
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/28/22 18:20, Cédric Le Goater wrote:
> This dumps the mapping windows, or decoding ranges, of all devices
> possibly attached of the controller.

We might want to change the name of the sysfs attribute to "ranges" or
"decoding-ranges" to be in sync with the new DT property.

C.

> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   drivers/spi/spi-aspeed-smc.c | 43 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
> 
> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
> index 5a995b5653f1..1611c354c31f 100644
> --- a/drivers/spi/spi-aspeed-smc.c
> +++ b/drivers/spi/spi-aspeed-smc.c
> @@ -382,6 +382,7 @@ static const char *aspeed_spi_get_name(struct spi_mem *mem)
>   
>   struct aspeed_spi_window {
>   	u32 cs;
> +	u32 reg;
>   	u32 offset;
>   	u32 size;
>   };
> @@ -396,6 +397,7 @@ static void aspeed_spi_get_windows(struct aspeed_spi *aspi,
>   	for (cs = 0; cs < aspi->data->max_cs; cs++) {
>   		reg_val = readl(aspi->regs + CE0_SEGMENT_ADDR_REG + cs * 4);
>   		windows[cs].cs = cs;
> +		windows[cs].reg = reg_val;
>   		windows[cs].size = data->segment_end(aspi, reg_val) -
>   			data->segment_start(aspi, reg_val);
>   		windows[cs].offset = data->segment_start(aspi, reg_val) - aspi->ahb_base_phy;
> @@ -712,6 +714,41 @@ static void aspeed_spi_enable(struct aspeed_spi *aspi, bool enable)
>   		aspeed_spi_chip_enable(aspi, cs, enable);
>   }
>   
> +static int windows_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct aspeed_spi *aspi = dev_get_drvdata(dev);
> +	struct aspeed_spi_window windows[ASPEED_SPI_MAX_NUM_CS] = { 0 };
> +	u32 cs;
> +	int len = 0;
> +
> +	if (aspi->data == &ast2400_spi_data)
> +		return 0;
> +
> +	aspeed_spi_get_windows(aspi, windows);
> +
> +	len += sysfs_emit_at(buf, len, "     offset     size       register\n");
> +	for (cs = 0; cs < aspi->data->max_cs; cs++) {
> +		if (!windows[cs].reg)
> +			len += sysfs_emit_at(buf, len, "CE%d: disabled\n", cs);
> +		else
> +			len += sysfs_emit_at(buf, len, "CE%d: 0x%.8x 0x%.8x 0x%x\n", cs,
> +					     windows[cs].offset, windows[cs].size,
> +					     windows[cs].reg);
> +	}
> +	return len;
> +}
> +
> +static DEVICE_ATTR_RO(windows);
> +
> +static struct attribute *aspeed_spi_attributes[] = {
> +	&dev_attr_windows.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group aspeed_spi_attribute_group = {
> +	.attrs = aspeed_spi_attributes
> +};
> +
>   static int aspeed_spi_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -784,6 +821,12 @@ static int aspeed_spi_probe(struct platform_device *pdev)
>   		dev_err(&pdev->dev, "spi_register_controller failed\n");
>   		goto disable_clk;
>   	}
> +
> +	ret = devm_device_add_group(&pdev->dev, &aspeed_spi_attribute_group);
> +	if (ret) {
> +		dev_err(&pdev->dev, "cannot create attribute group\n");
> +		goto disable_clk;
> +	}
>   	return 0;
>   
>   disable_clk:

