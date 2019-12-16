Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 252D112046A
	for <lists+openbmc@lfdr.de>; Mon, 16 Dec 2019 12:53:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47c05k2WtFzDq83
	for <lists+openbmc@lfdr.de>; Mon, 16 Dec 2019 22:53:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gRG5vSLZ"; 
 dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47c03S6R18zDqVB
 for <openbmc@lists.ozlabs.org>; Mon, 16 Dec 2019 22:51:13 +1100 (AEDT)
Received: by mail-ot1-x341.google.com with SMTP id o9so8903580ote.2
 for <openbmc@lists.ozlabs.org>; Mon, 16 Dec 2019 03:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9i65gLqW4fBbK0ZSvp4Y2aXjNnsmq18SdoRXHw7XcsA=;
 b=gRG5vSLZm8hq4i6BPT44msdYdHkSpFkorAxfsBZTusaRiEGrjjEDwASX4I0jwQ3AAe
 zUIw4Y89UQsFsYjalIbA45MFBokVwNN1ng303GB+uYVRtGw9cexAJG4gwZ56fjoL+pgS
 vc+pvvqwaN2ae5ro2Pso21D1OTXEt2h0MUG+hVLs6+7gdwAfrdj8Cr1Fdv5cpfe2UTz6
 +WkA/5MB3lHRbqi+ZvwR1FsdiOblATCm1qkG36oeHj72454e6f16Ix//+rVRmuG0KbZ8
 uuEi4vz24BjH9UQENK2FUW9LFpmfTvUQej+ag0K30FdCpsxnlgcrNecmi33CKIZmnxnx
 OTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9i65gLqW4fBbK0ZSvp4Y2aXjNnsmq18SdoRXHw7XcsA=;
 b=hiA3O1vX7VJc004XKu+DWG3nqp1JhOSh88Te1phAH5DpXqDc0/CtxbXenaGvXy5H0V
 tUtbon4TsIWKKvVfR3ljXMPlUE/38sxXKeitQB4/czD38f5XFcriCpixvxXsgeUrKo9l
 UUZdzSC02zggh37Xgu1059DBg9pJdzOafsT3KIfOGP2D6m69qJ/aZsthj5uCnzf5miyf
 46G0z26+9RjCi7og9J141tt7Glifhjho854xRWr1LZyYy2dNp2hBnBiMyujKZG9luLcB
 3goBEU7cIlDKyApgjF1zM5u/8V2st1XDpRL4tUkjPVR1AIoTCHV4bli0LNO1GPB6pdm0
 cIjQ==
X-Gm-Message-State: APjAAAVateYd9BO0rMyyYhY0pfB8/fUd/0he7iifmzHTfAH5GnyyH6I2
 iJgx8Kki0LxBr3uMkFZ3ZV21+PVUANyFWKbj/IQ=
X-Google-Smtp-Source: APXvYqziOPWqWw5DuQDYeXylAzYan+OEjQKo1Fe3PxaMMFqTZpEypxiLPyi7NbIWeSSlnpzsuSfTq5/Mj1KPck+CFyQ=
X-Received: by 2002:a05:6830:2111:: with SMTP id
 i17mr29590769otc.24.1576497069442; 
 Mon, 16 Dec 2019 03:51:09 -0800 (PST)
MIME-Version: 1.0
References: <20191213231803.20766-1-wak@google.com>
In-Reply-To: <20191213231803.20766-1-wak@google.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 16 Dec 2019 14:00:59 +0200
Message-ID: <CAP6Zq1ixSHB1mMcN=bcmS3oANhL4P7RrRsPk1hQdk=evEenmLQ@mail.gmail.com>
Subject: Re: [PATCH] npcm7xx-lpc-bpc: Rework driver
To: "William A. Kennington III" <wak@google.com>
Content-Type: multipart/alternative; boundary="000000000000d04b0a0599d0d3b9"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000d04b0a0599d0d3b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi William,



Thanks a lot for working on this.

Thanks for raising issues and sent great solutions for it. Appreciate it!


In general, we prefer to modify the existing driver and not to do a rework.
(I think it can be done in this case), please let us know what do you think=
.


On Sat, 14 Dec 2019 at 01:19, William A. Kennington III <wak@google.com>
wrote:

> This provides a number of fixes:
>  - Multiple file handles are now supported, previously using multiple
>    readers would cause a race in the kfifo and spew garbage to the
>    readers.
>
Indeed, there is not a support for a multiple readers; I prefer to have
only a single reader per channel because

I don't see too much use from the OpenBMC/other application multiple
readers, so the RCU use (that is coded great in your rework) is not much
needed and cause a little over head.

Do you need a multiple readers in the OpenBMC user space?

>  - iowrite{8,16,32} are now supported correctly. Previously, the
>    dwcapture code would get confused by values added to the fifo for 16
>    bit writes
>
dwcapture need to be used only with 4 byte writes, of course the host can
still write in  {8,16,32}  but it can cause a some issues.

for example writing only 16 bit from the higher address, and not getting
bit 8 at byte 0 for separating between the words.

I believe the issue is when writing lower 16 bits from the host(am I
correct?), we think it can solved with padding the same as one 8 bits write=
.

>  - Reads from the device now only return a single post code. Previously
>    the read call would emit all of the post code data in a single
>    syscall. This was broken because it wouldn't account for partial post
>    code writes into the fifo, meaning the reader could get partial
>    4-byte codes for dwcap.
>
But is seems that if the user not using dwcap each read will be 1 byte
only? what if the user like to read more than one byte at a one read?

as I mentioned above the dwcap is tricky (probably we needed to explained
the use of it better) so the write of 16 bit can be problematic.

I think we can solve the 16 bit write by doing a padding the same as we
doing when having 8 bit write, and when dwcap is enabling

We can read only 4 byte multiplier.

>
> Tested:
>     Ran as a module with multiple readers and saw the correct values
>     reaching all of the readers. Also tested adding and removing readers
>     at runtime and reloading the kernel module and validating the
>     register state.
>
> Change-Id: Ic979f523ccc7cda76a2328c5f8c869aa25d7204d
> Signed-off-by: William A. Kennington III <wak@google.com>
> ---
>  drivers/misc/npcm7xx-lpc-bpc.c | 388 ++++++++++++++++++++-------------
>  1 file changed, 235 insertions(+), 153 deletions(-)
>
> diff --git a/drivers/misc/npcm7xx-lpc-bpc.c
> b/drivers/misc/npcm7xx-lpc-bpc.c
> index e014e07cd4a46..b04323c4f932d 100644
> --- a/drivers/misc/npcm7xx-lpc-bpc.c
> +++ b/drivers/misc/npcm7xx-lpc-bpc.c
> @@ -10,6 +10,7 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> +#include <linux/slab.h>
>  #include <linux/miscdevice.h>
>  #include <linux/poll.h>
>
> @@ -28,270 +29,348 @@
>  #define NPCM7XX_BPCFA1L_REG    0x10 //BIOS POST Code FIFO Address 1 LSB
>  #define NPCM7XX_BPCFA1M_REG    0x12 //BIOS POST Code FIFO Address 1 MSB
>
> -/*BIOS regiser data*/
> +/* BIOS regiser data */
>  #define FIFO_IOADDR1_ENABLE    0x80
>  #define FIFO_IOADDR2_ENABLE    0x40
>
>  /* BPC interface package and structure definition */
> -#define BPC_KFIFO_SIZE         0x400
> +#define BPC_KFIFO_SIZE         0x100
>
> -/*BPC regiser data*/
> +/* BPC regiser data */
>  #define FIFO_DATA_VALID                0x80
>  #define FIFO_OVERFLOW          0x20
>  #define FIFO_READY_INT_ENABLE  0x8
>  #define FIFO_DWCAPTURE         0x4
>  #define FIFO_ADDR_DECODE       0x1
>
> -/*Host Reset*/
> +/* Host Reset */
>  #define HOST_RESET_INT_ENABLE  0x10
>  #define HOST_RESET_CHANGED     0x40
>
> +struct npcm7xx_code {
> +       u32 data;
> +       u8 len;
> +};
> +
> +struct npcm7xx_bpc_file_data {
> +       struct list_head                list;
> +       struct npcm7xx_bpc_channel      *ch;
> +       DECLARE_KFIFO(codes, struct npcm7xx_code, BPC_KFIFO_SIZE);
> +       bool                            host_reset;
> +};
> +
>  struct npcm7xx_bpc_channel {
> -       struct npcm7xx_bpc      *data;
> -       struct kfifo            fifo;
> +       struct npcm7xx_bpc      *drv;
>         wait_queue_head_t       wq;
> -       bool                    host_reset;
> +       struct list_head        files;
>         struct miscdevice       miscdev;
>  };
>
>  struct npcm7xx_bpc {
>         void __iomem                    *base;
> +       struct npcm7xx_bpc_channel      chs[NUM_BPC_CHANNELS];
>         int                             irq;
>         bool                            en_dwcap;
> -       struct npcm7xx_bpc_channel      ch[NUM_BPC_CHANNELS];
>  };
>
> -static struct npcm7xx_bpc_channel *npcm7xx_file_to_ch(struct file *file)
> +static int npcm7xx_bpc_open(struct inode *inode, struct file *file)
>  {
> -       return container_of(file->private_data, struct npcm7xx_bpc_channe=
l,
> -                           miscdev);
> +       struct npcm7xx_bpc_file_data *data;
> +
> +       data =3D kmalloc(sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       INIT_KFIFO(data->codes);
> +       data->ch =3D container_of(file->private_data,
> +                               struct npcm7xx_bpc_channel, miscdev);
> +       data->host_reset =3D false;
> +
> +       file->private_data =3D data;
> +       list_add_rcu(&data->list, &data->ch->files);
> +       return 0;
> +}
> +
> +static int npcm7xx_bpc_release(struct inode *inode, struct file *file)
> +{
> +       struct npcm7xx_bpc_file_data *data =3D file->private_data;
> +
> +       if (!data)
> +               return -EIO;
> +
> +       list_del_rcu(&data->list);
> +       synchronize_rcu();
> +
> +       file->private_data =3D NULL;
> +       kfree(data);
> +       return 0;
>  }
>
>  static ssize_t npcm7xx_bpc_read(struct file *file, char __user *buffer,
>                                 size_t count, loff_t *ppos)
>  {
> -       struct npcm7xx_bpc_channel *chan =3D npcm7xx_file_to_ch(file);
> -       struct npcm7xx_bpc *lpc_bpc =3D chan->data;
> -       unsigned int copied;
> +       struct npcm7xx_bpc_file_data *data =3D file->private_data;
> +       struct npcm7xx_code code;
>         int ret =3D 0;
> -       int cond_size =3D 1;
> -
> -       if (lpc_bpc->en_dwcap)
> -               cond_size =3D 3;
>
> -       if (kfifo_len(&chan->fifo) < cond_size) {
> +       while (!kfifo_get(&data->codes, &code)) {
>                 if (file->f_flags & O_NONBLOCK)
>                         return -EAGAIN;
>
>                 ret =3D wait_event_interruptible
> -                       (chan->wq, kfifo_len(&chan->fifo) > cond_size);
> +                       (data->ch->wq, kfifo_len(&data->codes) > 0);
>                 if (ret =3D=3D -ERESTARTSYS)
>                         return -EINTR;
>         }
>
> -       ret =3D kfifo_to_user(&chan->fifo, buffer, count, &copied);
> +       if (code.len < count)
> +               count =3D code.len;
>
> -       return ret ? ret : copied;
> +       ret =3D copy_to_user(buffer, &code.data, count);
> +       if (ret !=3D 0)
> +               return -EFAULT;
> +
> +       return count;
>  }
>
>  static __poll_t npcm7xx_bpc_poll(struct file *file,
>                                  struct poll_table_struct *pt)
>  {
> -       struct npcm7xx_bpc_channel *chan =3D npcm7xx_file_to_ch(file);
> +       struct npcm7xx_bpc_file_data *data =3D file->private_data;
>         __poll_t mask =3D 0;
>
> -       poll_wait(file, &chan->wq, pt);
> -       if (!kfifo_is_empty(&chan->fifo))
> +       poll_wait(file, &data->ch->wq, pt);
> +       if (!kfifo_is_empty(&data->codes))
>                 mask |=3D POLLIN;
>
> -       if (chan->host_reset) {
> +       if (data->host_reset) {
>                 mask |=3D POLLHUP;
> -               chan->host_reset =3D false;
> +               data->host_reset =3D false;
>         }
>
>         return mask;
>  }
>
> -static const struct file_operations npcm7xx_bpc_fops =3D {
> +static const struct file_operations npcm7xx_bpc_channel_fops =3D {
>         .owner          =3D THIS_MODULE,
> +       .open           =3D npcm7xx_bpc_open,
> +       .release        =3D npcm7xx_bpc_release,
>         .read           =3D npcm7xx_bpc_read,
>         .poll           =3D npcm7xx_bpc_poll,
>         .llseek         =3D noop_llseek,
>  };
>
> -static irqreturn_t npcm7xx_bpc_irq(int irq, void *arg)
> +static void npcm7xx_bpc_channel_update(struct npcm7xx_bpc_channel *ch,
> +                                      const struct npcm7xx_code *code)
>  {
> -       struct npcm7xx_bpc *lpc_bpc =3D arg;
> -       u8 fifo_st;
> -       u8 host_st;
> -       u8 addr_index =3D 0;
> -       u8 Data;
> -       u8 padzero[3] =3D {0};
> -       u8 last_addr_bit =3D 0;
> -       bool isr_flag =3D false;
> -
> -       fifo_st =3D ioread8(lpc_bpc->base + NPCM7XX_BPCFSTAT_REG);
> -       while (FIFO_DATA_VALID & fifo_st) {
> -                /* If dwcapture enabled only channel 0 (FIFO 0) used */
> -               if (!lpc_bpc->en_dwcap)
> -                       addr_index =3D fifo_st & FIFO_ADDR_DECODE;
> -               else
> -                       last_addr_bit =3D fifo_st & FIFO_ADDR_DECODE;
> -
> -               /*Read data from FIFO to clear interrupt*/
> -               Data =3D ioread8(lpc_bpc->base + NPCM7XX_BPCFDATA_REG);
> -               if (kfifo_is_full(&lpc_bpc->ch[addr_index].fifo))
> -                       kfifo_skip(&lpc_bpc->ch[addr_index].fifo);
> -               kfifo_put(&lpc_bpc->ch[addr_index].fifo, Data);
> -               if (fifo_st & FIFO_OVERFLOW)
> -                       pr_info("BIOS Post Codes FIFO Overflow!!!\n");
> +       struct npcm7xx_bpc_file_data *data;
>
> -               fifo_st =3D ioread8(lpc_bpc->base + NPCM7XX_BPCFSTAT_REG)=
;
> -               if (lpc_bpc->en_dwcap && last_addr_bit) {
> -                       if ((fifo_st & FIFO_ADDR_DECODE) ||
> -                           ((FIFO_DATA_VALID & fifo_st) =3D=3D 0)) {
> -                               while
> (kfifo_avail(&lpc_bpc->ch[addr_index].fifo) < DW_PAD_SIZE)
> -
>  kfifo_skip(&lpc_bpc->ch[addr_index].fifo);
> -                               kfifo_in(&lpc_bpc->ch[addr_index].fifo,
> -                                        padzero, DW_PAD_SIZE);
> -                       }
> +       if (!ch->drv) {
> +               pr_warn("BIOS Post Code Update for unconfigured
> channel\n");
> +               return;
> +       }
> +
> +       list_for_each_entry_rcu(data, &ch->files, list) {
> +               if (kfifo_is_full(&data->codes))
> +                       kfifo_skip(&data->codes);
> +               kfifo_put(&data->codes, *code);
> +       }
> +}
> +
> +static void npcm7xx_bpc_channel_wake(struct npcm7xx_bpc_channel *ch)
> +{
> +       if (!ch->drv)
> +               return;
> +
> +       wake_up_interruptible(&ch->wq);
> +}
> +
> +static void npcm7xx_bpc_host_reset(struct npcm7xx_bpc *bpc)
> +{
> +       struct npcm7xx_bpc_file_data *data;
> +       u8 i;
> +
> +       for (i =3D 0; i < NUM_BPC_CHANNELS; ++i) {
> +               if (!bpc->chs[i].drv)
> +                       continue;
> +               list_for_each_entry_rcu(data, &bpc->chs[i].files, list) {
> +                       data->host_reset =3D true;
>                 }
> -               isr_flag =3D true;
>         }
> +}
> +
> +static irqreturn_t npcm7xx_bpc_irq(int irq, void *arg)
> +{
> +       struct npcm7xx_bpc *bpc =3D arg;
> +       struct npcm7xx_code code =3D {
> +               .len =3D 0,
> +               .data =3D 0,
> +       };
> +       bool ch_wake[NUM_BPC_CHANNELS] =3D {};
> +       u8 read_byte;
> +       u8 status;
> +       u8 ch_i;
> +       bool reg_valid;
> +       irqreturn_t ret =3D IRQ_NONE;
> +
> +       rcu_read_lock();
> +
> +       while (true) {
> +               status =3D ioread8(bpc->base + NPCM7XX_BPCFSTAT_REG);
> +               reg_valid =3D status & FIFO_DATA_VALID;
> +               if (code.len > 0 && (!reg_valid || !bpc->en_dwcap ||
> +                                    status & FIFO_ADDR_DECODE)) {
> +                       npcm7xx_bpc_channel_update(&bpc->chs[ch_i], &code=
);
> +                       ch_wake[ch_i] =3D true;
> +                       code.len =3D 0;
> +                       code.data =3D 0;
> +               }
> +               if (!reg_valid)
> +                       break;
>
> -       host_st =3D ioread8(lpc_bpc->base + NPCM7XX_BPCFMSTAT_REG);
> -       if (host_st & HOST_RESET_CHANGED) {
> -               iowrite8(HOST_RESET_CHANGED,
> -                        lpc_bpc->base + NPCM7XX_BPCFMSTAT_REG);
> -               lpc_bpc->ch[addr_index].host_reset =3D true;
> -               isr_flag =3D true;
> +               if (status & FIFO_OVERFLOW)
> +                       pr_info("BIOS Post Codes FIFO Overflow!!!\n");
> +
> +               ch_i =3D bpc->en_dwcap ? 0 : status & FIFO_ADDR_DECODE;
> +               read_byte =3D ioread8(bpc->base + NPCM7XX_BPCFDATA_REG);
> +               code.data |=3D read_byte << (code.len++ << 3);
>         }
>
> -       if (isr_flag) {
> -               wake_up_interruptible(&lpc_bpc->ch[addr_index].wq);
> -               return IRQ_HANDLED;
> +       status =3D ioread8(bpc->base + NPCM7XX_BPCFMSTAT_REG);
> +       if (status & HOST_RESET_CHANGED) {
> +               iowrite8(HOST_RESET_CHANGED, bpc->base +
> NPCM7XX_BPCFMSTAT_REG);
> +               npcm7xx_bpc_host_reset(bpc);
> +               for (ch_i =3D 0; ch_i < NUM_BPC_CHANNELS; ++ch_i)
> +                       ch_wake[ch_i] =3D true;
>         }
>
> -       return IRQ_NONE;
> +       rcu_read_unlock();
> +
> +       for (ch_i =3D 0; ch_i < NUM_BPC_CHANNELS; ++ch_i)
> +               if (ch_wake[ch_i]) {
> +                       npcm7xx_bpc_channel_wake(&bpc->chs[ch_i]);
> +                       ret =3D IRQ_HANDLED;
> +               }
> +
> +       return ret;
>  }
>
> -static int npcm7xx_bpc_config_irq(struct npcm7xx_bpc *lpc_bpc,
> +static int npcm7xx_bpc_config_irq(struct npcm7xx_bpc *bpc,
>                                   struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
>         int rc;
>
> -       lpc_bpc->irq =3D platform_get_irq(pdev, 0);
> -       if (lpc_bpc->irq < 0) {
> +       bpc->irq =3D platform_get_irq(pdev, 0);
> +       if (bpc->irq < 0) {
>                 dev_err(dev, "get IRQ failed\n");
> -               return lpc_bpc->irq;
> +               return bpc->irq;
>         }
>
> -       rc =3D devm_request_irq(dev, lpc_bpc->irq,
> +       rc =3D devm_request_irq(dev, bpc->irq,
>                               npcm7xx_bpc_irq, IRQF_SHARED,
> -                             DEVICE_NAME, lpc_bpc);
> +                             DEVICE_NAME, bpc);
>         if (rc < 0) {
> -               dev_warn(dev, "Unable to request IRQ %d\n", lpc_bpc->irq)=
;
> +               dev_err(dev, "Unable to request IRQ %d\n", bpc->irq);
>                 return rc;
>         }
>
>         return 0;
>  }
>
> -static int npcm7xx_enable_bpc(struct npcm7xx_bpc *lpc_bpc, struct device
> *dev,
> -                             int channel, u16 lpc_port)
> +static int npcm7xx_bpc_channel_enable(struct npcm7xx_bpc *bpc, struct
> device *dev,
> +                                     int channel, u16 lpc_port)
>  {
> +       struct npcm7xx_bpc_channel *ch =3D &bpc->chs[channel];
>         int rc;
>         u8 addr_en, reg_en;
>
> -       init_waitqueue_head(&lpc_bpc->ch[channel].wq);
> -
> -       rc =3D kfifo_alloc(&lpc_bpc->ch[channel].fifo,
> -                        BPC_KFIFO_SIZE, GFP_KERNEL);
> -       if (rc)
> -               return rc;
> +       init_waitqueue_head(&ch->wq);
> +       INIT_LIST_HEAD(&ch->files);
>
> -       lpc_bpc->ch[channel].miscdev.minor =3D MISC_DYNAMIC_MINOR;
> -       lpc_bpc->ch[channel].miscdev.name =3D
> +       ch->miscdev.minor =3D MISC_DYNAMIC_MINOR;
> +       ch->miscdev.name =3D
>                 devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME,
> channel);
> -       lpc_bpc->ch[channel].miscdev.fops =3D &npcm7xx_bpc_fops;
> -       lpc_bpc->ch[channel].miscdev.parent =3D dev;
> -       rc =3D misc_register(&lpc_bpc->ch[channel].miscdev);
> +       ch->miscdev.fops =3D &npcm7xx_bpc_channel_fops;
> +       ch->miscdev.parent =3D dev;
> +       rc =3D misc_register(&ch->miscdev);
>         if (rc)
>                 return rc;
>
> -       lpc_bpc->ch[channel].data =3D lpc_bpc;
> -       lpc_bpc->ch[channel].host_reset =3D false;
> -
> -       /* Enable LPC snoop channel at requested port */
>         switch (channel) {
>         case 0:
>                 addr_en =3D FIFO_IOADDR1_ENABLE;
>                 iowrite8((u8)lpc_port & 0xFF,
> -                        lpc_bpc->base + NPCM7XX_BPCFA1L_REG);
> +                        bpc->base + NPCM7XX_BPCFA1L_REG);
>                 iowrite8((u8)(lpc_port >> 8),
> -                        lpc_bpc->base + NPCM7XX_BPCFA1M_REG);
> +                        bpc->base + NPCM7XX_BPCFA1M_REG);
>                 break;
>         case 1:
>                 addr_en =3D FIFO_IOADDR2_ENABLE;
>                 iowrite8((u8)lpc_port & 0xFF,
> -                        lpc_bpc->base + NPCM7XX_BPCFA2L_REG);
> +                        bpc->base + NPCM7XX_BPCFA2L_REG);
>                 iowrite8((u8)(lpc_port >> 8),
> -                        lpc_bpc->base + NPCM7XX_BPCFA2M_REG);
> +                        bpc->base + NPCM7XX_BPCFA2M_REG);
>                 break;
>         default:
> +               misc_deregister(&ch->miscdev);
>                 return -EINVAL;
>         }
>
> -       if (lpc_bpc->en_dwcap)
> +       if (bpc->en_dwcap)
>                 addr_en =3D FIFO_DWCAPTURE;
>
> -       /*
> -        * Enable FIFO Ready Interrupt, FIFO Capture of I/O addr,
> -        * and Host Reset
> -        */
> -       reg_en =3D ioread8(lpc_bpc->base + NPCM7XX_BPCFEN_REG);
> -       iowrite8(reg_en | addr_en | FIFO_READY_INT_ENABLE |
> -                HOST_RESET_INT_ENABLE, lpc_bpc->base +
> NPCM7XX_BPCFEN_REG);
> +       reg_en =3D ioread8(bpc->base + NPCM7XX_BPCFEN_REG);
> +       iowrite8(reg_en | addr_en, bpc->base + NPCM7XX_BPCFEN_REG);
>
> +       smp_mb();
> +       ch->drv =3D bpc;
>         return 0;
>  }
>
> -static void npcm7xx_disable_bpc(struct npcm7xx_bpc *lpc_bpc, int channel=
)
> +static void npcm7xx_bpc_channel_disable(struct npcm7xx_bpc *bpc, int
> channel)
>  {
> -       u8 reg_en;
> +       struct npcm7xx_bpc_channel *ch =3D &bpc->chs[channel];
> +       u8 reg_en =3D ioread8(bpc->base + NPCM7XX_BPCFEN_REG);
> +
> +       if (!ch->drv)
> +               return;
> +       ch->drv =3D NULL;
>
>         switch (channel) {
>         case 0:
> -               reg_en =3D ioread8(lpc_bpc->base + NPCM7XX_BPCFEN_REG);
> -               if (lpc_bpc->en_dwcap)
> -                       iowrite8(reg_en & ~FIFO_DWCAPTURE,
> -                                lpc_bpc->base + NPCM7XX_BPCFEN_REG);
> -               else
> -                       iowrite8(reg_en & ~FIFO_IOADDR1_ENABLE,
> -                                lpc_bpc->base + NPCM7XX_BPCFEN_REG);
> +               iowrite8(reg_en & ~(FIFO_DWCAPTURE | FIFO_IOADDR1_ENABLE)=
,
> +                        bpc->base + NPCM7XX_BPCFEN_REG);
>                 break;
>         case 1:
> -               reg_en =3D ioread8(lpc_bpc->base + NPCM7XX_BPCFEN_REG);
>                 iowrite8(reg_en & ~FIFO_IOADDR2_ENABLE,
> -                        lpc_bpc->base + NPCM7XX_BPCFEN_REG);
> +                        bpc->base + NPCM7XX_BPCFEN_REG);
>                 break;
>         default:
>                 return;
>         }
>
> -       if (!(reg_en & (FIFO_IOADDR1_ENABLE | FIFO_IOADDR2_ENABLE)))
> -               iowrite8(reg_en &
> -                        ~(FIFO_READY_INT_ENABLE | HOST_RESET_INT_ENABLE)=
,
> -                        lpc_bpc->base + NPCM7XX_BPCFEN_REG);
> +       misc_deregister(&ch->miscdev);
> +}
>
> -       kfifo_free(&lpc_bpc->ch[channel].fifo);
> -       misc_deregister(&lpc_bpc->ch[channel].miscdev);
> +static void npcm7xx_bpc_reset(struct npcm7xx_bpc *bpc)
> +{
> +       u8 reg_en =3D ioread8(bpc->base + NPCM7XX_BPCFEN_REG);
> +       reg_en &=3D ~(FIFO_IOADDR1_ENABLE | FIFO_IOADDR2_ENABLE |
> FIFO_DWCAPTURE |
> +                       FIFO_READY_INT_ENABLE | HOST_RESET_INT_ENABLE);
> +       iowrite8(reg_en, bpc->base + NPCM7XX_BPCFEN_REG);
> +}
> +
> +static void npcm7xx_bpc_enable_irq(struct npcm7xx_bpc *bpc)
> +{
> +       u8 reg_en =3D ioread8(bpc->base + NPCM7XX_BPCFEN_REG);
> +       reg_en |=3D FIFO_READY_INT_ENABLE | HOST_RESET_INT_ENABLE;
> +       iowrite8(reg_en, bpc->base + NPCM7XX_BPCFEN_REG);
>  }
>
>  static int npcm7xx_bpc_probe(struct platform_device *pdev)
>  {
> -       struct npcm7xx_bpc *lpc_bpc;
> +       struct npcm7xx_bpc *bpc;
>         struct resource *res;
>         struct device *dev;
>         u32 port;
> @@ -299,8 +378,8 @@ static int npcm7xx_bpc_probe(struct platform_device
> *pdev)
>
>         dev =3D &pdev->dev;
>
> -       lpc_bpc =3D devm_kzalloc(dev, sizeof(*lpc_bpc), GFP_KERNEL);
> -       if (!lpc_bpc)
> +       bpc =3D devm_kzalloc(dev, sizeof(*bpc), GFP_KERNEL);
> +       if (!bpc)
>                 return -ENOMEM;
>
>         res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> @@ -310,11 +389,11 @@ static int npcm7xx_bpc_probe(struct platform_device
> *pdev)
>         }
>
>         dev_dbg(dev, "BIOS post code base resource is %pR\n", res);
> -       lpc_bpc->base =3D devm_ioremap_resource(dev, res);
> -       if (IS_ERR(lpc_bpc->base))
> -               return PTR_ERR(lpc_bpc->base);
> +       bpc->base =3D devm_ioremap_resource(dev, res);
> +       if (IS_ERR(bpc->base))
> +               return PTR_ERR(bpc->base);
>
> -       dev_set_drvdata(&pdev->dev, lpc_bpc);
> +       dev_set_drvdata(&pdev->dev, bpc);
>
>         rc =3D of_property_read_u32_index(dev->of_node, "monitor-ports", =
0,
>                                         &port);
> @@ -323,14 +402,16 @@ static int npcm7xx_bpc_probe(struct platform_device
> *pdev)
>                 return -ENODEV;
>         }
>
> -       lpc_bpc->en_dwcap =3D
> +       bpc->en_dwcap =3D
>                 of_property_read_bool(dev->of_node, "bpc-en-dwcapture");
>
> -       rc =3D npcm7xx_bpc_config_irq(lpc_bpc, pdev);
> +       npcm7xx_bpc_reset(bpc);
> +       rc =3D npcm7xx_bpc_config_irq(bpc, pdev);
>         if (rc)
>                 return rc;
> +       npcm7xx_bpc_enable_irq(bpc);
>
> -       rc =3D npcm7xx_enable_bpc(lpc_bpc, dev, 0, port);
> +       rc =3D npcm7xx_bpc_channel_enable(bpc, dev, 0, port);
>         if (rc) {
>                 dev_err(dev, "Enable BIOS post code I/O port 0 failed\n")=
;
>                 return rc;
> @@ -340,35 +421,36 @@ static int npcm7xx_bpc_probe(struct platform_device
> *pdev)
>          * Configuration of second BPC channel port is optional
>          * Double-Word Capture ignoring address 2
>          */
> -       if (!lpc_bpc->en_dwcap) {
> -               if (of_property_read_u32_index(dev->of_node,
> "monitor-ports",
> -                                              1, &port) =3D=3D 0) {
> -                       rc =3D npcm7xx_enable_bpc(lpc_bpc, dev, 1, port);
> +       rc =3D of_property_read_u32_index(dev->of_node, "monitor-ports", =
1,
> +                                       &port);
> +       if (rc =3D=3D 0) {
> +               if (!bpc->en_dwcap) {
> +                       rc =3D npcm7xx_bpc_channel_enable(bpc, dev, 1, po=
rt);
>                         if (rc) {
> -                               dev_err(dev, "Enable BIOS post code I/O
> port 1 failed, disable I/O port 0\n");
> -                               npcm7xx_disable_bpc(lpc_bpc, 0);
> +                               dev_err(dev, "Enable BIOS post code I/O
> port 1 failed\n");
> +                               npcm7xx_bpc_channel_disable(bpc, 0);
> +                               npcm7xx_bpc_reset(bpc);
>                                 return rc;
>                         }
> +               } else {
> +                       dev_warn(dev, "Ignoring monitor port 1 with
> DWCAP\n");
>                 }
>         }
>
> -       pr_info("npcm7xx BIOS post code probe\n");
> -
> -       return rc;
> +       return 0;
>  }
>
>  static int npcm7xx_bpc_remove(struct platform_device *pdev)
>  {
> -       struct npcm7xx_bpc *lpc_bpc =3D dev_get_drvdata(&pdev->dev);
> -       u8 reg_en;
> -
> -       reg_en =3D ioread8(lpc_bpc->base + NPCM7XX_BPCFEN_REG);
> +       struct npcm7xx_bpc *bpc =3D dev_get_drvdata(&pdev->dev);
> +       u8 i;
>
> -       if (reg_en & FIFO_IOADDR1_ENABLE)
> -               npcm7xx_disable_bpc(lpc_bpc, 0);
> -       if (reg_en & FIFO_IOADDR2_ENABLE)
> -               npcm7xx_disable_bpc(lpc_bpc, 1);
> +       if (!bpc)
> +               return 0;
>
> +       for (i =3D 0; i < NUM_BPC_CHANNELS; ++i)
> +               npcm7xx_bpc_channel_disable(bpc, i);
> +       npcm7xx_bpc_reset(bpc);
>         return 0;
>  }
>
> --
> 2.24.1
>
>
on the upstream side,

We didn=E2=80=99t succeed to upstream BPC driver because Linux community wa=
nts to
create a BMC driver framework in the

Linux kernel driver folder for all the BMC unique modules and not using
misc framework.

(Joel is leading this :-))



Probably the driver will modify once we will have the BMC framework.


Thanks,


Tomer

--000000000000d04b0a0599d0d3b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"margin:0c=
m 0cm 0.0001pt"><font face=3D"arial, sans-serif">Hi William,</font></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"aria=
l, sans-serif">=C2=A0</font></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"aria=
l, sans-serif">Thanks a lot for working on this.</font></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"aria=
l, sans-serif">Thanks for raising issues and sent
great solutions for it. Appreciate it!</font></p><p class=3D"MsoNormal" sty=
le=3D"margin:0cm 0cm 0.0001pt"><font face=3D"arial, sans-serif"><br></font>=
</p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"aria=
l, sans-serif">I</font><span style=3D"font-family:arial,sans-serif">n gener=
al, we prefer to modify the
existing driver and not to do a rework. (I think it can be done in this cas=
e), please let us know what do you think.</span></p><p class=3D"MsoNormal" =
style=3D"margin:0cm 0cm 0.0001pt"><span style=3D"font-family:arial,sans-ser=
if"><br></span></p><p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"=
></p></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Sat, 14 Dec 2019 at 01:19, William A. Kennington III &lt;<a href=3D"mai=
lto:wak@google.com">wak@google.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">This provides a number of fixes:<br>
=C2=A0- Multiple file handles are now supported, previously using multiple<=
br>
=C2=A0 =C2=A0readers would cause a race in the kfifo and spew garbage to th=
e<br>
=C2=A0 =C2=A0readers.<br></blockquote><div><p class=3D"MsoNormal" style=3D"=
margin:0cm 0cm 0.0001pt"><font face=3D"arial, sans-serif" style=3D"">Indeed=
, there is not a support for a
multiple readers; I prefer to have only a single reader per channel because=
</font></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"aria=
l, sans-serif">I don&#39;t see too much use from the
OpenBMC/other application multiple readers, so the RCU use (that is coded
great in your rework) is not much needed and cause a little over head.</fon=
t></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"aria=
l, sans-serif">Do you need a multiple readers in
the OpenBMC user space?</font></p></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
=C2=A0- iowrite{8,16,32} are now supported correctly. Previously, the<br>
=C2=A0 =C2=A0dwcapture code would get confused by values added to the fifo =
for 16<br>
=C2=A0 =C2=A0bit writes<br></blockquote><div><p class=3D"MsoNormal" style=
=3D"margin:0cm 0cm 0.0001pt"><font face=3D"arial, sans-serif" style=3D"">dw=
capture need to be used only with
4 byte writes, of course the host can still write in=C2=A0 {8,16,32}=C2=A0 =
but
it can cause a some issues.</font></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"aria=
l, sans-serif">for example writing only 16 bit from
the higher address, and not getting bit 8 at byte 0 for separating between =
the
words.</font></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"aria=
l, sans-serif">I believe the issue is when writing
lower 16 bits from the host</font>(am I correct?)<span style=3D"font-family=
:arial,sans-serif">, we think it can solved with
padding the same as one 8 bits write.</span></p></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">=C2=A0- Reads from the device now only return =
a single post code. Previously<br>
=C2=A0 =C2=A0the read call would emit all of the post code data in a single=
<br>
=C2=A0 =C2=A0syscall. This was broken because it wouldn&#39;t account for p=
artial post<br>
=C2=A0 =C2=A0code writes into the fifo, meaning the reader could get partia=
l<br>
=C2=A0 =C2=A04-byte codes for dwcap.<br></blockquote><div><p class=3D"MsoNo=
rmal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"arial, sans-serif" st=
yle=3D"">But is seems that if the user not
using dwcap each read will be 1 byte only? what if the user like to read mo=
re
than one byte at a one read?</font></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"aria=
l, sans-serif">as I mentioned above the dwcap is
tricky (probably we needed to explained the use of it better) so the write =
of
16 bit can be problematic.</font></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"aria=
l, sans-serif">I think we can solve the 16 bit
write by doing a padding the same as we doing when having 8 bit write, and =
when
dwcap is enabling</font></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"aria=
l, sans-serif">We can read only 4 byte multiplier.</font></p></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
Tested:<br>
=C2=A0 =C2=A0 Ran as a module with multiple readers and saw the correct val=
ues<br>
=C2=A0 =C2=A0 reaching all of the readers. Also tested adding and removing =
readers<br>
=C2=A0 =C2=A0 at runtime and reloading the kernel module and validating the=
<br>
=C2=A0 =C2=A0 register state.<br>
<br>
Change-Id: Ic979f523ccc7cda76a2328c5f8c869aa25d7204d<br>
Signed-off-by: William A. Kennington III &lt;<a href=3D"mailto:wak@google.c=
om" target=3D"_blank">wak@google.com</a>&gt;<br>
---<br>
=C2=A0drivers/misc/npcm7xx-lpc-bpc.c | 388 ++++++++++++++++++++------------=
-<br>
=C2=A01 file changed, 235 insertions(+), 153 deletions(-)<br>
<br>
diff --git a/drivers/misc/npcm7xx-lpc-bpc.c b/drivers/misc/npcm7xx-lpc-bpc.=
c<br>
index e014e07cd4a46..b04323c4f932d 100644<br>
--- a/drivers/misc/npcm7xx-lpc-bpc.c<br>
+++ b/drivers/misc/npcm7xx-lpc-bpc.c<br>
@@ -10,6 +10,7 @@<br>
=C2=A0#include &lt;linux/of.h&gt;<br>
=C2=A0#include &lt;linux/platform_device.h&gt;<br>
=C2=A0#include &lt;linux/regmap.h&gt;<br>
+#include &lt;linux/slab.h&gt;<br>
=C2=A0#include &lt;linux/miscdevice.h&gt;<br>
=C2=A0#include &lt;linux/poll.h&gt;<br>
<br>
@@ -28,270 +29,348 @@<br>
=C2=A0#define NPCM7XX_BPCFA1L_REG=C2=A0 =C2=A0 0x10 //BIOS POST Code FIFO A=
ddress 1 LSB<br>
=C2=A0#define NPCM7XX_BPCFA1M_REG=C2=A0 =C2=A0 0x12 //BIOS POST Code FIFO A=
ddress 1 MSB<br>
<br>
-/*BIOS regiser data*/<br>
+/* BIOS regiser data */<br>
=C2=A0#define FIFO_IOADDR1_ENABLE=C2=A0 =C2=A0 0x80<br>
=C2=A0#define FIFO_IOADDR2_ENABLE=C2=A0 =C2=A0 0x40<br>
<br>
=C2=A0/* BPC interface package and structure definition */<br>
-#define BPC_KFIFO_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x400<br>
+#define BPC_KFIFO_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x100<br>
<br>
-/*BPC regiser data*/<br>
+/* BPC regiser data */<br>
=C2=A0#define FIFO_DATA_VALID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0x80<br>
=C2=A0#define FIFO_OVERFLOW=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x20<br>
=C2=A0#define FIFO_READY_INT_ENABLE=C2=A0 0x8<br>
=C2=A0#define FIFO_DWCAPTURE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x4<br>
=C2=A0#define FIFO_ADDR_DECODE=C2=A0 =C2=A0 =C2=A0 =C2=A00x1<br>
<br>
-/*Host Reset*/<br>
+/* Host Reset */<br>
=C2=A0#define HOST_RESET_INT_ENABLE=C2=A0 0x10<br>
=C2=A0#define HOST_RESET_CHANGED=C2=A0 =C2=A0 =C2=A00x40<br>
<br>
+struct npcm7xx_code {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 len;<br>
+};<br>
+<br>
+struct npcm7xx_bpc_file_data {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct list_head=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 list;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_bpc_channel=C2=A0 =C2=A0 =C2=A0 =
*ch;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DECLARE_KFIFO(codes, struct npcm7xx_code, BPC_K=
FIFO_SIZE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host_reset;<br>
+};<br>
+<br>
=C2=A0struct npcm7xx_bpc_channel {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_bpc=C2=A0 =C2=A0 =C2=A0 *data;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct kfifo=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 fifo;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_bpc=C2=A0 =C2=A0 =C2=A0 *drv;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wait_queue_head_t=C2=A0 =C2=A0 =C2=A0 =C2=A0wq;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 host_reset;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct list_head=C2=A0 =C2=A0 =C2=A0 =C2=A0 fil=
es;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct miscdevice=C2=A0 =C2=A0 =C2=A0 =C2=A0mis=
cdev;<br>
=C2=A0};<br>
<br>
=C2=A0struct npcm7xx_bpc {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 void __iomem=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *base;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_bpc_channel=C2=A0 =C2=A0 =C2=A0 =
chs[NUM_BPC_CHANNELS];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0irq;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 en_dwcap;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_bpc_channel=C2=A0 =C2=A0 =C2=A0 =
ch[NUM_BPC_CHANNELS];<br>
=C2=A0};<br>
<br>
-static struct npcm7xx_bpc_channel *npcm7xx_file_to_ch(struct file *file)<b=
r>
+static int npcm7xx_bpc_open(struct inode *inode, struct file *file)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return container_of(file-&gt;private_data, stru=
ct npcm7xx_bpc_channel,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0miscdev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_bpc_file_data *data;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0data =3D kmalloc(sizeof(*data), GFP_KERNEL);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!data)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_KFIFO(data-&gt;codes);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;ch =3D container_of(file-&gt;private_d=
ata,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_bpc_channel, miscdev);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;host_reset =3D false;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file-&gt;private_data =3D data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0list_add_rcu(&amp;data-&gt;list, &amp;data-&gt;=
ch-&gt;files);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int npcm7xx_bpc_release(struct inode *inode, struct file *file)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_bpc_file_data *data =3D file-&gt=
;private_data;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!data)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EIO;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0list_del_rcu(&amp;data-&gt;list);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0synchronize_rcu();<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file-&gt;private_data =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(data);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
=C2=A0static ssize_t npcm7xx_bpc_read(struct file *file, char __user *buffe=
r,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t count, loff_t *ppos)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_bpc_channel *chan =3D npcm7xx_fi=
le_to_ch(file);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_bpc *lpc_bpc =3D chan-&gt;data;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int copied;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_bpc_file_data *data =3D file-&gt=
;private_data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_code code;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int cond_size =3D 1;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (lpc_bpc-&gt;en_dwcap)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cond_size =3D 3;<br=
>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (kfifo_len(&amp;chan-&gt;fifo) &lt; cond_siz=
e) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while (!kfifo_get(&amp;data-&gt;codes, &amp;cod=
e)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (file-&gt;f_flag=
s &amp; O_NONBLOCK)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -EAGAIN;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D wait_event_=
interruptible<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(chan-&gt;wq, kfifo_len(&amp;chan-&gt;fifo) &gt; cond_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(data-&gt;ch-&gt;wq, kfifo_len(&amp;data-&gt;codes) &gt; 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -ERE=
STARTSYS)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -EINTR;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D kfifo_to_user(&amp;chan-&gt;fifo, buffe=
r, count, &amp;copied);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (code.len &lt; count)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0count =3D code.len;=
<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret ? ret : copied;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D copy_to_user(buffer, &amp;code.data, co=
unt);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret !=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<br>
=C2=A0}<br>
<br>
=C2=A0static __poll_t npcm7xx_bpc_poll(struct file *file,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct poll_table_struct *pt)<=
br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_bpc_channel *chan =3D npcm7xx_fi=
le_to_ch(file);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_bpc_file_data *data =3D file-&gt=
;private_data;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __poll_t mask =3D 0;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0poll_wait(file, &amp;chan-&gt;wq, pt);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!kfifo_is_empty(&amp;chan-&gt;fifo))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0poll_wait(file, &amp;data-&gt;ch-&gt;wq, pt);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!kfifo_is_empty(&amp;data-&gt;codes))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mask |=3D POLLIN;<b=
r>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (chan-&gt;host_reset) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (data-&gt;host_reset) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mask |=3D POLLHUP;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chan-&gt;host_reset=
 =3D false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;host_reset=
 =3D false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return mask;<br>
=C2=A0}<br>
<br>
-static const struct file_operations npcm7xx_bpc_fops =3D {<br>
+static const struct file_operations npcm7xx_bpc_channel_fops =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TH=
IS_MODULE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.open=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D npcm7xx_bpc_open,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.release=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D npcm7xx=
_bpc_release,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .read=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D npcm7xx_bpc_read,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .poll=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D npcm7xx_bpc_poll,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .llseek=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D no=
op_llseek,<br>
=C2=A0};<br>
<br>
-static irqreturn_t npcm7xx_bpc_irq(int irq, void *arg)<br>
+static void npcm7xx_bpc_channel_update(struct npcm7xx_bpc_channel *ch,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct np=
cm7xx_code *code)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_bpc *lpc_bpc =3D arg;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 fifo_st;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 host_st;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 addr_index =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 Data;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 padzero[3] =3D {0};<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 last_addr_bit =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bool isr_flag =3D false;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fifo_st =3D ioread8(lpc_bpc-&gt;base + NPCM7XX_=
BPCFSTAT_REG);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0while (FIFO_DATA_VALID &amp; fifo_st) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If dwcapture en=
abled only channel 0 (FIFO 0) used */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!lpc_bpc-&gt;en=
_dwcap)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0addr_index =3D fifo_st &amp; FIFO_ADDR_DECODE;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0last_addr_bit =3D fifo_st &amp; FIFO_ADDR_DECODE;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*Read data from FI=
FO to clear interrupt*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Data =3D ioread8(lp=
c_bpc-&gt;base + NPCM7XX_BPCFDATA_REG);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (kfifo_is_full(&=
amp;lpc_bpc-&gt;ch[addr_index].fifo))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0kfifo_skip(&amp;lpc_bpc-&gt;ch[addr_index].fifo);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfifo_put(&amp;lpc_=
bpc-&gt;ch[addr_index].fifo, Data);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fifo_st &amp; F=
IFO_OVERFLOW)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pr_info(&quot;BIOS Post Codes FIFO Overflow!!!\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_bpc_file_data *data;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fifo_st =3D ioread8=
(lpc_bpc-&gt;base + NPCM7XX_BPCFSTAT_REG);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (lpc_bpc-&gt;en_=
dwcap &amp;&amp; last_addr_bit) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if ((fifo_st &amp; FIFO_ADDR_DECODE) ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0((FIFO_DATA_VALID &amp; fifo_st) =3D=3D 0)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (kfifo_avail(&amp;lpc_bpc-&gt;c=
h[addr_index].fifo) &lt; DW_PAD_SIZE)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfifo_ski=
p(&amp;lpc_bpc-&gt;ch[addr_index].fifo);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfifo_in(&amp;lpc_bpc-&gt;ch[addr_ind=
ex].fifo,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 padzero,=
 DW_PAD_SIZE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ch-&gt;drv) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_warn(&quot;BIOS =
Post Code Update for unconfigured channel\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry_rcu(data, &amp;ch-&gt;files=
, list) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (kfifo_is_full(&=
amp;data-&gt;codes))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0kfifo_skip(&amp;data-&gt;codes);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfifo_put(&amp;data=
-&gt;codes, *code);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
+<br>
+static void npcm7xx_bpc_channel_wake(struct npcm7xx_bpc_channel *ch)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ch-&gt;drv)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0wake_up_interruptible(&amp;ch-&gt;wq);<br>
+}<br>
+<br>
+static void npcm7xx_bpc_host_reset(struct npcm7xx_bpc *bpc)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_bpc_file_data *data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 i;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; NUM_BPC_CHANNELS; ++i) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!bpc-&gt;chs[i]=
.drv)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry=
_rcu(data, &amp;bpc-&gt;chs[i].files, list) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0data-&gt;host_reset =3D true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isr_flag =3D true;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static irqreturn_t npcm7xx_bpc_irq(int irq, void *arg)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_bpc *bpc =3D arg;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_code code =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.len =3D 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.data =3D 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool ch_wake[NUM_BPC_CHANNELS] =3D {};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 read_byte;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 status;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 ch_i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool reg_valid;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0irqreturn_t ret =3D IRQ_NONE;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_read_lock();<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while (true) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D ioread8(=
bpc-&gt;base + NPCM7XX_BPCFSTAT_REG);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_valid =3D statu=
s &amp; FIFO_DATA_VALID;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (code.len &gt; 0=
 &amp;&amp; (!reg_valid || !bpc-&gt;en_dwcap ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status &amp; FIFO_ADDR=
_DECODE)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0npcm7xx_bpc_channel_update(&amp;bpc-&gt;chs[ch_i], &amp;code);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ch_wake[ch_i] =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0code.len =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0code.data =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!reg_valid)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0host_st =3D ioread8(lpc_bpc-&gt;base + NPCM7XX_=
BPCFMSTAT_REG);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (host_st &amp; HOST_RESET_CHANGED) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iowrite8(HOST_RESET=
_CHANGED,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 lpc_bpc-&gt;base + NPCM7XX_BPCFMSTAT_REG);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lpc_bpc-&gt;ch[addr=
_index].host_reset =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isr_flag =3D true;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (status &amp; FI=
FO_OVERFLOW)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pr_info(&quot;BIOS Post Codes FIFO Overflow!!!\n&quot;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ch_i =3D bpc-&gt;en=
_dwcap ? 0 : status &amp; FIFO_ADDR_DECODE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0read_byte =3D iorea=
d8(bpc-&gt;base + NPCM7XX_BPCFDATA_REG);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0code.data |=3D read=
_byte &lt;&lt; (code.len++ &lt;&lt; 3);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (isr_flag) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wake_up_interruptib=
le(&amp;lpc_bpc-&gt;ch[addr_index].wq);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return IRQ_HANDLED;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D ioread8(bpc-&gt;base + NPCM7XX_BPCFM=
STAT_REG);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (status &amp; HOST_RESET_CHANGED) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iowrite8(HOST_RESET=
_CHANGED, bpc-&gt;base + NPCM7XX_BPCFMSTAT_REG);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_bpc_host_re=
set(bpc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (ch_i =3D 0; ch=
_i &lt; NUM_BPC_CHANNELS; ++ch_i)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ch_wake[ch_i] =3D true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return IRQ_NONE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_read_unlock();<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (ch_i =3D 0; ch_i &lt; NUM_BPC_CHANNELS; ++=
ch_i)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ch_wake[ch_i]) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0npcm7xx_bpc_channel_wake(&amp;bpc-&gt;chs[ch_i]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D IRQ_HANDLED;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
-static int npcm7xx_bpc_config_irq(struct npcm7xx_bpc *lpc_bpc,<br>
+static int npcm7xx_bpc_config_irq(struct npcm7xx_bpc *bpc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct platform_device *pdev)=
<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device *dev =3D &amp;pdev-&gt;dev;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int rc;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lpc_bpc-&gt;irq =3D platform_get_irq(pdev, 0);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (lpc_bpc-&gt;irq &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bpc-&gt;irq =3D platform_get_irq(pdev, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bpc-&gt;irq &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(dev, &quot;=
get IRQ failed\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return lpc_bpc-&gt;=
irq;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return bpc-&gt;irq;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D devm_request_irq(dev, lpc_bpc-&gt;irq,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D devm_request_irq(dev, bpc-&gt;irq,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm7xx_bpc_irq, IRQF_SHARED,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DEVICE_NAME, lpc_bpc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DEVICE_NAME, bpc);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rc &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(dev, &quot=
;Unable to request IRQ %d\n&quot;, lpc_bpc-&gt;irq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;=
Unable to request IRQ %d\n&quot;, bpc-&gt;irq);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return rc;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
<br>
-static int npcm7xx_enable_bpc(struct npcm7xx_bpc *lpc_bpc, struct device *=
dev,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int channel, u16 lpc_port)<br>
+static int npcm7xx_bpc_channel_enable(struct npcm7xx_bpc *bpc, struct devi=
ce *dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int channel, u16=
 lpc_port)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_bpc_channel *ch =3D &amp;bpc-&gt=
;chs[channel];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int rc;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u8 addr_en, reg_en;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0init_waitqueue_head(&amp;lpc_bpc-&gt;ch[channel=
].wq);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D kfifo_alloc(&amp;lpc_bpc-&gt;ch[channel]=
.fifo,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 BPC_KFIFO_SIZE, GFP_KERNEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return rc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0init_waitqueue_head(&amp;ch-&gt;wq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_LIST_HEAD(&amp;ch-&gt;files);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lpc_bpc-&gt;ch[channel].miscdev.minor =3D MISC_=
DYNAMIC_MINOR;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lpc_bpc-&gt;ch[channel].<a href=3D"http://miscd=
ev.name" rel=3D"noreferrer" target=3D"_blank">miscdev.name</a> =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ch-&gt;miscdev.minor =3D MISC_DYNAMIC_MINOR;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ch-&gt;<a href=3D"http://miscdev.name" rel=3D"n=
oreferrer" target=3D"_blank">miscdev.name</a> =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 devm_kasprintf(dev,=
 GFP_KERNEL, &quot;%s%d&quot;, DEVICE_NAME, channel);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lpc_bpc-&gt;ch[channel].miscdev.fops =3D &amp;n=
pcm7xx_bpc_fops;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lpc_bpc-&gt;ch[channel].miscdev.parent =3D dev;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D misc_register(&amp;lpc_bpc-&gt;ch[channe=
l].miscdev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ch-&gt;miscdev.fops =3D &amp;npcm7xx_bpc_channe=
l_fops;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ch-&gt;miscdev.parent =3D dev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D misc_register(&amp;ch-&gt;miscdev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return rc;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lpc_bpc-&gt;ch[channel].data =3D lpc_bpc;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lpc_bpc-&gt;ch[channel].host_reset =3D false;<b=
r>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Enable LPC snoop channel at requested port *=
/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (channel) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr_en =3D FIFO_IO=
ADDR1_ENABLE;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iowrite8((u8)lpc_po=
rt &amp; 0xFF,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 lpc_bpc-&gt;base + NPCM7XX_BPCFA1L_REG);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bpc-&gt;base + NPCM7XX_BPCFA1L_REG);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iowrite8((u8)(lpc_p=
ort &gt;&gt; 8),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 lpc_bpc-&gt;base + NPCM7XX_BPCFA1M_REG);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bpc-&gt;base + NPCM7XX_BPCFA1M_REG);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 1:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr_en =3D FIFO_IO=
ADDR2_ENABLE;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iowrite8((u8)lpc_po=
rt &amp; 0xFF,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 lpc_bpc-&gt;base + NPCM7XX_BPCFA2L_REG);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bpc-&gt;base + NPCM7XX_BPCFA2L_REG);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iowrite8((u8)(lpc_p=
ort &gt;&gt; 8),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 lpc_bpc-&gt;base + NPCM7XX_BPCFA2M_REG);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bpc-&gt;base + NPCM7XX_BPCFA2M_REG);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0misc_deregister(&am=
p;ch-&gt;miscdev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (lpc_bpc-&gt;en_dwcap)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bpc-&gt;en_dwcap)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr_en =3D FIFO_DW=
CAPTURE;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Enable FIFO Ready Interrupt, FIFO Capture of=
 I/O addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * and Host Reset<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0reg_en =3D ioread8(lpc_bpc-&gt;base + NPCM7XX_B=
PCFEN_REG);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0iowrite8(reg_en | addr_en | FIFO_READY_INT_ENAB=
LE |<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HOST_RESET_INT_ENA=
BLE, lpc_bpc-&gt;base + NPCM7XX_BPCFEN_REG);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg_en =3D ioread8(bpc-&gt;base + NPCM7XX_BPCFE=
N_REG);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0iowrite8(reg_en | addr_en, bpc-&gt;base + NPCM7=
XX_BPCFEN_REG);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0smp_mb();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ch-&gt;drv =3D bpc;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
<br>
-static void npcm7xx_disable_bpc(struct npcm7xx_bpc *lpc_bpc, int channel)<=
br>
+static void npcm7xx_bpc_channel_disable(struct npcm7xx_bpc *bpc, int chann=
el)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 reg_en;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_bpc_channel *ch =3D &amp;bpc-&gt=
;chs[channel];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 reg_en =3D ioread8(bpc-&gt;base + NPCM7XX_BP=
CFEN_REG);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ch-&gt;drv)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ch-&gt;drv =3D NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (channel) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_en =3D ioread8(=
lpc_bpc-&gt;base + NPCM7XX_BPCFEN_REG);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (lpc_bpc-&gt;en_=
dwcap)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0iowrite8(reg_en &amp; ~FIFO_DWCAPTURE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lpc_bpc-&gt;base + NPCM7XX_BPCFEN_RE=
G);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0iowrite8(reg_en &amp; ~FIFO_IOADDR1_ENABLE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lpc_bpc-&gt;base + NPCM7XX_BPCFEN_RE=
G);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iowrite8(reg_en &am=
p; ~(FIFO_DWCAPTURE | FIFO_IOADDR1_ENABLE),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bpc-&gt;base + NPCM7XX_BPCFEN_REG);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 1:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_en =3D ioread8(=
lpc_bpc-&gt;base + NPCM7XX_BPCFEN_REG);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iowrite8(reg_en &am=
p; ~FIFO_IOADDR2_ENABLE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 lpc_bpc-&gt;base + NPCM7XX_BPCFEN_REG);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bpc-&gt;base + NPCM7XX_BPCFEN_REG);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(reg_en &amp; (FIFO_IOADDR1_ENABLE | FIFO_=
IOADDR2_ENABLE)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iowrite8(reg_en &am=
p;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ~(FIFO_READY_INT_ENABLE | HOST_RESET_INT_ENABLE),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 lpc_bpc-&gt;base + NPCM7XX_BPCFEN_REG);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0misc_deregister(&amp;ch-&gt;miscdev);<br>
+}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0kfifo_free(&amp;lpc_bpc-&gt;ch[channel].fifo);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0misc_deregister(&amp;lpc_bpc-&gt;ch[channel].mi=
scdev);<br>
+static void npcm7xx_bpc_reset(struct npcm7xx_bpc *bpc)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 reg_en =3D ioread8(bpc-&gt;base + NPCM7XX_BP=
CFEN_REG);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg_en &amp;=3D ~(FIFO_IOADDR1_ENABLE | FIFO_IO=
ADDR2_ENABLE | FIFO_DWCAPTURE |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0FIFO_READY_INT_ENABLE | HOST_RESET_INT_ENABLE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0iowrite8(reg_en, bpc-&gt;base + NPCM7XX_BPCFEN_=
REG);<br>
+}<br>
+<br>
+static void npcm7xx_bpc_enable_irq(struct npcm7xx_bpc *bpc)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 reg_en =3D ioread8(bpc-&gt;base + NPCM7XX_BP=
CFEN_REG);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reg_en |=3D FIFO_READY_INT_ENABLE | HOST_RESET_=
INT_ENABLE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0iowrite8(reg_en, bpc-&gt;base + NPCM7XX_BPCFEN_=
REG);<br>
=C2=A0}<br>
<br>
=C2=A0static int npcm7xx_bpc_probe(struct platform_device *pdev)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_bpc *lpc_bpc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_bpc *bpc;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct resource *res;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device *dev;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 port;<br>
@@ -299,8 +378,8 @@ static int npcm7xx_bpc_probe(struct platform_device *pd=
ev)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev =3D &amp;pdev-&gt;dev;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lpc_bpc =3D devm_kzalloc(dev, sizeof(*lpc_bpc),=
 GFP_KERNEL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!lpc_bpc)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bpc =3D devm_kzalloc(dev, sizeof(*bpc), GFP_KER=
NEL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!bpc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D platform_get_resource(pdev, IORESOURCE_=
MEM, 0);<br>
@@ -310,11 +389,11 @@ static int npcm7xx_bpc_probe(struct platform_device *=
pdev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_dbg(dev, &quot;BIOS post code base resource=
 is %pR\n&quot;, res);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lpc_bpc-&gt;base =3D devm_ioremap_resource(dev,=
 res);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(lpc_bpc-&gt;base))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(lpc_=
bpc-&gt;base);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bpc-&gt;base =3D devm_ioremap_resource(dev, res=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(bpc-&gt;base))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(bpc-=
&gt;base);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_set_drvdata(&amp;pdev-&gt;dev, lpc_bpc);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_set_drvdata(&amp;pdev-&gt;dev, bpc);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D of_property_read_u32_index(dev-&gt;of_no=
de, &quot;monitor-ports&quot;, 0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;por=
t);<br>
@@ -323,14 +402,16 @@ static int npcm7xx_bpc_probe(struct platform_device *=
pdev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lpc_bpc-&gt;en_dwcap =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bpc-&gt;en_dwcap =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 of_property_read_bo=
ol(dev-&gt;of_node, &quot;bpc-en-dwcapture&quot;);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D npcm7xx_bpc_config_irq(lpc_bpc, pdev);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_bpc_reset(bpc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D npcm7xx_bpc_config_irq(bpc, pdev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return rc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_bpc_enable_irq(bpc);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D npcm7xx_enable_bpc(lpc_bpc, dev, 0, port=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D npcm7xx_bpc_channel_enable(bpc, dev, 0, =
port);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rc) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(dev, &quot;=
Enable BIOS post code I/O port 0 failed\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return rc;<br>
@@ -340,35 +421,36 @@ static int npcm7xx_bpc_probe(struct platform_device *=
pdev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Configuration of second BPC channel por=
t is optional<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Double-Word Capture ignoring address 2<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!lpc_bpc-&gt;en_dwcap) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (of_property_rea=
d_u32_index(dev-&gt;of_node, &quot;monitor-ports&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 1, &amp;port) =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0rc =3D npcm7xx_enable_bpc(lpc_bpc, dev, 1, port);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D of_property_read_u32_index(dev-&gt;of_no=
de, &quot;monitor-ports&quot;, 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;port=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!bpc-&gt;en_dwc=
ap) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0rc =3D npcm7xx_bpc_channel_enable(bpc, dev, 1, port);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (rc) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;Enable BIOS post c=
ode I/O port 1 failed, disable I/O port 0\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_disable_bpc(lpc_bpc, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;Enable BIOS post c=
ode I/O port 1 failed\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_bpc_channel_disable(bpc, 0);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_bpc_reset(bpc);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return rc;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_warn(dev, &quot;Ignoring monitor port 1 with DWCAP\n&quot;);<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_info(&quot;npcm7xx BIOS post code probe\n&qu=
ot;);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return rc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
=C2=A0static int npcm7xx_bpc_remove(struct platform_device *pdev)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_bpc *lpc_bpc =3D dev_get_drvdata=
(&amp;pdev-&gt;dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 reg_en;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0reg_en =3D ioread8(lpc_bpc-&gt;base + NPCM7XX_B=
PCFEN_REG);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm7xx_bpc *bpc =3D dev_get_drvdata(&am=
p;pdev-&gt;dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 i;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (reg_en &amp; FIFO_IOADDR1_ENABLE)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_disable_bpc=
(lpc_bpc, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (reg_en &amp; FIFO_IOADDR2_ENABLE)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_disable_bpc=
(lpc_bpc, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!bpc)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; NUM_BPC_CHANNELS; ++i)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_bpc_channel=
_disable(bpc, i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_bpc_reset(bpc);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
<br>
-- <br>
2.24.1<br>
<br></blockquote><div><br></div><div><p class=3D"MsoNormal" style=3D"margin=
:0cm 0cm 0.0001pt"><span style=3D"font-family:arial,sans-serif">on the upst=
ream side,</span><br></p></div><div><font face=3D"arial, sans-serif"><br></=
font></div><div><font face=3D"arial, sans-serif">We didn=E2=80=99t succeed =
to upstream BPC
driver because Linux community wants to create a BMC driver framework in
the=C2=A0</font></div>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"aria=
l, sans-serif">Linux kernel driver folder for all
the BMC unique modules and not using misc framework.</font></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"aria=
l, sans-serif">(Joel is leading this :-))</font></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"aria=
l, sans-serif">=C2=A0</font></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"aria=
l, sans-serif">Probably=C2=A0the driver will modify
once we will have the BMC framework.</font></p><p class=3D"MsoNormal" style=
=3D"margin:0cm 0cm 0.0001pt"><font face=3D"arial, sans-serif"><br></font></=
p><p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"ar=
ial, sans-serif">Thanks,</font></p><p class=3D"MsoNormal" style=3D"margin:0=
cm 0cm 0.0001pt"><font face=3D"arial, sans-serif"><br></font></p><p class=
=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"arial, sans-=
serif">Tomer</font></p></div></div>

--000000000000d04b0a0599d0d3b9--
