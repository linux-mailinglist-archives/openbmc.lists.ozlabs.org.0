Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B81815B5A6E
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 14:48:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR5xZ3TDNz30Ly
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 22:48:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector1 header.b=aJF1TRgO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=foss.st.com (client-ip=91.207.212.93; helo=mx07-00178001.pphosted.com; envelope-from=prvs=5254dd12ce=patrice.chotard@foss.st.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector1 header.b=aJF1TRgO;
	dkim-atps=neutral
X-Greylist: delayed 1239 seconds by postgrey-1.36 at boromir; Mon, 12 Sep 2022 20:06:38 AEST
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR2Lk0gQFz2xHF;
	Mon, 12 Sep 2022 20:06:31 +1000 (AEST)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C9fhC1005121;
	Mon, 12 Sep 2022 11:44:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ipDfK4/1bC8yzgVQRzhCgemKUMMKU5d1+WxN6EEUhFU=;
 b=aJF1TRgO57039bnX3SC3IEIAK0yhzeRv+6NmSzipNZxMp0OiR9pU/9IwkVa75bhNt3O4
 mHLnMrsg84ZZjUDGwaKf8he0QOsLRI3ol0GCUcJKuDo5GmZnjLS9Krv8wpfg81hRzGdM
 H5tmzzRRlxjPUDNGI+a7XqnFa/1M7hW03JB8MCTWfiZ7Sn4bAd6kzfQxN4AGPrtaG2xr
 KpgB9DTFTY4U96BRrD+YiYi5EIbsTOeBo9+bi4pp6X7lb76IsXYCW7wgl10kxIzNUcnI
 yPVuHQElOH0c8eGk0IPbrZNqQ0di4oyB70vsc3CD253EHea6RIBPPOD/kKvkoICNlC8f dA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jgjvjsjts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 11:44:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C811910002A;
	Mon, 12 Sep 2022 11:44:45 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7E77321D381;
	Mon, 12 Sep 2022 11:44:45 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.121) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 12 Sep
 2022 11:44:42 +0200
Message-ID: <2c44a497-b489-7519-e922-4ec79eb7617d@foss.st.com>
Date: Mon, 12 Sep 2022 11:44:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
Content-Language: en-US
To: Sergiu Moga <sergiu.moga@microchip.com>, <tudor.ambarus@microchip.com>,
        <pratyush@kernel.org>, <michael@walle.cc>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <broonie@kernel.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <claudiu.beznea@microchip.com>, <chin-ting_kuo@aspeedtech.com>,
        <clg@kaod.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
        <kdasu.kdev@gmail.com>, <fancer.lancer@gmail.com>, <han.xu@nxp.com>,
        <john.garry@huawei.com>, <matthias.bgg@gmail.com>,
        <avifishman70@gmail.com>, <tmaimon77@gmail.com>,
        <tali.perry1@gmail.com>, <venture@google.com>, <yuenn@google.com>,
        <benjaminfair@google.com>, <haibo.chen@nxp.com>,
        <yogeshgaur.83@gmail.com>, <heiko@sntech.de>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <michal.simek@xilinx.com>
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220911174551.653599-1-sergiu.moga@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.121]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_06,2022-09-12_01,2022-06-22_01
X-Mailman-Approved-At: Mon, 12 Sep 2022 22:41:37 +1000
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Sergiu

On 9/11/22 19:45, Sergiu Moga wrote:
> In order to properly represent the hardware functionality
> in the core, avoid reconverting the number of dummy cycles
> to the number of bytes and only work with the former.
> Instead, let the drivers that do need this conversion do
> it themselves.
> 
> Signed-off-by: Sergiu Moga <sergiu.moga@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c        | 22 ++++----------
>  drivers/mtd/spi-nor/micron-st.c   |  2 +-
>  drivers/spi/atmel-quadspi.c       |  6 ++--
>  drivers/spi/spi-aspeed-smc.c      | 32 ++++++++++++++-------
>  drivers/spi/spi-ath79.c           |  2 +-
>  drivers/spi/spi-bcm-qspi.c        | 12 +++++---
>  drivers/spi/spi-cadence-quadspi.c |  8 ++----
>  drivers/spi/spi-cadence-xspi.c    |  5 +++-
>  drivers/spi/spi-dw-core.c         | 10 +++++--
>  drivers/spi/spi-fsl-qspi.c        | 17 ++++++-----
>  drivers/spi/spi-hisi-sfc-v3xx.c   |  6 +++-
>  drivers/spi/spi-mem.c             | 27 +++++++++++------
>  drivers/spi/spi-mt65xx.c          | 33 ++++++++++++++-------
>  drivers/spi/spi-mtk-nor.c         | 48 +++++++++++++++++--------------
>  drivers/spi/spi-mtk-snfi.c        | 24 ++++++++++------
>  drivers/spi/spi-mxic.c            | 18 ++++++++----
>  drivers/spi/spi-npcm-fiu.c        | 17 ++++++++---
>  drivers/spi/spi-nxp-fspi.c        | 10 +++----
>  drivers/spi/spi-rockchip-sfc.c    | 27 +++++++++++------
>  drivers/spi/spi-rpc-if.c          |  5 ++--
>  drivers/spi/spi-stm32-qspi.c      |  5 ++--
>  drivers/spi/spi-ti-qspi.c         | 12 ++++++--
>  drivers/spi/spi-zynq-qspi.c       | 15 ++++++----
>  drivers/spi/spi-zynqmp-gqspi.c    |  8 ++++--
>  include/linux/spi/spi-mem.h       | 10 +++----
>  25 files changed, 234 insertions(+), 147 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index f2c64006f8d7..cc8ca824f912 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -88,7 +88,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
>  	if (op->addr.nbytes)
>  		op->addr.buswidth = spi_nor_get_protocol_addr_nbits(proto);
>  
> -	if (op->dummy.nbytes)
> +	if (op->dummy.ncycles)
>  		op->dummy.buswidth = spi_nor_get_protocol_addr_nbits(proto);
>  
>  	if (op->data.nbytes)
> @@ -106,9 +106,6 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
>  		op->dummy.dtr = true;
>  		op->data.dtr = true;
>  
> -		/* 2 bytes per clock cycle in DTR mode. */
> -		op->dummy.nbytes *= 2;
> -

What is the benefit to remove dtr dummy.nbytes computation ? it leads to spray it in all drivers which support DTR.
It was simpler to let the framework to deal with it, have i missed something ?

Patrice

>  		ext = spi_nor_get_cmd_ext(nor, op);
>  		op->cmd.opcode = (op->cmd.opcode << 8) | ext;
>  		op->cmd.nbytes = 2;
> @@ -207,10 +204,7 @@ static ssize_t spi_nor_spimem_read_data(struct spi_nor *nor, loff_t from,
>  
>  	spi_nor_spimem_setup_op(nor, &op, nor->read_proto);
>  
> -	/* convert the dummy cycles to the number of bytes */
> -	op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
> -	if (spi_nor_protocol_is_dtr(nor->read_proto))
> -		op.dummy.nbytes *= 2;
> +	op.dummy.ncycles = nor->read_dummy;
>  
>  	usebouncebuf = spi_nor_spimem_bounce(nor, &op);
>  
> @@ -455,7 +449,7 @@ int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
>  
>  		if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
>  			op.addr.nbytes = nor->params->rdsr_addr_nbytes;
> -			op.dummy.nbytes = nor->params->rdsr_dummy;
> +			op.dummy.ncycles = nor->params->rdsr_dummy;
>  			/*
>  			 * We don't want to read only one byte in DTR mode. So,
>  			 * read 2 and then discard the second byte.
> @@ -1913,10 +1907,7 @@ static int spi_nor_spimem_check_readop(struct spi_nor *nor,
>  
>  	spi_nor_spimem_setup_op(nor, &op, read->proto);
>  
> -	/* convert the dummy cycles to the number of bytes */
> -	op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
> -	if (spi_nor_protocol_is_dtr(nor->read_proto))
> -		op.dummy.nbytes *= 2;

the same here

> +	op.dummy.ncycles = nor->read_dummy;
>  
>  	return spi_nor_spimem_check_op(nor, &op);
>  }
> @@ -3034,10 +3025,7 @@ static int spi_nor_create_read_dirmap(struct spi_nor *nor)
>  
>  	spi_nor_spimem_setup_op(nor, op, nor->read_proto);
>  
> -	/* convert the dummy cycles to the number of bytes */
> -	op->dummy.nbytes = (nor->read_dummy * op->dummy.buswidth) / 8;
> -	if (spi_nor_protocol_is_dtr(nor->read_proto))
> -		op->dummy.nbytes *= 2;

ditto

> +	op->dummy.ncycles = nor->read_dummy;
>  
>  	/*
>  	 * Since spi_nor_spimem_setup_op() only sets buswidth when the number
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index 3c9681a3f7a3..840a9fc0a888 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -337,7 +337,7 @@ static int micron_st_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
>  
>  		if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
>  			op.addr.nbytes = nor->params->rdsr_addr_nbytes;
> -			op.dummy.nbytes = nor->params->rdsr_dummy;
> +			op.dummy.ncycles = nor->params->rdsr_dummy;
>  			/*
>  			 * We don't want to read only one byte in DTR mode. So,
>  			 * read 2 and then discard the second byte.
> diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
> index 976a217e356d..9a86525e7a4a 100644
> --- a/drivers/spi/atmel-quadspi.c
> +++ b/drivers/spi/atmel-quadspi.c
> @@ -286,7 +286,7 @@ static bool atmel_qspi_supports_op(struct spi_mem *mem,
>  
>  	/* special case not supported by hardware */
>  	if (op->addr.nbytes == 2 && op->cmd.buswidth != op->addr.buswidth &&
> -	    op->dummy.nbytes == 0)
> +	    op->dummy.ncycles == 0)
>  		return false;
>  
>  	return true;
> @@ -308,8 +308,8 @@ static int atmel_qspi_set_cfg(struct atmel_qspi *aq,
>  		return mode;
>  	ifr |= atmel_qspi_modes[mode].config;
>  
> -	if (op->dummy.nbytes)
> -		dummy_cycles = op->dummy.nbytes * 8 / op->dummy.buswidth;
> +	if (op->dummy.ncycles)
> +		dummy_cycles = op->dummy.ncycles;
>  
>  	/*
>  	 * The controller allows 24 and 32-bit addressing while NAND-flash
> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
> index 3e891bf22470..2d50d50a9303 100644
> --- a/drivers/spi/spi-aspeed-smc.c
> +++ b/drivers/spi/spi-aspeed-smc.c
> @@ -231,7 +231,7 @@ static ssize_t aspeed_spi_read_user(struct aspeed_spi_chip *chip,
>  				    u64 offset, size_t len, void *buf)
>  {
>  	int io_mode = aspeed_spi_get_io_mode(op);
> -	u8 dummy = 0xFF;
> +	u8 dummy = 0xFF, dummy_nbytes;
>  	int i;
>  	int ret;
>  
> @@ -241,8 +241,12 @@ static ssize_t aspeed_spi_read_user(struct aspeed_spi_chip *chip,
>  	if (ret < 0)
>  		return ret;
>  
> -	if (op->dummy.buswidth && op->dummy.nbytes) {
> -		for (i = 0; i < op->dummy.nbytes / op->dummy.buswidth; i++)
> +	if (op->dummy.buswidth && op->dummy.ncycles) {
> +		dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> +		if (op->dummy.dtr)
> +			dummy_nbytes *= 2;
> +
> +		for (i = 0; i < dummy_nbytes / op->dummy.buswidth; i++)
>  			aspeed_spi_write_to_ahb(chip->ahb_base, &dummy,	sizeof(dummy));
>  	}
>  
> @@ -270,6 +274,8 @@ static ssize_t aspeed_spi_write_user(struct aspeed_spi_chip *chip,
>  /* support for 1-1-1, 1-1-2 or 1-1-4 */
>  static bool aspeed_spi_supports_op(struct spi_mem *mem, const struct spi_mem_op *op)
>  {
> +	u8 dummy_nbytes;
> +
>  	if (op->cmd.buswidth > 1)
>  		return false;
>  
> @@ -280,8 +286,12 @@ static bool aspeed_spi_supports_op(struct spi_mem *mem, const struct spi_mem_op
>  			return false;
>  	}
>  
> -	if (op->dummy.nbytes != 0) {
> -		if (op->dummy.buswidth > 1 || op->dummy.nbytes > 7)
> +	if (op->dummy.ncycles != 0) {
> +		dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> +		if (op->dummy.dtr)
> +			dummy_nbytes *= 2;
> +
> +		if (op->dummy.buswidth > 1 || dummy_nbytes > 7)
>  			return false;
>  	}
>  
> @@ -306,7 +316,7 @@ static int do_aspeed_spi_exec_op(struct spi_mem *mem, const struct spi_mem_op *o
>  		chip->cs, op->data.dir == SPI_MEM_DATA_IN ? "read" : "write",
>  		op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
>  		op->dummy.buswidth, op->data.buswidth,
> -		op->addr.nbytes, op->dummy.nbytes, op->data.nbytes);
> +		op->addr.nbytes, op->dummy.ncycles, op->data.nbytes);
>  
>  	addr_mode = readl(aspi->regs + CE_CTRL_REG);
>  	addr_mode_backup = addr_mode;
> @@ -327,8 +337,8 @@ static int do_aspeed_spi_exec_op(struct spi_mem *mem, const struct spi_mem_op *o
>  			ctl_val |= CTRL_IO_ADDRESS_4B;
>  	}
>  
> -	if (op->dummy.nbytes)
> -		ctl_val |= CTRL_IO_DUMMY_SET(op->dummy.nbytes / op->dummy.buswidth);
> +	if (op->dummy.ncycles)
> +		ctl_val |= CTRL_IO_DUMMY_SET(op->dummy.ncycles / 8);
>  
>  	if (op->data.nbytes)
>  		ctl_val |= aspeed_spi_get_io_mode(op);
> @@ -564,7 +574,7 @@ static int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
>  		desc->info.offset, desc->info.offset + desc->info.length,
>  		op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
>  		op->dummy.buswidth, op->data.buswidth,
> -		op->addr.nbytes, op->dummy.nbytes);
> +		op->addr.nbytes, op->dummy.ncycles);
>  
>  	chip->clk_freq = desc->mem->spi->max_speed_hz;
>  
> @@ -584,8 +594,8 @@ static int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
>  		op->cmd.opcode << CTRL_COMMAND_SHIFT |
>  		CTRL_IO_MODE_READ;
>  
> -	if (op->dummy.nbytes)
> -		ctl_val |= CTRL_IO_DUMMY_SET(op->dummy.nbytes / op->dummy.buswidth);
> +	if (op->dummy.ncycles)
> +		ctl_val |= CTRL_IO_DUMMY_SET(op->dummy.ncycles / 8);
>  
>  	/* Tune 4BYTE address mode */
>  	if (op->addr.nbytes) {
> diff --git a/drivers/spi/spi-ath79.c b/drivers/spi/spi-ath79.c
> index 607e7a49fb89..70bdb1eb42a2 100644
> --- a/drivers/spi/spi-ath79.c
> +++ b/drivers/spi/spi-ath79.c
> @@ -145,7 +145,7 @@ static int ath79_exec_mem_op(struct spi_mem *mem,
>  
>  	/* Only use for fast-read op. */
>  	if (op->cmd.opcode != 0x0b || op->data.dir != SPI_MEM_DATA_IN ||
> -	    op->addr.nbytes != 3 || op->dummy.nbytes != 1)
> +	    op->addr.nbytes != 3 || op->dummy.ncycles != 8)
>  		return -ENOTSUPP;
>  
>  	/* disable GPIO mode */
> diff --git a/drivers/spi/spi-bcm-qspi.c b/drivers/spi/spi-bcm-qspi.c
> index cad2d55dcd3d..143e411c1523 100644
> --- a/drivers/spi/spi-bcm-qspi.c
> +++ b/drivers/spi/spi-bcm-qspi.c
> @@ -428,8 +428,8 @@ static int bcm_qspi_bspi_set_flex_mode(struct bcm_qspi *qspi,
>  	if (addrlen == BSPI_ADDRLEN_4BYTES)
>  		bpp = BSPI_BPP_ADDR_SELECT_MASK;
>  
> -	if (op->dummy.nbytes)
> -		bpp |= (op->dummy.nbytes * 8) / op->dummy.buswidth;
> +	if (op->dummy.ncycles)
> +		bpp |= op->dummy.ncycles;
>  
>  	switch (width) {
>  	case SPI_NBITS_SINGLE:
> @@ -1153,12 +1153,16 @@ static int bcm_qspi_mspi_exec_mem_op(struct spi_device *spi,
>  	struct spi_master *master = spi->master;
>  	struct bcm_qspi *qspi = spi_master_get_devdata(master);
>  	struct spi_transfer t[2];
> -	u8 cmd[6] = { };
> +	u8 cmd[6] = { }, dummy_nbytes;
>  	int ret, i;
>  
>  	memset(cmd, 0, sizeof(cmd));
>  	memset(t, 0, sizeof(t));
>  
> +	dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> +	if (op->dummy.dtr)
> +		dummy_nbytes *= 2;
> +
>  	/* tx */
>  	/* opcode is in cmd[0] */
>  	cmd[0] = op->cmd.opcode;
> @@ -1166,7 +1170,7 @@ static int bcm_qspi_mspi_exec_mem_op(struct spi_device *spi,
>  		cmd[1 + i] = op->addr.val >> (8 * (op->addr.nbytes - i - 1));
>  
>  	t[0].tx_buf = cmd;
> -	t[0].len = op->addr.nbytes + op->dummy.nbytes + 1;
> +	t[0].len = op->addr.nbytes + dummy_nbytes + 1;
>  	t[0].bits_per_word = spi->bits_per_word;
>  	t[0].tx_nbits = op->cmd.buswidth;
>  	/* lets mspi know that this is not last transfer */
> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
> index 72b1a5a2298c..2af43ba4a2cb 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
> @@ -356,12 +356,10 @@ static unsigned int cqspi_calc_dummy(const struct spi_mem_op *op)
>  {
>  	unsigned int dummy_clk;
>  
> -	if (!op->dummy.nbytes)
> +	if (!op->dummy.ncycles)
>  		return 0;
>  
> -	dummy_clk = op->dummy.nbytes * (8 / op->dummy.buswidth);
> -	if (op->cmd.dtr)
> -		dummy_clk /= 2;
> +	dummy_clk = op->dummy.ncycles;
>  
>  	return dummy_clk;
>  }
> @@ -1333,7 +1331,7 @@ static bool cqspi_supports_mem_op(struct spi_mem *mem,
>  	 */
>  	all_true = op->cmd.dtr &&
>  		   (!op->addr.nbytes || op->addr.dtr) &&
> -		   (!op->dummy.nbytes || op->dummy.dtr) &&
> +		   (!op->dummy.ncycles || op->dummy.dtr) &&
>  		   (!op->data.nbytes || op->data.dtr);
>  
>  	all_false = !op->cmd.dtr && !op->addr.dtr && !op->dummy.dtr &&
> diff --git a/drivers/spi/spi-cadence-xspi.c b/drivers/spi/spi-cadence-xspi.c
> index 3ab19be83095..8575e4c2ed7a 100644
> --- a/drivers/spi/spi-cadence-xspi.c
> +++ b/drivers/spi/spi-cadence-xspi.c
> @@ -177,7 +177,10 @@
>  #define CDNS_XSPI_CMD_FLD_DSEQ_CMD_3(op) ( \
>  	FIELD_PREP(CDNS_XSPI_CMD_DSEQ_R3_DCNT_H, \
>  		((op)->data.nbytes >> 16) & 0xffff) | \
> -	FIELD_PREP(CDNS_XSPI_CMD_DSEQ_R3_NUM_OF_DUMMY, (op)->dummy.nbytes * 8))
> +	FIELD_PREP(CDNS_XSPI_CMD_DSEQ_R3_NUM_OF_DUMMY, \
> +		((op)->dummy.dtr ? \
> +		((op)->dummy.ncycles * (op)->dummy.buswidth * 2) : \
> +		((op)->dummy.ncycles * (op)->dummy.buswidth))))
>  
>  #define CDNS_XSPI_CMD_FLD_DSEQ_CMD_4(op, chipsel) ( \
>  	FIELD_PREP(CDNS_XSPI_CMD_DSEQ_R4_BANK, chipsel) | \
> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
> index f87d97ccd2d6..0ba5c7d0e66e 100644
> --- a/drivers/spi/spi-dw-core.c
> +++ b/drivers/spi/spi-dw-core.c
> @@ -498,13 +498,17 @@ static bool dw_spi_supports_mem_op(struct spi_mem *mem,
>  static int dw_spi_init_mem_buf(struct dw_spi *dws, const struct spi_mem_op *op)
>  {
>  	unsigned int i, j, len;
> -	u8 *out;
> +	u8 *out, dummy_nbytes;
>  
>  	/*
>  	 * Calculate the total length of the EEPROM command transfer and
>  	 * either use the pre-allocated buffer or create a temporary one.
>  	 */
> -	len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
> +	dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> +	if (op->dummy.dtr)
> +		dummy_nbytes *= 2;
> +
> +	len = op->cmd.nbytes + op->addr.nbytes + dummy_nbytes;
>  	if (op->data.dir == SPI_MEM_DATA_OUT)
>  		len += op->data.nbytes;
>  
> @@ -525,7 +529,7 @@ static int dw_spi_init_mem_buf(struct dw_spi *dws, const struct spi_mem_op *op)
>  		out[i] = DW_SPI_GET_BYTE(op->cmd.opcode, op->cmd.nbytes - i - 1);
>  	for (j = 0; j < op->addr.nbytes; ++i, ++j)
>  		out[i] = DW_SPI_GET_BYTE(op->addr.val, op->addr.nbytes - j - 1);
> -	for (j = 0; j < op->dummy.nbytes; ++i, ++j)
> +	for (j = 0; j < dummy_nbytes; ++i, ++j)
>  		out[i] = 0x0;
>  
>  	if (op->data.dir == SPI_MEM_DATA_OUT)
> diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
> index 46ae46a944c5..897e8f11ccd1 100644
> --- a/drivers/spi/spi-fsl-qspi.c
> +++ b/drivers/spi/spi-fsl-qspi.c
> @@ -369,6 +369,7 @@ static bool fsl_qspi_supports_op(struct spi_mem *mem,
>  				 const struct spi_mem_op *op)
>  {
>  	struct fsl_qspi *q = spi_controller_get_devdata(mem->spi->master);
> +	u8 dummy_nbytes;
>  	int ret;
>  
>  	ret = fsl_qspi_check_buswidth(q, op->cmd.buswidth);
> @@ -376,7 +377,7 @@ static bool fsl_qspi_supports_op(struct spi_mem *mem,
>  	if (op->addr.nbytes)
>  		ret |= fsl_qspi_check_buswidth(q, op->addr.buswidth);
>  
> -	if (op->dummy.nbytes)
> +	if (op->dummy.ncycles)
>  		ret |= fsl_qspi_check_buswidth(q, op->dummy.buswidth);
>  
>  	if (op->data.nbytes)
> @@ -389,14 +390,17 @@ static bool fsl_qspi_supports_op(struct spi_mem *mem,
>  	 * The number of instructions needed for the op, needs
>  	 * to fit into a single LUT entry.
>  	 */
> +	dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> +	if (op->dummy.dtr)
> +		dummy_nbytes *= 2;
> +
>  	if (op->addr.nbytes +
> -	   (op->dummy.nbytes ? 1:0) +
> +	   (dummy_nbytes ? 1:0) +
>  	   (op->data.nbytes ? 1:0) > 6)
>  		return false;
>  
>  	/* Max 64 dummy clock cycles supported */
> -	if (op->dummy.nbytes &&
> -	    (op->dummy.nbytes * 8 / op->dummy.buswidth > 64))
> +	if (op->dummy.ncycles && op->dummy.ncycles > 64)
>  		return false;
>  
>  	/* Max data length, check controller limits and alignment */
> @@ -437,11 +441,10 @@ static void fsl_qspi_prepare_lut(struct fsl_qspi *q,
>  		lutidx++;
>  	}
>  
> -	if (op->dummy.nbytes) {
> +	if (op->dummy.ncycles) {
>  		lutval[lutidx / 2] |= LUT_DEF(lutidx, LUT_DUMMY,
>  					      LUT_PAD(op->dummy.buswidth),
> -					      op->dummy.nbytes * 8 /
> -					      op->dummy.buswidth);
> +					      op->dummy.ncycles);
>  		lutidx++;
>  	}
>  
> diff --git a/drivers/spi/spi-hisi-sfc-v3xx.c b/drivers/spi/spi-hisi-sfc-v3xx.c
> index d3a23b1c2a4c..5b6994eb7c8b 100644
> --- a/drivers/spi/spi-hisi-sfc-v3xx.c
> +++ b/drivers/spi/spi-hisi-sfc-v3xx.c
> @@ -276,6 +276,7 @@ static int hisi_sfc_v3xx_start_bus(struct hisi_sfc_v3xx_host *host,
>  {
>  	int len = op->data.nbytes, buswidth_mode;
>  	u32 config = 0;
> +	u8 dummy_nbytes;
>  
>  	if (op->addr.nbytes)
>  		config |= HISI_SFC_V3XX_CMD_CFG_ADDR_EN_MSK;
> @@ -302,7 +303,10 @@ static int hisi_sfc_v3xx_start_bus(struct hisi_sfc_v3xx_host *host,
>  	if (op->data.dir == SPI_MEM_DATA_IN)
>  		config |= HISI_SFC_V3XX_CMD_CFG_RW_MSK;
>  
> -	config |= op->dummy.nbytes << HISI_SFC_V3XX_CMD_CFG_DUMMY_CNT_OFF |
> +	dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> +	if (op->dummy.dtr)
> +		dummy_nbytes *= 2;
> +	config |= dummy_nbytes << HISI_SFC_V3XX_CMD_CFG_DUMMY_CNT_OFF |
>  		  chip_select << HISI_SFC_V3XX_CMD_CFG_CS_SEL_OFF |
>  		  HISI_SFC_V3XX_CMD_CFG_START_MSK;
>  
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index 0c79193d9697..7b204963bb62 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -149,7 +149,7 @@ static bool spi_mem_check_buswidth(struct spi_mem *mem,
>  	    spi_check_buswidth_req(mem, op->addr.buswidth, true))
>  		return false;
>  
> -	if (op->dummy.nbytes &&
> +	if (op->dummy.ncycles &&
>  	    spi_check_buswidth_req(mem, op->dummy.buswidth, true))
>  		return false;
>  
> @@ -202,7 +202,7 @@ static int spi_mem_check_op(const struct spi_mem_op *op)
>  		return -EINVAL;
>  
>  	if ((op->addr.nbytes && !op->addr.buswidth) ||
> -	    (op->dummy.nbytes && !op->dummy.buswidth) ||
> +	    (op->dummy.ncycles && !op->dummy.buswidth) ||
>  	    (op->data.nbytes && !op->data.buswidth))
>  		return -EINVAL;
>  
> @@ -315,7 +315,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>  	struct spi_controller *ctlr = mem->spi->controller;
>  	struct spi_transfer xfers[4] = { };
>  	struct spi_message msg;
> -	u8 *tmpbuf;
> +	u8 *tmpbuf, dummy_nbytes;
>  	int ret;
>  
>  	ret = spi_mem_check_op(op);
> @@ -343,7 +343,11 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>  			return ret;
>  	}
>  
> -	tmpbufsize = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
> +	dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> +	if (op->dummy.dtr)
> +		dummy_nbytes *= 2;
> +
> +	tmpbufsize = op->cmd.nbytes + op->addr.nbytes + dummy_nbytes;
>  
>  	/*
>  	 * Allocate a buffer to transmit the CMD, ADDR cycles with kmalloc() so
> @@ -379,15 +383,15 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
>  		totalxferlen += op->addr.nbytes;
>  	}
>  
> -	if (op->dummy.nbytes) {
> -		memset(tmpbuf + op->addr.nbytes + 1, 0xff, op->dummy.nbytes);
> +	if (dummy_nbytes) {
> +		memset(tmpbuf + op->addr.nbytes + 1, 0xff, dummy_nbytes);
>  		xfers[xferpos].tx_buf = tmpbuf + op->addr.nbytes + 1;
> -		xfers[xferpos].len = op->dummy.nbytes;
> +		xfers[xferpos].len = dummy_nbytes;
>  		xfers[xferpos].tx_nbits = op->dummy.buswidth;
>  		xfers[xferpos].dummy_data = 1;
>  		spi_message_add_tail(&xfers[xferpos], &msg);
>  		xferpos++;
> -		totalxferlen += op->dummy.nbytes;
> +		totalxferlen += dummy_nbytes;
>  	}
>  
>  	if (op->data.nbytes) {
> @@ -456,12 +460,17 @@ int spi_mem_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
>  {
>  	struct spi_controller *ctlr = mem->spi->controller;
>  	size_t len;
> +	u8 dummy_nbytes;
>  
>  	if (ctlr->mem_ops && ctlr->mem_ops->adjust_op_size)
>  		return ctlr->mem_ops->adjust_op_size(mem, op);
>  
> +	dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> +	if (op->dummy.dtr)
> +		dummy_nbytes *= 2;
> +
>  	if (!ctlr->mem_ops || !ctlr->mem_ops->exec_op) {
> -		len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
> +		len = op->cmd.nbytes + op->addr.nbytes + dummy_nbytes;
>  
>  		if (len > spi_max_transfer_size(mem->spi))
>  			return -EINVAL;
> diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
> index 0a3b9f7eed30..22d002acebe8 100644
> --- a/drivers/spi/spi-mt65xx.c
> +++ b/drivers/spi/spi-mt65xx.c
> @@ -845,9 +845,13 @@ static int mtk_spi_mem_adjust_op_size(struct spi_mem *mem,
>  				      struct spi_mem_op *op)
>  {
>  	int opcode_len;
> +	u8 dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> +
> +	if (op->dummy.dtr)
> +		dummy_nbytes *= 2;
>  
>  	if (op->data.dir != SPI_MEM_NO_DATA) {
> -		opcode_len = 1 + op->addr.nbytes + op->dummy.nbytes;
> +		opcode_len = 1 + op->addr.nbytes + dummy_nbytes;
>  		if (opcode_len + op->data.nbytes > MTK_SPI_IPM_PACKET_SIZE) {
>  			op->data.nbytes = MTK_SPI_IPM_PACKET_SIZE - opcode_len;
>  			/* force data buffer dma-aligned. */
> @@ -861,14 +865,19 @@ static int mtk_spi_mem_adjust_op_size(struct spi_mem *mem,
>  static bool mtk_spi_mem_supports_op(struct spi_mem *mem,
>  				    const struct spi_mem_op *op)
>  {
> +	u8 dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> +
> +	if (op->dummy.dtr)
> +		dummy_nbytes *= 2;
> +
>  	if (!spi_mem_default_supports_op(mem, op))
>  		return false;
>  
> -	if (op->addr.nbytes && op->dummy.nbytes &&
> +	if (op->addr.nbytes && dummy_nbytes &&
>  	    op->addr.buswidth != op->dummy.buswidth)
>  		return false;
>  
> -	if (op->addr.nbytes + op->dummy.nbytes > 16)
> +	if (op->addr.nbytes + dummy_nbytes > 16)
>  		return false;
>  
>  	if (op->data.nbytes > MTK_SPI_IPM_PACKET_SIZE) {
> @@ -942,6 +951,10 @@ static int mtk_spi_mem_exec_op(struct spi_mem *mem,
>  	u32 reg_val, nio, tx_size;
>  	char *tx_tmp_buf, *rx_tmp_buf;
>  	int ret = 0;
> +	u8 dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> +
> +	if (op->dummy.dtr)
> +		dummy_nbytes *= 2;
>  
>  	mdata->use_spimem = true;
>  	reinit_completion(&mdata->spimem_done);
> @@ -957,8 +970,8 @@ static int mtk_spi_mem_exec_op(struct spi_mem *mem,
>  
>  	/* addr & dummy byte len */
>  	reg_val &= ~SPI_CFG3_IPM_ADDR_BYTELEN_MASK;
> -	if (op->addr.nbytes || op->dummy.nbytes)
> -		reg_val |= (op->addr.nbytes + op->dummy.nbytes) <<
> +	if (op->addr.nbytes || dummy_nbytes)
> +		reg_val |= (op->addr.nbytes + dummy_nbytes) <<
>  			    SPI_CFG3_IPM_ADDR_BYTELEN_OFFSET;
>  
>  	/* data byte len */
> @@ -971,7 +984,7 @@ static int mtk_spi_mem_exec_op(struct spi_mem *mem,
>  		mtk_spi_setup_packet(mem->spi->master);
>  	}
>  
> -	if (op->addr.nbytes || op->dummy.nbytes) {
> +	if (op->addr.nbytes || dummy_nbytes) {
>  		if (op->addr.buswidth == 1 || op->dummy.buswidth == 1)
>  			reg_val |= SPI_CFG3_IPM_XMODE_EN;
>  		else
> @@ -999,7 +1012,7 @@ static int mtk_spi_mem_exec_op(struct spi_mem *mem,
>  		reg_val &= ~SPI_CFG3_IPM_HALF_DUPLEX_DIR;
>  	writel(reg_val, mdata->base + SPI_CFG3_IPM_REG);
>  
> -	tx_size = 1 + op->addr.nbytes + op->dummy.nbytes;
> +	tx_size = 1 + op->addr.nbytes + dummy_nbytes;
>  	if (op->data.dir == SPI_MEM_DATA_OUT)
>  		tx_size += op->data.nbytes;
>  
> @@ -1021,13 +1034,13 @@ static int mtk_spi_mem_exec_op(struct spi_mem *mem,
>  					(8 * (op->addr.nbytes - i - 1));
>  	}
>  
> -	if (op->dummy.nbytes)
> +	if (dummy_nbytes)
>  		memset(tx_tmp_buf + op->addr.nbytes + 1,
>  		       0xff,
> -		       op->dummy.nbytes);
> +		       dummy_nbytes);
>  
>  	if (op->data.nbytes && op->data.dir == SPI_MEM_DATA_OUT)
> -		memcpy(tx_tmp_buf + op->dummy.nbytes + op->addr.nbytes + 1,
> +		memcpy(tx_tmp_buf + dummy_nbytes + op->addr.nbytes + 1,
>  		       op->data.buf.out,
>  		       op->data.nbytes);
>  
> diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
> index d167699a1a96..f6870c6e911a 100644
> --- a/drivers/spi/spi-mtk-nor.c
> +++ b/drivers/spi/spi-mtk-nor.c
> @@ -171,23 +171,18 @@ static bool need_bounce(struct mtk_nor *sp, const struct spi_mem_op *op)
>  
>  static bool mtk_nor_match_read(const struct spi_mem_op *op)
>  {
> -	int dummy = 0;
> -
> -	if (op->dummy.nbytes)
> -		dummy = op->dummy.nbytes * BITS_PER_BYTE / op->dummy.buswidth;
> -
>  	if ((op->data.buswidth == 2) || (op->data.buswidth == 4)) {
>  		if (op->addr.buswidth == 1)
> -			return dummy == 8;
> +			return op->dummy.ncycles == 8;
>  		else if (op->addr.buswidth == 2)
> -			return dummy == 4;
> +			return op->dummy.ncycles == 4;
>  		else if (op->addr.buswidth == 4)
> -			return dummy == 6;
> +			return op->dummy.ncycles == 6;
>  	} else if ((op->addr.buswidth == 1) && (op->data.buswidth == 1)) {
>  		if (op->cmd.opcode == 0x03)
> -			return dummy == 0;
> +			return op->dummy.ncycles == 0;
>  		else if (op->cmd.opcode == 0x0b)
> -			return dummy == 8;
> +			return op->dummy.ncycles == 8;
>  	}
>  	return false;
>  }
> @@ -195,6 +190,10 @@ static bool mtk_nor_match_read(const struct spi_mem_op *op)
>  static bool mtk_nor_match_prg(const struct spi_mem_op *op)
>  {
>  	int tx_len, rx_len, prg_len, prg_left;
> +	u8 dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> +
> +	if (op->dummy.dtr)
> +		dummy_nbytes *= 2;
>  
>  	// prg mode is spi-only.
>  	if ((op->cmd.buswidth > 1) || (op->addr.buswidth > 1) ||
> @@ -205,7 +204,7 @@ static bool mtk_nor_match_prg(const struct spi_mem_op *op)
>  
>  	if (op->data.dir == SPI_MEM_DATA_OUT) {
>  		// count dummy bytes only if we need to write data after it
> -		tx_len += op->dummy.nbytes;
> +		tx_len += dummy_nbytes;
>  
>  		// leave at least one byte for data
>  		if (tx_len > MTK_NOR_REG_PRGDATA_MAX)
> @@ -221,7 +220,7 @@ static bool mtk_nor_match_prg(const struct spi_mem_op *op)
>  			return false;
>  
>  		rx_len = op->data.nbytes;
> -		prg_left = MTK_NOR_PRG_CNT_MAX / 8 - tx_len - op->dummy.nbytes;
> +		prg_left = MTK_NOR_PRG_CNT_MAX / 8 - tx_len - dummy_nbytes;
>  		if (prg_left > MTK_NOR_REG_SHIFT_MAX + 1)
>  			prg_left = MTK_NOR_REG_SHIFT_MAX + 1;
>  		if (rx_len > prg_left) {
> @@ -230,11 +229,11 @@ static bool mtk_nor_match_prg(const struct spi_mem_op *op)
>  			rx_len = prg_left;
>  		}
>  
> -		prg_len = tx_len + op->dummy.nbytes + rx_len;
> +		prg_len = tx_len + dummy_nbytes + rx_len;
>  		if (prg_len > MTK_NOR_PRG_CNT_MAX / 8)
>  			return false;
>  	} else {
> -		prg_len = tx_len + op->dummy.nbytes;
> +		prg_len = tx_len + dummy_nbytes;
>  		if (prg_len > MTK_NOR_PRG_CNT_MAX / 8)
>  			return false;
>  	}
> @@ -244,15 +243,19 @@ static bool mtk_nor_match_prg(const struct spi_mem_op *op)
>  static void mtk_nor_adj_prg_size(struct spi_mem_op *op)
>  {
>  	int tx_len, tx_left, prg_left;
> +	u8 dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> +
> +	if (op->dummy.dtr)
> +		dummy_nbytes *= 2;
>  
>  	tx_len = op->cmd.nbytes + op->addr.nbytes;
>  	if (op->data.dir == SPI_MEM_DATA_OUT) {
> -		tx_len += op->dummy.nbytes;
> +		tx_len += dummy_nbytes;
>  		tx_left = MTK_NOR_REG_PRGDATA_MAX + 1 - tx_len;
>  		if (op->data.nbytes > tx_left)
>  			op->data.nbytes = tx_left;
>  	} else if (op->data.dir == SPI_MEM_DATA_IN) {
> -		prg_left = MTK_NOR_PRG_CNT_MAX / 8 - tx_len - op->dummy.nbytes;
> +		prg_left = MTK_NOR_PRG_CNT_MAX / 8 - tx_len - dummy_nbytes;
>  		if (prg_left > MTK_NOR_REG_SHIFT_MAX + 1)
>  			prg_left = MTK_NOR_REG_SHIFT_MAX + 1;
>  		if (op->data.nbytes > prg_left)
> @@ -312,7 +315,7 @@ static bool mtk_nor_supports_op(struct spi_mem *mem,
>  			break;
>  		case SPI_MEM_DATA_OUT:
>  			if ((op->addr.buswidth == 1) &&
> -			    (op->dummy.nbytes == 0) &&
> +			    (op->dummy.ncycles == 0) &&
>  			    (op->data.buswidth == 1))
>  				return true;
>  			break;
> @@ -515,17 +518,20 @@ static int mtk_nor_spi_mem_prg(struct mtk_nor *sp, const struct spi_mem_op *op)
>  	int tx_len, prg_len;
>  	int i, ret;
>  	void __iomem *reg;
> -	u8 bufbyte;
> +	u8 bufbyte, dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> +
> +	if (op->dummy.dtr)
> +		dummy_nbytes *= 2;
>  
>  	tx_len = op->cmd.nbytes + op->addr.nbytes;
>  
>  	// count dummy bytes only if we need to write data after it
>  	if (op->data.dir == SPI_MEM_DATA_OUT)
> -		tx_len += op->dummy.nbytes + op->data.nbytes;
> +		tx_len += dummy_nbytes + op->data.nbytes;
>  	else if (op->data.dir == SPI_MEM_DATA_IN)
>  		rx_len = op->data.nbytes;
>  
> -	prg_len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes +
> +	prg_len = op->cmd.nbytes + op->addr.nbytes + dummy_nbytes +
>  		  op->data.nbytes;
>  
>  	// an invalid op may reach here if the caller calls exec_op without
> @@ -550,7 +556,7 @@ static int mtk_nor_spi_mem_prg(struct mtk_nor *sp, const struct spi_mem_op *op)
>  	}
>  
>  	if (op->data.dir == SPI_MEM_DATA_OUT) {
> -		for (i = 0; i < op->dummy.nbytes; i++, reg_offset--) {
> +		for (i = 0; i < dummy_nbytes; i++, reg_offset--) {
>  			reg = sp->base + MTK_NOR_REG_PRGDATA(reg_offset);
>  			writeb(0, reg);
>  		}
> diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-snfi.c
> index d66bf9762557..05d2f0a97feb 100644
> --- a/drivers/spi/spi-mtk-snfi.c
> +++ b/drivers/spi/spi-mtk-snfi.c
> @@ -434,7 +434,10 @@ static int mtk_snand_mac_io(struct mtk_snand *snf, const struct spi_mem_op *op)
>  	const u8 *tx_buf = NULL;
>  	u8 *rx_buf = NULL;
>  	int i, ret;
> -	u8 b;
> +	u8 b, dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> +
> +	if (op->dummy.dtr)
> +		dummy_nbytes *= 2;
>  
>  	if (op->data.dir == SPI_MEM_DATA_IN) {
>  		rx_len = op->data.nbytes;
> @@ -463,7 +466,7 @@ static int mtk_snand_mac_io(struct mtk_snand *snf, const struct spi_mem_op *op)
>  		}
>  	}
>  
> -	for (i = 0; i < op->dummy.nbytes; i++, reg_offs++) {
> +	for (i = 0; i < dummy_nbytes; i++, reg_offs++) {
>  		if (reg_offs % 4 == 3) {
>  			nfi_write32(snf, SNF_GPRAM + reg_offs - 3, val);
>  			val = 0;
> @@ -836,7 +839,7 @@ static int mtk_snand_read_page_cache(struct mtk_snand *snf,
>  	u32 op_addr = op->addr.val;
>  	// where to start copying data from bounce buffer
>  	u32 rd_offset = 0;
> -	u32 dummy_clk = (op->dummy.nbytes * BITS_PER_BYTE / op->dummy.buswidth);
> +	u32 dummy_clk = op->dummy.ncycles;
>  	u32 op_mode = 0;
>  	u32 dma_len = snf->buf_len;
>  	int ret = 0;
> @@ -1178,8 +1181,7 @@ static bool mtk_snand_is_page_ops(const struct spi_mem_op *op)
>  	// match read from page instructions
>  	if (op->data.dir == SPI_MEM_DATA_IN) {
>  		// check dummy cycle first
> -		if (op->dummy.nbytes * BITS_PER_BYTE / op->dummy.buswidth >
> -		    DATA_READ_MAX_DUMMY)
> +		if (op->dummy.ncycles > DATA_READ_MAX_DUMMY)
>  			return false;
>  		// quad io / quad out
>  		if ((op->addr.buswidth == 4 || op->addr.buswidth == 1) &&
> @@ -1196,7 +1198,7 @@ static bool mtk_snand_is_page_ops(const struct spi_mem_op *op)
>  			return true;
>  	} else if (op->data.dir == SPI_MEM_DATA_OUT) {
>  		// check dummy cycle first
> -		if (op->dummy.nbytes)
> +		if (op->dummy.ncycles)
>  			return false;
>  		// program load quad out
>  		if (op->addr.buswidth == 1 && op->data.buswidth == 4)
> @@ -1218,7 +1220,7 @@ static bool mtk_snand_supports_op(struct spi_mem *mem,
>  	if (mtk_snand_is_page_ops(op))
>  		return true;
>  	return ((op->addr.nbytes == 0 || op->addr.buswidth == 1) &&
> -		(op->dummy.nbytes == 0 || op->dummy.buswidth == 1) &&
> +		(op->dummy.ncycles == 0 || op->dummy.buswidth == 1) &&
>  		(op->data.nbytes == 0 || op->data.buswidth == 1));
>  }
>  
> @@ -1239,7 +1241,13 @@ static int mtk_snand_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
>  		if (op->data.nbytes > l)
>  			op->data.nbytes = l;
>  	} else {
> -		size_t hl = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
> +		size_t hl;
> +		u8 dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> +
> +		if (op->dummy.dtr)
> +			dummy_nbytes *= 2;
> +
> +		hl = op->cmd.nbytes + op->addr.nbytes + dummy_nbytes;
>  
>  		if (hl >= SNF_GPRAM_SIZE)
>  			return -EOPNOTSUPP;
> diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
> index 65be8e085ab8..d940ee0e11a5 100644
> --- a/drivers/spi/spi-mxic.c
> +++ b/drivers/spi/spi-mxic.c
> @@ -316,14 +316,18 @@ static u32 mxic_spi_mem_prep_op_cfg(const struct spi_mem_op *op,
>  	u32 cfg = OP_CMD_BYTES(op->cmd.nbytes) |
>  		  OP_CMD_BUSW(fls(op->cmd.buswidth) - 1) |
>  		  (op->cmd.dtr ? OP_CMD_DDR : 0);
> +	u8 dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> +
> +	if (op->dummy.dtr)
> +		dummy_nbytes *= 2;
>  
>  	if (op->addr.nbytes)
>  		cfg |= OP_ADDR_BYTES(op->addr.nbytes) |
>  		       OP_ADDR_BUSW(fls(op->addr.buswidth) - 1) |
>  		       (op->addr.dtr ? OP_ADDR_DDR : 0);
>  
> -	if (op->dummy.nbytes)
> -		cfg |= OP_DUMMY_CYC(op->dummy.nbytes);
> +	if (dummy_nbytes)
> +		cfg |= OP_DUMMY_CYC(dummy_nbytes);
>  
>  	/* Direct mapping data.nbytes field is not populated */
>  	if (data_len) {
> @@ -481,7 +485,7 @@ static bool mxic_spi_mem_supports_op(struct spi_mem *mem,
>  	    op->dummy.buswidth > 8 || op->cmd.buswidth > 8)
>  		return false;
>  
> -	if (op->data.nbytes && op->dummy.nbytes &&
> +	if (op->data.nbytes && op->dummy.ncycles &&
>  	    op->data.buswidth != op->dummy.buswidth)
>  		return false;
>  
> @@ -512,7 +516,11 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
>  {
>  	struct mxic_spi *mxic = spi_master_get_devdata(mem->spi->master);
>  	int i, ret;
> -	u8 addr[8], cmd[2];
> +	u8 addr[8], cmd[2], dummy_nbytes;
> +
> +	dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> +	if (op->dummy.dtr)
> +		dummy_nbytes *= 2;
>  
>  	ret = mxic_spi_set_freq(mxic, mem->spi->max_speed_hz);
>  	if (ret)
> @@ -543,7 +551,7 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
>  	if (ret)
>  		goto out;
>  
> -	ret = mxic_spi_data_xfer(mxic, NULL, NULL, op->dummy.nbytes);
> +	ret = mxic_spi_data_xfer(mxic, NULL, NULL, dummy_nbytes);
>  	if (ret)
>  		goto out;
>  
> diff --git a/drivers/spi/spi-npcm-fiu.c b/drivers/spi/spi-npcm-fiu.c
> index 49f6424e35af..17493f668459 100644
> --- a/drivers/spi/spi-npcm-fiu.c
> +++ b/drivers/spi/spi-npcm-fiu.c
> @@ -265,6 +265,11 @@ static const struct regmap_config npcm_mtd_regmap_config = {
>  static void npcm_fiu_set_drd(struct npcm_fiu_spi *fiu,
>  			     const struct spi_mem_op *op)
>  {
> +	u8 dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> +
> +	if (op->dummy.dtr)
> +		dummy_nbytes *= 2;
> +
>  	regmap_update_bits(fiu->regmap, NPCM_FIU_DRD_CFG,
>  			   NPCM_FIU_DRD_CFG_ACCTYPE,
>  			   ilog2(op->addr.buswidth) <<
> @@ -272,8 +277,8 @@ static void npcm_fiu_set_drd(struct npcm_fiu_spi *fiu,
>  	fiu->drd_op.addr.buswidth = op->addr.buswidth;
>  	regmap_update_bits(fiu->regmap, NPCM_FIU_DRD_CFG,
>  			   NPCM_FIU_DRD_CFG_DBW,
> -			   op->dummy.nbytes << NPCM_FIU_DRD_DBW_SHIFT);
> -	fiu->drd_op.dummy.nbytes = op->dummy.nbytes;
> +			   dummy_nbytes << NPCM_FIU_DRD_DBW_SHIFT);
> +	fiu->drd_op.dummy.ncycles = op->dummy.ncycles;
>  	regmap_update_bits(fiu->regmap, NPCM_FIU_DRD_CFG,
>  			   NPCM_FIU_DRD_CFG_RDCMD, op->cmd.opcode);
>  	fiu->drd_op.cmd.opcode = op->cmd.opcode;
> @@ -299,7 +304,7 @@ static ssize_t npcm_fiu_direct_read(struct spi_mem_dirmap_desc *desc,
>  			*(buf_rx + i) = ioread8(src + i);
>  	} else {
>  		if (desc->info.op_tmpl.addr.buswidth != fiu->drd_op.addr.buswidth ||
> -		    desc->info.op_tmpl.dummy.nbytes != fiu->drd_op.dummy.nbytes ||
> +		    desc->info.op_tmpl.dummy.ncycles != fiu->drd_op.dummy.ncycles ||
>  		    desc->info.op_tmpl.cmd.opcode != fiu->drd_op.cmd.opcode ||
>  		    desc->info.op_tmpl.addr.nbytes != fiu->drd_op.addr.nbytes)
>  			npcm_fiu_set_drd(fiu, &desc->info.op_tmpl);
> @@ -341,6 +346,10 @@ static int npcm_fiu_uma_read(struct spi_mem *mem,
>  	int ret;
>  	u32 val;
>  	u32 i;
> +	u8 dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> +
> +	if (op->dummy.dtr)
> +		dummy_nbytes *= 2;
>  
>  	regmap_update_bits(fiu->regmap, NPCM_FIU_UMA_CTS,
>  			   NPCM_FIU_UMA_CTS_DEV_NUM,
> @@ -357,7 +366,7 @@ static int npcm_fiu_uma_read(struct spi_mem *mem,
>  			<< NPCM_FIU_UMA_CFG_DBPCK_SHIFT;
>  		uma_cfg |= ilog2(op->data.buswidth)
>  			<< NPCM_FIU_UMA_CFG_RDBPCK_SHIFT;
> -		uma_cfg |= op->dummy.nbytes << NPCM_FIU_UMA_CFG_DBSIZ_SHIFT;
> +		uma_cfg |= dummy_nbytes << NPCM_FIU_UMA_CFG_DBSIZ_SHIFT;
>  		uma_cfg |= op->addr.nbytes << NPCM_FIU_UMA_CFG_ADDSIZ_SHIFT;
>  		regmap_write(fiu->regmap, NPCM_FIU_UMA_ADDR, addr);
>  	} else {
> diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
> index 2b0301fc971c..ccec9b726283 100644
> --- a/drivers/spi/spi-nxp-fspi.c
> +++ b/drivers/spi/spi-nxp-fspi.c
> @@ -444,7 +444,7 @@ static bool nxp_fspi_supports_op(struct spi_mem *mem,
>  	if (op->addr.nbytes)
>  		ret |= nxp_fspi_check_buswidth(f, op->addr.buswidth);
>  
> -	if (op->dummy.nbytes)
> +	if (op->dummy.ncycles)
>  		ret |= nxp_fspi_check_buswidth(f, op->dummy.buswidth);
>  
>  	if (op->data.nbytes)
> @@ -468,8 +468,7 @@ static bool nxp_fspi_supports_op(struct spi_mem *mem,
>  		return false;
>  
>  	/* Max 64 dummy clock cycles supported */
> -	if (op->dummy.buswidth &&
> -	    (op->dummy.nbytes * 8 / op->dummy.buswidth > 64))
> +	if (op->dummy.ncycles > 64)
>  		return false;
>  
>  	/* Max data length, check controller limits and alignment */
> @@ -543,15 +542,14 @@ static void nxp_fspi_prepare_lut(struct nxp_fspi *f,
>  	}
>  
>  	/* dummy bytes, if needed */
> -	if (op->dummy.nbytes) {
> +	if (op->dummy.ncycles) {
>  		lutval[lutidx / 2] |= LUT_DEF(lutidx, LUT_DUMMY,
>  		/*
>  		 * Due to FlexSPI controller limitation number of PAD for dummy
>  		 * buswidth needs to be programmed as equal to data buswidth.
>  		 */
>  					      LUT_PAD(op->data.buswidth),
> -					      op->dummy.nbytes * 8 /
> -					      op->dummy.buswidth);
> +					      op->dummy.ncycles);
>  		lutidx++;
>  	}
>  
> diff --git a/drivers/spi/spi-rockchip-sfc.c b/drivers/spi/spi-rockchip-sfc.c
> index bd87d3c92dd3..82f9e61b9036 100644
> --- a/drivers/spi/spi-rockchip-sfc.c
> +++ b/drivers/spi/spi-rockchip-sfc.c
> @@ -282,16 +282,21 @@ static int rockchip_sfc_wait_rxfifo_ready(struct rockchip_sfc *sfc, u32 timeout_
>  
>  static void rockchip_sfc_adjust_op_work(struct spi_mem_op *op)
>  {
> -	if (unlikely(op->dummy.nbytes && !op->addr.nbytes)) {
> +	if (unlikely(op->dummy.ncycles && !op->addr.nbytes)) {
> +		u8 dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> +
> +		if (op->dummy.dtr)
> +			dummy_nbytes *= 2;
> +
>  		/*
>  		 * SFC not support output DUMMY cycles right after CMD cycles, so
>  		 * treat it as ADDR cycles.
>  		 */
> -		op->addr.nbytes = op->dummy.nbytes;
> +		op->addr.nbytes = dummy_nbytes;
>  		op->addr.buswidth = op->dummy.buswidth;
>  		op->addr.val = 0xFFFFFFFFF;
>  
> -		op->dummy.nbytes = 0;
> +		op->dummy.ncycles = 0;
>  	}
>  }
>  
> @@ -301,6 +306,10 @@ static int rockchip_sfc_xfer_setup(struct rockchip_sfc *sfc,
>  				   u32 len)
>  {
>  	u32 ctrl = 0, cmd = 0;
> +	u8 dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> +
> +	if (op->dummy.dtr)
> +		dummy_nbytes *= 2;
>  
>  	/* set CMD */
>  	cmd = op->cmd.opcode;
> @@ -321,13 +330,13 @@ static int rockchip_sfc_xfer_setup(struct rockchip_sfc *sfc,
>  	}
>  
>  	/* set DUMMY */
> -	if (op->dummy.nbytes) {
> +	if (dummy_nbytes) {
>  		if (op->dummy.buswidth == 4)
> -			cmd |= op->dummy.nbytes * 2 << SFC_CMD_DUMMY_SHIFT;
> +			cmd |= dummy_nbytes * 2 << SFC_CMD_DUMMY_SHIFT;
>  		else if (op->dummy.buswidth == 2)
> -			cmd |= op->dummy.nbytes * 4 << SFC_CMD_DUMMY_SHIFT;
> +			cmd |= dummy_nbytes * 4 << SFC_CMD_DUMMY_SHIFT;
>  		else
> -			cmd |= op->dummy.nbytes * 8 << SFC_CMD_DUMMY_SHIFT;
> +			cmd |= dummy_nbytes * 8 << SFC_CMD_DUMMY_SHIFT;
>  	}
>  
>  	/* set DATA */
> @@ -348,9 +357,9 @@ static int rockchip_sfc_xfer_setup(struct rockchip_sfc *sfc,
>  	ctrl |= SFC_CTRL_PHASE_SEL_NEGETIVE;
>  	cmd |= mem->spi->chip_select << SFC_CMD_CS_SHIFT;
>  
> -	dev_dbg(sfc->dev, "sfc addr.nbytes=%x(x%d) dummy.nbytes=%x(x%d)\n",
> +	dev_dbg(sfc->dev, "sfc addr.nbytes=%x(x%d) dummy.ncycles=%x(x%d)\n",
>  		op->addr.nbytes, op->addr.buswidth,
> -		op->dummy.nbytes, op->dummy.buswidth);
> +		op->dummy.ncycles, op->dummy.buswidth);
>  	dev_dbg(sfc->dev, "sfc ctrl=%x cmd=%x addr=%llx len=%x\n",
>  		ctrl, cmd, op->addr.val, len);
>  
> diff --git a/drivers/spi/spi-rpc-if.c b/drivers/spi/spi-rpc-if.c
> index 24ec1c83f379..fb317a80bef8 100644
> --- a/drivers/spi/spi-rpc-if.c
> +++ b/drivers/spi/spi-rpc-if.c
> @@ -32,10 +32,9 @@ static void rpcif_spi_mem_prepare(struct spi_device *spi_dev,
>  		rpc_op.addr.val = spi_op->addr.val;
>  	}
>  
> -	if (spi_op->dummy.nbytes) {
> +	if (spi_op->dummy.ncycles) {
>  		rpc_op.dummy.buswidth = spi_op->dummy.buswidth;
> -		rpc_op.dummy.ncycles  = spi_op->dummy.nbytes * 8 /
> -					spi_op->dummy.buswidth;
> +		rpc_op.dummy.ncycles  = spi_op->dummy.ncycles;
>  	}
>  
>  	if (spi_op->data.nbytes || (offs && len)) {
> diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
> index f3fe92300639..9072345eddde 100644
> --- a/drivers/spi/spi-stm32-qspi.c
> +++ b/drivers/spi/spi-stm32-qspi.c
> @@ -388,9 +388,8 @@ static int stm32_qspi_send(struct spi_mem *mem, const struct spi_mem_op *op)
>  		ccr |= FIELD_PREP(CCR_ADSIZE_MASK, op->addr.nbytes - 1);
>  	}
>  
> -	if (op->dummy.nbytes)
> -		ccr |= FIELD_PREP(CCR_DCYC_MASK,
> -				  op->dummy.nbytes * 8 / op->dummy.buswidth);
> +	if (op->dummy.ncycles)
> +		ccr |= FIELD_PREP(CCR_DCYC_MASK, op->dummy.ncycles);
>  
>  	if (op->data.nbytes) {
>  		ccr |= FIELD_PREP(CCR_DMODE_MASK,
> diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
> index 60086869bcae..377bc119344f 100644
> --- a/drivers/spi/spi-ti-qspi.c
> +++ b/drivers/spi/spi-ti-qspi.c
> @@ -579,6 +579,10 @@ static int ti_qspi_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
>  {
>  	struct ti_qspi *qspi = spi_controller_get_devdata(mem->spi->master);
>  	size_t max_len;
> +	u8 dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> +
> +	if (op->dummy.dtr)
> +		dummy_nbytes *= 2;
>  
>  	if (op->data.dir == SPI_MEM_DATA_IN) {
>  		if (op->addr.val < qspi->mmap_size) {
> @@ -595,7 +599,7 @@ static int ti_qspi_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
>  			 * Adjust size to comply with the QSPI max frame length.
>  			 */
>  			max_len = QSPI_FRAME;
> -			max_len -= 1 + op->addr.nbytes + op->dummy.nbytes;
> +			max_len -= 1 + op->addr.nbytes + dummy_nbytes;
>  			op->data.nbytes = min((size_t) op->data.nbytes,
>  					      max_len);
>  		}
> @@ -610,6 +614,10 @@ static int ti_qspi_exec_mem_op(struct spi_mem *mem,
>  	struct ti_qspi *qspi = spi_master_get_devdata(mem->spi->master);
>  	u32 from = 0;
>  	int ret = 0;
> +	u8 dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> +
> +	if (op->dummy.dtr)
> +		dummy_nbytes *= 2;
>  
>  	/* Only optimize read path. */
>  	if (!op->data.nbytes || op->data.dir != SPI_MEM_DATA_IN ||
> @@ -628,7 +636,7 @@ static int ti_qspi_exec_mem_op(struct spi_mem *mem,
>  		ti_qspi_enable_memory_map(mem->spi);
>  	}
>  	ti_qspi_setup_mmap_read(mem->spi, op->cmd.opcode, op->data.buswidth,
> -				op->addr.nbytes, op->dummy.nbytes);
> +				op->addr.nbytes, dummy_nbytes);
>  
>  	if (qspi->rx_chan) {
>  		struct sg_table sgt;
> diff --git a/drivers/spi/spi-zynq-qspi.c b/drivers/spi/spi-zynq-qspi.c
> index 78f31b61a2aa..84b7db85548c 100644
> --- a/drivers/spi/spi-zynq-qspi.c
> +++ b/drivers/spi/spi-zynq-qspi.c
> @@ -527,7 +527,10 @@ static int zynq_qspi_exec_mem_op(struct spi_mem *mem,
>  {
>  	struct zynq_qspi *xqspi = spi_controller_get_devdata(mem->spi->master);
>  	int err = 0, i;
> -	u8 *tmpbuf;
> +	u8 *tmpbuf, dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> +
> +	if (op->dummy.dtr)
> +		dummy_nbytes *= 2;
>  
>  	dev_dbg(xqspi->dev, "cmd:%#x mode:%d.%d.%d.%d\n",
>  		op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
> @@ -568,17 +571,17 @@ static int zynq_qspi_exec_mem_op(struct spi_mem *mem,
>  			err = -ETIMEDOUT;
>  	}
>  
> -	if (op->dummy.nbytes) {
> -		tmpbuf = kzalloc(op->dummy.nbytes, GFP_KERNEL);
> +	if (dummy_nbytes) {
> +		tmpbuf = kzalloc(dummy_nbytes, GFP_KERNEL);
>  		if (!tmpbuf)
>  			return -ENOMEM;
>  
> -		memset(tmpbuf, 0xff, op->dummy.nbytes);
> +		memset(tmpbuf, 0xff, dummy_nbytes);
>  		reinit_completion(&xqspi->data_completion);
>  		xqspi->txbuf = tmpbuf;
>  		xqspi->rxbuf = NULL;
> -		xqspi->tx_bytes = op->dummy.nbytes;
> -		xqspi->rx_bytes = op->dummy.nbytes;
> +		xqspi->tx_bytes = dummy_nbytes;
> +		xqspi->rx_bytes = dummy_nbytes;
>  		zynq_qspi_write_op(xqspi, ZYNQ_QSPI_FIFO_DEPTH, true);
>  		zynq_qspi_write(xqspi, ZYNQ_QSPI_IEN_OFFSET,
>  				ZYNQ_QSPI_IXR_RXTX_MASK);
> diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
> index c760aac070e5..b41abadef9a6 100644
> --- a/drivers/spi/spi-zynqmp-gqspi.c
> +++ b/drivers/spi/spi-zynqmp-gqspi.c
> @@ -948,6 +948,10 @@ static int zynqmp_qspi_exec_op(struct spi_mem *mem,
>  	u32 genfifoentry = 0;
>  	u16 opcode = op->cmd.opcode;
>  	u64 opaddr;
> +	u8 dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> +
> +	if (op->dummy.dtr)
> +		dummy_nbytes *= 2;
>  
>  	dev_dbg(xqspi->dev, "cmd:%#x mode:%d.%d.%d.%d\n",
>  		op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
> @@ -1006,14 +1010,14 @@ static int zynqmp_qspi_exec_op(struct spi_mem *mem,
>  		}
>  	}
>  
> -	if (op->dummy.nbytes) {
> +	if (dummy_nbytes) {
>  		xqspi->txbuf = NULL;
>  		xqspi->rxbuf = NULL;
>  		/*
>  		 * xqspi->bytes_to_transfer here represents the dummy circles
>  		 * which need to be sent.
>  		 */
> -		xqspi->bytes_to_transfer = op->dummy.nbytes * 8 / op->dummy.buswidth;
> +		xqspi->bytes_to_transfer = dummy_nbytes;
>  		xqspi->bytes_to_receive = 0;
>  		/*
>  		 * Using op->data.buswidth instead of op->dummy.buswidth here because
> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> index 2ba044d0d5e5..5fd45800af03 100644
> --- a/include/linux/spi/spi-mem.h
> +++ b/include/linux/spi/spi-mem.h
> @@ -29,9 +29,9 @@
>  
>  #define SPI_MEM_OP_NO_ADDR	{ }
>  
> -#define SPI_MEM_OP_DUMMY(__nbytes, __buswidth)			\
> +#define SPI_MEM_OP_DUMMY(__ncycles, __buswidth)		\
>  	{							\
> -		.nbytes = __nbytes,				\
> +		.ncycles = __ncycles,				\
>  		.buswidth = __buswidth,				\
>  	}
>  
> @@ -83,8 +83,8 @@ enum spi_mem_data_dir {
>   *	      Note that only @addr.nbytes are taken into account in this
>   *	      address value, so users should make sure the value fits in the
>   *	      assigned number of bytes.
> - * @dummy.nbytes: number of dummy bytes to send after an opcode or address. Can
> - *		  be zero if the operation does not require dummy bytes
> + * @dummy.ncycles: number of dummy cycles after an opcode or address. Can
> + *		   be zero if the operation does not require dummy cycles
>   * @dummy.buswidth: number of IO lanes used to transmit the dummy bytes
>   * @dummy.dtr: whether the dummy bytes should be sent in DTR mode or not
>   * @data.buswidth: number of IO lanes used to send/receive the data
> @@ -112,7 +112,7 @@ struct spi_mem_op {
>  	} addr;
>  
>  	struct {
> -		u8 nbytes;
> +		u8 ncycles;
>  		u8 buswidth;
>  		u8 dtr : 1;
>  	} dummy;
