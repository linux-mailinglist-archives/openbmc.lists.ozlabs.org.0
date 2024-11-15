Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C99D9CDEAD
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2024 13:52:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XqcNX66W3z3c5s
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2024 23:51:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.17.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731675113;
	cv=none; b=OhJ/10HrM2m9QO3Vw8ElVkz58Wxf4R1XSWyL1bd6o6a7LvB5SFjrVSbL5efx9jjjbE0nvVnJlI247qlzyytxoNss4HqJpbcIT1qYw3MqWZooxvw6r901px8n2sxhliVwDcrWTVxMODbMyhKR5lWOpB7zNUjCjnr9mkxGRPlylc5oattc7vGVDvvyTX/0OmOWhvBe/YwaXrPKRiorDyDGQSK7tUEL6xrW9Xh30aZsJj/FStIDfJpmuYJBZpYp8cPeZObJQXDHtCKWXezmmQX+pTGTDZKAVyyBuA/Fl3ODidLJzr7NuA8KTpeC8EYUl/CAJ4pVX6gZvoRogwbDrfMndw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731675113; c=relaxed/relaxed;
	bh=b1h073xk2VbAnT3Phba46TVvE1MlsVQw4HAW0gXyXlc=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=nsl0GKu/fm3Tmiuou0SjzyCcMdBdjDdZobAEyi2gIW3Xh3fGA5swTdzup0xIuRYQ56x4ovgx5MNjK6aTEAUEprI4RDJ8QkYt2VG6ShxRQeQMljWXL34qGLCqoCW47m+9Z14ohp8QdcB/XrVZE4fsliw7PcvUncck4nzQ5FKVDns1SUDm0jIALy4qvOhzBfBpbgvi/DFsm9PimH4sYrzoIKakTGjU9Y/vfqvReJSxIBxr+DhBoI9KgAA8tHYuueUpwvFhIYI96QqDj7CISmjGivVY2QAommNU78ppk86hU4JgBBR2IB8wNwbccA9+8k/HY0IF8LlXGdJ03UgOqk0pcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=u1VJ0BoN; dkim-atps=neutral; spf=pass (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=u1VJ0BoN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 319 seconds by postgrey-1.37 at boromir; Fri, 15 Nov 2024 23:51:49 AEDT
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XqcNP6sc9z2yNP
	for <openbmc@lists.ozlabs.org>; Fri, 15 Nov 2024 23:51:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1731675105; x=1732279905; i=markus.elfring@web.de;
	bh=b1h073xk2VbAnT3Phba46TVvE1MlsVQw4HAW0gXyXlc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=u1VJ0BoNaiPgSWh9Tpi9svWgN2zRDamVrGqTJyLvVrDjvbMfJkJz/xXAVp6rcV21
	 Pv4kAKB2szusjBs+hjNksoxiB/JK2N3SoK1YrinMDP2XQoSRpkLieC1Uo/YouDCLs
	 xO7kP/TgbPLbUIyLu6pHJ5Ja+GyPIAvehYWMnPOJZaZ0Bl7vn35ej0EJIOjKqLJUY
	 kHsRP37iZ3G6FwQ0rIw2JPZSWR+pUVZOFpGm3I4xRtJLYd+7nfBZsNnJakgqlgitg
	 DgETnbwmvwP/rSkmrdxosB5KC3pX9hatsGInTM68IliPNThaDErzHIXTVttj756Ex
	 OFG2mDYbd2QduZhq/g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MnG2Q-1tbP6k2ebU-00qZyC; Fri, 15
 Nov 2024 13:46:02 +0100
Message-ID: <945b113c-516d-4d35-9d45-224c03a344e4@web.de>
Date: Fri, 15 Nov 2024 13:45:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org,
 Avi Fishman <avifishman70@gmail.com>, Benjamin Fair
 <benjaminfair@google.com>, =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?=
 <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>,
 Tali Perry <tali.perry1@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] hwmon: (npcm750-pwm-fan) Use
 devm_platform_ioremap_resource_byname() in npcm7xx_pwm_fan_probe()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zvtwJmbmg0PXPGIXT71pqkzzYsC/7bRRW3nuOzd86p4fLSesLTs
 QPiqTagiHgD0mYjEBLnYpdkUStiSMnevQewINmsgsF01CLSYBdfMH/jnmx8vB/LDe/riTmO
 Z56lzISgaxu6TLOrz7gR5UYJoTPj2liwjhQQiOjnzup3/ipTdYWHoF24Ibfb6l3Abppy0vc
 VPbC9+kojGVxcwGdRmqxA==
UI-OutboundReport: notjunk:1;M01:P0:VvFCUmc7STU=;sltDFj8hhME0yDSsPEwb06ENBf+
 JG3X5ryl5FASXGuh15Ir7jUHqwEqOfPIY9bn1rATImOe+oVeu+1S3GVkDKby+GaTNg2T9mSki
 rmJBs8Z7P0ViPyGZS429B+f3bVGlEh3iVzPnLGbfxUUfCloMuz+kJnbB2L8Kp2+Iv2V9R1HM3
 +JXFeSRCvqS57dnIFWkUBLp72e0lac3WYqM9IfNWvGn/EZ5nOqnmXd8F3PDHrQ5mXkFkCnDie
 1GoN3xhDmDcb/XjV2Lc7ph0KylaLhELLe5dtPi7xAJO9C7LRPree7Wr1ASJ8ONMHKb/k42n5l
 KMgmheCjmVX0rHk0BjOxiAMjo3YPu4RLEHB6Y27qOTZdotsurFG4sA8e5ROPkFA4Q1S/y9YVS
 fUbQdZ1LTfWt8xaXMnG4p9s5fkAt6BQVRi8tezNiKhCsT1+lOS4tyx/EWG01BIN8LxAB2AF28
 t4EOER7Dp71fefvOhFq8nMZrVdYNZzMGR67HM0ilQTEfgBWONUCG3vdGcXgnQwjAfxu0aWeMm
 L7agLEenKGPV07aaCoUbBdwRUYrwmM3dTfCAsERjgBwz1VUz+vjy1Lm04GLGpGDZvcNMx20BG
 0tR+J3VSpwKhwnuFd7pWcyebTdFSFQxcJDPo2soM6WlgZeUqqO0DT2OkHzagCMQTDP3T+zGIx
 HL7doeElI+n3lmvHy6/MDwB0VStqap9HNRtsiarcdvcro2kNgyQ6k+DPQdcfyRYwARkN5NMuu
 tUwKUPMdWU9Qbp10zqGM1x4Mcqo2k4hojyPzh8STyflg5tzPJRVvZoQ1oGh8IMl+sTziTYOOC
 tuWpC1J2OZEniPg+foWgVJJoEk85Dfrjv/R3wWp0aoCO8nFkdZFA+ZS++30pXJNMavKNJjpGF
 rkR83HxdbWr88noj1W7LB/meyrfY9Ho6nEYfRXd3r4sDiI3+edGMc+Cg/
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: Rosen Penev <rosenp@gmail.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Nov 2024 13:30:58 +0100

* Reuse existing functionality from devm_platform_ioremap_resource_byname(=
)
  instead of keeping duplicate source code.

  This issue was transformed by using the Coccinelle software.

* Omit the local variable =E2=80=9Cres=E2=80=9D which became unnecessary
  with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/hwmon/npcm750-pwm-fan.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-f=
an.c
index db3b551828eb..d66edb184bca 100644
=2D-- a/drivers/hwmon/npcm750-pwm-fan.c
+++ b/drivers/hwmon/npcm750-pwm-fan.c
@@ -929,7 +929,6 @@ static int npcm7xx_pwm_fan_probe(struct platform_devic=
e *pdev)
 	struct device *dev =3D &pdev->dev;
 	struct device_node *np;
 	struct npcm7xx_pwm_fan_data *data;
-	struct resource *res;
 	struct device *hwmon;
 	char name[20];
 	int ret, cnt;
@@ -948,14 +947,7 @@ static int npcm7xx_pwm_fan_probe(struct platform_devi=
ce *pdev)

 	data->pwm_modules =3D data->info->pwm_max_channel / NPCM7XX_PWM_MAX_CHN_=
NUM_IN_A_MODULE;

-	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "pwm");
-	if (!res) {
-		dev_err(dev, "pwm resource not found\n");
-		return -ENODEV;
-	}
-
-	data->pwm_base =3D devm_ioremap_resource(dev, res);
-	dev_dbg(dev, "pwm base resource is %pR\n", res);
+	data->pwm_base =3D devm_platform_ioremap_resource_byname(pdev, "pwm");
 	if (IS_ERR(data->pwm_base))
 		return PTR_ERR(data->pwm_base);

@@ -965,14 +957,7 @@ static int npcm7xx_pwm_fan_probe(struct platform_devi=
ce *pdev)
 		return PTR_ERR(data->pwm_clk);
 	}

-	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "fan");
-	if (!res) {
-		dev_err(dev, "fan resource not found\n");
-		return -ENODEV;
-	}
-
-	data->fan_base =3D devm_ioremap_resource(dev, res);
-	dev_dbg(dev, "fan base resource is %pR\n", res);
+	data->fan_base =3D devm_platform_ioremap_resource_byname(pdev, "fan");
 	if (IS_ERR(data->fan_base))
 		return PTR_ERR(data->fan_base);

=2D-
2.47.0

