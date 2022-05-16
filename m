Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E069C527D8D
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 08:26:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1q5Z5fxTz3c93
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 16:26:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=facebook header.b=pGlttGHU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=6135bb9a91=pdel@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=pGlttGHU; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1q2g6CYFz3c8j
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2022 16:23:55 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24FNMkGu031036
 for <openbmc@lists.ozlabs.org>; Sun, 15 May 2022 23:23:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=6CL1/KK/2w9upNeYwoETLMMDFnfRyRFpi+VsWJsj4s4=;
 b=pGlttGHUD+q3VXr7p6+x0fgcPAvfHlaBAxXhTN2AnB/dEVSViXm0+3B5k9ZI+KesNiDV
 hUVU20vqSvybd6Ia8TDQjevcgwynN41aClRRP5iY5cndS2IxDi+Kxivv/5fxjzg6wt7X
 Y9JCfa3z1NXDd9P/U5Y64IwCTAJJWslgfJs= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3g2br3y1s7-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 15 May 2022 23:23:53 -0700
Received: from twshared6447.05.prn5.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sun, 15 May 2022 23:23:51 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 20A9564DCACE; Sun, 15 May 2022 23:23:30 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
Subject: [PATCH v2 5/5] hw: aspeed: Init all UART's with serial devices
Date: Sun, 15 May 2022 23:23:28 -0700
Message-ID: <20220516062328.298336-6-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220516062328.298336-1-pdel@fb.com>
References: <20220516062328.298336-1-pdel@fb.com>
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: WzAH07y3ntBcR4hbqMI2oieQYT0uO_Yl
X-Proofpoint-ORIG-GUID: WzAH07y3ntBcR4hbqMI2oieQYT0uO_Yl
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-15_11,2022-05-13_01,2022-02-23_01
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
Cc: peter.maydell@linaro.org, zev@bewilderbeest.net, andrew@aj.id.au,
 irischenlj@fb.com, openbmc@lists.ozlabs.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, clg@kaod.org, pdel@fb.com, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Background:

AspeedMachineClass.uart_default specifies the serial console UART, which
usually corresponds to the "stdout-path" in the device tree.

The default value is UART5, since most boards use UART5 for this:

    amc->uart_default =3D ASPEED_DEV_UART5;

Users can override AspeedMachineClass.uart_default in their board's machine
class init to specify something besides UART5. For example, for fuji-bmc:

    amc->uart_default =3D ASPEED_DEV_UART1;

We only connect this one UART, of the 5 UART's on the AST2400 and AST2500
and the 13 UART's on the AST2600 and AST1030, to a serial device that QEMU
users can use. None of the other UART's are initialized, and the only way
to override this attribute is by creating a specialized board definition,
requiring QEMU source code changes and rebuilding.

The result of this is that if you want to get serial console output on a
board that uses UART3, you need to add a board definition. This was
encountered by Zev in OpenBMC. [1]

Changes:

This commit initializes all of the UART's present on each Aspeed chip with
serial devices and allows the QEMU user to connect as many or few as they
like to serial devices. For example, you can still run QEMU and just connect
stdout to the machine's default UART, without specifying any additional
serial devices:

    qemu-system-arm -machine fuji-bmc \
        -drive file=3Dfuji.mtd,format=3Draw,if=3Dmtd \
        -nographic

However, if you don't want to add a special machine definition, you can now
manually configure UART1 to connect to stdout and get serial console output,
even if the machine's default is UART5:

    qemu-system-arm -machine ast2600-evb \
        -drive file=3Dfuji.mtd,format=3Draw,if=3Dmtd \
        -serial null -serial mon:stdio -display none

In the example above, the first "-serial null" argument is connected to
UART5, and "-serial mon:stdio" is connected to UART1.

Another example: you can get serial console output from Wedge100, which uses
UART3, by reusing the palmetto AST2400 machine and rewiring the serial
device arguments:

    qemu-system-arm -machine palmetto-bmc \
        -drive file=3Dwedge100.mtd,format=3Draw,if=3Dmtd \
        -serial null -serial null -serial null \
        -serial mon:stdio -display none

There is a slight change in behavior introduced with this change: now, each
UART's memory-mapped IO region will have a serial device model connected to
it. Previously, all reads and writes to those regions would be ineffective
and return zero values, but now some values will be nonzero, even when the
user doesn't connect a serial device backend (like a socket, file, etc). For
example, the line status register might indicate that the transmit buffer is
empty now, whereas previously it might have always indicated it was full.

[1] https://lore.kernel.org/openbmc/YnzGnWjkYdMUUNyM@hatter.bewilderbeest.n=
et/
[2] https://github.com/facebook/openbmc/releases/download/v2021.49.0/fuji.m=
td
[3] https://github.com/facebook/openbmc/releases/download/v2021.49.0/wedge1=
00.mtd

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed_soc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 912798a9c9..30574d4276 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -546,9 +546,18 @@ qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev)
 void aspeed_soc_uart_init(AspeedSoCState *s)
 {
     AspeedSoCClass *sc =3D ASPEED_SOC_GET_CLASS(s);
+    int i, uart;
=20
     /* Attach an 8250 to the IO space as our UART */
     serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
                    aspeed_soc_get_irq(s, s->uart_default), 38400,
                    serial_hd(0), DEVICE_LITTLE_ENDIAN);
+    for (i =3D 1, uart =3D ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart+=
+) {
+        if (uart =3D=3D s->uart_default) {
+            uart++;
+        }
+        serial_mm_init(get_system_memory(), sc->memmap[uart], 2,
+                       aspeed_soc_get_irq(s, uart), 38400,
+                       serial_hd(i), DEVICE_LITTLE_ENDIAN);
+    }
 }
--=20
2.30.2

