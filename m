Return-Path: <openbmc+bounces-1234-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF76D39B50
	for <lists+openbmc@lfdr.de>; Mon, 19 Jan 2026 00:26:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvV8H4sCtz2yFW;
	Mon, 19 Jan 2026 10:26:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768759810;
	cv=none; b=C+VTXBE/UvMmm6OmN66EGXpvAF+L4x/7ciYhchbQQcldvcvRrQ41pf7UJLXfY+VeiMs9g8UhVwQMNUYxbbay8NW0zJkKOlIxMXTwSZ9YGHh63dU9DdcsKjfny8K1h/eiBiatbXJ9/4dkhMjkwyFMa+YTwXSBrA9gNTVLgRbJn/I+MCTPOjg66Tv3zi9IwHKD+R2cZPaa9IBct5nZH337eFwJu0NHwLa4UBP2FatlpWd1o74mM8pOJW5FcmOvuv36Bp1Pi3oRN9y+mzsFtWk4Y8l45VwHSg/cTY8DdyWIYBat/h6C3Fr3peDuKdwDY6HKKO6t7E8PiYVpkjwF0b2aKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768759810; c=relaxed/relaxed;
	bh=xF+EKsCw3DAcisLqyjUVzy9KuncQFl/L6/ZeXlOHhAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oIqIEt7x/XqFn95m0kWk+jmjhGxlX+ZyesGuV6ePhcTND0+4dLR2iEmzlTrk82nnDkT+6HuFnh76Oz9gKkXWMQMukSX7cAmxMkt/t82oSwQ0kaNSOd0kjHLmrTcNL8sfESo2vaKn9FDI4s+Gpr2ACmnI5wsqLU4OwsDG0LRDzWOfg2hTw3/byGvVLvv9e4X8woamPGGZfsPPv/1/EbCo2WlIPRUfeix9xt9YO/Ec8ebQqSqyBHU2zXoyM5M0X40v08JOiPjhUwTgn/mxyBJxtszRn9BgMxJ6RCSgc0P8fcu+EfeO33MGeUKtENaCVvpcv1Xy62KSYGHTR3vY86UJUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eL0a1Qb7; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jur0UMTd; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eL0a1Qb7;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jur0UMTd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvM7k0y41z2xSZ
	for <openbmc@lists.ozlabs.org>; Mon, 19 Jan 2026 05:10:09 +1100 (AEDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IDM8M93246862
	for <openbmc@lists.ozlabs.org>; Sun, 18 Jan 2026 18:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xF+EKsCw3DAcisLqyjUVzy9KuncQFl/L6/ZeXlOHhAo=; b=eL0a1Qb7gDs4Ddve
	0NXzoUo9WM/0fPiz+owufJ/TN7UB1YorGCL5iME/3xC20RYpToTyzU9rMAl69/cX
	p0se3f7oX63VGOYHAj579mzRleSJhJKqA1K2iejV6rNmmjQiZuwrXiluUYJeYd43
	p05ezSi73YZu3gmMpnkbK/NT/g02StJ2p+xr68eOs+RhPvxe+nqM/+kqh171eNhf
	e1I7pgMXFtt3HuLgyHGwJnoLoHWAQ8vKfYIWwT6yLRTTp7thQtJU6gCSi8EfTM55
	bOH6F+Br1a/t/yoE7EIMymmpb2Q/8yYy+chJp1osPlgMqMctqVegdOP9YCBrenu9
	NTwUXA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2guju1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Sun, 18 Jan 2026 18:10:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6b315185aso473890285a.2
        for <openbmc@lists.ozlabs.org>; Sun, 18 Jan 2026 10:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759807; x=1769364607; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xF+EKsCw3DAcisLqyjUVzy9KuncQFl/L6/ZeXlOHhAo=;
        b=jur0UMTdHaTDN2EyzayFi4aczoNgP4C2wG9dkWNXdRRe3QjTVXEI5IRIYZj5WneVKq
         bFmR5k7ffI82Sqw2fpy0jPIHLM1uRH/IpKSiFEd+Wg9aZM0lVpYYz8HnY2XoROTUPpcF
         C5XEy5s2rBTM0RupHpZtqE4O7cvuvdCya/uC6N1vh5E9DLyWdXQacW6/oVBpaBIHagfI
         VZ/+r3NzXfnA8JldRL7LUMy+koqwhk9sKBRMS9dOYkoCcBIAxuAn0oiP0mX8PBpzc40V
         qc3IatDoxvvY3CEO4aJfXB1hkznqFPBzTkoQxeC6Vxw0jpkSEswBMV4r9w2qddrjg3cc
         mKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759807; x=1769364607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xF+EKsCw3DAcisLqyjUVzy9KuncQFl/L6/ZeXlOHhAo=;
        b=R4uTI3b+NctrN+WnuF6G272izRTP46tIGJXiLBF7sFQ9JiRKKStqC2vSQu+ltF9yzI
         I5Sq8DX7OppmksmIZ5MoHkHq08g7e02Et/Bf6EtC7bRXIXOz0Fh50IPzZewM6jnVx87e
         KEW8TZPvXyv1WrNULQ9FU+NZd0AYm51rChgN+JtatrfSXrVJmJWAgQlfomZSGyBET7Yc
         DWvxO4lmQ4WhDhN6cdtTROntvBqNFb5fgrHOVBrpBJdEPaB3OXvrQnsWpq4fDASq7Fby
         iIHkmPFJNQQffCTLCfW8wcqDH/gLznrCnpHWKyf7ZKPKXgUq481OE9qYFUWJgz3MIWDH
         UkVw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ9qME0vxlrYqjkeg/vF97N63IEXTwzqth/Hj+oJZO5FEZp//8Rwyq+KW2zisKsTCqRpcI1vyH@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyQwX3XH3c26nV4UxDwlR0brNOTfVgQzvQdb9rrJOPN4fFBO0Uk
	AZFOOe/Cyb51BVEO3LMWj1nrz3mfihY4OI1+zo/WruKyXdrEpS3tnTgkLRWoZNK1yB/ywo+gHtJ
	7LiHcNR9+W0eUZ+Xpuz5ItboRD8YFTV/NYmvvGLNrkB2sGJ1NUlWpd47cZnPWtg==
X-Gm-Gg: AY/fxX6lRlpHMsdqQTfSc2P4vMj3wTJbHWuYL4o3fd6tSJFAUtbTrd2CmFAp4Ug04b7
	6hJVXlswlRk/7Gp5XBVrvJavvKZXOSEwBQbWvxJMnlCq/KJLu34cZLDJFrK6uvuIAaMLRUVdqdo
	+FdZQU52YwEIolg1/MdIWqYdMmlxu4PWCcSCMeyPl85C6my9Wx7a4dKFb5iPhtYQsow+oedwWTq
	YNm4THh1A94XkBZ8mIev1ASs6d5YsjE2Cn5Ud75PyQeMJPuhfK6AfgyXzHKAEzg6DNfXesRkMAD
	yEmvadbH25c4WyVN8ypELLZq+mPpI+FftQAee59k72uPKA5b+IXQcYMwMHzreTBFB5nyhs7MOP7
	yjIGVAM5suz3pGThqoj8N7gAisX9gJdeAMw==
X-Received: by 2002:a05:620a:319d:b0:8a1:762a:ab13 with SMTP id af79cd13be357-8c6a68ed101mr1320495085a.10.1768759807237;
        Sun, 18 Jan 2026 10:10:07 -0800 (PST)
X-Received: by 2002:a05:620a:319d:b0:8a1:762a:ab13 with SMTP id af79cd13be357-8c6a68ed101mr1320490285a.10.1768759806815;
        Sun, 18 Jan 2026 10:10:06 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:25 +0100
Subject: [PATCH v2 02/11] pinctrl: starfive: jh7110-sys: Cleanup header
 includes
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
Message-Id: <20260118-pinctrl-cleanup-guard-v2-2-bd36f681bdc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=957;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7QVsX3meH/ya2n+MBwkYR1pzRXVW1X0rbx6284HAjYo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSHvR6NL3AOW754D5v84SJb7LIyFBtY8KP66G
 rat0rpoDimJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h7wAKCRDBN2bmhouD
 140hD/oDwb35yyHvtbjc/M0Lb0PMZ0C388lWdCmXu5PHWfBfqbi0pqIpiLHa/I8lydecaQng+2T
 6pXYaLCQXfyx6d6HjJ55DKT0y0CB6wGv6jNrkEel9RIEZtNF98EnmNQ16fH/1rSb9mkMC7i2p7p
 uDQZ4QUXT4LLz83NgAx9pJhb0KnfOtuSCj7ilWSVwBJAtUtjFo5I5GRJSTTEh56yE2ZABLc4cPM
 v3zF59Hm8PbD3E9MuXG9dkZ3zcW4LPXVh80oYbkUYomCkspDgpq1XUWslyrduP8BRg61ub43bFN
 D7b2pKxQcp9n4qRPG87arVBUJzO5bUdZriEhcvIwRA8g7Ty4t1XjUE2dBdcmlu1jHGR4yu0AvNS
 J7gZipSXXYh7pfrpXX5hfVYQaU0Rx5NjFvVJYlHsg3MPu58t0NRwsCZyu5njKqBnL97H23DcTnb
 OGU6INWVFiyd26HXHhgTxNPu8HbyBRFE4CXAtbLk+R38puFmLXoAIe93PD83NKVNNA5JuQ1qMDT
 03Mtb/klRnsQT786huPeUBAPeMhGoyfg8zbw5gZNhOsb7qtBjGABqQ2+kFMbdfME3WC2aEWdkol
 fQpOxqisp1hpLzun3NpNsowLGMaZelCuMxI2s0Eqx5whKM1Oq8cNrvIZKO9NQDkY4SqD/TZ+3rw
 05cWuH/pid0x7LQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfXxhtoUXW5dF+9
 WD0cvGxNwDMcQhzJkEVE1F5ZQ+CnnD3qlbuguAcqdeebAKAiLIQQSRjjztPXrP9Xp43xjPqfx5H
 sJgWDhV78/jTQGXuPoZkGvIX5VvhQivTxBvVOqgM3DmWlXld/esAcQJB6/DkUI7JgjCYV9lw+5l
 Q8+tWmr3jsiNw7j4p7R10RLFgln0Nv3BLGbr9VHUIkfjd3mhEzx2AjMD6aaOAwSDkG4FoXod10Y
 pPuJmUL1Tr8SDIeo8/19y+M5AuOXKMFhYL7m/cXm0VsRHRtte/OAdv/SWKkdfOfm0qZD0O7rFcG
 egvaY7wruZ20K8VzDUnoVfUIr7OnR+Cp6mO0hjpJ0f2ffqjRmr1WxiF+/5tYMFSeNHGF/eR4N2t
 4ri+tOBnqOUB1GKV8ebtoyQyLZ8M2jBQB0y66/HMDPeas9OqXtLW3bBaz9z7ieHITTVeetoyeJK
 qs/t+fuJoEzB45Nm/cA==
X-Authority-Analysis: v=2.4 cv=Sev6t/Ru c=1 sm=1 tr=0 ts=696d21ff cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Bq6zwJu1AAAA:8 a=EUspDBNiAAAA:8
 a=2Nzugx-BcEq53SDkSVIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=KQ6X2bKhxX7Fj2iT9C4S:22
X-Proofpoint-GUID: jje85qZvVhlKtwGgLubP0ZQF8YiIBfZc
X-Proofpoint-ORIG-GUID: jje85qZvVhlKtwGgLubP0ZQF8YiIBfZc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601180159
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Remove unused includes: no clocks, mutexes and resets.

Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c
index 9b67063a0b0b..44f84e4c29bf 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c
@@ -7,14 +7,11 @@
  */
 
 #include <linux/bits.h>
-#include <linux/clk.h>
 #include <linux/gpio/driver.h>
 #include <linux/io.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/platform_device.h>
-#include <linux/reset.h>
 #include <linux/spinlock.h>
 
 #include <linux/pinctrl/pinctrl.h>

-- 
2.51.0


