Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF2743F6B8
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 07:35:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgWNT51wyz2yph
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 16:35:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=S/5FHeCr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2d;
 helo=mail-yb1-xb2d.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=S/5FHeCr; dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgWN30JVDz2yK2
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 16:34:56 +1100 (AEDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 67so21396510yba.6
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 22:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rthgzlYszn+lDeAor1sPnZbXBFL5cTk73JTwHz8bd8Y=;
 b=S/5FHeCrdXq/o9LjX8fO0ZGJAXH9/zGNGkz/Xbr2/FOQUSbEbC60u/3D5GbSBLjo9e
 nyKAq9Wm192ONlUiqRDklZGmaFMmBpNX8W3WWPxtCm14rjBbscJFuyUMsgQxCuK+OlXp
 QtFORAzlqIvVNkK3z8jmL/fnDdxR4/Wd1FFAl7+7M48LreCIJIrlx56/HhAIR/oH67/C
 unkVkS7trJPpZ+vCosZ1pQMFXnlKgJtFE2tuYp+V2ax1B+YQX8nIfS2FTc86va9xydGQ
 Q8y5fm8g5pRkdubjt67j4u/DuLC1zdP1CO1Dd0OG0hfg4QJ9MuWV51h9gtLDCrnM0m2p
 cYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rthgzlYszn+lDeAor1sPnZbXBFL5cTk73JTwHz8bd8Y=;
 b=z94af0qH1PtfN873aOAlXKxqd00K55w5MNsGzFD85rOWXPc4xQMdQGVLyrKz6LAJUu
 QpHgUfjZsga/+4L9bhATtGkeRSOvTp3RT9uOUY7b8ZZ0dRJgu+ve/shJYGYLZEiPLgEH
 etuQhf7kEdGbOnniRkzseTBYqjUj0vgxB+Qy2QpP4+XFITXZxJo6CSpQXtmZUqGH/isJ
 0gvFogl/VbfE+S66qK79RuAPGA9PTG/xdKHFeIVxVIeossGOej73EjeovH+stHU7P+02
 +/3rsFk/zt83KnXEmjh2Gbp+gTiVZ47juTFKYFILp2fam7KzfAUeZJwWeGnBkeDPK0VN
 PWqw==
X-Gm-Message-State: AOAM531oehbufW2SJrIimyGD3r4SW60AeOemYoW2BUKO6bQgkNYHZsyd
 Mjzpm/LBVPUwYUwBChLubHBpXYFNYaLMa3AJuhE=
X-Google-Smtp-Source: ABdhPJyY41gLHB0/qaKgVOrQvqANyeSHB9r3AdNvJOWVqy2BlGdzmI0HBHBH8qykvG9xkOCwPazti0HVE+uQIO1s4dM=
X-Received: by 2002:a25:2304:: with SMTP id j4mr8576263ybj.359.1635485692227; 
 Thu, 28 Oct 2021 22:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211028141938.3530-1-lukas.bulwahn@gmail.com>
 <20211028141938.3530-2-lukas.bulwahn@gmail.com>
 <CAK8P3a2UmTj2imJWdeLHX0TTV36Hk-Xx5c3j8cPe+Gk33-3Tyw@mail.gmail.com>
In-Reply-To: <CAK8P3a2UmTj2imJWdeLHX0TTV36Hk-Xx5c3j8cPe+Gk33-3Tyw@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 29 Oct 2021 07:34:40 +0200
Message-ID: <CAKXUXMzsEyqKs-OT6j3shTLY1pbS1z7O1GSn36+LxKRLQQPb+g@mail.gmail.com>
Subject: Re: [PATCH 01/13] arm: debug: remove obsolete debug code for
 DEBUG_ZTE_ZX
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: Linus Walleij <linusw@kernel.org>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Sekhar Nori <nsekhar@ti.com>,
 Russell King <linux@armlinux.org.uk>, Tali Perry <tali.perry1@gmail.com>,
 Krzysztof Halasa <khalasa@piap.pl>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Patrick Venture <venture@google.com>, Imre Kaloz <kaloz@openwrt.org>,
 Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 28, 2021 at 4:38 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Oct 28, 2021 at 4:19 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > Commit 89d4f98ae90d ("ARM: remove zte zx platform") removes the config
> > DEBUG_ZTE_ZX. Hence, since then, the "ifdef CONFIG_DEBUG_ZTE_ZX" in
> > ./arch/arm/include/debug/pl01x.S is dead code.
> >
> > Fortunately, ./scripts/checkkconfigsymbols.py detects this and warns:
> >
> > DEBUG_ZTE_ZX
> > Referencing files: arch/arm/include/debug/pl01x.S
> >
> > So, remove the obsolete ifdef CONFIG_DEBUG_ZTE_ZX.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
>
> I see another copy of these constants in drivers/tty/serial/amba-pl011.c,
> which we should probably clean up as well.
>

Arnd, did you have something like this---see below---for serial
amba-pl011 in mind?

Then, I would adjust the patch to remove all the zte_zx serial
left-over in one commit.

Lukas

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index d361cd84ff8c..c9534e229166 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -188,38 +188,6 @@ static struct vendor_data vendor_st = {
     .get_fifosize        = get_fifosize_st,
 };

-static const u16 pl011_zte_offsets[REG_ARRAY_SIZE] = {
-    [REG_DR] = ZX_UART011_DR,
-    [REG_FR] = ZX_UART011_FR,
-    [REG_LCRH_RX] = ZX_UART011_LCRH,
-    [REG_LCRH_TX] = ZX_UART011_LCRH,
-    [REG_IBRD] = ZX_UART011_IBRD,
-    [REG_FBRD] = ZX_UART011_FBRD,
-    [REG_CR] = ZX_UART011_CR,
-    [REG_IFLS] = ZX_UART011_IFLS,
-    [REG_IMSC] = ZX_UART011_IMSC,
-    [REG_RIS] = ZX_UART011_RIS,
-    [REG_MIS] = ZX_UART011_MIS,
-    [REG_ICR] = ZX_UART011_ICR,
-    [REG_DMACR] = ZX_UART011_DMACR,
-};
-
-static unsigned int get_fifosize_zte(struct amba_device *dev)
-{
-    return 16;
-}
-
-static struct vendor_data vendor_zte = {
-    .reg_offset        = pl011_zte_offsets,
-    .access_32b        = true,
-    .ifls            = UART011_IFLS_RX4_8|UART011_IFLS_TX4_8,
-    .fr_busy        = ZX_UART01x_FR_BUSY,
-    .fr_dsr            = ZX_UART01x_FR_DSR,
-    .fr_cts            = ZX_UART01x_FR_CTS,
-    .fr_ri            = ZX_UART011_FR_RI,
-    .get_fifosize        = get_fifosize_zte,
-};
-
 /* Deals with DMA transactions */

 struct pl011_sgbuf {
@@ -2974,11 +2942,6 @@ static const struct amba_id pl011_ids[] = {
         .mask    = 0x00ffffff,
         .data    = &vendor_st,
     },
-    {
-        .id    = AMBA_LINUX_ID(0x00, 0x1, 0xffe),
-        .mask    = 0x00ffffff,
-        .data    = &vendor_zte,
-    },
     { 0, 0 },
 };

diff --git a/include/linux/amba/bus.h b/include/linux/amba/bus.h
index edfcf7a14dcd..6c7f47846971 100644
--- a/include/linux/amba/bus.h
+++ b/include/linux/amba/bus.h
@@ -90,14 +90,8 @@ enum amba_vendor {
     AMBA_VENDOR_ST = 0x80,
     AMBA_VENDOR_QCOM = 0x51,
     AMBA_VENDOR_LSI = 0xb6,
-    AMBA_VENDOR_LINUX = 0xfe,    /* This value is not official */
 };

-/* This is used to generate pseudo-ID for AMBA device */
-#define AMBA_LINUX_ID(conf, rev, part) \
-    (((conf) & 0xff) << 24 | ((rev) & 0xf) << 20 | \
-    AMBA_VENDOR_LINUX << 12 | ((part) & 0xfff))
-
 extern struct bus_type amba_bustype;

 #define to_amba_device(d)    container_of(d, struct amba_device, dev)
