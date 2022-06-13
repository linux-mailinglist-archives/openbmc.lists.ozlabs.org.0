Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6810054D891
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:44:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNmj51cqjz3f8T
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:44:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=r32laorB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ti.com (client-ip=198.47.19.142; helo=fllv0016.ext.ti.com; envelope-from=p.yadav@ti.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=r32laorB;
	dkim-atps=neutral
X-Greylist: delayed 987 seconds by postgrey-1.36 at boromir; Mon, 13 Jun 2022 18:57:19 AEST
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LM56l2Fgbz3bm2
	for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2022 18:57:17 +1000 (AEST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25D8dsm8023311;
	Mon, 13 Jun 2022 03:39:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655109594;
	bh=yB0N/eBApvLnHywfzpr1P7uAOtpx4mXByhrRq/pwrSI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=r32laorBRMVlvdy0ax40q4DP6j/2CQmAmWwKpkUT8bKhCTa07hrnV3DzxEc9tC479
	 qjtZETPbST8hNv+TKlmuR/liNNVDgztetrL0w5/gRqmS6R0gvGiOsqMgGsZALo9A7r
	 F/nfgiTA0n6/4bXreBfqsdsNev9MQ73rH6YS7mP4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25D8dstI034912
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Jun 2022 03:39:54 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 13
 Jun 2022 03:39:53 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 13 Jun 2022 03:39:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25D8drpX037114;
	Mon, 13 Jun 2022 03:39:53 -0500
Date: Mon, 13 Jun 2022 14:09:52 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] spi: aspeed: Fix division by zero
Message-ID: <20220613083952.4z45ulaxdy2okbho@ti.com>
References: <20220611103929.1484062-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220611103929.1484062-1-clg@kaod.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Thu, 16 Jun 2022 12:05:36 +1000
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>, Joel Stanley <joel@jms.id.au>, Ian Woloschin <ian.woloschin@akamai.com>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/06/22 12:39PM, Cédric Le Goater wrote:
> When using the normal read operation for data transfers, the dummy bus
> width is zero. In that case, they are no dummy bytes to transfer and
> setting the dummy field in the controller register becomes useless.
> 
> Issue was found on a custom "Bifrost" board with a AST2500 SoC and
> using a MX25L51245GMI-08G SPI Flash.
> 
> Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> Reported-by: Ian Woloschin <ian.woloschin@akamai.com>
> Fixes: 54613fc6659b ("spi: aspeed: Add support for direct mapping")
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  drivers/spi/spi-aspeed-smc.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
> index 496f3e1e9079..3e891bf22470 100644
> --- a/drivers/spi/spi-aspeed-smc.c
> +++ b/drivers/spi/spi-aspeed-smc.c
> @@ -558,6 +558,14 @@ static int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
>  	u32 ctl_val;
>  	int ret = 0;
>  
> +	dev_dbg(aspi->dev,
> +		"CE%d %s dirmap [ 0x%.8llx - 0x%.8llx ] OP %#x mode:%d.%d.%d.%d naddr:%#x ndummies:%#x\n",
> +		chip->cs, op->data.dir == SPI_MEM_DATA_IN ? "read" : "write",
> +		desc->info.offset, desc->info.offset + desc->info.length,
> +		op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
> +		op->dummy.buswidth, op->data.buswidth,
> +		op->addr.nbytes, op->dummy.nbytes);
> +

Unrelated change. Please send as a separate patch.

>  	chip->clk_freq = desc->mem->spi->max_speed_hz;
>  
>  	/* Only for reads */
> @@ -574,9 +582,11 @@ static int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
>  	ctl_val = readl(chip->ctl) & ~CTRL_IO_CMD_MASK;
>  	ctl_val |= aspeed_spi_get_io_mode(op) |
>  		op->cmd.opcode << CTRL_COMMAND_SHIFT |
> -		CTRL_IO_DUMMY_SET(op->dummy.nbytes / op->dummy.buswidth) |
>  		CTRL_IO_MODE_READ;
>  
> +	if (op->dummy.nbytes)
> +		ctl_val |= CTRL_IO_DUMMY_SET(op->dummy.nbytes / op->dummy.buswidth);
> +

LGTM. With the above fixed,

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

>  	/* Tune 4BYTE address mode */
>  	if (op->addr.nbytes) {
>  		u32 addr_mode = readl(aspi->regs + CE_CTRL_REG);
> -- 
> 2.35.3
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
