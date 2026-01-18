Return-Path: <openbmc+bounces-1228-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0117D39B34
	for <lists+openbmc@lfdr.de>; Mon, 19 Jan 2026 00:21:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvV2Z64DNz3bTf;
	Mon, 19 Jan 2026 10:21:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768759814;
	cv=none; b=bGlarBup5boJAa/a61NczPd+eiCQeFmbZizpFu4UQ6shyIlE1sBSP8IR2kTFm/gRLDx7xFDgliQt/Fl1uT01Y3/1wPkf2W6Fj9Ski0OhXUtaVrvALKBr6Qqjxnuh4/jvLOpRpw4E9fO2xNuuepfOOprKOhxevkFWtAjEr75NPbssneSoyoZ7sQgBejiA3dITuFxosW+zBwy61oHgxi/A9Usbpwjs8WjrlRz0maJss6Hjd6yY2l1u/od6cBChlM7zsBhth4iFvGKbj/BprNxjx5bCq3NQjTGfPrbho0e1X991h4+knNC+qzazB6KNQqvglezd8eykT9dh2wae1Tbojg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768759814; c=relaxed/relaxed;
	bh=Mv0nQD2Fz+xmN887PWY6S7g+L/xnSZWABnal0geai9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UNw2lc/0/6l6lcCKDpq0y2+CoLXQbc9q0UiCTpPC12hAI5+oiQBdO/JWUG7W/4/0Cii9ORkPruyyJgiqjDsU3sE8TxK7w7sy+xAD8b5/n8vQIBrRCBUel5nzPPrG9R7KjNY07QORgyCkTcfCKzoL9EafRrHYZkH5nZleOjbCX8kFzzDSJcTE7FkhHEcYVmkurItM0n1uY+j2Ztp08NpvyObSq2OulGYJxdWHUYOs+xgj1sG1rp8oEE7I979tn9i1u4FCsL7cImzPd7HJeP2VqG9cptGXxJLY1czQ1P5ohPGcENfyNaFpCa/OA74+2Md+SycXVy2VQleED3zo4fLyvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EKd0XTCH; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZEOHW3q9; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EKd0XTCH;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZEOHW3q9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvM7p0hscz2xpt
	for <openbmc@lists.ozlabs.org>; Mon, 19 Jan 2026 05:10:13 +1100 (AEDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60I6oQUQ2359211
	for <openbmc@lists.ozlabs.org>; Sun, 18 Jan 2026 18:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mv0nQD2Fz+xmN887PWY6S7g+L/xnSZWABnal0geai9Y=; b=EKd0XTCH2anl67j7
	+xoS3zAwyuw5gexTX4UDZDbMLnC5kc49ZKBvo/PRSfX8H9/mojr8PFpvgc3ME88b
	6axcSF5oETo3Ez0pN8KFbvoEFyhPrF7c+uSatRaUEvMLzXAK644V1AGsZn56bvQS
	bCZLsjvXGEqpYS3LnoXqvUCuqUI7H7Y11WJLUaxSPHHwguRGZ4Q7IimJmipOt+50
	Q6aw2Gwamt/7NCO5mbtrghH/O7wwME0l9ThG+ASTltN1oWwT7WSEvV1+2j1EvAR2
	nzqjOBiZ1kktZ82XgQPuWYmITvwpCe163Q9AwYzYfAfXeJQ2iw890FeCl+fRz5AT
	mTlM1w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br1cqay0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Sun, 18 Jan 2026 18:10:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6b315185aso473904185a.2
        for <openbmc@lists.ozlabs.org>; Sun, 18 Jan 2026 10:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759811; x=1769364611; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mv0nQD2Fz+xmN887PWY6S7g+L/xnSZWABnal0geai9Y=;
        b=ZEOHW3q9xx8o1D1nuBFHAQFgeCN96+G68Xsih4jNZlBKXv7ZTxNyRh1Vc5ExVzkfx+
         lUkaHkgbAEv7OZLw4QcklbjSBfNDahsq281L5BL9E0PhoBkLczyDmbaztysjV3s2K1We
         sixG2SVaE92gyRU6+aVPgcMOW1n9NbfKyI4uivSV7a4Xz1eepbXZ8FIZ4ooHMOS+9GzS
         jvVb5nx2Ifr22HOGGJ8S6BBftduln+CVEIPI0sTo4UIGyB1YHfNNt7KGtNYQGsWpFIfu
         7FMnhkIxTN88iR+BxIQhdGm8OG6wnWrE/4DWMPYFiqiKDpRiY+FFEp/+g5CpT6/E3eSp
         PuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759811; x=1769364611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mv0nQD2Fz+xmN887PWY6S7g+L/xnSZWABnal0geai9Y=;
        b=QluBvGX9QjCUko9TEpXYBq3UOlSivcjKPxzVMsvKjGTDUjUh1e0o6XdPRkHg66p5rV
         VUqSPiebY8lb+ppfuKBOT54nZnD4RavPelGn8jMemPkLWfBKitx+wgScc4mLunVylPkg
         u0w9tI24jND36lKDyzkNjl8evvTZSct40SEkNVzIiQJ0fPynlO0QUrJ7jb4UAYW8v5Q1
         JmvZnW2yTEINVLu+nG9NBw+TgnOkBaJN30JzdVt5dx9AncBUFT/MwsDQKhOL8Nr3DTCB
         OWqiJcCU5OGU/gCoqMwZi5extTRpsvDYNiDQKJgFS5ds9NG+ns7PkjsN8DsTPld8OIM8
         ZoeA==
X-Forwarded-Encrypted: i=1; AJvYcCWpg8dnrAhyGRbn081a2VQfmoWYyrI2YQNPxdVsfTIuqPS9qaNdzNnH2JHIz3163Qdo8D6uwZcY@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyeTMMFnq1ArdkkWkJCPUKoHCwAVqd0OZysfEzJLRdDjFO/mQ1D
	RJCBVGOlZ+xLnOoClwAZt4BvUF7gtwm8CnLc26L5hvbJoYEDoQJUQ+HPkynpyFlyLCC1L02bLuI
	sbJMo2ToQii6O97P/Fo0B1To9gXs+dcIoZ5ixfChgcE0N6iCliZjP1kV7ikcWYw==
X-Gm-Gg: AY/fxX6+5EZO1ERobVHL30r6h+gBiMLmHsYBLN25ltPPoXqybOo7PRy8XxB9ytKQivG
	fIIItE0jw8FXY6INTfZnyzgey7dLXD1fuNRwld+wBg4wFKvocFTvU+nKVGpvbTqy83akE/QBryN
	rgNNX1qbT4B+do0CR9IkA2I467AeaxltEhXChFqNtvxMY+WgcGOiFRF6V0tPNcmzIarlhKybFIH
	KhVWbf73xaf52uZ4adHicVSYILiPVhOxS/82UaQjoRIQ2yNZCOBmt109V0vUrqpT0/6yAjJyD1m
	MXKUwhrntQKxMGnjyInNRdlGP+lqIEh93zrlzSA9/tn7Wjoh0AE1zZ1hAyhEAeqxfiYzAxsKr4z
	gdal++Nqs+8fWMIFn33vK4mNYKvF6a1FIlw==
X-Received: by 2002:a05:620a:1924:b0:8b2:f269:f899 with SMTP id af79cd13be357-8c6a6956472mr1391333885a.56.1768759811448;
        Sun, 18 Jan 2026 10:10:11 -0800 (PST)
X-Received: by 2002:a05:620a:1924:b0:8b2:f269:f899 with SMTP id af79cd13be357-8c6a6956472mr1391327885a.56.1768759810821;
        Sun, 18 Jan 2026 10:10:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:27 +0100
Subject: [PATCH v2 04/11] pinctrl: amd: Cleanup header includes
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
Message-Id: <20260118-pinctrl-cleanup-guard-v2-4-bd36f681bdc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KS2A41254/IzptP8+yKUiwH8wnfKT/gY+cirH/V2Wao=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSHxcMweZ49Q5Nba1wrVt3CAmG8iWHmyaxcHb
 TNtiusHLMCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h8QAKCRDBN2bmhouD
 10MfD/9Y8BgVbkm6bl+36BXzMgv1xbm7JsRk164MPz0v27NRR9/A7MTJxMXT6LNgShVq1djSxge
 6g8uCxUY/9zNFfEZbrbUevJi5cHtHc5/YUTCSNnot/lyVENX5O2KSCx3dYOpUdjrHDF8VX8ybHW
 wzM/tjZOoVQ7+gYxMukxqt3s8XLQOVct9PlD6qtPZmiFE1vab6GQQgLNVgM1lOYylEfR2ldNJXs
 jXDMtydYwc+g2dbP9e5rnGzbL2XkzK9qGia8zw1O8+ri8yvQ/U9eaHS+WXwTO7Vlr1QAxEc4oUC
 zKbv4wtZ1zeayUoWUv1YYDBGknxgFxwVQ+bjAyyLW+9wq3v6aKLX2CCdb7vhkv9IIbgJ0ieuMw0
 xixdCHOWfKQ+OYzmelQ7pXLN7RTHkKO8loGnPsXOAVHqo6wdt1FOQH1bb4xGl9Pd1K011ZOn4sP
 piveUlRUfW37nPiHBDROLc5yASzQBPjKA06V8RpaHwfC7I/9bVbiBuGyvVHdGhk6LBSFFKEjrBX
 UljGUMx3HN/A8uksjr0su24ucX5chRlqNVyncRJqPaYjbJAJ0zFKM64X1r9AnLRwEVfas7sruYn
 VGBFODgVsHuDAOcu5XDZBnuzDmqv88C04tW2Pve5Yakzf9c11d3W7hQUeI1nroie7c8OQHhI2ca
 a6OcgYeqNAjKKjQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 6OLG5iINYYAX_QqtC1qrgoG-wzwxTQQU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfX94+7ilXLhELU
 lqh+KK0xFCWG1zwBT5Yf/xbPWClhcFqEXj3CmvMkCfKvL7ORjhy9pBZxSDYG1PWuMTZqVZlcMqb
 p57vQ80F1CSwNmh7EGJ+Wq5mvZ+kZKEPhwJxRyhi34Hyu5RjEM8PXbymEJ9CXUqjGEsn83nsVn2
 ay8BRUly1cazDJXsaIVPjIU/irbULZ/aPEjVu7CErUnWl2QOadO6PPN3vIKbfP0JHKB/mceKx7b
 kCQruc9esmLWU0e1B6GZTXgy1nnvYLq69Rfp2XaHYXR0NbHmtuW1NUZTSA0zGSbqSHfHt+cp9py
 JuVGZ2sjn7JSGeP577V+xzpGqeclmx6elXKBTkGLFIgxhonj0mzN7f5CedSD5ofr7TkdJKtxMtr
 aLwQMFe4+FS1Ahyn1ZpRexUfGGA6kzBcH8JYJrUWhZKyQffKoWE2fl28fOcLS6HeVfs7WS3NWKk
 G4W/zsSYhboOYZLHnkg==
X-Proofpoint-ORIG-GUID: 6OLG5iINYYAX_QqtC1qrgoG-wzwxTQQU
X-Authority-Analysis: v=2.4 cv=NfbrFmD4 c=1 sm=1 tr=0 ts=696d2204 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tMXyHTyi87mTYQFNLaMA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
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

Remove unused includes: no lists and mutexes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-amd.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 2dac5c71eb00..2af94ef56434 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -21,11 +21,9 @@
 #include <linux/gpio/driver.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
-#include <linux/mutex.h>
 #include <linux/acpi.h>
 #include <linux/seq_file.h>
 #include <linux/interrupt.h>
-#include <linux/list.h>
 #include <linux/bitops.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>

-- 
2.51.0


