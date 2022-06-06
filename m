Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B50953F1BF
	for <lists+openbmc@lfdr.de>; Mon,  6 Jun 2022 23:32:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LH6Cd5K1Dz3blW
	for <lists+openbmc@lfdr.de>; Tue,  7 Jun 2022 07:32:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=LGBF5z2k;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=LGBF5z2k;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LH6CB5vqDz301F
	for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2022 07:32:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1654551128;
	bh=0HIULZ+QP47IbHx9ecHTqk4qfd6wTa7bUnEWZ6Ul/pU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=LGBF5z2kQpKcqSn8NXeg9N7NOiyjuNsyRANovXTFFoSsA9P+XBhKCbJU3p3D01RCf
	 8hwQHle5o3cWY3KyNOcH8h0BxLdW5viokBnRVqGi1tLiBUrck9JwWfACLh3+Jkkupw
	 XaTHDTIfBBf8nPWDgRhZq+1dY+xmW7cX6I512HNs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.195.3]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MN5iZ-1oF2Mk3EH7-00IzfX; Mon, 06
 Jun 2022 23:32:07 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v3] ARM: dts: nuvoton: wpcm450: Add missing aliases for serial0/serial1
Date: Mon,  6 Jun 2022 23:31:53 +0200
Message-Id: <20220606213154.2055462-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LtQZT3D+BZrxCdI5eT8HYdXnSpeQX5cgZkRRcTjGUGJg7dIL8Ni
 1ksqGpWYcHKX6IpAbqXjp1lM74QHRV+cgGvJV8y/nlMZ0sMyIopRIQN0uFuSmrByN6PNxex
 V2SgSH4/fhfHaC1ic4B5awunyPCQyLoZLnFClTT/Zv++2hNKuGPm5p1+FfyD4fb2P2Qq7/O
 6q2k3Htc+k0JTQdM9PcGw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:eJ0U6DDgKAo=:+29B9ZWSIcRb7rOY68M354
 Y2FlAIacp5pNWI45nRCfkuTBshXIy2X3liqJXQJQYl9EmUdkqnNrmX8lz9p0kQezJSP9/UHcK
 BVyd5fB4/a0lcPxbuKrG74f8jgaXopesUVIvjG8bG2tGq95eWAkBe9CaRLisiTzmD8RiNuCbu
 dmYh8rCfrNfbpyQh78APTp4X1pU1DRcoC6OgC1j5O4qxqvwdnqcnjf33wiNmOhsMn5q9MCDId
 7xOlzA5f0MK5LEnr6x2bwhuWs1n48wOsfGIm79f8Y2yrbhhXm6xXAYznMoNyUCrz+RE60dwbr
 J/6eyoeJhBSsJivlpOWc1EglBbU1S8ozpuC22rJxPGkjXmKD1p9Q4Ub7g9JMeGcRUnylCx3cy
 Y/CVGXleg0HDqWubQNHOirEBDsDha/PYTYeTbufvnPJgmdLwxXVDrT0XgM2zHc+qCbbgsl5uu
 AHb+NQvp5LwV98456quC1CMQWouwZTDGrNIc9njMtNaC7n42uB4/LlJBC8S5uhnsHeZPl4qiN
 mKniEasQDuNLxgotVc44MUVO6rPzjSltm1rf0jxH6rJ6e6wMgDcJYxdH6ndNaSTAhIxGtpYQ0
 bSqVGgkr4M7Y17NqATkQlgSpnYBCZ6+Y/TTesPdWWJV4jf+kjAVL/Je7oI1hHfxbPSc1dCJfW
 jjM1TqhHK5T62fl7xmNazupUgLtTcVyiNNgq7/tRJU+qMm2w20dkOBjvdbazZ1OlUOE8fdM1K
 aPMApAEwZmzYsso9UJHKnEphtB4cGgcsw8h3bOMGw/KaDOBUBOd+0T4KUY+FPlYCZ6We2K8y2
 mJ3k7ffFjS3CKWbkplXXn2kaHvLD39MmfiT7unWHYDGqoi0gMHnU2WTYlJzPDVYdEZpLPrNTO
 jtXMk+jNVMPhKjNm9+TlMYMtW4BHjWUgcoawNa4jiYQFBncRkIq3bkF0XJzOxPc/Q0X1gknUD
 b0rD4C8RwiEUy2bGAQX+eOsio4/nt1IAtLZS5rgjvWiWMIfpWtWkCocDR8Xxa98HYd6MvH4Qq
 8oCGRhmHx2QodVFGYBM9ZnmX7lo3gpbYMl5YJUSv3tm65dnJh6F9aeBQQoFEaxTgokQGqi5zo
 ebhz44EZ8aJC+hKE0AsfNOeSb5dz8VixfR5rr9SbKWOSTrhWf1kvtvYew==
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Without these, /chosen/stdout-path =3D "serial0:115200n8" does not work.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
v3:
- Move serial aliases to board-specific file

v2:
- mention WPCM450 in the summary
=2D--
 arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts b=
/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
index 3ee61251a16d0..83363c578f53c 100644
=2D-- a/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
+++ b/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
@@ -15,6 +15,11 @@ / {
 	model =3D "Supermicro X9SCi-LN4F BMC";
 	compatible =3D "supermicro,x9sci-ln4f-bmc", "nuvoton,wpcm450";

+	aliases {
+		serial0 =3D &serial0;
+		serial1 =3D &serial1;
+	};
+
 	chosen {
 		stdout-path =3D "serial0:115200n8";
 	};
=2D-
2.35.1

