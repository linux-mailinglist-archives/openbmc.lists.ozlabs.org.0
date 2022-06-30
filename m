Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B41FB56214A
	for <lists+openbmc@lfdr.de>; Thu, 30 Jun 2022 19:31:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYlkM4VdCz3cgc
	for <lists+openbmc@lfdr.de>; Fri,  1 Jul 2022 03:31:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=188.165.42.229; helo=4.mo548.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 4.mo548.mail-out.ovh.net (4.mo548.mail-out.ovh.net [188.165.42.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYlk43Nryz2yMK
	for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2022 03:31:22 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.55])
	by mo548.mail-out.ovh.net (Postfix) with ESMTPS id DADFF1FF8F;
	Thu, 30 Jun 2022 17:23:44 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 30 Jun
 2022 19:23:44 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-110S0044880d423-adc9-45d1-9510-23aa7138f6d2,
                    40551C6C823FDDA91B74F5D58A080B55BE22893A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9cfe0fe8-d37c-8511-87f8-aebe8e1a6e23@kaod.org>
Date: Thu, 30 Jun 2022 19:23:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH linux 4/5] spi: aspeed: Handle custom decoding ranges
Content-Language: en-US
To: Naresh Solanki <naresh.solanki@9elements.com>
References: <20220628162044.1121337-1-clg@kaod.org>
 <20220628162044.1121337-5-clg@kaod.org>
 <CABqG17gD4VwQiSz_LcnikN+GuQ9UqEZB2hm8pCoJFdbGyoj8BA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CABqG17gD4VwQiSz_LcnikN+GuQ9UqEZB2hm8pCoJFdbGyoj8BA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8015275b-5b32-4eb7-8332-61d69a832bb1
X-Ovh-Tracer-Id: 15861677889633291171
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudehuddguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheptghhihhnqdhtihhnghgpkhhuohesrghsphgvvgguthgvtghhrdgtohhmpdfovfetjfhoshhtpehmohehgeek
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/29/22 07:46, Naresh Solanki wrote:
> Verified for its working.

Thanks for the test ! When we upstream, a Tested-by tag would
be nice to have.

C.

> Thanks
> 
> 
> On Tue, 28 Jun 2022 at 21:51, Cédric Le Goater <clg@kaod.org <mailto:clg@kaod.org>> wrote:
> 
>     "ranges" predefines settings of the decoding ranges for each CS. If
>     found in the DT, the driver applies the settings at probe time. The
>     default behavior is to set the decoding range of each CS using the
>     flash device size when the spi slave is setup.
> 
>     Cc: Naresh Solanki <naresh.solanki@9elements.com <mailto:naresh.solanki@9elements.com>>
>     Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com <mailto:chin-ting_kuo@aspeedtech.com>>
>     Signed-off-by: Cédric Le Goater <clg@kaod.org <mailto:clg@kaod.org>>
>     ---
>       drivers/spi/spi-aspeed-smc.c | 63 +++++++++++++++++++++++++++++++++++-
>       1 file changed, 62 insertions(+), 1 deletion(-)
> 
>     diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
>     index 1611c354c31f..791cbf753a85 100644
>     --- a/drivers/spi/spi-aspeed-smc.c
>     +++ b/drivers/spi/spi-aspeed-smc.c
>     @@ -101,6 +101,7 @@ struct aspeed_spi {
>              u32                      clk_freq;
> 
>              struct aspeed_spi_chip   chips[ASPEED_SPI_MAX_NUM_CS];
>     +       bool                     fixed_windows;
>       };
> 
>       static u32 aspeed_spi_get_io_mode(const struct spi_mem_op *op)
>     @@ -574,7 +575,8 @@ static int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
>              if (op->data.dir != SPI_MEM_DATA_IN)
>                      return -EOPNOTSUPP;
> 
>     -       aspeed_spi_chip_adjust_window(chip, desc->info.offset, desc->info.length);
>     +       if (!aspi->fixed_windows)
>     +               aspeed_spi_chip_adjust_window(chip, desc->info.offset, desc->info.length);
> 
>              if (desc->info.length > chip->ahb_window_size)
>                      dev_warn(aspi->dev, "CE%d window (%dMB) too small for mapping",
>     @@ -749,6 +751,61 @@ static const struct attribute_group aspeed_spi_attribute_group = {
>              .attrs = aspeed_spi_attributes
>       };
> 
>     +static int aspeed_spi_chip_read_ranges(struct device_node *node, struct aspeed_spi *aspi)
>     +{
>     +       const char *range_prop = "ranges";
>     +       struct property *prop;
>     +       struct aspeed_spi_window ranges[ASPEED_SPI_MAX_NUM_CS];
>     +       int prop_size;
>     +       int count;
>     +       int ret;
>     +       int i;
>     +
>     +       prop = of_find_property(node, range_prop, &prop_size);
>     +       if (!prop)
>     +               return 0;
>     +
>     +       count = prop_size / sizeof(*ranges);
>     +       if (count > aspi->data->max_cs) {
>     +               dev_err(aspi->dev, "invalid '%s' property %d\n", range_prop, count);
>     +               return -EINVAL;
>     +       }
>     +
>     +       if (count < aspi->data->max_cs)
>     +               dev_dbg(aspi->dev, "'%s' property does not cover all CE\n",
>     +                       range_prop);
>     +
>     +       ret = of_property_read_u32_array(node, range_prop, (u32 *)ranges, count * 4);
>     +       if (ret)
>     +               return ret;
>     +
>     +       dev_info(aspi->dev, "Using preset decoding ranges\n");
>     +       for (i = 0; i < count; i++) {
>     +               struct aspeed_spi_window *win = &ranges[i];
>     +
>     +               if (win->cs > aspi->data->max_cs) {
>     +                       dev_err(aspi->dev, "CE%d range is invalid", win->cs);
>     +                       return -EINVAL;
>     +               }
>     +
>     +               /* Trim top bit of the address to keep offset */
>     +               win->offset &= aspi->ahb_window_size - 1;
>     +
>     +               /* Minimal check */
>     +               if (win->offset + win->size > aspi->ahb_window_size) {
>     +                       dev_warn(aspi->dev, "CE%d range is too large", win->cs);
>     +                               return -EINVAL;
>     +               }
>     +
>     +               ret = aspeed_spi_set_window(aspi, win);
>     +               if (ret)
>     +                       return ret;
>     +       }
>     +
>     +       aspi->fixed_windows = true;
>     +       return 0;
>     +}
>     +
>       static int aspeed_spi_probe(struct platform_device *pdev)
>       {
>              struct device *dev = &pdev->dev;
>     @@ -806,6 +863,10 @@ static int aspeed_spi_probe(struct platform_device *pdev)
>                      return ret;
>              }
> 
>     +       ret = aspeed_spi_chip_read_ranges(dev->of_node, aspi);
>     +       if (ret)
>     +               return ret;
>     +
>              /* IRQ is for DMA, which the driver doesn't support yet */
> 
>              ctlr->mode_bits = SPI_RX_DUAL | SPI_TX_DUAL | data->mode_bits;
>     -- 
>     2.35.3
> 

