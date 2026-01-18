Return-Path: <openbmc+bounces-1227-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2275D39B33
	for <lists+openbmc@lfdr.de>; Mon, 19 Jan 2026 00:21:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvV2Z1gVTz30N8;
	Mon, 19 Jan 2026 10:21:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768759812;
	cv=none; b=Y/yOc1ksLsSEGHh4G75ezKQ/mywFt9k431Cb6RIfSpP1JDqwx2YejhxZNOzk2rUE1a+2kZNM4PMnUDYSup0L2Qs7NU5lvtYzyl6AQ4g733P/oNYkozPgGlgHmdqTNYBRfoBt1SRIiBWdZprKoroThuAZeEpAXrLjWVhMgRGMNz09mz+nCd/PFfnxJE+Sdc4rq1WCu7pyFIJcaNst0stEDXZmYVkQE1RC+rYqWxjn4DIyljsHjtEwlYNSH4/QpNYI7WWo2CCkA/mPDdpo6W005QMQM07bKwmxJdQ72PXNCJ5M5pNbSHsof/UD7MFfPb2Fe4mfdUFqkcM+3IOxjXQpeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768759812; c=relaxed/relaxed;
	bh=Nw/X4tXH2dJCM6CqOW5hG9dFyviCyY63+ly6mDS998w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ULCPEQzOBH4INlPfq7DnaxUfwvErHIouTS9cQPCLZ5APaWbgsn2PMLKopqnJg4/KZp5mybyfSPbQcUv41nCOcvuzBKP2MKr6GS/dSbQuep4WJ9B8Ky4jhwpU18Vi5laBbJUb1VQnQUv8xyYKn6ybYn9PAY94EIqbmzimLVMLB1iUEXpnSfTY6Exzxyz9jzduIk6C9h4DGBTZqp5A/rVSVYtWiuNxD5bZox7uOwDT0mcl9sF1Nz7OL0Pk13h9vcV12DSZHuAoJAj9xNf0UWG/CocHKoX87B0ccfOVs7sDVDVcv/BJ462eohaxVQsts7n1lX0wudt7SFScjANZWdaBCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XM0kU0IO; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OH3H+dLa; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XM0kU0IO;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OH3H+dLa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvM7m15wRz2yFW
	for <openbmc@lists.ozlabs.org>; Mon, 19 Jan 2026 05:10:11 +1100 (AEDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IAj2ZU2814581
	for <openbmc@lists.ozlabs.org>; Sun, 18 Jan 2026 18:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nw/X4tXH2dJCM6CqOW5hG9dFyviCyY63+ly6mDS998w=; b=XM0kU0IOuobH+dzF
	6qVL0KuB91DXq8pk+r1qmhwUkydjBo9HyCAY1LKdpuGih0pp9iKU6HVfW9HWLFxz
	R3IvKRlSB4lkLTBq6Pbr+wtIL33Q2GypI40wf1+SQn+5VlMc+q/3g2J/WUeCGB97
	1dnPHYWjD5O3T1uXciWGtbVV3Wo7snw+1aYn8bU56XpkaX0IxdQtyK/Gfzq2EqHd
	49dgs7MxLA2i7SGKCaYTRZEYUpviIKBf427BxsincA+Rj5kL4djRYs1NICEOqLuo
	Xf2CJ7rrUcH9mKV8D8qc8HG7eIjsQBCiUZGE8GGMvx+q81KgwIcWKIef2/ofx/2C
	kdePBw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br1cqay0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Sun, 18 Jan 2026 18:10:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bb9f029f31so1124108285a.2
        for <openbmc@lists.ozlabs.org>; Sun, 18 Jan 2026 10:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759809; x=1769364609; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nw/X4tXH2dJCM6CqOW5hG9dFyviCyY63+ly6mDS998w=;
        b=OH3H+dLaK5Q+TSfQGyOcTDuJsRW5ptTJNKzpOKohEP1EcZdBpkRNhqHpIiXnR8y+Oz
         CDgk1q4h1zIgfOMkC3TlOC9pcn3B4bPlqZivii+p/IIeWWtVqR2e6U7IpXnOvtdBH1Xa
         BnfkfzToCQrE9om/us8hHZiBD8O46s4CGaxmKtIwymHg4ueJfnrAY5bNLT8V4gMf/hL0
         XjUvxUqtQnWr8A4by85uDsPr5Qou4EN5uNhZlLjJm3aGrwx6GQH2pii8vspPvRNpWun4
         0B5ttTBAbkd36gzc4gKWl+gcekYnkXUvnpJ7vDiVvTMVjp6GkP0uoYK7hIkrwFSIMVW9
         ocTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759809; x=1769364609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nw/X4tXH2dJCM6CqOW5hG9dFyviCyY63+ly6mDS998w=;
        b=Fde9aoTxrxUafAc/pHIv7uDJ9ytFlTpFNS9kpvUklKb8Dv1FQrjEAFmfXVJs4oV4jm
         a7etFZJeFr0eW84GDvEzWxibD4+XvsmYxot1om/O7dRG3jYyoJuInn2cktdCbIVIlFTU
         wsoeinNBSRfszTthnQ6jI3Yy+ibzjvBtGChW59QvZwhT6PlVAlwUw0zKbjMLBP1aDPw6
         tCzvIziR3TnDLYB5SKfsKeSxSsswJME4exclZ48sfH8LixadodIrQwR5NtK1g3Zblo9w
         38ZO+q8r6VJtroq2KCi8XXlz9DXgcu4XhyNk2uzrij48lKiQYmxIZlPFPvsMZZl801sC
         Psmg==
X-Forwarded-Encrypted: i=1; AJvYcCXLJXOyxOgL4dXkJ/RlKlxF+QQF1qW6eNpG3MDfKNndKOn43jm+wlryEYND09vZsO2eHLxvcm+C@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwwDlcsgbjBTfV+gQWyfqErqCB/FfsUEZPR7qbg45ayWlBcyzE2
	Coo7RZjQy6cxPxdReEpzIVKbDo/S10/dCpBDOfVCi8xNeoRQ1CMIMIv6BH4BZUtznEZpFfkc8SF
	ew7VqIRhYrgBdOsd5PALoHXhwA0wMI5PsIKM5CUD7MFq8s1Jz69YaikmKVMuhmg==
X-Gm-Gg: AY/fxX7vbehgOWWbm0BJLMCskEPdNGZW1oIkQzr6AUMV+Cs+4dUSq9fmdky2BMo+B2G
	bkCOnxVYS1sBqtsDDeQVoQxcLl1Y4wmgJ1owriQMrRCBLjlF3DSKYXoQScwvG6VB0GrJMBIFJyg
	LadI5CIIDWr4fmuowImkOS4rum5NFqVp84h9AI55U+fr02LwxbJq6UH4qwVzs6F2a3iEE7YAC2a
	k76fT84qJioH9WKA0bNjpZjILfLNQXVina37qbeZCkN38agoUFxiUjVmPFeDulBh+Jl1AVaaTGK
	YU7JDIfCKGBQjGbYRx3xvK5qvy52+lCSOMZmf3UNW3OL8ncNQ3eMGHc3t4PeIjb2p5/feogoD8N
	Ay3AiMGd1kmCTHjK1cbYvkc25BpzsgwbrQQ==
X-Received: by 2002:a05:620a:2550:b0:8b2:f1cc:a14b with SMTP id af79cd13be357-8c6a67cc5c8mr1321765085a.87.1768759809368;
        Sun, 18 Jan 2026 10:10:09 -0800 (PST)
X-Received: by 2002:a05:620a:2550:b0:8b2:f1cc:a14b with SMTP id af79cd13be357-8c6a67cc5c8mr1321761985a.87.1768759808928;
        Sun, 18 Jan 2026 10:10:08 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:26 +0100
Subject: [PATCH v2 03/11] pinctrl: sophgo: Cleanup header includes
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-pinctrl-cleanup-guard-v2-3-bd36f681bdc0@oss.qualcomm.com>
References: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
In-Reply-To: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Hal Feng <hal.feng@starfivetech.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=K3uQDGZFV9ixSLMAp+XTCn6w6PMJReQbBttCFQN0F/U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSHwFh1ny8ZUBi7E3yd3ZVK3fp/JTPumZY3DF
 DMrk8Bsjp+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h8AAKCRDBN2bmhouD
 1xP9D/wKpjBpf0B5lT15hZHuDhBlqt/XMr+dL2IoW+gDe82hyBNbi9Mssn20GVc1WxaEnqmnq4V
 p4+swUeTdryZjhbgxuKOPrnBZ5Vk+8vlzjCsvDVQ2ReBaqMpORafXuxkCKFgclmPhchYQRR6b/9
 /6l9s0yU2jXLJ/19u2o6w1PYH9z2E0bXHvYkcbKNeJFQHEKOlKZO49UNYTddgFA6Glzh2kmdWa4
 iVPwqzZEAbi33uzkLpefoBgD2iQyRwmyLJSxN0ZlVWdPPd6cxYvfPMWlr/a4ZUDTTfEYRZzlkEz
 nxG+54c1yU+jxM5okvGMdms9h6U5n3xWwKQoHYLNd8q0xZXrjBesvQB1Z49IkKfDBFLbkNGgWTN
 tlOUZlfxVOe5kEK6DwJlPpG7xVCf1ey6yUYxBCnqM+1HYMFULN3Q1/C+0jxj9XJZ4mKG4AC63n9
 dYUqyGyPrLP8dKvvV619YhkgqwYnCKINxgT5jTECPev4nLqZjQxG2jWTZtVcGitKwo6aaZAPm4N
 nxmYst0BFODDdlwnUAIbEeTzcSbEfm1xCuURbI7/ir0a83enDBdVx7FY/SLEB55rhRpN63dJLgx
 Vciq6wWoExc3WoBaH3dwBm0ST1MNbLbF6lHxQqvEKQELGhE9JzTjOytPYUjW7UbvNKOMmRQ5Grw
 4tuQ43AnItwMaTA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: ulR_lqa6m5oUoe86mY0GcKIDfFeePXnp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfX7YbbGIo7MZwm
 lDhZGEQHnAp656UI8sjy53LJ1Qw1SjLCzHlKAakSvbkmbG6DhTsU0v94KF4Fyuqhoo3zgC225+G
 PrG5vUbDIJ1jvHXbtIqbG3urZIK8BUvPrhqI30zw6cr2o4GKVCMV0RMeQob0mUwv53qW0lOxUvY
 Sgvcapu5xVpGL3Cc4Qr5OmcmIwdJf36aRALNnZomkflq+9mQw/db64dUyQSdeE/UoGgP1Lly1lf
 BUJFews72AsvHQ0EEqNcqWqZtomw0ALn5eB7RUhUz/USWzyMm/pzhIR7MiRYWTZ5WLHbuL2fuZq
 lEbYgA+IUmlhwHp2w86X5o/cb83+0opSp7xxKNUXhf60y6C5zL1aqN3hTz3r+dOThFkPQsjme5R
 32QEyDz5uNFmV4rsFK4vrZsCcNWUJq79rj5BNDJcBRY+QPWfchvingbDgeHMZfQSkSKWiN8qUja
 p5qVgAE2N1T7tRDarJQ==
X-Proofpoint-ORIG-GUID: ulR_lqa6m5oUoe86mY0GcKIDfFeePXnp
X-Authority-Analysis: v=2.4 cv=NfbrFmD4 c=1 sm=1 tr=0 ts=696d2202 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=XMepgddcWT0EFqeyVMQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601180159
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Remove unused includes from internal headers, because they do not have
following: bit manipulations, mutexes, spinlocks and struct devices.
These headers are included by actual C files, which seem to have all
necessary includes.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/sophgo/pinctrl-cv18xx.h | 4 ----
 drivers/pinctrl/sophgo/pinctrl-sg2042.h | 6 ------
 2 files changed, 10 deletions(-)

diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
index 759c0e604acf..973ab9a38fcf 100644
--- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
+++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
@@ -6,11 +6,7 @@
 #ifndef _PINCTRL_SOPHGO_CV18XX_H
 #define _PINCTRL_SOPHGO_CV18XX_H
 
-#include <linux/bits.h>
 #include <linux/bitfield.h>
-#include <linux/mutex.h>
-#include <linux/spinlock.h>
-#include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf.h>
 
diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2042.h b/drivers/pinctrl/sophgo/pinctrl-sg2042.h
index d481973fcf97..1a2b00dde1fa 100644
--- a/drivers/pinctrl/sophgo/pinctrl-sg2042.h
+++ b/drivers/pinctrl/sophgo/pinctrl-sg2042.h
@@ -6,12 +6,6 @@
 #ifndef _PINCTRL_SOPHGO_SG2042_H
 #define _PINCTRL_SOPHGO_SG2042_H
 
-#include <linux/bits.h>
-#include <linux/bitfield.h>
-#include <linux/device.h>
-#include <linux/mutex.h>
-#include <linux/spinlock.h>
-#include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf.h>
 

-- 
2.51.0


