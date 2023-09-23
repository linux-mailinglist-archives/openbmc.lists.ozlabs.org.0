Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E937AC20D
	for <lists+openbmc@lfdr.de>; Sat, 23 Sep 2023 14:29:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=o5A1d7wG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rt7k83wn3z3cM4
	for <lists+openbmc@lfdr.de>; Sat, 23 Sep 2023 22:29:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=o5A1d7wG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rt7jV42WPz3bdm
	for <openbmc@lists.ozlabs.org>; Sat, 23 Sep 2023 22:29:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
 t=1695472121; x=1696076921; i=j.neuschaefer@gmx.net;
 bh=5PbtnxHt4pzwD8Q2b/5utg2+U5eL23wgfkdvavzRTeM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=o5A1d7wGiMAYUAcAekHw+yVsJDV1l7XbJ7hoBYr577AlA2DrQrq8Qc2qmEFwncVRx0BHr2EbYtm
 e7+7W9mJTFkScaMhUkjJOBQ5aMG4RMyg4dIJgEFIQMgAZOwm2n4Oi4kbj74o9b5EtlhgcHbVMv/0f
 KQIcPR4vD5R8lxsOWX3VXmC6RvsAO95a2EzKJ55HZKYG2cxW/sxCYcaDX+9Le5QMWh6/wmb0omQGq
 q0PJjJ3Jr1l4r2VDv8NbBQLJr5WZ4fKowUhzZfh7GDBwUAsLOqCm7acDnyzjwyneFM6NzL35vJYO5
 vL8aiVv6Z6LwGgHwrodr1oiXu0iAPBLzvwgA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.47.152]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8ob6-1rmBoN1xP4-015qKl; Sat, 23
 Sep 2023 14:28:41 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: wpcm450_defconfig: Fix formatting of 32-bit number
Date: Sat, 23 Sep 2023 14:28:32 +0200
Message-Id: <20230923122833.1734268-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pn8f3Er7D00eg+JBPEfT1LBHFNbmo1D6zRqUPQqSN8TNw37DOtM
 6yuFL8Fw7QNZad/4aSq/+sUfFT1vGyJYmCJJeY1/YUvgiytcF5yd2mzGupkYDgiIySZO8Hl
 Vplq2nkjwP9iEL/NR2ARTZhcp5+KZVdU23M8gAEzxuEdK4PVaC6N71yc7PtaJt9IOt4BXFV
 tcihTtr/8qyQBgRXwQCxg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PCHRbzln+TM=;pObnbTvGRUjCreVVnsegac+vUiF
 +kT0jLsW6Gavv1xvlxZW+6FQKxzzfazO0iS3Ot6KsysYaaa0AZYDU8xxDe9ZRP/dpUpKxSnHg
 tNGpUCRYnL9ofp1qxFinoAhDPRorVm8qfU0r/+AqgcEb2OZEHdqXmjffieSaGfwvbm3yEdDn9
 rwvUWOl5ZkxdvKRHcDT8BBMHlp/SoGAuGU+W+iHRCjYOWrxNVhZMNtqYJ5zKl7w0E14IWqW2W
 /f/Kruq9j/1PZm4VSa+WbVnDEz/sxO0flYLjmnrDsv/boNXkFnFAMYue/IXu8vV7QKK0ZbZjg
 X38EEmJd5jo07q8kVs5bsw9l2S3t2+vNHkKzbszedAj+TMZtBjt9K63NYv0kyjQSmx9sHLKhX
 Z8LFxTj243DzwZuqXdllbkZoqDfKvdSiwfpo/HoszsndLbafLCLHwRiuDrReNt/kLSLAUwxe6
 DDtzAcgMwJi2dLjdsG2JUQ1YXMFJQ9xSBxVH1HqP704ZkLYtMvk347wx79dAKBS4e7he/bUEK
 OU74kOCiH3DJXPas1Nq55RplrsLjZwgSpCQm5aomwyq2u7p5rWbjkvP6+H0beaAGjlUpb/G5t
 /RE1TL/RZzkdvptJ+0sP+yHwHH1AwFFd0FZljg3u+zoAf6zs9yOYhoNQukcsUxxt3HTPIhlHr
 5y5dKtuDBNcVhVb602bPqWKCeIObqaQljJP8fub8qmVWrtrYLsZnBqmAFJITGgXus/kEYUfOj
 UoUbLdt6+iHxMIWNYIpKPiBUbatnA9N9fMOS325nSfRCmZ35OzGd4SoxsClZADGlvvfiaIsK1
 0gyJvkG0UzjwyEJDbYN4Hs+DVa5DtOsofEPDeMij33SAxzKHQq+daqX63mgAF4g1nBMJWwbIl
 dKt4LnFpWce7h5/ZNnQ/+QYJlTDen4/3TySwXo/Fp7zmq3AT6ka26eaSI5XFcFvdIy9pGaOJm
 cekimA==
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
Cc: linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Russell King <linux@armlinux.org.uk>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Nine digits are one too many.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 arch/arm/configs/wpcm450_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/wpcm450_defconfig b/arch/arm/configs/wpcm450=
_defconfig
index 45483deab034f..78b6c671eade5 100644
=2D-- a/arch/arm/configs/wpcm450_defconfig
+++ b/arch/arm/configs/wpcm450_defconfig
@@ -206,6 +206,6 @@ CONFIG_DEBUG_USER=3Dy
 CONFIG_DEBUG_LL=3Dy
 CONFIG_DEBUG_LL_UART_8250=3Dy
 CONFIG_DEBUG_UART_PHYS=3D0xb8000000
-CONFIG_DEBUG_UART_VIRT=3D0x0ff000000
+CONFIG_DEBUG_UART_VIRT=3D0xff000000
 CONFIG_DEBUG_UART_8250_WORD=3Dy
 CONFIG_EARLY_PRINTK=3Dy
=2D-
2.40.1

