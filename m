Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7355EB5B9
	for <lists+openbmc@lfdr.de>; Tue, 27 Sep 2022 01:26:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbzRF1PStz3blf
	for <lists+openbmc@lfdr.de>; Tue, 27 Sep 2022 09:26:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OSsjw1Wy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=fancer.lancer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OSsjw1Wy;
	dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbqQH3d0nz2xCj;
	Tue, 27 Sep 2022 03:25:10 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id z25so12000188lfr.2;
        Mon, 26 Sep 2022 10:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=p0cv6OWCG+k4Yx1z1NserLX920Ctk5iH9JL+ILpJ/Rk=;
        b=OSsjw1Wy1sqe/S/VCPRhvBCufm1/3Ip8TX5h67WfooKHp+7wTk0g8PAxq8321pFNJp
         rH96Ujirylu09bK37nfZKS/txm5VlKrZwZv51kxta7Hb9sctjMsWcK+ZRs5CV9f8QP5y
         FHzC9OdHnGfr0VYr8ev3JbaUiyn2uZiRaDh5HoVLepFgzIU/AsP8KK6ED8W4oSxGg+j2
         /RVHo2o3/9TYDdG01V9fAQbEGrQFkbCZPQcBkkDpO9u7m2X9ETxPL/Tt4axjYy9aBReS
         VrTuatDHVAo2iV16QTx6YrTvKRrfgelbYaIRQoagRulu0t0w4UT1h1Z0196PiKfXPPQj
         MZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=p0cv6OWCG+k4Yx1z1NserLX920Ctk5iH9JL+ILpJ/Rk=;
        b=4poseX8kv/WiPUeR0y8U8bnyhtYjdgP+l80oY7gjRP9tpqf8KlOAoDAacWSSK+tb+E
         AoYxobjyOTcPDAbWds7XrNvzFjcGlQxWkMUfyVUaYllHZxZbTkr4IsmhebPQz8L/QbgM
         kQ907HKCkFQzVPJFoS2hP9jSPCKS/0j4AQZztNzJVfVcRcEmIX6CDlGgDmhllZlaVtx8
         D5ORtJ2Kvxy7t2qlpQUpKvaGe8rY0ICBTw5yZopefuC1GRlHhJU3Yu1KFXpg+I13e9kz
         1YWLKNVt/CFRilkd+EdcnWoI+Dqkgn1JF0mEJl9mO/c4OP6h8FwoiyL3RISH1YtHBFoD
         yyAg==
X-Gm-Message-State: ACrzQf09i2IPGyq2/ADLPHhJDHw1nibKZ1m4OlwrWskR+W9hu7hUO5cM
	i5QfFrZ0Dn2vOD5QjDZveIk=
X-Google-Smtp-Source: AMsMyM5xJh/lb55NobJAejaokmm+TsWNAKAXwdI5AGh7Onx5487PaVW+h6MhGBxJj73R6zXdNP0xNw==
X-Received: by 2002:a05:6512:3128:b0:499:3c1d:f9e with SMTP id p8-20020a056512312800b004993c1d0f9emr9281543lfd.634.1664213100684;
        Mon, 26 Sep 2022 10:25:00 -0700 (PDT)
Received: from mobilestation (ip1.ibrae.ac.ru. [91.238.191.1])
        by smtp.gmail.com with ESMTPSA id y1-20020a05651c106100b0026c16e9e45bsm2442137ljm.17.2022.09.26.10.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 10:24:59 -0700 (PDT)
Date: Mon, 26 Sep 2022 20:24:54 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Sergiu.Moga@microchip.com, Mark Brown <broonie@kernel.org>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
Message-ID: <20220926172454.kbpzck7med5bopre@mobilestation>
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation>
 <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
X-Mailman-Approved-At: Tue, 27 Sep 2022 09:22:21 +1000
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
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com, linux-aspeed@lists.ozlabs.org, alexandre.torgue@foss.st.com, tali.perry1@gmail.com, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, tmaimon77@gmail.com, benjaminfair@google.com, kdasu.kdev@gmail.com, richard@nod.at, chin-ting_kuo@aspeedtech.com, michal.simek@xilinx.com, haibo.chen@nxp.com, openbmc@lists.ozlabs.org, bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au, yogeshgaur.83@gmail.com, linux-rockchip@lists.infradead.org, Tudor.Ambarus@microchip.com, john.garry@huawei.com, broonie@kernel.org, linux-mediatek@lists.infradead.org, clg@kaod.org, matthias.bgg@gmail.com, han.xu@nxp.com, linux-arm-kernel@lists.infradead.org, andrew@aj.id.au, venture@google.com, heiko@sntech.de, Nicolas.Ferre@microchip.com, linux-kernel@vger.kernel.org, avifishman70@gmail.com, michael@walle.cc, mcoquelin.stm32@gmail.com, Claudiu.Beznea@microchip.com, pratyush@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

@Mark, @Tudor, @Pratyush, @Michael could you please join the
discussion regarding the dummy.buswidth and dummy.dtr fields in the
spi_mem_op structure?

On Mon, Sep 26, 2022 at 09:05:49AM +0000, Sergiu.Moga@microchip.com wrote:
> On 26.09.2022 01:03, Serge Semin wrote:
> > Hello Sergiu
> > 

Sergiu, you didn't address all my comments. Please be more attentive.

> 
> 
> Hello Serge,
> 
> 
> > On Sun, Sep 11, 2022 at 08:45:53PM +0300, Sergiu Moga wrote:
> >> In order to properly represent the hardware functionality
> >> in the core, avoid reconverting the number of dummy cycles
> >> to the number of bytes and only work with the former.
> >> Instead, let the drivers that do need this conversion do
> >> it themselves.
> >>
> >> Signed-off-by: Sergiu Moga <sergiu.moga@microchip.com>
> >> ---
> >>   drivers/mtd/spi-nor/core.c        | 22 ++++----------
> > 
> > [...]
> > 
> >>   drivers/spi/spi-dw-core.c         | 10 +++++--
> > 
> > [...]
> > 
> >>   drivers/spi/spi-mem.c             | 27 +++++++++++------
> > 
> > [...]
> > 
> >>   drivers/spi/spi-mtk-nor.c         | 48 +++++++++++++++++--------------
> > 
> > [...]
> > 
> >>   drivers/spi/spi-zynq-qspi.c       | 15 ++++++----
> >>   drivers/spi/spi-zynqmp-gqspi.c    |  8 ++++--
> >>   include/linux/spi/spi-mem.h       | 10 +++----
> >>   25 files changed, 234 insertions(+), 147 deletions(-)
> >>
> >> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> >> index f2c64006f8d7..cc8ca824f912 100644
> >> --- a/drivers/mtd/spi-nor/core.c
> >> +++ b/drivers/mtd/spi-nor/core.c
> >> @@ -88,7 +88,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
> >>        if (op->addr.nbytes)
> >>                op->addr.buswidth = spi_nor_get_protocol_addr_nbits(proto);
> >>
> > 
> > 
> > 
> >> -     if (op->dummy.nbytes)
> >> +     if (op->dummy.ncycles)
> >>                op->dummy.buswidth = spi_nor_get_protocol_addr_nbits(proto);
> >>
> >>        if (op->data.nbytes)
> >> @@ -106,9 +106,6 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
> >>                op->dummy.dtr = true;
> >>                op->data.dtr = true;
> >>
> >> -             /* 2 bytes per clock cycle in DTR mode. */
> >> -             op->dummy.nbytes *= 2;
> >> -
> >>                ext = spi_nor_get_cmd_ext(nor, op);
> >>                op->cmd.opcode = (op->cmd.opcode << 8) | ext;
> >>                op->cmd.nbytes = 2;
> >> @@ -207,10 +204,7 @@ static ssize_t spi_nor_spimem_read_data(struct spi_nor *nor, loff_t from,
> >>
> >>        spi_nor_spimem_setup_op(nor, &op, nor->read_proto);
> >>
> >> -     /* convert the dummy cycles to the number of bytes */
> >> -     op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
> >> -     if (spi_nor_protocol_is_dtr(nor->read_proto))
> >> -             op.dummy.nbytes *= 2;
> >> +     op.dummy.ncycles = nor->read_dummy;
> > 
> > So according to this modification and what is done in the rest of the
> > patch, the dummy part of the SPI-mem operations now contains the number
> > of cycles only. Am I right to think that it means a number of dummy
> > clock oscillations? (Judging from what I've seen in the HW-manuals of
> > the SPI NOR memory devices most likely I am...)
> 
> 
> 
> Yes, you are correct.
> 
> 
> > If so the "ncycles" field
> > is now free from the "data" semantic. Then what is the meaning of the
> > "buswidth and "dtr" fields in the spi_mem_op.dummy field?
> > 
> 
> 

> It is still meaningful as it is used for the conversion by some drivers 
> to nbytes and I do not see how it goes out of the specification in any 
> way. So, at least for now, I do not see any reason to remove these fields.

I do see the way these fields are used in the SPI-mem drivers. I was
wondering what do these bits mean in the framework of the SPI-mem
core? AFAICS from the specification the dummy cycles are irrelevant to
the data bus state. It says "the master tri-states the bus during
'dummy' cycles." If so I don't see a reason to have the DTR and
buswidth fields in the spi_mem_op structure anymore. The number of
cycles could be calculated right on the initialization stage based on
the SPI NOR/NAND requirements.

@Mark, @Tudor, @Pratyush, what do you think?

> 
> 
> >>
> >>        usebouncebuf = spi_nor_spimem_bounce(nor, &op);
> >>
> >> @@ -455,7 +449,7 @@ int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
> >>
> >>                if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
> >>                        op.addr.nbytes = nor->params->rdsr_addr_nbytes;
> >> -                     op.dummy.nbytes = nor->params->rdsr_dummy;
> >> +                     op.dummy.ncycles = nor->params->rdsr_dummy;
> >>                        /*
> >>                         * We don't want to read only one byte in DTR mode. So,
> >>                         * read 2 and then discard the second byte.
> >> @@ -1913,10 +1907,7 @@ static int spi_nor_spimem_check_readop(struct spi_nor *nor,
> >>
> >>        spi_nor_spimem_setup_op(nor, &op, read->proto);
> >>
> >> -     /* convert the dummy cycles to the number of bytes */
> >> -     op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;
> >> -     if (spi_nor_protocol_is_dtr(nor->read_proto))
> >> -             op.dummy.nbytes *= 2;
> >> +     op.dummy.ncycles = nor->read_dummy;
> >>
> >>        return spi_nor_spimem_check_op(nor, &op);
> >>   }
> >> @@ -3034,10 +3025,7 @@ static int spi_nor_create_read_dirmap(struct spi_nor *nor)
> >>
> >>        spi_nor_spimem_setup_op(nor, op, nor->read_proto);
> >>
> >> -     /* convert the dummy cycles to the number of bytes */
> >> -     op->dummy.nbytes = (nor->read_dummy * op->dummy.buswidth) / 8;
> >> -     if (spi_nor_protocol_is_dtr(nor->read_proto))
> >> -             op->dummy.nbytes *= 2;
> >> +     op->dummy.ncycles = nor->read_dummy;
> >>
> >>        /*
> >>         * Since spi_nor_spimem_setup_op() only sets buswidth when the number
> > 
> > [...]
> > 
> >> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
> >> index f87d97ccd2d6..0ba5c7d0e66e 100644
> >> --- a/drivers/spi/spi-dw-core.c
> >> +++ b/drivers/spi/spi-dw-core.c
> >> @@ -498,13 +498,17 @@ static bool dw_spi_supports_mem_op(struct spi_mem *mem,
> >>   static int dw_spi_init_mem_buf(struct dw_spi *dws, const struct spi_mem_op *op)
> >>   {
> >>        unsigned int i, j, len;
> >> -     u8 *out;
> >> +     u8 *out, dummy_nbytes;
> >>
> >>        /*
> >>         * Calculate the total length of the EEPROM command transfer and
> >>         * either use the pre-allocated buffer or create a temporary one.
> >>         */
> >> -     len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
> > 
> >> +     dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> > 
> > 1. What about using the BITS_PER_BYTE macro (linux/bits.h) here? Since
> > you are adding a similar modification to so many drivers what about using
> > that macro there too?
> > 
> 
> 

> AFAICT BIT_PER_BYTE is meant to transparently indicate how many bits per 
> byte an arch has. Although, there is no place in the kernel from what I 
> can see that has BITS_PER_BYTE with a value other than 8, you cannot 
> deny that there exist architectures whose number of bits per byte may be 
> different from 8.

Judging by the way the macro is declared it isn't platform specific.
So no, the kernel always expects the byte having eight bits.

> 
> Meanwhile, the JESD216E specification tells us in the Terms and 
> definitions chapter that
> "DWORD: Four consecutive 8-bit bytes used as the basic 32-bit building 
> block for headers and parameter tables." So it explicitly says that a 
> byte has 8 bits regardless of the arch.

Right. That's what the BITS_PER_BYTE macro is for.

> 
> Therefore, I do not agree with replacing 8 with the BITS_PER_BYTE macro 
> as, IMO, it does not represent the same thing as the number of bits per 
> byte that the terms and definitions of the JESD216E specification refer to.

It represents exactly the same in include/linux/bits.h .

Ideally it would be good to use it in all your updates since you touch
the corresponding parts anyway. But at the very least I would insist on
using the macro in the drivers which already have it utilized like
spi-dw-*, spi-mtk-snfi, spi-mtk-nor. 

> 
> 
> > 2. buswidth is supposed to be always 1 in this driver (see the
> > dw_spi_supports_mem_op() method). So it can be dropped from the
> > statement above.
> > 
> > 3. Since the ncycles now contains a number of clock cycles there is no
> > point in taking the SPI bus-width into account at all. What is
> > meaningful is how many oscillations are supposed to be placed on the
> > CLK line before the data is available. So the op->dummy.ncycles /
> > BITS_PER_BYTE statement would be more appropriate here in any case.
> > 
> 
> 

> I can agee with this in the case of this driver, sure.

Ok. thanks.

> 
> 
> >> +     if (op->dummy.dtr)
> >> +             dummy_nbytes *= 2;
> > 
> > DTR is unsupported by the controller. See, no spi_controller_mem_caps
> > initialized. So this part is redundant. The same is most likely
> > applicable for some of the DTR-related updates in this patch too
> > since the spi_controller_mem_caps structure is initialized in a few
> > drivers only.
> > 
> 
> 

> Agreed. Initially, wherever I was not sure, I just placed this if 
> condition to avoid breaking anything in case the driver does support 
> DTR. The same goes for your other related observations to other driver 
> modifications, with which I agree :).

AFAICS the only drivers which support the DTR-capable transfers are
the ones having the spi_controller_mem_caps structure defined with dtr
set to true or the ones with custom SPI-mem ops. It means that the
DTR-transfers are supported by the spi-mtk-snfi.c, spi-mxic.c,
spi-cadence-quadspi.c and spi-intel.c drivers only. The rest of the
SPI-controller drivers will fail to execute the SPI-mem ops with dtr
flag set due to the spi_mem_default_supports_op() method semantics.

> 
> 
> >> +
> >> +     len = op->cmd.nbytes + op->addr.nbytes + dummy_nbytes;
> >>        if (op->data.dir == SPI_MEM_DATA_OUT)
> >>                len += op->data.nbytes;
> >>
> >> @@ -525,7 +529,7 @@ static int dw_spi_init_mem_buf(struct dw_spi *dws, const struct spi_mem_op *op)
> >>                out[i] = DW_SPI_GET_BYTE(op->cmd.opcode, op->cmd.nbytes - i - 1);
> >>        for (j = 0; j < op->addr.nbytes; ++i, ++j)
> >>                out[i] = DW_SPI_GET_BYTE(op->addr.val, op->addr.nbytes - j - 1);
> >> -     for (j = 0; j < op->dummy.nbytes; ++i, ++j)
> >> +     for (j = 0; j < dummy_nbytes; ++i, ++j)
> >>                out[i] = 0x0;
> >>
> >>        if (op->data.dir == SPI_MEM_DATA_OUT)
> > 
> > [...]
> > 
> >> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> >> index 0c79193d9697..7b204963bb62 100644
> >> --- a/drivers/spi/spi-mem.c
> >> +++ b/drivers/spi/spi-mem.c
> >> @@ -149,7 +149,7 @@ static bool spi_mem_check_buswidth(struct spi_mem *mem,
> >>            spi_check_buswidth_req(mem, op->addr.buswidth, true))
> >>                return false;
> >>
> >> -     if (op->dummy.nbytes &&
> >> +     if (op->dummy.ncycles &&
> >>            spi_check_buswidth_req(mem, op->dummy.buswidth, true))
> >>                return false;
> >>
> >> @@ -202,7 +202,7 @@ static int spi_mem_check_op(const struct spi_mem_op *op)
> >>                return -EINVAL;
> >>
> >>        if ((op->addr.nbytes && !op->addr.buswidth) ||
> >> -         (op->dummy.nbytes && !op->dummy.buswidth) ||
> >> +         (op->dummy.ncycles && !op->dummy.buswidth) ||
> >>            (op->data.nbytes && !op->data.buswidth))
> >>                return -EINVAL;
> >>
> >> @@ -315,7 +315,7 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
> > 
> >>        struct spi_controller *ctlr = mem->spi->controller;
> >>        struct spi_transfer xfers[4] = { };
> >>        struct spi_message msg;
> >> -     u8 *tmpbuf;
> >> +     u8 *tmpbuf, dummy_nbytes;
> >>        int ret;
> > 

> > Reverse xmas tree order?

Please take this note into account. Preserving the locally defined
coding-style convention is a very useful practice. It retains the code
uniformity, which improves readability and maintainability for just no
price.

> > 
> >>
> >>        ret = spi_mem_check_op(op);
> >> @@ -343,7 +343,11 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
> >>                        return ret;
> >>        }
> >>
> > 
> >> -     tmpbufsize = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
> >> +     dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> > 
> > So ncycles now indeed is a number of CLK line oscillations. This most
> > likely will break the SPI Nand driver then, which still passes the
> > number of bytes to the SPI_MEM_OP_DUMMY() macro.
> > 
> >> +     if (op->dummy.dtr)
> >> +             dummy_nbytes *= 2;
> > 
> > Generic SPI-mem ops don't take the DTR mode into account. So I don't
> > see this necessary.
> > 
> 
> 

> You may be right, but this part of the code does take into consideration 
> the number of dummy.nbytes to calculate the xfer length. Therefore, 
> shouldn't this code block also know if the number of dummy nbytes is 
> actually double the amount that it calculated through the conversion 
> formula?

Ok. This part turns to be debatable indeed. On the first glance the
SPI-mem core doesn't anyhow handles the DTR-flag value. On the other
hand SPI-controllers may have the dtr-capability flag set thus, for
instance implicitly supporting the DTR transfers. Finally currently
all the DTR-aware drivers are known to have the custom SPI-mem ops
defined. So some aspects say for dropping the dummy.dtr field usage
from here, some say against it. I'll leave it for you and @Mark,
@Tudor, @Pratyush to decide.

> 
> 
> >> +
> >> +     tmpbufsize = op->cmd.nbytes + op->addr.nbytes + dummy_nbytes;
> >>
> >>        /*
> >>         * Allocate a buffer to transmit the CMD, ADDR cycles with kmalloc() so
> >> @@ -379,15 +383,15 @@ int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
> >>                totalxferlen += op->addr.nbytes;
> >>        }
> >>
> >> -     if (op->dummy.nbytes) {
> >> -             memset(tmpbuf + op->addr.nbytes + 1, 0xff, op->dummy.nbytes);
> >> +     if (dummy_nbytes) {
> >> +             memset(tmpbuf + op->addr.nbytes + 1, 0xff, dummy_nbytes);
> >>                xfers[xferpos].tx_buf = tmpbuf + op->addr.nbytes + 1;
> >> -             xfers[xferpos].len = op->dummy.nbytes;
> >> +             xfers[xferpos].len = dummy_nbytes;
> >>                xfers[xferpos].tx_nbits = op->dummy.buswidth;
> >>                xfers[xferpos].dummy_data = 1;
> >>                spi_message_add_tail(&xfers[xferpos], &msg);
> >>                xferpos++;
> >> -             totalxferlen += op->dummy.nbytes;
> >> +             totalxferlen += dummy_nbytes;
> >>        }
> >>
> >>        if (op->data.nbytes) {
> >> @@ -456,12 +460,17 @@ int spi_mem_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
> >>   {
> > 
> >>        struct spi_controller *ctlr = mem->spi->controller;
> >>        size_t len;
> >> +     u8 dummy_nbytes;
> > 

> > reverse xmas tree?

Please retain the local coding style convention.

> > 
> >>
> >>        if (ctlr->mem_ops && ctlr->mem_ops->adjust_op_size)
> >>                return ctlr->mem_ops->adjust_op_size(mem, op);
> >>
> >> +     dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> >> +     if (op->dummy.dtr)
> >> +             dummy_nbytes *= 2;
> >> +
> >>        if (!ctlr->mem_ops || !ctlr->mem_ops->exec_op) {
> >> -             len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
> >> +             len = op->cmd.nbytes + op->addr.nbytes + dummy_nbytes;
> >>
> >>                if (len > spi_max_transfer_size(mem->spi))
> >>                        return -EINVAL;
> > 
> > [...]
> > 
> >> diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
> >> index d167699a1a96..f6870c6e911a 100644
> >> --- a/drivers/spi/spi-mtk-nor.c
> >> +++ b/drivers/spi/spi-mtk-nor.c
> >> @@ -171,23 +171,18 @@ static bool need_bounce(struct mtk_nor *sp, const struct spi_mem_op *op)
> >>
> >>   static bool mtk_nor_match_read(const struct spi_mem_op *op)
> >>   {
> >> -     int dummy = 0;
> >> -
> >> -     if (op->dummy.nbytes)
> >> -             dummy = op->dummy.nbytes * BITS_PER_BYTE / op->dummy.buswidth;
> >> -
> >>        if ((op->data.buswidth == 2) || (op->data.buswidth == 4)) {
> >>                if (op->addr.buswidth == 1)
> >> -                     return dummy == 8;
> >> +                     return op->dummy.ncycles == 8;
> >>                else if (op->addr.buswidth == 2)
> >> -                     return dummy == 4;
> >> +                     return op->dummy.ncycles == 4;
> >>                else if (op->addr.buswidth == 4)
> >> -                     return dummy == 6;
> >> +                     return op->dummy.ncycles == 6;
> >>        } else if ((op->addr.buswidth == 1) && (op->data.buswidth == 1)) {
> >>                if (op->cmd.opcode == 0x03)
> >> -                     return dummy == 0;
> >> +                     return op->dummy.ncycles == 0;
> >>                else if (op->cmd.opcode == 0x0b)
> >> -                     return dummy == 8;
> >> +                     return op->dummy.ncycles == 8;
> >>        }
> >>        return false;
> >>   }
> >> @@ -195,6 +190,10 @@ static bool mtk_nor_match_read(const struct spi_mem_op *op)
> >>   static bool mtk_nor_match_prg(const struct spi_mem_op *op)
> >>   {
> >>        int tx_len, rx_len, prg_len, prg_left;
> > 


> >> +     u8 dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> >> +
> > 
> > IMO it's better to move the initialization statement to a separate
> > line here.

Again. The initialization statement is too long. It makes the code
harder to read. Just split the declaration and initialization up.

> > 
> >> +     if (op->dummy.dtr)
> >> +             dummy_nbytes *= 2;
> > 

> > Does the MTK SPI driver support DTR? AFAICS it doesn't.

I'll give an answer. It doesn't. The spi_mem_exec_op() will return the
-ENOTSUPP error if an SPI-mem op with any dtr flag set is requested.

> > 
> >>
> >>        // prg mode is spi-only.
> >>        if ((op->cmd.buswidth > 1) || (op->addr.buswidth > 1) ||
> >> @@ -205,7 +204,7 @@ static bool mtk_nor_match_prg(const struct spi_mem_op *op)
> >>
> >>        if (op->data.dir == SPI_MEM_DATA_OUT) {
> >>                // count dummy bytes only if we need to write data after it
> >> -             tx_len += op->dummy.nbytes;
> >> +             tx_len += dummy_nbytes;
> >>
> >>                // leave at least one byte for data
> >>                if (tx_len > MTK_NOR_REG_PRGDATA_MAX)
> >> @@ -221,7 +220,7 @@ static bool mtk_nor_match_prg(const struct spi_mem_op *op)
> >>                        return false;
> >>
> >>                rx_len = op->data.nbytes;
> >> -             prg_left = MTK_NOR_PRG_CNT_MAX / 8 - tx_len - op->dummy.nbytes;
> >> +             prg_left = MTK_NOR_PRG_CNT_MAX / 8 - tx_len - dummy_nbytes;
> >>                if (prg_left > MTK_NOR_REG_SHIFT_MAX + 1)
> >>                        prg_left = MTK_NOR_REG_SHIFT_MAX + 1;
> >>                if (rx_len > prg_left) {
> >> @@ -230,11 +229,11 @@ static bool mtk_nor_match_prg(const struct spi_mem_op *op)
> >>                        rx_len = prg_left;
> >>                }
> >>
> >> -             prg_len = tx_len + op->dummy.nbytes + rx_len;
> >> +             prg_len = tx_len + dummy_nbytes + rx_len;
> >>                if (prg_len > MTK_NOR_PRG_CNT_MAX / 8)
> >>                        return false;
> >>        } else {
> >> -             prg_len = tx_len + op->dummy.nbytes;
> >> +             prg_len = tx_len + dummy_nbytes;
> >>                if (prg_len > MTK_NOR_PRG_CNT_MAX / 8)
> >>                        return false;
> >>        }
> >> @@ -244,15 +243,19 @@ static bool mtk_nor_match_prg(const struct spi_mem_op *op)
> >>   static void mtk_nor_adj_prg_size(struct spi_mem_op *op)
> >>   {
> >>        int tx_len, tx_left, prg_left;
> > 
> >> +     u8 dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> >> +
> >> +     if (op->dummy.dtr)
> >> +             dummy_nbytes *= 2;
> > 
> > ditto
> > 
> >>
> >>        tx_len = op->cmd.nbytes + op->addr.nbytes;
> >>        if (op->data.dir == SPI_MEM_DATA_OUT) {
> >> -             tx_len += op->dummy.nbytes;
> >> +             tx_len += dummy_nbytes;
> >>                tx_left = MTK_NOR_REG_PRGDATA_MAX + 1 - tx_len;
> >>                if (op->data.nbytes > tx_left)
> >>                        op->data.nbytes = tx_left;
> >>        } else if (op->data.dir == SPI_MEM_DATA_IN) {
> >> -             prg_left = MTK_NOR_PRG_CNT_MAX / 8 - tx_len - op->dummy.nbytes;
> >> +             prg_left = MTK_NOR_PRG_CNT_MAX / 8 - tx_len - dummy_nbytes;
> >>                if (prg_left > MTK_NOR_REG_SHIFT_MAX + 1)
> >>                        prg_left = MTK_NOR_REG_SHIFT_MAX + 1;
> >>                if (op->data.nbytes > prg_left)
> >> @@ -312,7 +315,7 @@ static bool mtk_nor_supports_op(struct spi_mem *mem,
> >>                        break;
> >>                case SPI_MEM_DATA_OUT:
> >>                        if ((op->addr.buswidth == 1) &&
> >> -                         (op->dummy.nbytes == 0) &&
> >> +                         (op->dummy.ncycles == 0) &&
> >>                            (op->data.buswidth == 1))
> >>                                return true;
> >>                        break;
> >> @@ -515,17 +518,20 @@ static int mtk_nor_spi_mem_prg(struct mtk_nor *sp, const struct spi_mem_op *op)
> >>        int tx_len, prg_len;
> >>        int i, ret;
> >>        void __iomem *reg;
> > 
> >> -     u8 bufbyte;
> >> +     u8 bufbyte, dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> >> +
> >> +     if (op->dummy.dtr)
> >> +             dummy_nbytes *= 2;
> > 
> > ditto
> > 
> >>
> >>        tx_len = op->cmd.nbytes + op->addr.nbytes;
> >>
> >>        // count dummy bytes only if we need to write data after it
> >>        if (op->data.dir == SPI_MEM_DATA_OUT)
> >> -             tx_len += op->dummy.nbytes + op->data.nbytes;
> >> +             tx_len += dummy_nbytes + op->data.nbytes;
> >>        else if (op->data.dir == SPI_MEM_DATA_IN)
> >>                rx_len = op->data.nbytes;
> >>
> >> -     prg_len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes +
> >> +     prg_len = op->cmd.nbytes + op->addr.nbytes + dummy_nbytes +
> >>                  op->data.nbytes;
> >>
> >>        // an invalid op may reach here if the caller calls exec_op without
> >> @@ -550,7 +556,7 @@ static int mtk_nor_spi_mem_prg(struct mtk_nor *sp, const struct spi_mem_op *op)
> >>        }
> >>
> >>        if (op->data.dir == SPI_MEM_DATA_OUT) {
> >> -             for (i = 0; i < op->dummy.nbytes; i++, reg_offset--) {
> >> +             for (i = 0; i < dummy_nbytes; i++, reg_offset--) {
> >>                        reg = sp->base + MTK_NOR_REG_PRGDATA(reg_offset);
> >>                        writeb(0, reg);
> >>                }
> > 
> > [...]
> > 
> >> diff --git a/drivers/spi/spi-zynq-qspi.c b/drivers/spi/spi-zynq-qspi.c
> >> index 78f31b61a2aa..84b7db85548c 100644
> >> --- a/drivers/spi/spi-zynq-qspi.c
> >> +++ b/drivers/spi/spi-zynq-qspi.c
> >> @@ -527,7 +527,10 @@ static int zynq_qspi_exec_mem_op(struct spi_mem *mem,
> >>   {
> >>        struct zynq_qspi *xqspi = spi_controller_get_devdata(mem->spi->master);
> >>        int err = 0, i;

> >> -     u8 *tmpbuf;
> >> +     u8 *tmpbuf, dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> > 
> > Separate line?

Too long. Split the declaration and initialization up.

> > 
> >> +
> >> +     if (op->dummy.dtr)
> >> +             dummy_nbytes *= 2;
> > 
> > Is DTR supported by the driver?
> > 
> 
> 

> Not from what I can see, but I was not 100% sure so I placed this if 
> statement here just in case.

spi_mem_default_supports_op() will return false for the DTR-available
transfers anyway. So the spi_mem_exec_op() method will fail right at
the start and this part will never be executed if the DTR-mode is
requested.

-Sergey

> 
> 
> 
> >>
> >>        dev_dbg(xqspi->dev, "cmd:%#x mode:%d.%d.%d.%d\n",
> >>                op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
> >> @@ -568,17 +571,17 @@ static int zynq_qspi_exec_mem_op(struct spi_mem *mem,
> >>                        err = -ETIMEDOUT;
> >>        }
> >>
> >> -     if (op->dummy.nbytes) {
> >> -             tmpbuf = kzalloc(op->dummy.nbytes, GFP_KERNEL);
> >> +     if (dummy_nbytes) {
> >> +             tmpbuf = kzalloc(dummy_nbytes, GFP_KERNEL);
> >>                if (!tmpbuf)
> >>                        return -ENOMEM;
> >>
> >> -             memset(tmpbuf, 0xff, op->dummy.nbytes);
> >> +             memset(tmpbuf, 0xff, dummy_nbytes);
> >>                reinit_completion(&xqspi->data_completion);
> >>                xqspi->txbuf = tmpbuf;
> >>                xqspi->rxbuf = NULL;
> >> -             xqspi->tx_bytes = op->dummy.nbytes;
> >> -             xqspi->rx_bytes = op->dummy.nbytes;
> >> +             xqspi->tx_bytes = dummy_nbytes;
> >> +             xqspi->rx_bytes = dummy_nbytes;
> >>                zynq_qspi_write_op(xqspi, ZYNQ_QSPI_FIFO_DEPTH, true);
> >>                zynq_qspi_write(xqspi, ZYNQ_QSPI_IEN_OFFSET,
> >>                                ZYNQ_QSPI_IXR_RXTX_MASK);
> >> diff --git a/drivers/spi/spi-zynqmp-gqspi.c b/drivers/spi/spi-zynqmp-gqspi.c
> >> index c760aac070e5..b41abadef9a6 100644
> >> --- a/drivers/spi/spi-zynqmp-gqspi.c
> >> +++ b/drivers/spi/spi-zynqmp-gqspi.c
> >> @@ -948,6 +948,10 @@ static int zynqmp_qspi_exec_op(struct spi_mem *mem,
> >>        u32 genfifoentry = 0;
> >>        u16 opcode = op->cmd.opcode;
> >>        u64 opaddr;
> > 
> >> +     u8 dummy_nbytes = (op->dummy.ncycles * op->dummy.buswidth) / 8;
> >> +
> >> +     if (op->dummy.dtr)
> >> +             dummy_nbytes *= 2;
> > 
> > ditto
> > 
> >>
> >>        dev_dbg(xqspi->dev, "cmd:%#x mode:%d.%d.%d.%d\n",
> >>                op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
> >> @@ -1006,14 +1010,14 @@ static int zynqmp_qspi_exec_op(struct spi_mem *mem,
> >>                }
> >>        }
> >>
> >> -     if (op->dummy.nbytes) {
> >> +     if (dummy_nbytes) {
> >>                xqspi->txbuf = NULL;
> >>                xqspi->rxbuf = NULL;
> >>                /*
> >>                 * xqspi->bytes_to_transfer here represents the dummy circles
> >>                 * which need to be sent.
> >>                 */
> >> -             xqspi->bytes_to_transfer = op->dummy.nbytes * 8 / op->dummy.buswidth;
> >> +             xqspi->bytes_to_transfer = dummy_nbytes;
> >>                xqspi->bytes_to_receive = 0;
> >>                /*
> >>                 * Using op->data.buswidth instead of op->dummy.buswidth here because
> >> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> >> index 2ba044d0d5e5..5fd45800af03 100644
> >> --- a/include/linux/spi/spi-mem.h
> >> +++ b/include/linux/spi/spi-mem.h
> >> @@ -29,9 +29,9 @@
> >>
> >>   #define SPI_MEM_OP_NO_ADDR   { }
> >>
> > 
> >> -#define SPI_MEM_OP_DUMMY(__nbytes, __buswidth)                       \
> >> +#define SPI_MEM_OP_DUMMY(__ncycles, __buswidth)              \
> >>        {                                                       \
> > 
> >> -             .nbytes = __nbytes,                             \
> >> +             .ncycles = __ncycles,                           \
> >>                .buswidth = __buswidth,                         \
> > 
> > Please make sure this update and the drivers/spi/spi-mem.c driver
> > alterations are coherent with the SPI Nand driver. See the macro usages:
> > include/linux/mtd/spinand.h: SPINAND_PAGE_READ_FROM_*().
> > 
> > -Sergey
> >
> 
> 
> Yes, indeed, I should have paid more attention here. As I have 
> previously said,  I simply replaced dummy.nbytes with the code sequences 
> you now see. I should have checked for SPI_MEM_OP_DUMMY usages as well 
> since I changed its definition. Thank you! :)
> 
> 
> >>        }
> >>
> >> @@ -83,8 +83,8 @@ enum spi_mem_data_dir {
> >>    *         Note that only @addr.nbytes are taken into account in this
> >>    *         address value, so users should make sure the value fits in the
> >>    *         assigned number of bytes.
> >> - * @dummy.nbytes: number of dummy bytes to send after an opcode or address. Can
> >> - *             be zero if the operation does not require dummy bytes
> >> + * @dummy.ncycles: number of dummy cycles after an opcode or address. Can
> >> + *              be zero if the operation does not require dummy cycles
> >>    * @dummy.buswidth: number of IO lanes used to transmit the dummy bytes
> >>    * @dummy.dtr: whether the dummy bytes should be sent in DTR mode or not
> >>    * @data.buswidth: number of IO lanes used to send/receive the data
> >> @@ -112,7 +112,7 @@ struct spi_mem_op {
> >>        } addr;
> >>
> >>        struct {
> >> -             u8 nbytes;
> >> +             u8 ncycles;
> >>                u8 buswidth;
> >>                u8 dtr : 1;
> >>        } dummy;
> >> --
> >> 2.34.1
> >>
> 
> 
> Regards,
> 	Sergiu
