Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FB711EE5D
	for <lists+openbmc@lfdr.de>; Sat, 14 Dec 2019 00:18:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ZRSD1lgxzDrLX
	for <lists+openbmc@lfdr.de>; Sat, 14 Dec 2019 10:18:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--wak.bounces.google.com (client-ip=2607:f8b0:4864:20::649;
 helo=mail-pl1-x649.google.com;
 envelope-from=3lxz0xqmkby4gkuqyyqvo.mywyzoxlwmvscdc.yjvklc.ybq@flex--wak.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="VkSqcdPL"; 
 dkim-atps=neutral
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZRRX4m9zzDr63
 for <openbmc@lists.ozlabs.org>; Sat, 14 Dec 2019 10:18:11 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id d24so2064359pll.14
 for <openbmc@lists.ozlabs.org>; Fri, 13 Dec 2019 15:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=ai8y2TdcFWgI5YbR86/8iFPk7YBipMR6zf4KTCcX3oE=;
 b=VkSqcdPLo3B8d3hnc/3rYYFzl8lxVfcKT9eRMH4AeMYeRJ/TSS/QEPAtGUsFNSzVnw
 VovZnpk1V38WPyAzbSx2AgaQ+KHgKfkxp8wmpDUXQ9cSMae81aov8Uqk6r9sEHmNreKd
 GOpQSJMQ0Zn11+lRkb9rMh+itAC7bjGR6JQJ0xGZrrwKMci6E9qwNwlUU6V9QU/H44gk
 oQkZBLMM3LKmklGzhfJrQo583I+THaHwepGpbIMeiAs2Kwim/SJO0iv8v6XHQ7uX9tmU
 n7UDychkxnRVvulIIQUN3J5IH7mSewTDSEDc7HBFJFcPMXE0AfFNril3hTnWuo/edodI
 NZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=ai8y2TdcFWgI5YbR86/8iFPk7YBipMR6zf4KTCcX3oE=;
 b=HZ99eJcd5OO+ido2onl7jNaUTDaM1orQh4z2RwKna9NshbMF/G69exk/h4X12Nqe52
 v2xlZq4t7W77UBWtFtKX9Yz9EBbELa+W1Ok2Oy/jnQlKjThDnpDK/YcIxHGVZB5G4xA1
 CBcsCjNBH/O/qlRRPhqXBf0i+N1/N8HHFKpZRmA2KepXJjzeYdaxE+h2PKrtCcQCf7Cv
 JFPKtjaLRHHm9cKQequrks6XZ+VNiw95oGaXO4mUCvkaOQFYa+n6Og4CdDwruo5IdP0r
 gq6NkuEcYiEAkTOGRqUaqMKX5NDgfALm8qyXWVa0cwfvnneYebugKk7PTTiiPDi9XXKF
 lQbg==
X-Gm-Message-State: APjAAAUbygb4SwfBqELKCD5Pz5r0T42EP+rFHnClixtsZGcyiYqtXu/l
 rbTb3ijlknUUQTxXx539C1FW9VYJerq2vpduvzAoHSgKDYDKSxBp8kIxQPSFws+G8soZ1y7HhdK
 YTbZsUYgUad0XOuV3MJG2FminG+MYHyev+Qfzb85rgl4BXS+bj4zAziov
X-Google-Smtp-Source: APXvYqy3i+dFEumI/46mBHyV5mRsp7YEVKkgtzXMdeI/l57QCNeIxbO5yKjf86hAD1poEmD+rw+EBEM=
X-Received: by 2002:a63:7985:: with SMTP id u127mr2235571pgc.169.1576279087844; 
 Fri, 13 Dec 2019 15:18:07 -0800 (PST)
Date: Fri, 13 Dec 2019 15:18:03 -0800
Message-Id: <20191213231803.20766-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.1
Subject: [PATCH] npcm7xx-lpc-bpc: Rework driver
From: "William A. Kennington III" <wak@google.com>
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: "William A. Kennington III" <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This provides a number of fixes:
 - Multiple file handles are now supported, previously using multiple
   readers would cause a race in the kfifo and spew garbage to the
   readers.
 - iowrite{8,16,32} are now supported correctly. Previously, the
   dwcapture code would get confused by values added to the fifo for 16
   bit writes
 - Reads from the device now only return a single post code. Previously
   the read call would emit all of the post code data in a single
   syscall. This was broken because it wouldn't account for partial post
   code writes into the fifo, meaning the reader could get partial
   4-byte codes for dwcap.

Tested:
    Ran as a module with multiple readers and saw the correct values
    reaching all of the readers. Also tested adding and removing readers
    at runtime and reloading the kernel module and validating the
    register state.

Change-Id: Ic979f523ccc7cda76a2328c5f8c869aa25d7204d
Signed-off-by: William A. Kennington III <wak@google.com>
---
 drivers/misc/npcm7xx-lpc-bpc.c | 388 ++++++++++++++++++++-------------
 1 file changed, 235 insertions(+), 153 deletions(-)

diff --git a/drivers/misc/npcm7xx-lpc-bpc.c b/drivers/misc/npcm7xx-lpc-bpc.c
index e014e07cd4a46..b04323c4f932d 100644
--- a/drivers/misc/npcm7xx-lpc-bpc.c
+++ b/drivers/misc/npcm7xx-lpc-bpc.c
@@ -10,6 +10,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
 #include <linux/miscdevice.h>
 #include <linux/poll.h>
 
@@ -28,270 +29,348 @@
 #define NPCM7XX_BPCFA1L_REG	0x10 //BIOS POST Code FIFO Address 1 LSB
 #define NPCM7XX_BPCFA1M_REG	0x12 //BIOS POST Code FIFO Address 1 MSB
 
-/*BIOS regiser data*/
+/* BIOS regiser data */
 #define FIFO_IOADDR1_ENABLE	0x80
 #define FIFO_IOADDR2_ENABLE	0x40
 
 /* BPC interface package and structure definition */
-#define BPC_KFIFO_SIZE		0x400
+#define BPC_KFIFO_SIZE		0x100
 
-/*BPC regiser data*/
+/* BPC regiser data */
 #define FIFO_DATA_VALID		0x80
 #define FIFO_OVERFLOW		0x20
 #define FIFO_READY_INT_ENABLE	0x8
 #define FIFO_DWCAPTURE		0x4
 #define FIFO_ADDR_DECODE	0x1
 
-/*Host Reset*/
+/* Host Reset */
 #define HOST_RESET_INT_ENABLE	0x10
 #define HOST_RESET_CHANGED	0x40
 
+struct npcm7xx_code {
+	u32 data;
+	u8 len;
+};
+
+struct npcm7xx_bpc_file_data {
+	struct list_head		list;
+	struct npcm7xx_bpc_channel	*ch;
+	DECLARE_KFIFO(codes, struct npcm7xx_code, BPC_KFIFO_SIZE);
+	bool				host_reset;
+};
+
 struct npcm7xx_bpc_channel {
-	struct npcm7xx_bpc	*data;
-	struct kfifo		fifo;
+	struct npcm7xx_bpc	*drv;
 	wait_queue_head_t	wq;
-	bool			host_reset;
+	struct list_head	files;
 	struct miscdevice	miscdev;
 };
 
 struct npcm7xx_bpc {
 	void __iomem			*base;
+	struct npcm7xx_bpc_channel	chs[NUM_BPC_CHANNELS];
 	int				irq;
 	bool				en_dwcap;
-	struct npcm7xx_bpc_channel	ch[NUM_BPC_CHANNELS];
 };
 
-static struct npcm7xx_bpc_channel *npcm7xx_file_to_ch(struct file *file)
+static int npcm7xx_bpc_open(struct inode *inode, struct file *file)
 {
-	return container_of(file->private_data, struct npcm7xx_bpc_channel,
-			    miscdev);
+	struct npcm7xx_bpc_file_data *data;
+
+	data = kmalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	INIT_KFIFO(data->codes);
+	data->ch = container_of(file->private_data,
+				struct npcm7xx_bpc_channel, miscdev);
+	data->host_reset = false;
+
+	file->private_data = data;
+	list_add_rcu(&data->list, &data->ch->files);
+	return 0;
+}
+
+static int npcm7xx_bpc_release(struct inode *inode, struct file *file)
+{
+	struct npcm7xx_bpc_file_data *data = file->private_data;
+
+	if (!data)
+		return -EIO;
+
+	list_del_rcu(&data->list);
+	synchronize_rcu();
+
+	file->private_data = NULL;
+	kfree(data);
+	return 0;
 }
 
 static ssize_t npcm7xx_bpc_read(struct file *file, char __user *buffer,
 				size_t count, loff_t *ppos)
 {
-	struct npcm7xx_bpc_channel *chan = npcm7xx_file_to_ch(file);
-	struct npcm7xx_bpc *lpc_bpc = chan->data;
-	unsigned int copied;
+	struct npcm7xx_bpc_file_data *data = file->private_data;
+	struct npcm7xx_code code;
 	int ret = 0;
-	int cond_size = 1;
-
-	if (lpc_bpc->en_dwcap)
-		cond_size = 3;
 
-	if (kfifo_len(&chan->fifo) < cond_size) {
+	while (!kfifo_get(&data->codes, &code)) {
 		if (file->f_flags & O_NONBLOCK)
 			return -EAGAIN;
 
 		ret = wait_event_interruptible
-			(chan->wq, kfifo_len(&chan->fifo) > cond_size);
+			(data->ch->wq, kfifo_len(&data->codes) > 0);
 		if (ret == -ERESTARTSYS)
 			return -EINTR;
 	}
 
-	ret = kfifo_to_user(&chan->fifo, buffer, count, &copied);
+	if (code.len < count)
+		count = code.len;
 
-	return ret ? ret : copied;
+	ret = copy_to_user(buffer, &code.data, count);
+	if (ret != 0)
+		return -EFAULT;
+
+	return count;
 }
 
 static __poll_t npcm7xx_bpc_poll(struct file *file,
 				 struct poll_table_struct *pt)
 {
-	struct npcm7xx_bpc_channel *chan = npcm7xx_file_to_ch(file);
+	struct npcm7xx_bpc_file_data *data = file->private_data;
 	__poll_t mask = 0;
 
-	poll_wait(file, &chan->wq, pt);
-	if (!kfifo_is_empty(&chan->fifo))
+	poll_wait(file, &data->ch->wq, pt);
+	if (!kfifo_is_empty(&data->codes))
 		mask |= POLLIN;
 
-	if (chan->host_reset) {
+	if (data->host_reset) {
 		mask |= POLLHUP;
-		chan->host_reset = false;
+		data->host_reset = false;
 	}
 
 	return mask;
 }
 
-static const struct file_operations npcm7xx_bpc_fops = {
+static const struct file_operations npcm7xx_bpc_channel_fops = {
 	.owner		= THIS_MODULE,
+	.open		= npcm7xx_bpc_open,
+	.release	= npcm7xx_bpc_release,
 	.read		= npcm7xx_bpc_read,
 	.poll		= npcm7xx_bpc_poll,
 	.llseek		= noop_llseek,
 };
 
-static irqreturn_t npcm7xx_bpc_irq(int irq, void *arg)
+static void npcm7xx_bpc_channel_update(struct npcm7xx_bpc_channel *ch,
+				       const struct npcm7xx_code *code)
 {
-	struct npcm7xx_bpc *lpc_bpc = arg;
-	u8 fifo_st;
-	u8 host_st;
-	u8 addr_index = 0;
-	u8 Data;
-	u8 padzero[3] = {0};
-	u8 last_addr_bit = 0;
-	bool isr_flag = false;
-
-	fifo_st = ioread8(lpc_bpc->base + NPCM7XX_BPCFSTAT_REG);
-	while (FIFO_DATA_VALID & fifo_st) {
-		 /* If dwcapture enabled only channel 0 (FIFO 0) used */
-		if (!lpc_bpc->en_dwcap)
-			addr_index = fifo_st & FIFO_ADDR_DECODE;
-		else
-			last_addr_bit = fifo_st & FIFO_ADDR_DECODE;
-
-		/*Read data from FIFO to clear interrupt*/
-		Data = ioread8(lpc_bpc->base + NPCM7XX_BPCFDATA_REG);
-		if (kfifo_is_full(&lpc_bpc->ch[addr_index].fifo))
-			kfifo_skip(&lpc_bpc->ch[addr_index].fifo);
-		kfifo_put(&lpc_bpc->ch[addr_index].fifo, Data);
-		if (fifo_st & FIFO_OVERFLOW)
-			pr_info("BIOS Post Codes FIFO Overflow!!!\n");
+	struct npcm7xx_bpc_file_data *data;
 
-		fifo_st = ioread8(lpc_bpc->base + NPCM7XX_BPCFSTAT_REG);
-		if (lpc_bpc->en_dwcap && last_addr_bit) {
-			if ((fifo_st & FIFO_ADDR_DECODE) ||
-			    ((FIFO_DATA_VALID & fifo_st) == 0)) {
-				while (kfifo_avail(&lpc_bpc->ch[addr_index].fifo) < DW_PAD_SIZE)
-					kfifo_skip(&lpc_bpc->ch[addr_index].fifo);
-				kfifo_in(&lpc_bpc->ch[addr_index].fifo,
-					 padzero, DW_PAD_SIZE);
-			}
+	if (!ch->drv) {
+		pr_warn("BIOS Post Code Update for unconfigured channel\n");
+		return;
+	}
+
+	list_for_each_entry_rcu(data, &ch->files, list) {
+		if (kfifo_is_full(&data->codes))
+			kfifo_skip(&data->codes);
+		kfifo_put(&data->codes, *code);
+	}
+}
+
+static void npcm7xx_bpc_channel_wake(struct npcm7xx_bpc_channel *ch)
+{
+	if (!ch->drv)
+		return;
+
+	wake_up_interruptible(&ch->wq);
+}
+
+static void npcm7xx_bpc_host_reset(struct npcm7xx_bpc *bpc)
+{
+	struct npcm7xx_bpc_file_data *data;
+	u8 i;
+
+	for (i = 0; i < NUM_BPC_CHANNELS; ++i) {
+		if (!bpc->chs[i].drv)
+			continue;
+		list_for_each_entry_rcu(data, &bpc->chs[i].files, list) {
+			data->host_reset = true;
 		}
-		isr_flag = true;
 	}
+}
+
+static irqreturn_t npcm7xx_bpc_irq(int irq, void *arg)
+{
+	struct npcm7xx_bpc *bpc = arg;
+	struct npcm7xx_code code = {
+		.len = 0,
+		.data = 0,
+	};
+	bool ch_wake[NUM_BPC_CHANNELS] = {};
+	u8 read_byte;
+	u8 status;
+	u8 ch_i;
+	bool reg_valid;
+	irqreturn_t ret = IRQ_NONE;
+
+	rcu_read_lock();
+
+	while (true) {
+		status = ioread8(bpc->base + NPCM7XX_BPCFSTAT_REG);
+		reg_valid = status & FIFO_DATA_VALID;
+		if (code.len > 0 && (!reg_valid || !bpc->en_dwcap ||
+				     status & FIFO_ADDR_DECODE)) {
+			npcm7xx_bpc_channel_update(&bpc->chs[ch_i], &code);
+			ch_wake[ch_i] = true;
+			code.len = 0;
+			code.data = 0;
+		}
+		if (!reg_valid)
+			break;
 
-	host_st = ioread8(lpc_bpc->base + NPCM7XX_BPCFMSTAT_REG);
-	if (host_st & HOST_RESET_CHANGED) {
-		iowrite8(HOST_RESET_CHANGED,
-			 lpc_bpc->base + NPCM7XX_BPCFMSTAT_REG);
-		lpc_bpc->ch[addr_index].host_reset = true;
-		isr_flag = true;
+		if (status & FIFO_OVERFLOW)
+			pr_info("BIOS Post Codes FIFO Overflow!!!\n");
+
+		ch_i = bpc->en_dwcap ? 0 : status & FIFO_ADDR_DECODE;
+		read_byte = ioread8(bpc->base + NPCM7XX_BPCFDATA_REG);
+		code.data |= read_byte << (code.len++ << 3);
 	}
 
-	if (isr_flag) {
-		wake_up_interruptible(&lpc_bpc->ch[addr_index].wq);
-		return IRQ_HANDLED;
+	status = ioread8(bpc->base + NPCM7XX_BPCFMSTAT_REG);
+	if (status & HOST_RESET_CHANGED) {
+		iowrite8(HOST_RESET_CHANGED, bpc->base + NPCM7XX_BPCFMSTAT_REG);
+		npcm7xx_bpc_host_reset(bpc);
+		for (ch_i = 0; ch_i < NUM_BPC_CHANNELS; ++ch_i)
+			ch_wake[ch_i] = true;
 	}
 
-	return IRQ_NONE;
+	rcu_read_unlock();
+
+	for (ch_i = 0; ch_i < NUM_BPC_CHANNELS; ++ch_i)
+		if (ch_wake[ch_i]) {
+			npcm7xx_bpc_channel_wake(&bpc->chs[ch_i]);
+			ret = IRQ_HANDLED;
+		}
+
+	return ret;
 }
 
-static int npcm7xx_bpc_config_irq(struct npcm7xx_bpc *lpc_bpc,
+static int npcm7xx_bpc_config_irq(struct npcm7xx_bpc *bpc,
 				  struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	int rc;
 
-	lpc_bpc->irq = platform_get_irq(pdev, 0);
-	if (lpc_bpc->irq < 0) {
+	bpc->irq = platform_get_irq(pdev, 0);
+	if (bpc->irq < 0) {
 		dev_err(dev, "get IRQ failed\n");
-		return lpc_bpc->irq;
+		return bpc->irq;
 	}
 
-	rc = devm_request_irq(dev, lpc_bpc->irq,
+	rc = devm_request_irq(dev, bpc->irq,
 			      npcm7xx_bpc_irq, IRQF_SHARED,
-			      DEVICE_NAME, lpc_bpc);
+			      DEVICE_NAME, bpc);
 	if (rc < 0) {
-		dev_warn(dev, "Unable to request IRQ %d\n", lpc_bpc->irq);
+		dev_err(dev, "Unable to request IRQ %d\n", bpc->irq);
 		return rc;
 	}
 
 	return 0;
 }
 
-static int npcm7xx_enable_bpc(struct npcm7xx_bpc *lpc_bpc, struct device *dev,
-			      int channel, u16 lpc_port)
+static int npcm7xx_bpc_channel_enable(struct npcm7xx_bpc *bpc, struct device *dev,
+				      int channel, u16 lpc_port)
 {
+	struct npcm7xx_bpc_channel *ch = &bpc->chs[channel];
 	int rc;
 	u8 addr_en, reg_en;
 
-	init_waitqueue_head(&lpc_bpc->ch[channel].wq);
-
-	rc = kfifo_alloc(&lpc_bpc->ch[channel].fifo,
-			 BPC_KFIFO_SIZE, GFP_KERNEL);
-	if (rc)
-		return rc;
+	init_waitqueue_head(&ch->wq);
+	INIT_LIST_HEAD(&ch->files);
 
-	lpc_bpc->ch[channel].miscdev.minor = MISC_DYNAMIC_MINOR;
-	lpc_bpc->ch[channel].miscdev.name =
+	ch->miscdev.minor = MISC_DYNAMIC_MINOR;
+	ch->miscdev.name =
 		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, channel);
-	lpc_bpc->ch[channel].miscdev.fops = &npcm7xx_bpc_fops;
-	lpc_bpc->ch[channel].miscdev.parent = dev;
-	rc = misc_register(&lpc_bpc->ch[channel].miscdev);
+	ch->miscdev.fops = &npcm7xx_bpc_channel_fops;
+	ch->miscdev.parent = dev;
+	rc = misc_register(&ch->miscdev);
 	if (rc)
 		return rc;
 
-	lpc_bpc->ch[channel].data = lpc_bpc;
-	lpc_bpc->ch[channel].host_reset = false;
-
-	/* Enable LPC snoop channel at requested port */
 	switch (channel) {
 	case 0:
 		addr_en = FIFO_IOADDR1_ENABLE;
 		iowrite8((u8)lpc_port & 0xFF,
-			 lpc_bpc->base + NPCM7XX_BPCFA1L_REG);
+			 bpc->base + NPCM7XX_BPCFA1L_REG);
 		iowrite8((u8)(lpc_port >> 8),
-			 lpc_bpc->base + NPCM7XX_BPCFA1M_REG);
+			 bpc->base + NPCM7XX_BPCFA1M_REG);
 		break;
 	case 1:
 		addr_en = FIFO_IOADDR2_ENABLE;
 		iowrite8((u8)lpc_port & 0xFF,
-			 lpc_bpc->base + NPCM7XX_BPCFA2L_REG);
+			 bpc->base + NPCM7XX_BPCFA2L_REG);
 		iowrite8((u8)(lpc_port >> 8),
-			 lpc_bpc->base + NPCM7XX_BPCFA2M_REG);
+			 bpc->base + NPCM7XX_BPCFA2M_REG);
 		break;
 	default:
+		misc_deregister(&ch->miscdev);
 		return -EINVAL;
 	}
 
-	if (lpc_bpc->en_dwcap)
+	if (bpc->en_dwcap)
 		addr_en = FIFO_DWCAPTURE;
 
-	/*
-	 * Enable FIFO Ready Interrupt, FIFO Capture of I/O addr,
-	 * and Host Reset
-	 */
-	reg_en = ioread8(lpc_bpc->base + NPCM7XX_BPCFEN_REG);
-	iowrite8(reg_en | addr_en | FIFO_READY_INT_ENABLE |
-		 HOST_RESET_INT_ENABLE, lpc_bpc->base + NPCM7XX_BPCFEN_REG);
+	reg_en = ioread8(bpc->base + NPCM7XX_BPCFEN_REG);
+	iowrite8(reg_en | addr_en, bpc->base + NPCM7XX_BPCFEN_REG);
 
+	smp_mb();
+	ch->drv = bpc;
 	return 0;
 }
 
-static void npcm7xx_disable_bpc(struct npcm7xx_bpc *lpc_bpc, int channel)
+static void npcm7xx_bpc_channel_disable(struct npcm7xx_bpc *bpc, int channel)
 {
-	u8 reg_en;
+	struct npcm7xx_bpc_channel *ch = &bpc->chs[channel];
+	u8 reg_en = ioread8(bpc->base + NPCM7XX_BPCFEN_REG);
+
+	if (!ch->drv)
+		return;
+	ch->drv = NULL;
 
 	switch (channel) {
 	case 0:
-		reg_en = ioread8(lpc_bpc->base + NPCM7XX_BPCFEN_REG);
-		if (lpc_bpc->en_dwcap)
-			iowrite8(reg_en & ~FIFO_DWCAPTURE,
-				 lpc_bpc->base + NPCM7XX_BPCFEN_REG);
-		else
-			iowrite8(reg_en & ~FIFO_IOADDR1_ENABLE,
-				 lpc_bpc->base + NPCM7XX_BPCFEN_REG);
+		iowrite8(reg_en & ~(FIFO_DWCAPTURE | FIFO_IOADDR1_ENABLE),
+			 bpc->base + NPCM7XX_BPCFEN_REG);
 		break;
 	case 1:
-		reg_en = ioread8(lpc_bpc->base + NPCM7XX_BPCFEN_REG);
 		iowrite8(reg_en & ~FIFO_IOADDR2_ENABLE,
-			 lpc_bpc->base + NPCM7XX_BPCFEN_REG);
+			 bpc->base + NPCM7XX_BPCFEN_REG);
 		break;
 	default:
 		return;
 	}
 
-	if (!(reg_en & (FIFO_IOADDR1_ENABLE | FIFO_IOADDR2_ENABLE)))
-		iowrite8(reg_en &
-			 ~(FIFO_READY_INT_ENABLE | HOST_RESET_INT_ENABLE),
-			 lpc_bpc->base + NPCM7XX_BPCFEN_REG);
+	misc_deregister(&ch->miscdev);
+}
 
-	kfifo_free(&lpc_bpc->ch[channel].fifo);
-	misc_deregister(&lpc_bpc->ch[channel].miscdev);
+static void npcm7xx_bpc_reset(struct npcm7xx_bpc *bpc)
+{
+	u8 reg_en = ioread8(bpc->base + NPCM7XX_BPCFEN_REG);
+	reg_en &= ~(FIFO_IOADDR1_ENABLE | FIFO_IOADDR2_ENABLE | FIFO_DWCAPTURE |
+			FIFO_READY_INT_ENABLE | HOST_RESET_INT_ENABLE);
+	iowrite8(reg_en, bpc->base + NPCM7XX_BPCFEN_REG);
+}
+
+static void npcm7xx_bpc_enable_irq(struct npcm7xx_bpc *bpc)
+{
+	u8 reg_en = ioread8(bpc->base + NPCM7XX_BPCFEN_REG);
+	reg_en |= FIFO_READY_INT_ENABLE | HOST_RESET_INT_ENABLE;
+	iowrite8(reg_en, bpc->base + NPCM7XX_BPCFEN_REG);
 }
 
 static int npcm7xx_bpc_probe(struct platform_device *pdev)
 {
-	struct npcm7xx_bpc *lpc_bpc;
+	struct npcm7xx_bpc *bpc;
 	struct resource *res;
 	struct device *dev;
 	u32 port;
@@ -299,8 +378,8 @@ static int npcm7xx_bpc_probe(struct platform_device *pdev)
 
 	dev = &pdev->dev;
 
-	lpc_bpc = devm_kzalloc(dev, sizeof(*lpc_bpc), GFP_KERNEL);
-	if (!lpc_bpc)
+	bpc = devm_kzalloc(dev, sizeof(*bpc), GFP_KERNEL);
+	if (!bpc)
 		return -ENOMEM;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -310,11 +389,11 @@ static int npcm7xx_bpc_probe(struct platform_device *pdev)
 	}
 
 	dev_dbg(dev, "BIOS post code base resource is %pR\n", res);
-	lpc_bpc->base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(lpc_bpc->base))
-		return PTR_ERR(lpc_bpc->base);
+	bpc->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(bpc->base))
+		return PTR_ERR(bpc->base);
 
-	dev_set_drvdata(&pdev->dev, lpc_bpc);
+	dev_set_drvdata(&pdev->dev, bpc);
 
 	rc = of_property_read_u32_index(dev->of_node, "monitor-ports", 0,
 					&port);
@@ -323,14 +402,16 @@ static int npcm7xx_bpc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	lpc_bpc->en_dwcap =
+	bpc->en_dwcap =
 		of_property_read_bool(dev->of_node, "bpc-en-dwcapture");
 
-	rc = npcm7xx_bpc_config_irq(lpc_bpc, pdev);
+	npcm7xx_bpc_reset(bpc);
+	rc = npcm7xx_bpc_config_irq(bpc, pdev);
 	if (rc)
 		return rc;
+	npcm7xx_bpc_enable_irq(bpc);
 
-	rc = npcm7xx_enable_bpc(lpc_bpc, dev, 0, port);
+	rc = npcm7xx_bpc_channel_enable(bpc, dev, 0, port);
 	if (rc) {
 		dev_err(dev, "Enable BIOS post code I/O port 0 failed\n");
 		return rc;
@@ -340,35 +421,36 @@ static int npcm7xx_bpc_probe(struct platform_device *pdev)
 	 * Configuration of second BPC channel port is optional
 	 * Double-Word Capture ignoring address 2
 	 */
-	if (!lpc_bpc->en_dwcap) {
-		if (of_property_read_u32_index(dev->of_node, "monitor-ports",
-					       1, &port) == 0) {
-			rc = npcm7xx_enable_bpc(lpc_bpc, dev, 1, port);
+	rc = of_property_read_u32_index(dev->of_node, "monitor-ports", 1,
+					&port);
+	if (rc == 0) {
+		if (!bpc->en_dwcap) {
+			rc = npcm7xx_bpc_channel_enable(bpc, dev, 1, port);
 			if (rc) {
-				dev_err(dev, "Enable BIOS post code I/O port 1 failed, disable I/O port 0\n");
-				npcm7xx_disable_bpc(lpc_bpc, 0);
+				dev_err(dev, "Enable BIOS post code I/O port 1 failed\n");
+				npcm7xx_bpc_channel_disable(bpc, 0);
+				npcm7xx_bpc_reset(bpc);
 				return rc;
 			}
+		} else {
+			dev_warn(dev, "Ignoring monitor port 1 with DWCAP\n");
 		}
 	}
 
-	pr_info("npcm7xx BIOS post code probe\n");
-
-	return rc;
+	return 0;
 }
 
 static int npcm7xx_bpc_remove(struct platform_device *pdev)
 {
-	struct npcm7xx_bpc *lpc_bpc = dev_get_drvdata(&pdev->dev);
-	u8 reg_en;
-
-	reg_en = ioread8(lpc_bpc->base + NPCM7XX_BPCFEN_REG);
+	struct npcm7xx_bpc *bpc = dev_get_drvdata(&pdev->dev);
+	u8 i;
 
-	if (reg_en & FIFO_IOADDR1_ENABLE)
-		npcm7xx_disable_bpc(lpc_bpc, 0);
-	if (reg_en & FIFO_IOADDR2_ENABLE)
-		npcm7xx_disable_bpc(lpc_bpc, 1);
+	if (!bpc)
+		return 0;
 
+	for (i = 0; i < NUM_BPC_CHANNELS; ++i)
+		npcm7xx_bpc_channel_disable(bpc, i);
+	npcm7xx_bpc_reset(bpc);
 	return 0;
 }
 
-- 
2.24.1

