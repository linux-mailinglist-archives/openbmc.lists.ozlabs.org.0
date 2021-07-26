Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFC83D5C30
	for <lists+openbmc@lfdr.de>; Mon, 26 Jul 2021 16:53:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYNG15Fc5z307x
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 00:53:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=LV8JowaB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a;
 helo=mail-lf1-x12a.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LV8JowaB; dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYNFk23Jlz2yxP
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jul 2021 00:52:57 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id z2so16002777lft.1
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jul 2021 07:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DfxheQCIJCkcTH/YXFNMpkYed/y3ZV374BigRlEb7Sc=;
 b=LV8JowaBllbBQhHr7tdZaDLBdpT/MqPZvCdnpEL1nJVvkYYM6helS5kshnaU5h28S/
 zMMwyrqF8lAXIXgmqKDeYQZgdVZjm69iBYU6LbVSvFCOsLbgQ08uvw8mXtf8CTqvd+Mz
 PBB1NBnLo2XQfnEhEs1mAvABGFIBSwzPiZKXAIvRREs2G8ptJ7AAxSef7Zo4e+qDrApF
 593qfxsMY46ry72/rdfKcLYloMk7qVz1sEjuoBUxLuKavvq4zPt/E0ojYeWy/P2c3XSR
 Z61ElJJt91MaxOsIftdGpR4jGC4lI5E5h50XTnoG2v7uRg2xYHm+rpOFwxFcsCza6fbm
 UNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DfxheQCIJCkcTH/YXFNMpkYed/y3ZV374BigRlEb7Sc=;
 b=gFd9oMFgHZxRCUnc67Gp0L7xZ2q8H12PNcJGhSHVBf/7dK89nB6UBkYXx7GIBfc9R9
 9gyEA+pX5JLM7K6BOoY+3F8q75l7SSn0sERI315Yf51mDoP0gfr+Fg+xdqzysws9UP1n
 3R8i2bg+S5E4rh1mC2MurBB8/aqUD7u1DnZZr0pE9GLD90TYT9kYChZC53tXg414jsNo
 zhcVL1bH7U3ViVbYRfN5eUPELKAAj04/Okyaa9rIWwV/kYuBQ2crq8XwQmOH+sQt1zfW
 4YPDKp8UNzQKHv1omhY9L7Wt28p7sueSgwujjalr1Q969D1nZRwdI8+uw78nL0LO86iK
 +JTg==
X-Gm-Message-State: AOAM533i0UInQ3Bk1Z/GZmZKLwi4TCoXoSRsiSnvpYQoPmffrQoMuyks
 9l4DvPjcgSDX9VqwVHPKafE=
X-Google-Smtp-Source: ABdhPJydTvbLYFDn4n0XMIWAEhsjos3vivKY7LHpTkPww27AJmzaJ7/IFGe6XAwZGys/oQJDARlg5A==
X-Received: by 2002:ac2:58e1:: with SMTP id v1mr12933046lfo.616.1627311171145; 
 Mon, 26 Jul 2021 07:52:51 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id z23sm20703lfg.153.2021.07.26.07.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:52:50 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id
 16QEqlYd004696; Mon, 26 Jul 2021 17:52:48 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 16QEqlLk004695;
 Mon, 26 Jul 2021 17:52:47 +0300
Date: Mon, 26 Jul 2021 17:52:46 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Konstantin Klubnichkin <kitsok@yandex-team.ru>
Subject: Re: Serial Over Lan (SOL) no login prompt on Linux IRQ mode
Message-ID: <20210726145246.GL875@home.paul.comp>
References: <CAE33tLEsCJtr9VPYj57ZcOe5iWD6282WmrMTr-Hp96Y3rkBzAA@mail.gmail.com>
 <000001d5bc87$f6fe3780$e4faa680$@linux.intel.com>
 <CAE33tLHvjuwFwCsSdohvYPHgs-f-8sDWMsNdAhzgQbs3=o7_tQ@mail.gmail.com>
 <429111627309901@mail.yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <429111627309901@mail.yandex-team.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Konstantin,

On Mon, Jul 26, 2021 at 05:36:51PM +0300, Konstantin Klubnichkin wrote:
> I'm digging into AST2500 datasheet for last couple of days but can't find what
> may cause this behavior.

My attempts at understanding this failed too, apparently the aspeed
documentation is incomplete or incorrect. So we have to use the
following patch from Phoenix (guess you'll see what it's doing right
away after spending so much time reading the datasheet ;) ):

From 6d7afdfeb67288ff67864a25de2d4fa783f18336 Mon Sep 17 00:00:00 2001
From: Patrick Voelker <patrick_voelker@phoenix.com>
Date: Wed, 21 Apr 2021 02:14:01 +0000
Subject: [PATCH] * Fix host serial routing and SOL so that it doesn't
 interfere with IRQ driven console in host Linux boot.

---
 ...Fix-Host-UART-Routing-For-Better-SOL.patch | 63 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot-%.bbappend      |  1 +
 .../0109-Added-UART3-For-Better-SOL.patch     | 33 ++++++++++
 .../linux/linux-aspeed_%.bbappend             |  1 +
 .../0000-Attach-Console-To-ttyS2.patch        | 12 ++++
 .../console/obmc-console/obmc-console.conf    |  4 +-
 .../console/obmc-console_%.bbappend           |  3 +
 7 files changed, 114 insertions(+), 3 deletions(-)
 create mode 100644 meta-phoenix/meta-ptec-tp/recipes-bsp/u-boot/files/0009-Fix-Host-UART-Routing-For-Better-SOL.patch
 create mode 100644 meta-phoenix/meta-ptec-tp/recipes-kernel/linux/linux-aspeed/0109-Added-UART3-For-Better-SOL.patch
 create mode 100644 meta-phoenix/meta-ptec-tp/recipes-phosphor/console/obmc-console/0000-Attach-Console-To-ttyS2.patch

diff --git a/meta-phoenix/meta-ptec-tp/recipes-bsp/u-boot/files/0009-Fix-Host-UART-Routing-For-Better-SOL.patch b/meta-phoenix/meta-ptec-tp/recipes-bsp/u-boot/files/0009-Fix-Host-UART-Routing-For-Better-SOL.patch
new file mode 100644
index 000000000000..13e359bef26c
--- /dev/null
+++ b/meta-phoenix/meta-ptec-tp/recipes-bsp/u-boot/files/0009-Fix-Host-UART-Routing-For-Better-SOL.patch
@@ -0,0 +1,63 @@
+diff --git a/arch/arm/include/asm/arch-aspeed/ast_scu.h b/arch/arm/include/asm/arch-aspeed/ast_scu.h
+index 8fc7c3c934..32c6fbf10a 100755
+--- a/arch/arm/include/asm/arch-aspeed/ast_scu.h
++++ b/arch/arm/include/asm/arch-aspeed/ast_scu.h
+@@ -53,11 +53,22 @@
+ 
+ /* HICRA Bits */
+ #define HICRA_I01_OFFSET    (0)
+-#define HICRA_UART3_OFFSET  (22)
+ #define HICRA_I01_MASK      (7 << HICRA_I01_OFFSET)
+-#define HICRA_UART3_MASK    (7 << HICRA_UART3_OFFSET)
+ #define HICRA_UART3_TO_IO1  (2 << HICRA_I01_OFFSET)
++#define HICRA_UART4_TO_IO1  (3 << HICRA_I01_OFFSET)
++
++#define HICRA_UART1_OFFSET  (16)
++#define HICRA_UART1_MASK    (7 << HICRA_UART1_OFFSET)
++#define HICRA_UART3_TO_UART1  (5 << HICRA_UART1_OFFSET)
++
++#define HICRA_UART3_OFFSET  (22)
++#define HICRA_UART3_MASK    (7 << HICRA_UART3_OFFSET)
+ #define HICRA_IO1_TO_UART3  (2 << HICRA_UART3_OFFSET)
++#define HICRA_UART1_TO_UART3  (5 << HICRA_UART3_OFFSET)
++
++#define HICRA_UART4_OFFSET  (25)
++#define HICRA_UART4_MASK    (7 << HICRA_UART4_OFFSET)
++#define HICRA_IO1_TO_UART4  (1 << HICRA_UART4_OFFSET)
+ 
+ /* HICRB Bits */
+ #define HICRB_EN80HSGIO (1 << 13)       /* Enable 80hSGIO */
+diff --git a/board/aspeed/ast-g5/ast-g5.c b/board/aspeed/ast-g5/ast-g5.c
+index cc47d7a73f..99dba8582a 100755
+--- a/board/aspeed/ast-g5/ast-g5.c
++++ b/board/aspeed/ast-g5/ast-g5.c
+@@ -73,12 +73,25 @@ void redirect_host_uart( void )
+ {
+     uint32_t reg = 0x00;
+ 
+-    /* Redirect UART3 (/dev/ttyS2) to IO1 (and vice-versa) */
+-    reg = readl(AST_LPC_BASE + HICRA);
++    /* Redirect UART4 (/dev/ttyS3) to IO1 (and vice-versa)
++        And also redirect UART1 to UART3 (ttyS0 and ttyS2) to eachother (and vice-versa) */
++
++    // UART4 to IO1
+     reg &= ~HICRA_I01_MASK;
+-    reg |= HICRA_UART3_TO_IO1;
++    reg |= HICRA_UART4_TO_IO1;
++
++    // IO1 to UART4
++    reg &= ~HICRA_UART4_MASK;
++    reg |= HICRA_IO1_TO_UART4;
++
++    // UART1 to UART3
+     reg &= ~HICRA_UART3_MASK;
+-    reg |= HICRA_IO1_TO_UART3;
++    reg |= HICRA_UART1_TO_UART3;
++
++    // UART3 to UART1
++    reg &= ~HICRA_UART1_MASK;
++    reg |= HICRA_UART3_TO_UART1;
++
+ 	writel(reg, AST_LPC_BASE + HICRA);
+ }
+ 
diff --git a/meta-phoenix/meta-ptec-tp/recipes-bsp/u-boot/u-boot-%.bbappend b/meta-phoenix/meta-ptec-tp/recipes-bsp/u-boot/u-boot-%.bbappend
index d98545d99a10..6a6bb5102b15 100755
--- a/meta-phoenix/meta-ptec-tp/recipes-bsp/u-boot/u-boot-%.bbappend
+++ b/meta-phoenix/meta-ptec-tp/recipes-bsp/u-boot/u-boot-%.bbappend
@@ -7,6 +7,7 @@ SRC_URI_append_aspeed += " \
     file://0005-enable-passthrough-in-uboot.patch \
     file://0007-Fix-GIP-141-enable-port-80h-post-code-display-on-the-7-segment-LEDs.patch \
     file://0008-Add-Host-UART-Routing.patch \
+    file://0009-Fix-Host-UART-Routing-For-Better-SOL.patch \
     "
 
 SRC_URI_remove = ""
diff --git a/meta-phoenix/meta-ptec-tp/recipes-kernel/linux/linux-aspeed/0109-Added-UART3-For-Better-SOL.patch b/meta-phoenix/meta-ptec-tp/recipes-kernel/linux/linux-aspeed/0109-Added-UART3-For-Better-SOL.patch
new file mode 100644
index 000000000000..767af2a937db
--- /dev/null
+++ b/meta-phoenix/meta-ptec-tp/recipes-kernel/linux/linux-aspeed/0109-Added-UART3-For-Better-SOL.patch
@@ -0,0 +1,33 @@
+diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
+index 77233d360142..39786a59ae47 100644
+--- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
++++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
+@@ -162,7 +162,7 @@
+ };
+ 
+ &uart1 {
+-	// Host Console
++	// Host In Console
+ 	status = "okay";
+ 	pinctrl-names = "default";
+ 	pinctrl-0 = <&pinctrl_txd1_default
+@@ -170,12 +170,17 @@
+ };
+ 
+ &uart2 {
+-	// SoL Host Console
++	// Not used
+ 	status = "okay";
+ };
+ 
+ &uart3 {
+-	// SoL BMC Console
++	// SoL Console
++	status = "okay";
++};
++
++&uart4 {
++	// Host Out Console
+ 	status = "okay";
+ };
+ 
diff --git a/meta-phoenix/meta-ptec-tp/recipes-kernel/linux/linux-aspeed_%.bbappend b/meta-phoenix/meta-ptec-tp/recipes-kernel/linux/linux-aspeed_%.bbappend
index 4f927b7e64d3..981a4924b526 100755
--- a/meta-phoenix/meta-ptec-tp/recipes-kernel/linux/linux-aspeed_%.bbappend
+++ b/meta-phoenix/meta-ptec-tp/recipes-kernel/linux/linux-aspeed_%.bbappend
@@ -30,4 +30,5 @@ SRC_URI += " \
 	file://0106-Add-get-MAC-address-through-NCSI-command-to-get-INTEL-MAC-address.patch \
 	file://0107-Fix-get-MAC-address-from-mlx-card-increment-1.patch \
 	file://0108-Adjust-SIRQ-Polarity.patch \
+	file://0109-Added-UART3-For-Better-SOL.patch \
 	"
diff --git a/meta-phoenix/meta-ptec-tp/recipes-phosphor/console/obmc-console/0000-Attach-Console-To-ttyS2.patch b/meta-phoenix/meta-ptec-tp/recipes-phosphor/console/obmc-console/0000-Attach-Console-To-ttyS2.patch
new file mode 100644
index 000000000000..2967cc1f3758
--- /dev/null
+++ b/meta-phoenix/meta-ptec-tp/recipes-phosphor/console/obmc-console/0000-Attach-Console-To-ttyS2.patch
@@ -0,0 +1,12 @@
+diff --git a/conf/obmc-console@.service.in b/conf/obmc-console@.service.in
+index c6cd1b4..7bf1de6 100644
+--- a/conf/obmc-console@.service.in
++++ b/conf/obmc-console@.service.in
+@@ -4,6 +4,6 @@ ConditionPathExists=/etc/obmc-console/server.%i.conf
+ 
+ [Service]
+ # Instance ID is the VUART basename
+-ExecStart=/usr/sbin/obmc-console-server --config /etc/obmc-console/server.%i.conf %i
++ExecStart=/usr/sbin/obmc-console-server --config /etc/obmc-console/server.%i.conf ttyS2
+ SyslogIdentifier=%i-console-server
+ Restart=always
diff --git a/meta-phoenix/meta-ptec-tp/recipes-phosphor/console/obmc-console/obmc-console.conf b/meta-phoenix/meta-ptec-tp/recipes-phosphor/console/obmc-console/obmc-console.conf
index c5faabc0ab6d..8491f53653ec 100644
--- a/meta-phoenix/meta-ptec-tp/recipes-phosphor/console/obmc-console/obmc-console.conf
+++ b/meta-phoenix/meta-ptec-tp/recipes-phosphor/console/obmc-console/obmc-console.conf
@@ -1,5 +1,3 @@
 baud = 115200
-lpc-address = 0x3f8
-sirq = 4
-local-tty = ttyS2
+local-tty = ttyS3
 local-tty-baud = 115200
diff --git a/meta-phoenix/meta-ptec-tp/recipes-phosphor/console/obmc-console_%.bbappend b/meta-phoenix/meta-ptec-tp/recipes-phosphor/console/obmc-console_%.bbappend
index 50d7d4f0f160..53ee6d7124f3 100644
--- a/meta-phoenix/meta-ptec-tp/recipes-phosphor/console/obmc-console_%.bbappend
+++ b/meta-phoenix/meta-ptec-tp/recipes-phosphor/console/obmc-console_%.bbappend
@@ -1,2 +1,5 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 OBMC_CONSOLE_HOST_TTY = "ttyS2"
+
+SRC_URI += " file://0000-Attach-Console-To-ttyS2.patch \
+	   "
-- 
2.17.1

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
