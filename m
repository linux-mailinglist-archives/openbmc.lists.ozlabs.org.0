Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D331E12EEC
	for <lists+openbmc@lfdr.de>; Fri,  3 May 2019 15:24:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wXt30sxJzDqmR
	for <lists+openbmc@lfdr.de>; Fri,  3 May 2019 23:24:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JkMD6dY7"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wXrp2mXKzDqgW
 for <openbmc@lists.ozlabs.org>; Fri,  3 May 2019 23:23:34 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id v9so5129600iol.10
 for <openbmc@lists.ozlabs.org>; Fri, 03 May 2019 06:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GGfTxGk/8XUp/vMUUCQvy3jMTL/VREFo4dL0ld3IS4s=;
 b=JkMD6dY73/06HhlKbxpx1DaZ6O1c55iZpMaZ8bHAr1HpBi7Yi6LP9tOXjoWKjeBBf3
 AtYR+wGbmvJ4THSPCdR+kdAH8gTzwGs09PQBrhMw+EHSe5u604rtjg7WWxIYXdSbQuEu
 lqf+LcliR9yHjUNt5TiIHwJ0Gl561HjprhhA9yM4nDu73/OWBKjAk9utXDZOZXmX0nyI
 wnAjgTtsQ7r8GWG0N3hvC3lKAnUNHfzopH4LBL9LoEmqeoxzI0VM1oQ9FZTofDQW6Itx
 hQFb208Bt4+p10y5fyxUI2CUUGX42ssVBJbEDtgq1gXuv1lhWzyCnC78TUnpwHgogs/8
 3Ivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GGfTxGk/8XUp/vMUUCQvy3jMTL/VREFo4dL0ld3IS4s=;
 b=tlB0sd8WJQ08/TC1MJsU47gHl08JZJ861bxaZrpWsfP7V1P5x6NHICYlIzD7pbvobT
 GGdmNl17n3AgUeb4Btrenj2Q8/6tFcesGrRT0oH966t7SyJS/b+rXJyfclfKSQejSBjD
 V6g+7OTdr49FPXJ7ZE7y3pVRRgois5KyuZ/pISilUw33KGgRMNMDMyIdQdp8Z4EVHklE
 Mda7eTAuunGdNkm9VuHmsj+Zy6Qeto28jROmLBudI6HvPQiyeqs8F6wF9N5h4v+td2le
 dm/Pyduk1Urw3nq+JqTEBbu6PHU2duG7Y8zmSZb0YRUkr2wCHY87hMbM/jZbD0ELlmwx
 KzYQ==
X-Gm-Message-State: APjAAAX0IK29rwu/NVVbP+XySI+szvt0dLMvXkH+LBcJiC2RMPzHy6yf
 9Wvs7VfrEy+4EH7k1joNgOaB4fHZ5xjsPGIG6H4=
X-Google-Smtp-Source: APXvYqwUIFGbeO9jT05XrRwsuACU9XlLbUSJkB54SZAfHMlmp9l2y071P2KYhFXN8e1gf5lkTHP/ts2H4K3qVPnA9fw=
X-Received: by 2002:a05:6602:146:: with SMTP id
 v6mr6257949iot.275.1556889811435; 
 Fri, 03 May 2019 06:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190416111631.356803-1-tmaimon77@gmail.com>
 <20190416111631.356803-3-tmaimon77@gmail.com>
In-Reply-To: <20190416111631.356803-3-tmaimon77@gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Fri, 3 May 2019 16:30:35 +0300
Message-ID: <CAP6Zq1jfpyJX6g8k7G-VJtO2qrUZcgt1SLizdfCz36z6pOazKw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] misc: npcm: add NPCM LPC BPC driver
To: Greg KH <gregkh@linuxfoundation.org>, arnd@arnd.de, 
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>,
 Brendan Higgins <brendanhiggins@google.com>, 
 Avi Fishman <avifishman70@gmail.com>, Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="0000000000002a450c0587fba816"
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
Cc: Linux HWMON List <linux-hwmon@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000002a450c0587fba816
Content-Type: text/plain; charset="UTF-8"

Hi,

It will be great if one of the maintainers can take a look in NPCM LPC
snoop driver :-)

Thanks in advance,

Tomer

On Tue, 16 Apr 2019 at 14:19, Tomer Maimon <tmaimon77@gmail.com> wrote:

> Add Nuvoton BMC NPCM BIOS post code (BPC) driver.
>
> The NPCM BPC monitoring two I/O address written by
> the host on the Low Pin Count (LPC) bus, the capure
> data stored in 128-word FIFO.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  drivers/misc/Kconfig              |   8 +
>  drivers/misc/Makefile             |   1 +
>  drivers/misc/npcm-lpc-bpc-snoop.c | 385
> ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 394 insertions(+)
>  create mode 100644 drivers/misc/npcm-lpc-bpc-snoop.c
>
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 42ab8ec92a04..320a1d0083d2 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -532,6 +532,14 @@ config PVPANIC
>           a paravirtualized device provided by QEMU; it lets a virtual
> machine
>           (guest) communicate panic events to the host.
>
> +config NPCM_LPC_BPC_SNOOP
> +       tristate "NPCM LPC BIOS Post Code snoop support"
> +       depends on (ARCH_NPCM || COMPILE_TEST)
> +       help
> +         Provides a NPCM BMC driver to control the LPC BIOS Post Code
> +         interface which allows the BMC to monitoring and save
> +         the data written by the host to an arbitrary LPC I/O port.
> +
>  source "drivers/misc/c2port/Kconfig"
>  source "drivers/misc/eeprom/Kconfig"
>  source "drivers/misc/cb710/Kconfig"
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index d5b7d3404dc7..5dd0bff75b60 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -59,5 +59,6 @@ obj-$(CONFIG_ASPEED_LPC_SNOOP)        +=
> aspeed-lpc-snoop.o
>  obj-$(CONFIG_PCI_ENDPOINT_TEST)        += pci_endpoint_test.o
>  obj-$(CONFIG_OCXL)             += ocxl/
>  obj-y                          += cardreader/
> +obj-$(CONFIG_NPCM_LPC_BPC_SNOOP) += npcm-lpc-bpc-snoop.o
>  obj-$(CONFIG_PVPANIC)          += pvpanic.o
>  obj-$(CONFIG_HABANA_AI)                += habanalabs/
> diff --git a/drivers/misc/npcm-lpc-bpc-snoop.c
> b/drivers/misc/npcm-lpc-bpc-snoop.c
> new file mode 100644
> index 000000000000..9b7f7313e14d
> --- /dev/null
> +++ b/drivers/misc/npcm-lpc-bpc-snoop.c
> @@ -0,0 +1,385 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2014-2018 Nuvoton Technology corporation.
> +
> +#include <linux/fs.h>
> +#include <linux/bitops.h>
> +#include <linux/interrupt.h>
> +#include <linux/kfifo.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/miscdevice.h>
> +#include <linux/poll.h>
> +
> +#define DEVICE_NAME    "npcm-lpc-bpc"
> +
> +#define NUM_BPC_CHANNELS               2
> +#define DW_PAD_SIZE                    3
> +
> +/* BIOS POST Code FIFO Registers */
> +#define NPCM_BPCFA2L_REG       0x2 //BIOS POST Code FIFO Address 2 LSB
> +#define NPCM_BPCFA2M_REG       0x4 //BIOS POST Code FIFO Address 2 MSB
> +#define NPCM_BPCFEN_REG        0x6 //BIOS POST Code FIFO Enable
> +#define NPCM_BPCFSTAT_REG      0x8 //BIOS POST Code FIFO Status
> +#define NPCM_BPCFDATA_REG      0xA //BIOS POST Code FIFO Data
> +#define NPCM_BPCFMSTAT_REG     0xC //BIOS POST Code FIFO Miscellaneous
> Status
> +#define NPCM_BPCFA1L_REG       0x10 //BIOS POST Code FIFO Address 1 LSB
> +#define NPCM_BPCFA1M_REG       0x12 //BIOS POST Code FIFO Address 1 MSB
> +
> +/*BIOS regiser data*/
> +#define FIFO_IOADDR1_ENABLE    0x80
> +#define FIFO_IOADDR2_ENABLE    0x40
> +
> +/* BPC interface package and structure definition */
> +#define BPC_KFIFO_SIZE         0x400
> +
> +/*BPC regiser data*/
> +#define FIFO_DATA_VALID                0x80
> +#define FIFO_OVERFLOW          0x20
> +#define FIFO_READY_INT_ENABLE  0x8
> +#define FIFO_DWCAPTURE         0x4
> +#define FIFO_ADDR_DECODE       0x1
> +
> +/*Host Reset*/
> +#define HOST_RESET_INT_ENABLE  0x10
> +#define HOST_RESET_CHANGED     0x40
> +
> +struct npcm_bpc_channel {
> +       struct npcm_bpc *data;
> +       struct kfifo            fifo;
> +       wait_queue_head_t       wq;
> +       bool                    host_reset;
> +       struct miscdevice       miscdev;
> +};
> +
> +struct npcm_bpc {
> +       void __iomem                    *base;
> +       int                             irq;
> +       bool                            en_dwcap;
> +       struct npcm_bpc_channel ch[NUM_BPC_CHANNELS];
> +};
> +
> +static struct npcm_bpc_channel *npcm_file_to_ch(struct file *file)
> +{
> +       return container_of(file->private_data, struct npcm_bpc_channel,
> +                           miscdev);
> +}
> +
> +static ssize_t npcm_bpc_read(struct file *file, char __user *buffer,
> +                            size_t count, loff_t *ppos)
> +{
> +       struct npcm_bpc_channel *chan = npcm_file_to_ch(file);
> +       struct npcm_bpc *lpc_bpc = chan->data;
> +       unsigned int copied;
> +       int ret = 0;
> +       int cond_size = 1;
> +
> +       if (lpc_bpc->en_dwcap)
> +               cond_size = 3;
> +
> +       if (kfifo_len(&chan->fifo) < cond_size) {
> +               if (file->f_flags & O_NONBLOCK)
> +                       return -EAGAIN;
> +
> +               ret = wait_event_interruptible
> +                       (chan->wq, kfifo_len(&chan->fifo) > cond_size);
> +               if (ret == -ERESTARTSYS)
> +                       return -EINTR;
> +       }
> +
> +       ret = kfifo_to_user(&chan->fifo, buffer, count, &copied);
> +
> +       return ret ? ret : copied;
> +}
> +
> +static __poll_t npcm_bpc_poll(struct file *file, struct poll_table_struct
> *pt)
> +{
> +       struct npcm_bpc_channel *chan = npcm_file_to_ch(file);
> +       __poll_t mask = 0;
> +
> +       poll_wait(file, &chan->wq, pt);
> +       if (!kfifo_is_empty(&chan->fifo))
> +               mask |= POLLIN;
> +
> +       if (chan->host_reset) {
> +               mask |= POLLHUP;
> +               chan->host_reset = false;
> +       }
> +
> +       return mask;
> +}
> +
> +static const struct file_operations npcm_bpc_fops = {
> +       .owner          = THIS_MODULE,
> +       .read           = npcm_bpc_read,
> +       .poll           = npcm_bpc_poll,
> +       .llseek         = noop_llseek,
> +};
> +
> +static irqreturn_t npcm_bpc_irq(int irq, void *arg)
> +{
> +       struct npcm_bpc *lpc_bpc = arg;
> +       u8 fifo_st;
> +       u8 host_st;
> +       u8 addr_index = 0;
> +       u8 Data;
> +       u8 padzero[3] = {0};
> +       u8 last_addr_bit = 0;
> +       bool isr_flag = false;
> +
> +       fifo_st = ioread8(lpc_bpc->base + NPCM_BPCFSTAT_REG);
> +       while (FIFO_DATA_VALID & fifo_st) {
> +                /* If dwcapture enabled only channel 0 (FIFO 0) used */
> +               if (!lpc_bpc->en_dwcap)
> +                       addr_index = fifo_st & FIFO_ADDR_DECODE;
> +               else
> +                       last_addr_bit = fifo_st & FIFO_ADDR_DECODE;
> +
> +               /*Read data from FIFO to clear interrupt*/
> +               Data = ioread8(lpc_bpc->base + NPCM_BPCFDATA_REG);
> +               if (kfifo_is_full(&lpc_bpc->ch[addr_index].fifo))
> +                       kfifo_skip(&lpc_bpc->ch[addr_index].fifo);
> +               kfifo_put(&lpc_bpc->ch[addr_index].fifo, Data);
> +               if (fifo_st & FIFO_OVERFLOW)
> +                       pr_info("BIOS Post Codes FIFO Overflow!!!\n");
> +
> +               fifo_st = ioread8(lpc_bpc->base + NPCM_BPCFSTAT_REG);
> +               if (lpc_bpc->en_dwcap && last_addr_bit) {
> +                       if ((fifo_st & FIFO_ADDR_DECODE) ||
> +                           ((FIFO_DATA_VALID & fifo_st) == 0)) {
> +                               while
> (kfifo_avail(&lpc_bpc->ch[addr_index].fifo) < DW_PAD_SIZE)
> +
>  kfifo_skip(&lpc_bpc->ch[addr_index].fifo);
> +                               kfifo_in(&lpc_bpc->ch[addr_index].fifo,
> +                                        padzero, DW_PAD_SIZE);
> +                       }
> +               }
> +               isr_flag = true;
> +       }
> +
> +       host_st = ioread8(lpc_bpc->base + NPCM_BPCFMSTAT_REG);
> +       if (host_st & HOST_RESET_CHANGED) {
> +               iowrite8(HOST_RESET_CHANGED,
> +                        lpc_bpc->base + NPCM_BPCFMSTAT_REG);
> +               lpc_bpc->ch[addr_index].host_reset = true;
> +               isr_flag = true;
> +       }
> +
> +       if (isr_flag) {
> +               wake_up_interruptible(&lpc_bpc->ch[addr_index].wq);
> +               return IRQ_HANDLED;
> +       }
> +
> +       return IRQ_NONE;
> +}
> +
> +static int npcm_bpc_config_irq(struct npcm_bpc *lpc_bpc,
> +                              struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       int rc;
> +
> +       lpc_bpc->irq = platform_get_irq(pdev, 0);
> +       if (lpc_bpc->irq < 0) {
> +               dev_err(dev, "get IRQ failed\n");
> +               return lpc_bpc->irq;
> +       }
> +
> +       rc = devm_request_irq(dev, lpc_bpc->irq,
> +                             npcm_bpc_irq, IRQF_SHARED,
> +                             DEVICE_NAME, lpc_bpc);
> +       if (rc < 0) {
> +               dev_warn(dev, "Unable to request IRQ %d\n", lpc_bpc->irq);
> +               return rc;
> +       }
> +
> +       return 0;
> +}
> +
> +static int npcm_enable_bpc(struct npcm_bpc *lpc_bpc, struct device *dev,
> +                          int channel, u16 lpc_port)
> +{
> +       int rc;
> +       u8 addr_en, reg_en;
> +
> +       init_waitqueue_head(&lpc_bpc->ch[channel].wq);
> +
> +       rc = kfifo_alloc(&lpc_bpc->ch[channel].fifo,
> +                        BPC_KFIFO_SIZE, GFP_KERNEL);
> +       if (rc)
> +               return rc;
> +
> +       lpc_bpc->ch[channel].miscdev.minor = MISC_DYNAMIC_MINOR;
> +       lpc_bpc->ch[channel].miscdev.name =
> +               devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME,
> channel);
> +       lpc_bpc->ch[channel].miscdev.fops = &npcm_bpc_fops;
> +       lpc_bpc->ch[channel].miscdev.parent = dev;
> +       rc = misc_register(&lpc_bpc->ch[channel].miscdev);
> +       if (rc)
> +               return rc;
> +
> +       lpc_bpc->ch[channel].data = lpc_bpc;
> +       lpc_bpc->ch[channel].host_reset = false;
> +
> +       /* Enable LPC snoop channel at requested port */
> +       switch (channel) {
> +       case 0:
> +               addr_en = FIFO_IOADDR1_ENABLE;
> +               iowrite8((u8)lpc_port & 0xFF,
> +                        lpc_bpc->base + NPCM_BPCFA1L_REG);
> +               iowrite8((u8)(lpc_port >> 8),
> +                        lpc_bpc->base + NPCM_BPCFA1M_REG);
> +               break;
> +       case 1:
> +               addr_en = FIFO_IOADDR2_ENABLE;
> +               iowrite8((u8)lpc_port & 0xFF,
> +                        lpc_bpc->base + NPCM_BPCFA2L_REG);
> +               iowrite8((u8)(lpc_port >> 8),
> +                        lpc_bpc->base + NPCM_BPCFA2M_REG);
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       if (lpc_bpc->en_dwcap)
> +               addr_en = FIFO_DWCAPTURE;
> +
> +       /*
> +        * Enable FIFO Ready Interrupt, FIFO Capture of I/O addr,
> +        * and Host Reset
> +        */
> +       reg_en = ioread8(lpc_bpc->base + NPCM_BPCFEN_REG);
> +       iowrite8(reg_en | addr_en | FIFO_READY_INT_ENABLE |
> +                HOST_RESET_INT_ENABLE, lpc_bpc->base + NPCM_BPCFEN_REG);
> +
> +       return 0;
> +}
> +
> +static void npcm_disable_bpc(struct npcm_bpc *lpc_bpc, int channel)
> +{
> +       u8 reg_en;
> +
> +       switch (channel) {
> +       case 0:
> +               reg_en = ioread8(lpc_bpc->base + NPCM_BPCFEN_REG);
> +               if (lpc_bpc->en_dwcap)
> +                       iowrite8(reg_en & ~FIFO_DWCAPTURE,
> +                                lpc_bpc->base + NPCM_BPCFEN_REG);
> +               else
> +                       iowrite8(reg_en & ~FIFO_IOADDR1_ENABLE,
> +                                lpc_bpc->base + NPCM_BPCFEN_REG);
> +               break;
> +       case 1:
> +               reg_en = ioread8(lpc_bpc->base + NPCM_BPCFEN_REG);
> +               iowrite8(reg_en & ~FIFO_IOADDR2_ENABLE,
> +                        lpc_bpc->base + NPCM_BPCFEN_REG);
> +               break;
> +       default:
> +               return;
> +       }
> +
> +       if (!(reg_en & (FIFO_IOADDR1_ENABLE | FIFO_IOADDR2_ENABLE)))
> +               iowrite8(reg_en &
> +                        ~(FIFO_READY_INT_ENABLE | HOST_RESET_INT_ENABLE),
> +                        lpc_bpc->base + NPCM_BPCFEN_REG);
> +
> +       kfifo_free(&lpc_bpc->ch[channel].fifo);
> +       misc_deregister(&lpc_bpc->ch[channel].miscdev);
> +}
> +
> +static int npcm_bpc_probe(struct platform_device *pdev)
> +{
> +       struct npcm_bpc *lpc_bpc;
> +       struct device *dev;
> +       u32 port;
> +       int rc;
> +
> +       dev = &pdev->dev;
> +
> +       lpc_bpc = devm_kzalloc(dev, sizeof(*lpc_bpc), GFP_KERNEL);
> +       if (!lpc_bpc)
> +               return -ENOMEM;
> +
> +       lpc_bpc->base = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(lpc_bpc->base))
> +               return PTR_ERR(lpc_bpc->base);
> +
> +       dev_set_drvdata(&pdev->dev, lpc_bpc);
> +
> +       rc = of_property_read_u32_index(dev->of_node, "snoop-ports", 0,
> +                                       &port);
> +       if (rc) {
> +               dev_err(dev, "no snoop ports configured\n");
> +               return -ENODEV;
> +       }
> +
> +       lpc_bpc->en_dwcap =
> +               of_property_read_bool(dev->of_node,
> "nuvoton,lpc-en-dwcapture");
> +
> +       rc = npcm_bpc_config_irq(lpc_bpc, pdev);
> +       if (rc)
> +               return rc;
> +
> +       rc = npcm_enable_bpc(lpc_bpc, dev, 0, port);
> +       if (rc) {
> +               dev_err(dev, "Enable BIOS post code I/O port 0 failed\n");
> +               return rc;
> +       }
> +
> +       /*
> +        * Configuration of second BPC channel port is optional
> +        * Double-Word Capture ignoring address 2
> +        */
> +       if (!lpc_bpc->en_dwcap) {
> +               if (of_property_read_u32_index(dev->of_node, "snoop-ports",
> +                                              1, &port) == 0) {
> +                       rc = npcm_enable_bpc(lpc_bpc, dev, 1, port);
> +                       if (rc) {
> +                               dev_err(dev, "Enable BIOS post code I/O
> port 1 failed, disable I/O port 0\n");
> +                               npcm_disable_bpc(lpc_bpc, 0);
> +                               return rc;
> +                       }
> +               }
> +       }
> +
> +       pr_info("NPCM BIOS post code probe\n");
> +
> +       return rc;
> +}
> +
> +static int npcm_bpc_remove(struct platform_device *pdev)
> +{
> +       struct npcm_bpc *lpc_bpc = dev_get_drvdata(&pdev->dev);
> +       u8 reg_en;
> +
> +       reg_en = ioread8(lpc_bpc->base + NPCM_BPCFEN_REG);
> +
> +       if (reg_en & FIFO_IOADDR1_ENABLE)
> +               npcm_disable_bpc(lpc_bpc, 0);
> +       if (reg_en & FIFO_IOADDR2_ENABLE)
> +               npcm_disable_bpc(lpc_bpc, 1);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id npcm_bpc_match[] = {
> +       { .compatible = "nuvoton,npcm750-lpc-bpc-snoop" },
> +       { },
> +};
> +
> +static struct platform_driver npcm_bpc_driver = {
> +       .driver = {
> +               .name           = DEVICE_NAME,
> +               .of_match_table = npcm_bpc_match,
> +       },
> +       .probe = npcm_bpc_probe,
> +       .remove = npcm_bpc_remove,
> +};
> +
> +module_platform_driver(npcm_bpc_driver);
> +
> +MODULE_DEVICE_TABLE(of, npcm_bpc_match);
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
> +MODULE_DESCRIPTION("Linux driver to control NPCM LPC BIOS post code
> snooping");
> --
> 2.14.1
>
>

--0000000000002a450c0587fba816
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+SGksPGRpdj48YnI+PC9kaXY+PGRpdj5JdCB3aWxsIGJlIGdyZWF0IGlm
IG9uZSBvZiB0aGUgbWFpbnRhaW5lcnMgY2FuIHRha2UgYSBsb29rIGluIE5QQ00gTFBDIHNub29w
IGRyaXZlciA6LSk8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlRoYW5rcyBpbiBhZHZhbmNlLDwv
ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VG9tZXI8L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFzcz0i
Z21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBUdWUsIDE2
IEFwciAyMDE5IGF0IDE0OjE5LCBUb21lciBNYWltb24gJmx0OzxhIGhyZWY9Im1haWx0bzp0bWFp
bW9uNzdAZ21haWwuY29tIj50bWFpbW9uNzdAZ21haWwuY29tPC9hPiZndDsgd3JvdGU6PGJyPjwv
ZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4
IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5n
LWxlZnQ6MWV4Ij5BZGQgTnV2b3RvbiBCTUMgTlBDTSBCSU9TIHBvc3QgY29kZSAoQlBDKSBkcml2
ZXIuPGJyPg0KPGJyPg0KVGhlIE5QQ00gQlBDIG1vbml0b3JpbmcgdHdvIEkvTyBhZGRyZXNzIHdy
aXR0ZW4gYnk8YnI+DQp0aGUgaG9zdCBvbiB0aGUgTG93IFBpbiBDb3VudCAoTFBDKSBidXMsIHRo
ZSBjYXB1cmU8YnI+DQpkYXRhIHN0b3JlZCBpbiAxMjgtd29yZCBGSUZPLjxicj4NCjxicj4NClNp
Z25lZC1vZmYtYnk6IFRvbWVyIE1haW1vbiAmbHQ7PGEgaHJlZj0ibWFpbHRvOnRtYWltb243N0Bn
bWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj50bWFpbW9uNzdAZ21haWwuY29tPC9hPiZndDs8YnI+
DQotLS08YnI+DQrCoGRyaXZlcnMvbWlzYy9LY29uZmlnwqAgwqAgwqAgwqAgwqAgwqAgwqAgfMKg
IMKgOCArPGJyPg0KwqBkcml2ZXJzL21pc2MvTWFrZWZpbGXCoCDCoCDCoCDCoCDCoCDCoCDCoHzC
oCDCoDEgKzxicj4NCsKgZHJpdmVycy9taXNjL25wY20tbHBjLWJwYy1zbm9vcC5jIHwgMzg1ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrPGJyPg0KwqAzIGZpbGVzIGNoYW5n
ZWQsIDM5NCBpbnNlcnRpb25zKCspPGJyPg0KwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9t
aXNjL25wY20tbHBjLWJwYy1zbm9vcC5jPGJyPg0KPGJyPg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bWlzYy9LY29uZmlnIGIvZHJpdmVycy9taXNjL0tjb25maWc8YnI+DQppbmRleCA0MmFiOGVjOTJh
MDQuLjMyMGExZDAwODNkMiAxMDA2NDQ8YnI+DQotLS0gYS9kcml2ZXJzL21pc2MvS2NvbmZpZzxi
cj4NCisrKyBiL2RyaXZlcnMvbWlzYy9LY29uZmlnPGJyPg0KQEAgLTUzMiw2ICs1MzIsMTQgQEAg
Y29uZmlnIFBWUEFOSUM8YnI+DQrCoCDCoCDCoCDCoCDCoCBhIHBhcmF2aXJ0dWFsaXplZCBkZXZp
Y2UgcHJvdmlkZWQgYnkgUUVNVTsgaXQgbGV0cyBhIHZpcnR1YWwgbWFjaGluZTxicj4NCsKgIMKg
IMKgIMKgIMKgIChndWVzdCkgY29tbXVuaWNhdGUgcGFuaWMgZXZlbnRzIHRvIHRoZSBob3N0Ljxi
cj4NCjxicj4NCitjb25maWcgTlBDTV9MUENfQlBDX1NOT09QPGJyPg0KK8KgIMKgIMKgIMKgdHJp
c3RhdGUgJnF1b3Q7TlBDTSBMUEMgQklPUyBQb3N0IENvZGUgc25vb3Agc3VwcG9ydCZxdW90Ozxi
cj4NCivCoCDCoCDCoCDCoGRlcGVuZHMgb24gKEFSQ0hfTlBDTSB8fCBDT01QSUxFX1RFU1QpPGJy
Pg0KK8KgIMKgIMKgIMKgaGVscDxicj4NCivCoCDCoCDCoCDCoCDCoFByb3ZpZGVzIGEgTlBDTSBC
TUMgZHJpdmVyIHRvIGNvbnRyb2wgdGhlIExQQyBCSU9TIFBvc3QgQ29kZTxicj4NCivCoCDCoCDC
oCDCoCDCoGludGVyZmFjZSB3aGljaCBhbGxvd3MgdGhlIEJNQyB0byBtb25pdG9yaW5nIGFuZCBz
YXZlPGJyPg0KK8KgIMKgIMKgIMKgIMKgdGhlIGRhdGEgd3JpdHRlbiBieSB0aGUgaG9zdCB0byBh
biBhcmJpdHJhcnkgTFBDIEkvTyBwb3J0Ljxicj4NCis8YnI+DQrCoHNvdXJjZSAmcXVvdDtkcml2
ZXJzL21pc2MvYzJwb3J0L0tjb25maWcmcXVvdDs8YnI+DQrCoHNvdXJjZSAmcXVvdDtkcml2ZXJz
L21pc2MvZWVwcm9tL0tjb25maWcmcXVvdDs8YnI+DQrCoHNvdXJjZSAmcXVvdDtkcml2ZXJzL21p
c2MvY2I3MTAvS2NvbmZpZyZxdW90Ozxicj4NCmRpZmYgLS1naXQgYS9kcml2ZXJzL21pc2MvTWFr
ZWZpbGUgYi9kcml2ZXJzL21pc2MvTWFrZWZpbGU8YnI+DQppbmRleCBkNWI3ZDM0MDRkYzcuLjVk
ZDBiZmY3NWI2MCAxMDA2NDQ8YnI+DQotLS0gYS9kcml2ZXJzL21pc2MvTWFrZWZpbGU8YnI+DQor
KysgYi9kcml2ZXJzL21pc2MvTWFrZWZpbGU8YnI+DQpAQCAtNTksNSArNTksNiBAQCBvYmotJChD
T05GSUdfQVNQRUVEX0xQQ19TTk9PUCnCoCDCoCDCoCDCoCArPSBhc3BlZWQtbHBjLXNub29wLm88
YnI+DQrCoG9iai0kKENPTkZJR19QQ0lfRU5EUE9JTlRfVEVTVCnCoCDCoCDCoCDCoCArPSBwY2lf
ZW5kcG9pbnRfdGVzdC5vPGJyPg0KwqBvYmotJChDT05GSUdfT0NYTCnCoCDCoCDCoCDCoCDCoCDC
oCDCoCs9IG9jeGwvPGJyPg0KwqBvYmotecKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgICs9IGNhcmRyZWFkZXIvPGJyPg0KK29iai0kKENPTkZJR19OUENNX0xQQ19CUENfU05P
T1ApICs9IG5wY20tbHBjLWJwYy1zbm9vcC5vPGJyPg0KwqBvYmotJChDT05GSUdfUFZQQU5JQynC
oCDCoCDCoCDCoCDCoCArPSBwdnBhbmljLm88YnI+DQrCoG9iai0kKENPTkZJR19IQUJBTkFfQUkp
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKz0gaGFiYW5hbGFicy88YnI+DQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9taXNjL25wY20tbHBjLWJwYy1zbm9vcC5jIGIvZHJpdmVycy9taXNjL25wY20tbHBj
LWJwYy1zbm9vcC5jPGJyPg0KbmV3IGZpbGUgbW9kZSAxMDA2NDQ8YnI+DQppbmRleCAwMDAwMDAw
MDAwMDAuLjliN2Y3MzEzZTE0ZDxicj4NCi0tLSAvZGV2L251bGw8YnI+DQorKysgYi9kcml2ZXJz
L21pc2MvbnBjbS1scGMtYnBjLXNub29wLmM8YnI+DQpAQCAtMCwwICsxLDM4NSBAQDxicj4NCisv
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMDxicj4NCisvLyBDb3B5cmlnaHQgKGMp
IDIwMTQtMjAxOCBOdXZvdG9uIFRlY2hub2xvZ3kgY29ycG9yYXRpb24uPGJyPg0KKzxicj4NCisj
aW5jbHVkZSAmbHQ7bGludXgvZnMuaCZndDs8YnI+DQorI2luY2x1ZGUgJmx0O2xpbnV4L2JpdG9w
cy5oJmd0Ozxicj4NCisjaW5jbHVkZSAmbHQ7bGludXgvaW50ZXJydXB0LmgmZ3Q7PGJyPg0KKyNp
bmNsdWRlICZsdDtsaW51eC9rZmlmby5oJmd0Ozxicj4NCisjaW5jbHVkZSAmbHQ7bGludXgvbWZk
L3N5c2Nvbi5oJmd0Ozxicj4NCisjaW5jbHVkZSAmbHQ7bGludXgvbW9kdWxlLmgmZ3Q7PGJyPg0K
KyNpbmNsdWRlICZsdDtsaW51eC9vZi5oJmd0Ozxicj4NCisjaW5jbHVkZSAmbHQ7bGludXgvcGxh
dGZvcm1fZGV2aWNlLmgmZ3Q7PGJyPg0KKyNpbmNsdWRlICZsdDtsaW51eC9yZWdtYXAuaCZndDs8
YnI+DQorI2luY2x1ZGUgJmx0O2xpbnV4L21pc2NkZXZpY2UuaCZndDs8YnI+DQorI2luY2x1ZGUg
Jmx0O2xpbnV4L3BvbGwuaCZndDs8YnI+DQorPGJyPg0KKyNkZWZpbmUgREVWSUNFX05BTUXCoCDC
oCAmcXVvdDtucGNtLWxwYy1icGMmcXVvdDs8YnI+DQorPGJyPg0KKyNkZWZpbmUgTlVNX0JQQ19D
SEFOTkVMU8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgMjxicj4NCisjZGVmaW5lIERXX1BBRF9TSVpF
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMzxicj4NCis8YnI+DQorLyogQklPUyBQT1NU
IENvZGUgRklGTyBSZWdpc3RlcnMgKi88YnI+DQorI2RlZmluZSBOUENNX0JQQ0ZBMkxfUkVHwqAg
wqAgwqAgwqAweDIgLy9CSU9TIFBPU1QgQ29kZSBGSUZPIEFkZHJlc3MgMiBMU0I8YnI+DQorI2Rl
ZmluZSBOUENNX0JQQ0ZBMk1fUkVHwqAgwqAgwqAgwqAweDQgLy9CSU9TIFBPU1QgQ29kZSBGSUZP
IEFkZHJlc3MgMiBNU0I8YnI+DQorI2RlZmluZSBOUENNX0JQQ0ZFTl9SRUfCoCDCoCDCoCDCoCAw
eDYgLy9CSU9TIFBPU1QgQ29kZSBGSUZPIEVuYWJsZTxicj4NCisjZGVmaW5lIE5QQ01fQlBDRlNU
QVRfUkVHwqAgwqAgwqAgMHg4IC8vQklPUyBQT1NUIENvZGUgRklGTyBTdGF0dXM8YnI+DQorI2Rl
ZmluZSBOUENNX0JQQ0ZEQVRBX1JFR8KgIMKgIMKgIDB4QSAvL0JJT1MgUE9TVCBDb2RlIEZJRk8g
RGF0YTxicj4NCisjZGVmaW5lIE5QQ01fQlBDRk1TVEFUX1JFR8KgIMKgIMKgMHhDIC8vQklPUyBQ
T1NUIENvZGUgRklGTyBNaXNjZWxsYW5lb3VzIFN0YXR1czxicj4NCisjZGVmaW5lIE5QQ01fQlBD
RkExTF9SRUfCoCDCoCDCoCDCoDB4MTAgLy9CSU9TIFBPU1QgQ29kZSBGSUZPIEFkZHJlc3MgMSBM
U0I8YnI+DQorI2RlZmluZSBOUENNX0JQQ0ZBMU1fUkVHwqAgwqAgwqAgwqAweDEyIC8vQklPUyBQ
T1NUIENvZGUgRklGTyBBZGRyZXNzIDEgTVNCPGJyPg0KKzxicj4NCisvKkJJT1MgcmVnaXNlciBk
YXRhKi88YnI+DQorI2RlZmluZSBGSUZPX0lPQUREUjFfRU5BQkxFwqAgwqAgMHg4MDxicj4NCisj
ZGVmaW5lIEZJRk9fSU9BRERSMl9FTkFCTEXCoCDCoCAweDQwPGJyPg0KKzxicj4NCisvKiBCUEMg
aW50ZXJmYWNlIHBhY2thZ2UgYW5kIHN0cnVjdHVyZSBkZWZpbml0aW9uICovPGJyPg0KKyNkZWZp
bmUgQlBDX0tGSUZPX1NJWkXCoCDCoCDCoCDCoCDCoDB4NDAwPGJyPg0KKzxicj4NCisvKkJQQyBy
ZWdpc2VyIGRhdGEqLzxicj4NCisjZGVmaW5lIEZJRk9fREFUQV9WQUxJRMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIDB4ODA8YnI+DQorI2RlZmluZSBGSUZPX09WRVJGTE9XwqAgwqAgwqAgwqAgwqAg
MHgyMDxicj4NCisjZGVmaW5lIEZJRk9fUkVBRFlfSU5UX0VOQUJMRcKgIDB4ODxicj4NCisjZGVm
aW5lIEZJRk9fRFdDQVBUVVJFwqAgwqAgwqAgwqAgwqAweDQ8YnI+DQorI2RlZmluZSBGSUZPX0FE
RFJfREVDT0RFwqAgwqAgwqAgwqAweDE8YnI+DQorPGJyPg0KKy8qSG9zdCBSZXNldCovPGJyPg0K
KyNkZWZpbmUgSE9TVF9SRVNFVF9JTlRfRU5BQkxFwqAgMHgxMDxicj4NCisjZGVmaW5lIEhPU1Rf
UkVTRVRfQ0hBTkdFRMKgIMKgIMKgMHg0MDxicj4NCis8YnI+DQorc3RydWN0IG5wY21fYnBjX2No
YW5uZWwgezxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBucGNtX2JwYyAqZGF0YTs8YnI+DQorwqAg
wqAgwqAgwqBzdHJ1Y3Qga2ZpZm/CoCDCoCDCoCDCoCDCoCDCoCBmaWZvOzxicj4NCivCoCDCoCDC
oCDCoHdhaXRfcXVldWVfaGVhZF90wqAgwqAgwqAgwqB3cTs8YnI+DQorwqAgwqAgwqAgwqBib29s
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaG9zdF9yZXNldDs8YnI+DQorwqAgwqAgwqAg
wqBzdHJ1Y3QgbWlzY2RldmljZcKgIMKgIMKgIMKgbWlzY2Rldjs8YnI+DQorfTs8YnI+DQorPGJy
Pg0KK3N0cnVjdCBucGNtX2JwYyB7PGJyPg0KK8KgIMKgIMKgIMKgdm9pZCBfX2lvbWVtwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKmJhc2U7PGJyPg0KK8KgIMKgIMKgIMKgaW50wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpcnE7PGJyPg0KK8KgIMKgIMKg
IMKgYm9vbMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGVuX2R3Y2Fw
Ozxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBucGNtX2JwY19jaGFubmVsIGNoW05VTV9CUENfQ0hB
Tk5FTFNdOzxicj4NCit9Ozxicj4NCis8YnI+DQorc3RhdGljIHN0cnVjdCBucGNtX2JwY19jaGFu
bmVsICpucGNtX2ZpbGVfdG9fY2goc3RydWN0IGZpbGUgKmZpbGUpPGJyPg0KK3s8YnI+DQorwqAg
wqAgwqAgwqByZXR1cm4gY29udGFpbmVyX29mKGZpbGUtJmd0O3ByaXZhdGVfZGF0YSwgc3RydWN0
IG5wY21fYnBjX2NoYW5uZWwsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgbWlzY2Rldik7PGJyPg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyBzc2l6ZV90IG5w
Y21fYnBjX3JlYWQoc3RydWN0IGZpbGUgKmZpbGUsIGNoYXIgX191c2VyICpidWZmZXIsPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHNpemVfdCBjb3VudCwg
bG9mZl90ICpwcG9zKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IG5wY21fYnBjX2No
YW5uZWwgKmNoYW4gPSBucGNtX2ZpbGVfdG9fY2goZmlsZSk7PGJyPg0KK8KgIMKgIMKgIMKgc3Ry
dWN0IG5wY21fYnBjICpscGNfYnBjID0gY2hhbi0mZ3Q7ZGF0YTs8YnI+DQorwqAgwqAgwqAgwqB1
bnNpZ25lZCBpbnQgY29waWVkOzxicj4NCivCoCDCoCDCoCDCoGludCByZXQgPSAwOzxicj4NCivC
oCDCoCDCoCDCoGludCBjb25kX3NpemUgPSAxOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBpZiAo
bHBjX2JwYy0mZ3Q7ZW5fZHdjYXApPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29uZF9z
aXplID0gMzs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgaWYgKGtmaWZvX2xlbigmYW1wO2NoYW4t
Jmd0O2ZpZm8pICZsdDsgY29uZF9zaXplKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
aWYgKGZpbGUtJmd0O2ZfZmxhZ3MgJmFtcDsgT19OT05CTE9DSyk8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gLUVBR0FJTjs8YnI+DQorPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcmV0ID0gd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKGNoYW4tJmd0O3dxLCBrZmlmb19sZW4o
JmFtcDtjaGFuLSZndDtmaWZvKSAmZ3Q7IGNvbmRfc2l6ZSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgaWYgKHJldCA9PSAtRVJFU1RBUlRTWVMpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIC1FSU5UUjs8YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0K
Kzxicj4NCivCoCDCoCDCoCDCoHJldCA9IGtmaWZvX3RvX3VzZXIoJmFtcDtjaGFuLSZndDtmaWZv
LCBidWZmZXIsIGNvdW50LCAmYW1wO2NvcGllZCk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJl
dHVybiByZXQgPyByZXQgOiBjb3BpZWQ7PGJyPg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyBfX3Bv
bGxfdCBucGNtX2JwY19wb2xsKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3QgcG9sbF90YWJsZV9z
dHJ1Y3QgKnB0KTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IG5wY21fYnBjX2NoYW5u
ZWwgKmNoYW4gPSBucGNtX2ZpbGVfdG9fY2goZmlsZSk7PGJyPg0KK8KgIMKgIMKgIMKgX19wb2xs
X3QgbWFzayA9IDA7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHBvbGxfd2FpdChmaWxlLCAmYW1w
O2NoYW4tJmd0O3dxLCBwdCk7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKCFrZmlmb19pc19lbXB0eSgm
YW1wO2NoYW4tJmd0O2ZpZm8pKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG1hc2sgfD0g
UE9MTElOOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBpZiAoY2hhbi0mZ3Q7aG9zdF9yZXNldCkg
ezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG1hc2sgfD0gUE9MTEhVUDs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBjaGFuLSZndDtob3N0X3Jlc2V0ID0gZmFsc2U7PGJyPg0KK8Kg
IMKgIMKgIMKgfTxicj4NCis8YnI+DQorwqAgwqAgwqAgwqByZXR1cm4gbWFzazs8YnI+DQorfTxi
cj4NCis8YnI+DQorc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgbnBjbV9icGNf
Zm9wcyA9IHs8YnI+DQorwqAgwqAgwqAgwqAub3duZXLCoCDCoCDCoCDCoCDCoCA9IFRISVNfTU9E
VUxFLDxicj4NCivCoCDCoCDCoCDCoC5yZWFkwqAgwqAgwqAgwqAgwqAgwqA9IG5wY21fYnBjX3Jl
YWQsPGJyPg0KK8KgIMKgIMKgIMKgLnBvbGzCoCDCoCDCoCDCoCDCoCDCoD0gbnBjbV9icGNfcG9s
bCw8YnI+DQorwqAgwqAgwqAgwqAubGxzZWVrwqAgwqAgwqAgwqAgwqA9IG5vb3BfbGxzZWVrLDxi
cj4NCit9Ozxicj4NCis8YnI+DQorc3RhdGljIGlycXJldHVybl90IG5wY21fYnBjX2lycShpbnQg
aXJxLCB2b2lkICphcmcpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3QgbnBjbV9icGMg
KmxwY19icGMgPSBhcmc7PGJyPg0KK8KgIMKgIMKgIMKgdTggZmlmb19zdDs8YnI+DQorwqAgwqAg
wqAgwqB1OCBob3N0X3N0Ozxicj4NCivCoCDCoCDCoCDCoHU4IGFkZHJfaW5kZXggPSAwOzxicj4N
CivCoCDCoCDCoCDCoHU4IERhdGE7PGJyPg0KK8KgIMKgIMKgIMKgdTggcGFkemVyb1szXSA9IHsw
fTs8YnI+DQorwqAgwqAgwqAgwqB1OCBsYXN0X2FkZHJfYml0ID0gMDs8YnI+DQorwqAgwqAgwqAg
wqBib29sIGlzcl9mbGFnID0gZmFsc2U7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGZpZm9fc3Qg
PSBpb3JlYWQ4KGxwY19icGMtJmd0O2Jhc2UgKyBOUENNX0JQQ0ZTVEFUX1JFRyk7PGJyPg0KK8Kg
IMKgIMKgIMKgd2hpbGUgKEZJRk9fREFUQV9WQUxJRCAmYW1wOyBmaWZvX3N0KSB7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIElmIGR3Y2FwdHVyZSBlbmFibGVkIG9ubHkgY2hhbm5l
bCAwIChGSUZPIDApIHVzZWQgKi88YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoIWxw
Y19icGMtJmd0O2VuX2R3Y2FwKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGFkZHJfaW5kZXggPSBmaWZvX3N0ICZhbXA7IEZJRk9fQUREUl9ERUNPREU7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgZWxzZTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGxhc3RfYWRkcl9iaXQgPSBmaWZvX3N0ICZhbXA7IEZJRk9fQUREUl9ERUNPREU7
PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qUmVhZCBkYXRhIGZyb20gRklG
TyB0byBjbGVhciBpbnRlcnJ1cHQqLzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoERhdGEg
PSBpb3JlYWQ4KGxwY19icGMtJmd0O2Jhc2UgKyBOUENNX0JQQ0ZEQVRBX1JFRyk7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKGtmaWZvX2lzX2Z1bGwoJmFtcDtscGNfYnBjLSZndDtj
aFthZGRyX2luZGV4XS5maWZvKSk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBrZmlmb19za2lwKCZhbXA7bHBjX2JwYy0mZ3Q7Y2hbYWRkcl9pbmRleF0uZmlmbyk7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKga2ZpZm9fcHV0KCZhbXA7bHBjX2JwYy0mZ3Q7Y2hb
YWRkcl9pbmRleF0uZmlmbywgRGF0YSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYg
KGZpZm9fc3QgJmFtcDsgRklGT19PVkVSRkxPVyk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBwcl9pbmZvKCZxdW90O0JJT1MgUG9zdCBDb2RlcyBGSUZPIE92ZXJmbG93
ISEhXG4mcXVvdDspOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmaWZvX3N0
ID0gaW9yZWFkOChscGNfYnBjLSZndDtiYXNlICsgTlBDTV9CUENGU1RBVF9SRUcpOzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChscGNfYnBjLSZndDtlbl9kd2NhcCAmYW1wOyZhbXA7
IGxhc3RfYWRkcl9iaXQpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBpZiAoKGZpZm9fc3QgJmFtcDsgRklGT19BRERSX0RFQ09ERSkgfHw8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAoKEZJRk9fREFUQV9WQUxJRCAmYW1wOyBm
aWZvX3N0KSA9PSAwKSkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHdoaWxlIChrZmlmb19hdmFpbCgmYW1wO2xwY19icGMtJmd0O2NoW2FkZHJf
aW5kZXhdLmZpZm8pICZsdDsgRFdfUEFEX1NJWkUpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKga2ZpZm9fc2tpcCgmYW1wO2xw
Y19icGMtJmd0O2NoW2FkZHJfaW5kZXhdLmZpZm8pOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGtmaWZvX2luKCZhbXA7bHBjX2JwYy0mZ3Q7Y2hb
YWRkcl9pbmRleF0uZmlmbyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcGFkemVybywgRFdfUEFEX1NJWkUpOzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaXNyX2ZsYWcgPSB0cnVlOzxi
cj4NCivCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgaG9zdF9zdCA9IGlvcmVh
ZDgobHBjX2JwYy0mZ3Q7YmFzZSArIE5QQ01fQlBDRk1TVEFUX1JFRyk7PGJyPg0KK8KgIMKgIMKg
IMKgaWYgKGhvc3Rfc3QgJmFtcDsgSE9TVF9SRVNFVF9DSEFOR0VEKSB7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgaW93cml0ZTgoSE9TVF9SRVNFVF9DSEFOR0VELDxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBscGNfYnBjLSZndDtiYXNlICsgTlBDTV9CUENG
TVNUQVRfUkVHKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBscGNfYnBjLSZndDtjaFth
ZGRyX2luZGV4XS5ob3N0X3Jlc2V0ID0gdHJ1ZTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBpc3JfZmxhZyA9IHRydWU7PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCis8YnI+DQorwqAgwqAg
wqAgwqBpZiAoaXNyX2ZsYWcpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB3YWtlX3Vw
X2ludGVycnVwdGlibGUoJmFtcDtscGNfYnBjLSZndDtjaFthZGRyX2luZGV4XS53cSk7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIElSUV9IQU5ETEVEOzxicj4NCivCoCDCoCDC
oCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmV0dXJuIElSUV9OT05FOzxicj4NCit9PGJy
Pg0KKzxicj4NCitzdGF0aWMgaW50IG5wY21fYnBjX2NvbmZpZ19pcnEoc3RydWN0IG5wY21fYnBj
ICpscGNfYnBjLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KTxicj4NCit7PGJyPg0KK8KgIMKgIMKg
IMKgc3RydWN0IGRldmljZSAqZGV2ID0gJmFtcDtwZGV2LSZndDtkZXY7PGJyPg0KK8KgIMKgIMKg
IMKgaW50IHJjOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBscGNfYnBjLSZndDtpcnEgPSBwbGF0
Zm9ybV9nZXRfaXJxKHBkZXYsIDApOzxicj4NCivCoCDCoCDCoCDCoGlmIChscGNfYnBjLSZndDtp
cnEgJmx0OyAwKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGV2X2VycihkZXYsICZx
dW90O2dldCBJUlEgZmFpbGVkXG4mcXVvdDspOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHJldHVybiBscGNfYnBjLSZndDtpcnE7PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCis8YnI+DQor
wqAgwqAgwqAgwqByYyA9IGRldm1fcmVxdWVzdF9pcnEoZGV2LCBscGNfYnBjLSZndDtpcnEsPGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbnBjbV9icGNf
aXJxLCBJUlFGX1NIQVJFRCw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBERVZJQ0VfTkFNRSwgbHBjX2JwYyk7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKHJj
ICZsdDsgMCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRldl93YXJuKGRldiwgJnF1
b3Q7VW5hYmxlIHRvIHJlcXVlc3QgSVJRICVkXG4mcXVvdDssIGxwY19icGMtJmd0O2lycSk7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIHJjOzxicj4NCivCoCDCoCDCoCDCoH08
YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmV0dXJuIDA7PGJyPg0KK308YnI+DQorPGJyPg0KK3N0
YXRpYyBpbnQgbnBjbV9lbmFibGVfYnBjKHN0cnVjdCBucGNtX2JwYyAqbHBjX2JwYywgc3RydWN0
IGRldmljZSAqZGV2LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBpbnQgY2hhbm5lbCwgdTE2IGxwY19wb3J0KTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgaW50
IHJjOzxicj4NCivCoCDCoCDCoCDCoHU4IGFkZHJfZW4sIHJlZ19lbjs8YnI+DQorPGJyPg0KK8Kg
IMKgIMKgIMKgaW5pdF93YWl0cXVldWVfaGVhZCgmYW1wO2xwY19icGMtJmd0O2NoW2NoYW5uZWxd
LndxKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmMgPSBrZmlmb19hbGxvYygmYW1wO2xwY19i
cGMtJmd0O2NoW2NoYW5uZWxdLmZpZm8sPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIEJQQ19LRklGT19TSVpFLCBHRlBfS0VSTkVMKTs8YnI+DQorwqAgwqAgwqAgwqBp
ZiAocmMpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIHJjOzxicj4NCis8YnI+
DQorwqAgwqAgwqAgwqBscGNfYnBjLSZndDtjaFtjaGFubmVsXS5taXNjZGV2Lm1pbm9yID0gTUlT
Q19EWU5BTUlDX01JTk9SOzxicj4NCivCoCDCoCDCoCDCoGxwY19icGMtJmd0O2NoW2NoYW5uZWxd
LjxhIGhyZWY9Imh0dHA6Ly9taXNjZGV2Lm5hbWUiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPm1pc2NkZXYubmFtZTwvYT4gPTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRl
dm1fa2FzcHJpbnRmKGRldiwgR0ZQX0tFUk5FTCwgJnF1b3Q7JXMlZCZxdW90OywgREVWSUNFX05B
TUUsIGNoYW5uZWwpOzxicj4NCivCoCDCoCDCoCDCoGxwY19icGMtJmd0O2NoW2NoYW5uZWxdLm1p
c2NkZXYuZm9wcyA9ICZhbXA7bnBjbV9icGNfZm9wczs8YnI+DQorwqAgwqAgwqAgwqBscGNfYnBj
LSZndDtjaFtjaGFubmVsXS5taXNjZGV2LnBhcmVudCA9IGRldjs8YnI+DQorwqAgwqAgwqAgwqBy
YyA9IG1pc2NfcmVnaXN0ZXIoJmFtcDtscGNfYnBjLSZndDtjaFtjaGFubmVsXS5taXNjZGV2KTs8
YnI+DQorwqAgwqAgwqAgwqBpZiAocmMpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0
dXJuIHJjOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBscGNfYnBjLSZndDtjaFtjaGFubmVsXS5k
YXRhID0gbHBjX2JwYzs8YnI+DQorwqAgwqAgwqAgwqBscGNfYnBjLSZndDtjaFtjaGFubmVsXS5o
b3N0X3Jlc2V0ID0gZmFsc2U7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoC8qIEVuYWJsZSBMUEMg
c25vb3AgY2hhbm5lbCBhdCByZXF1ZXN0ZWQgcG9ydCAqLzxicj4NCivCoCDCoCDCoCDCoHN3aXRj
aCAoY2hhbm5lbCkgezxicj4NCivCoCDCoCDCoCDCoGNhc2UgMDo8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBhZGRyX2VuID0gRklGT19JT0FERFIxX0VOQUJMRTs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBpb3dyaXRlOCgodTgpbHBjX3BvcnQgJmFtcDsgMHhGRiw8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgbHBjX2JwYy0mZ3Q7YmFzZSArIE5QQ01f
QlBDRkExTF9SRUcpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlvd3JpdGU4KCh1OCko
bHBjX3BvcnQgJmd0OyZndDsgOCksPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIGxwY19icGMtJmd0O2Jhc2UgKyBOUENNX0JQQ0ZBMU1fUkVHKTs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQorwqAgwqAgwqAgwqBjYXNlIDE6PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgYWRkcl9lbiA9IEZJRk9fSU9BRERSMl9FTkFCTEU7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW93cml0ZTgoKHU4KWxwY19wb3J0ICZhbXA7IDB4RkYs
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGxwY19icGMtJmd0O2Jh
c2UgKyBOUENNX0JQQ0ZBMkxfUkVHKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpb3dy
aXRlOCgodTgpKGxwY19wb3J0ICZndDsmZ3Q7IDgpLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBscGNfYnBjLSZndDtiYXNlICsgTlBDTV9CUENGQTJNX1JFRyk7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KK8KgIMKgIMKgIMKgZGVmYXVs
dDo8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gLUVJTlZBTDs8YnI+DQorwqAg
wqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGlmIChscGNfYnBjLSZndDtlbl9kd2Nh
cCk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBhZGRyX2VuID0gRklGT19EV0NBUFRVUkU7
PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoC8qPGJyPg0KK8KgIMKgIMKgIMKgICogRW5hYmxlIEZJ
Rk8gUmVhZHkgSW50ZXJydXB0LCBGSUZPIENhcHR1cmUgb2YgSS9PIGFkZHIsPGJyPg0KK8KgIMKg
IMKgIMKgICogYW5kIEhvc3QgUmVzZXQ8YnI+DQorwqAgwqAgwqAgwqAgKi88YnI+DQorwqAgwqAg
wqAgwqByZWdfZW4gPSBpb3JlYWQ4KGxwY19icGMtJmd0O2Jhc2UgKyBOUENNX0JQQ0ZFTl9SRUcp
Ozxicj4NCivCoCDCoCDCoCDCoGlvd3JpdGU4KHJlZ19lbiB8IGFkZHJfZW4gfCBGSUZPX1JFQURZ
X0lOVF9FTkFCTEUgfDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBIT1NUX1JFU0VUX0lO
VF9FTkFCTEUsIGxwY19icGMtJmd0O2Jhc2UgKyBOUENNX0JQQ0ZFTl9SRUcpOzxicj4NCis8YnI+
DQorwqAgwqAgwqAgwqByZXR1cm4gMDs8YnI+DQorfTxicj4NCis8YnI+DQorc3RhdGljIHZvaWQg
bnBjbV9kaXNhYmxlX2JwYyhzdHJ1Y3QgbnBjbV9icGMgKmxwY19icGMsIGludCBjaGFubmVsKTxi
cj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgdTggcmVnX2VuOzxicj4NCis8YnI+DQorwqAgwqAgwqAg
wqBzd2l0Y2ggKGNoYW5uZWwpIHs8YnI+DQorwqAgwqAgwqAgwqBjYXNlIDA6PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcmVnX2VuID0gaW9yZWFkOChscGNfYnBjLSZndDtiYXNlICsgTlBD
TV9CUENGRU5fUkVHKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAobHBjX2JwYy0m
Z3Q7ZW5fZHdjYXApPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW93
cml0ZTgocmVnX2VuICZhbXA7IH5GSUZPX0RXQ0FQVFVSRSw8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgbHBjX2JwYy0mZ3Q7YmFzZSArIE5QQ01f
QlBDRkVOX1JFRyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZWxzZTxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlvd3JpdGU4KHJlZ19lbiAmYW1wOyB+RklG
T19JT0FERFIxX0VOQUJMRSw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgbHBjX2JwYy0mZ3Q7YmFzZSArIE5QQ01fQlBDRkVOX1JFRyk7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYnJlYWs7PGJyPg0KK8KgIMKgIMKgIMKgY2FzZSAxOjxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ19lbiA9IGlvcmVhZDgobHBjX2JwYy0mZ3Q7
YmFzZSArIE5QQ01fQlBDRkVOX1JFRyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW93
cml0ZTgocmVnX2VuICZhbXA7IH5GSUZPX0lPQUREUjJfRU5BQkxFLDxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBscGNfYnBjLSZndDtiYXNlICsgTlBDTV9CUENGRU5f
UkVHKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBicmVhazs8YnI+DQorwqAgwqAgwqAg
wqBkZWZhdWx0Ojxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybjs8YnI+DQorwqAg
wqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGlmICghKHJlZ19lbiAmYW1wOyAoRklG
T19JT0FERFIxX0VOQUJMRSB8IEZJRk9fSU9BRERSMl9FTkFCTEUpKSk8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBpb3dyaXRlOChyZWdfZW4gJmFtcDs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgfihGSUZPX1JFQURZX0lOVF9FTkFCTEUgfCBIT1NUX1JFU0VU
X0lOVF9FTkFCTEUpLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBs
cGNfYnBjLSZndDtiYXNlICsgTlBDTV9CUENGRU5fUkVHKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKg
IMKga2ZpZm9fZnJlZSgmYW1wO2xwY19icGMtJmd0O2NoW2NoYW5uZWxdLmZpZm8pOzxicj4NCivC
oCDCoCDCoCDCoG1pc2NfZGVyZWdpc3RlcigmYW1wO2xwY19icGMtJmd0O2NoW2NoYW5uZWxdLm1p
c2NkZXYpOzxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgaW50IG5wY21fYnBjX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBzdHJ1
Y3QgbnBjbV9icGMgKmxwY19icGM7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IGRldmljZSAqZGV2
Ozxicj4NCivCoCDCoCDCoCDCoHUzMiBwb3J0Ozxicj4NCivCoCDCoCDCoCDCoGludCByYzs8YnI+
DQorPGJyPg0KK8KgIMKgIMKgIMKgZGV2ID0gJmFtcDtwZGV2LSZndDtkZXY7PGJyPg0KKzxicj4N
CivCoCDCoCDCoCDCoGxwY19icGMgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmxwY19icGMp
LCBHRlBfS0VSTkVMKTs8YnI+DQorwqAgwqAgwqAgwqBpZiAoIWxwY19icGMpPGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIC1FTk9NRU07PGJyPg0KKzxicj4NCivCoCDCoCDCoCDC
oGxwY19icGMtJmd0O2Jhc2UgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwg
MCk7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKElTX0VSUihscGNfYnBjLSZndDtiYXNlKSk8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gUFRSX0VSUihscGNfYnBjLSZndDtiYXNlKTs8
YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgZGV2X3NldF9kcnZkYXRhKCZhbXA7cGRldi0mZ3Q7ZGV2
LCBscGNfYnBjKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmMgPSBvZl9wcm9wZXJ0eV9yZWFk
X3UzMl9pbmRleChkZXYtJmd0O29mX25vZGUsICZxdW90O3Nub29wLXBvcnRzJnF1b3Q7LCAwLDxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCZhbXA7cG9ydCk7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKHJjKSB7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgZGV2X2VycihkZXYsICZxdW90O25vIHNub29wIHBvcnRzIGNvbmZp
Z3VyZWRcbiZxdW90Oyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIC1FTk9E
RVY7PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBscGNfYnBjLSZn
dDtlbl9kd2NhcCA9PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgb2ZfcHJvcGVydHlfcmVh
ZF9ib29sKGRldi0mZ3Q7b2Zfbm9kZSwgJnF1b3Q7bnV2b3RvbixscGMtZW4tZHdjYXB0dXJlJnF1
b3Q7KTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgcmMgPSBucGNtX2JwY19jb25maWdfaXJxKGxw
Y19icGMsIHBkZXYpOzxicj4NCivCoCDCoCDCoCDCoGlmIChyYyk8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqByZXR1cm4gcmM7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHJjID0gbnBjbV9l
bmFibGVfYnBjKGxwY19icGMsIGRldiwgMCwgcG9ydCk7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKHJj
KSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGV2X2VycihkZXYsICZxdW90O0VuYWJs
ZSBCSU9TIHBvc3QgY29kZSBJL08gcG9ydCAwIGZhaWxlZFxuJnF1b3Q7KTs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gcmM7PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCis8YnI+
DQorwqAgwqAgwqAgwqAvKjxicj4NCivCoCDCoCDCoCDCoCAqIENvbmZpZ3VyYXRpb24gb2Ygc2Vj
b25kIEJQQyBjaGFubmVsIHBvcnQgaXMgb3B0aW9uYWw8YnI+DQorwqAgwqAgwqAgwqAgKiBEb3Vi
bGUtV29yZCBDYXB0dXJlIGlnbm9yaW5nIGFkZHJlc3MgMjxicj4NCivCoCDCoCDCoCDCoCAqLzxi
cj4NCivCoCDCoCDCoCDCoGlmICghbHBjX2JwYy0mZ3Q7ZW5fZHdjYXApIHs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBpZiAob2ZfcHJvcGVydHlfcmVhZF91MzJfaW5kZXgoZGV2LSZndDtv
Zl9ub2RlLCAmcXVvdDtzbm9vcC1wb3J0cyZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMSwgJmFt
cDtwb3J0KSA9PSAwKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cmMgPSBucGNtX2VuYWJsZV9icGMobHBjX2JwYywgZGV2LCAxLCBwb3J0KTs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAocmMpIHs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkZXZfZXJyKGRldiwgJnF1b3Q7RW5h
YmxlIEJJT1MgcG9zdCBjb2RlIEkvTyBwb3J0IDEgZmFpbGVkLCBkaXNhYmxlIEkvTyBwb3J0IDBc
biZxdW90Oyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgbnBjbV9kaXNhYmxlX2JwYyhscGNfYnBjLCAwKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gcmM7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oH08YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoHByX2luZm8oJnF1
b3Q7TlBDTSBCSU9TIHBvc3QgY29kZSBwcm9iZVxuJnF1b3Q7KTs8YnI+DQorPGJyPg0KK8KgIMKg
IMKgIMKgcmV0dXJuIHJjOzxicj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgaW50IG5wY21fYnBj
X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KTxicj4NCit7PGJyPg0KK8KgIMKg
IMKgIMKgc3RydWN0IG5wY21fYnBjICpscGNfYnBjID0gZGV2X2dldF9kcnZkYXRhKCZhbXA7cGRl
di0mZ3Q7ZGV2KTs8YnI+DQorwqAgwqAgwqAgwqB1OCByZWdfZW47PGJyPg0KKzxicj4NCivCoCDC
oCDCoCDCoHJlZ19lbiA9IGlvcmVhZDgobHBjX2JwYy0mZ3Q7YmFzZSArIE5QQ01fQlBDRkVOX1JF
Ryk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGlmIChyZWdfZW4gJmFtcDsgRklGT19JT0FERFIx
X0VOQUJMRSk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBucGNtX2Rpc2FibGVfYnBjKGxw
Y19icGMsIDApOzxicj4NCivCoCDCoCDCoCDCoGlmIChyZWdfZW4gJmFtcDsgRklGT19JT0FERFIy
X0VOQUJMRSk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBucGNtX2Rpc2FibGVfYnBjKGxw
Y19icGMsIDEpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqByZXR1cm4gMDs8YnI+DQorfTxicj4N
Cis8YnI+DQorc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbnBjbV9icGNfbWF0Y2hb
XSA9IHs8YnI+DQorwqAgwqAgwqAgwqB7IC5jb21wYXRpYmxlID0gJnF1b3Q7bnV2b3RvbixucGNt
NzUwLWxwYy1icGMtc25vb3AmcXVvdDsgfSw8YnI+DQorwqAgwqAgwqAgwqB7IH0sPGJyPg0KK307
PGJyPg0KKzxicj4NCitzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBucGNtX2JwY19kcml2
ZXIgPSB7PGJyPg0KK8KgIMKgIMKgIMKgLmRyaXZlciA9IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAubmFtZcKgIMKgIMKgIMKgIMKgIMKgPSBERVZJQ0VfTkFNRSw8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAub2ZfbWF0Y2hfdGFibGUgPSBucGNtX2JwY19tYXRjaCw8YnI+DQor
wqAgwqAgwqAgwqB9LDxicj4NCivCoCDCoCDCoCDCoC5wcm9iZSA9IG5wY21fYnBjX3Byb2JlLDxi
cj4NCivCoCDCoCDCoCDCoC5yZW1vdmUgPSBucGNtX2JwY19yZW1vdmUsPGJyPg0KK307PGJyPg0K
Kzxicj4NCittb2R1bGVfcGxhdGZvcm1fZHJpdmVyKG5wY21fYnBjX2RyaXZlcik7PGJyPg0KKzxi
cj4NCitNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBucGNtX2JwY19tYXRjaCk7PGJyPg0KK01PRFVM
RV9MSUNFTlNFKCZxdW90O0dQTCZxdW90Oyk7PGJyPg0KK01PRFVMRV9BVVRIT1IoJnF1b3Q7VG9t
ZXIgTWFpbW9uICZsdDs8YSBocmVmPSJtYWlsdG86dG9tZXIubWFpbW9uQG51dm90b24uY29tIiB0
YXJnZXQ9Il9ibGFuayI+dG9tZXIubWFpbW9uQG51dm90b24uY29tPC9hPiZndDsmcXVvdDspOzxi
cj4NCitNT0RVTEVfREVTQ1JJUFRJT04oJnF1b3Q7TGludXggZHJpdmVyIHRvIGNvbnRyb2wgTlBD
TSBMUEMgQklPUyBwb3N0IGNvZGUgc25vb3BpbmcmcXVvdDspOzxicj4NCi0tIDxicj4NCjIuMTQu
MTxicj4NCjxicj4NCjwvYmxvY2txdW90ZT48L2Rpdj4NCg==
--0000000000002a450c0587fba816--
