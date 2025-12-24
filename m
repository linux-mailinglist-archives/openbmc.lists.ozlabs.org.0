Return-Path: <openbmc+bounces-1075-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F32CE5B36
	for <lists+openbmc@lfdr.de>; Mon, 29 Dec 2025 02:46:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dffFY4Czhz2xqj;
	Mon, 29 Dec 2025 12:46:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766580289;
	cv=none; b=jlPVqwX1dRx8GkP3T7YKXtTa5EeM/LpRNDg40houR8peYx6QMxYXrmIXdihcaCtz+GbBxsm0NR1cwP6DMAHcNet4dnYVBPIcSvJA/+0kqRJ+vnu7Uhi2pX5/pXLu6kURKmpEGiUQaUpmtOE8/0wEWWfX8PGiNZ6sbeJyfkNhuGk4rVLFq1cpIjU+/YmM6b0qqtwxIeuZb3pM/7Zz37RWTeDx+NZNrAxNIlEE3R0qgvJHtzAlt3KD7E9lWEVktR5HQe2wxocmdCL/44Xipjoytry2iBc80zIEpzhUCvZLrCkFU3IJTpQqhgc/Ku5/mIh7vUC38gbrOI+LBqZdxBe8TA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766580289; c=relaxed/relaxed;
	bh=pIBKnWae4catNyYhM3q80mHwGLIsFVJVcGLF7SAAxtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oU5i0wvuRb6T5aTws9WPdAJGwVTxNi/FnIEYVKOblbhI+n/55KJC6W66xUeWIBxExDUcjY7sFF5BMRG9/hJRsSfsV1heagu4Nn2g2Ii3YPRDNeVOuVpF77XPTMEzKiFVFZpCmVOVM3+HZ05nxOhhwbearovq/sYULI3uOwrrD9zhUNUwHZ2U3YsnQaWabryyRq+0duECZ/UUmeGvnPEDh3aQqdygAI3yFWtgytLlH5NhfNdNnEVtdXRIjMTbYgtt7EHK2bwb1CWtZhFqNTJxsg2w0ZUV1VPhJ8xEVd0yBOp2O8s1uFmBgSo13gtGKoVgFrLcZWd6vKIMRbgmOP99Eg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YmVfTXwS; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dq5qkc74; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YmVfTXwS;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dq5qkc74;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbs5s1pQgz2yPM
	for <openbmc@lists.ozlabs.org>; Wed, 24 Dec 2025 23:44:49 +1100 (AEDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3wKQ23796513
	for <openbmc@lists.ozlabs.org>; Wed, 24 Dec 2025 12:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pIBKnWae4ca
	tNyYhM3q80mHwGLIsFVJVcGLF7SAAxtM=; b=YmVfTXwSg+dzYWqzDS2Fpsnl+k+
	SoCPXSRlgSckh5iv5ayAMfxhfXcHJOkKcOHnKH8GO+G+PiIEOqh5yxvfzsvHvagh
	DsfzldtCWsLRZYfFfMiyj4BBioW9ZIbpAmldVI2UZI+qRHzxOuer4u5TqfyiuuHl
	bACTzaQOJHgjRDbHTNTpnL9981mFYhB5FqCtQQeIjKlpeVDTHcG2+McanmvDXwBi
	LPforIBOwwkdCel6R8oWLCRoBnJkER8aYz3DGpb93+EsTNsEcEqGtmlpfBAjdAbj
	WRgUUrxD5HDQbiZhGy+FNKF/BgDimrPDuNV872iYi/jr1GpII2a2ac7jPpg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b88r696pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 24 Dec 2025 12:44:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1d26abbd8so160833021cf.1
        for <openbmc@lists.ozlabs.org>; Wed, 24 Dec 2025 04:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766580286; x=1767185086; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIBKnWae4catNyYhM3q80mHwGLIsFVJVcGLF7SAAxtM=;
        b=dq5qkc74Tg1Tt963mVD31YOeiymX+nmvlJL88YdFwBTokXVzpUdrU4WVdt4FdSew7X
         vweNGD8s9lSzFcRwIaA4KDHASA3CxnoFwEpGbAX5U3tNpcKJh7ymf2mrOseWIDmfAUdt
         sJ+C/SBz9t52XoZegozOEb4NYtBvcq+qwtLtIUQxF9DL1xnCuv+OgEyfPCWMbcKNpuVa
         OVc+bApWUn++mEjXpQKUlQstLiBh1WuQ28DiamUp2sBal7oocfSScx4ABdOeAUtwViv+
         zG69AbaU7/VvVQu5rHElYY4PCOHkry+CXBL0Z0rXxGcGqW/lQgmV4HTgN5FsSSeByRkf
         UwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766580286; x=1767185086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pIBKnWae4catNyYhM3q80mHwGLIsFVJVcGLF7SAAxtM=;
        b=BSQ3tjpSEpvQ7kTv5bSdYYQIu0MnVtqMBFvsD8PqwAXz+45h/xFNJNpr1UGDzhuBRp
         yL/58iz+CdNJPnyGLmsGzbpNedLrh50UTNDo/Pu4+XnLe75SRFGmLgdnB9GC5noe4OZ1
         9C3NLYvDMhdzZ2XPAdGqapkBiQVh/rR9ii1r0YBN2r4F8DX9tBHHOxzCRiiVL7jZwcSr
         FitapBoGVbP9BkiWcQPEr29TdtWuEzVwh5yDzrA+IdyBxiGu8KR7+GSiy6Nyiqpc8XQ8
         NNcPuE+lkM0LJ5NcwasCgc4S8QFc+7nUehqGi/plLGw2CTd0H8p89UamPswndGalZRUQ
         jF0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW60EdDdNujwT6ZDv6m7NNhweYwVg232UEth9izqpQHHqAtBsiS2giNru+znT0Gy0QxkcfWPPKz@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy09KosS2ZY9FTjZtTsNMDV4IZBZ/G/bsrGk4Fj9pc9TbI704Ew
	/KnEWfBttEwL6xWfA4yDVnjZreXCv05PWRuiaKikjX5dw3lo1mN73SjfJq1R9c8Wf8ciHXbnvAw
	j4SwAA9RZWzjlbM0hNcnjLANnYFvUvIcpcuExU7B5863WT7zIPIZvJWqUIiu8ZQ==
X-Gm-Gg: AY/fxX62YryRv8ALL+B1hi++H+uwtZGJm7u7xoK+iRE84wp/AWAayPwOJgTNXX9hrF8
	PUlsGuKqFpCAxY5z49EcRtOas6quWbZH0m1i4vKWVqsPrUKKE2gykh0bw1VjKNklo+fGuyhVxPZ
	AJgJPVFX2lRXdcPo/R+AGAx2swJsMvZjEVx7WBGiic5ws3Yy2NsVNAe0X155mQQ/k2AOa92eN42
	VrEbOFDaN+xztZzLecSj9EaPzm7FJMtz8EmcHMJk1YlpFugG1sJ0x2Lf2i4qvy1j9qdqx1e5JG1
	VrPfJdr9QaA2Etm2ZJD/BBk8VaHx5ZtY73ldcB/0lrck4Y8weWcF0r87Qb45eFOBCqR4XoDyMxM
	Gfp05YMBi46fcwPclhw8/yWko/JhCoC3Xv2QZO3HefN85AacZYsXs+M6KevoHBOV+ts8Fog==
X-Received: by 2002:ac8:5a4c:0:b0:4f1:ab28:d9f6 with SMTP id d75a77b69052e-4f4abd03195mr248360331cf.26.1766580286442;
        Wed, 24 Dec 2025 04:44:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTZXliHT1pgcb3I+/DNRDGU4Mh4keA+YHzBcuOF/mpCrQZKYCA78vOX3Oe8oOjwDHK4oJOAA==
X-Received: by 2002:ac8:5a4c:0:b0:4f1:ab28:d9f6 with SMTP id d75a77b69052e-4f4abd03195mr248359981cf.26.1766580286049;
        Wed, 24 Dec 2025 04:44:46 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159a6d0sm16832679a12.28.2025.12.24.04.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:44:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Aubin Constans <aubin.constans@microchip.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Robert Richter <rric@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Adrian Hunter <adrian.hunter@intel.com>, Joel Stanley <joel@jms.id.au>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 4/4] mmc: sdhci: aspeed: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 13:44:35 +0100
Message-ID: <20251224124431.208434-8-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=k3fIiJQnt3//kLj8p1O4BhrfyE8J8CFmxoc44wKmiXk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS+AxsqyFxFGGpeZZHIhCyKOnvdjTJf+CTZuIW
 G78x7Z+JzWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvgMQAKCRDBN2bmhouD
 17GWD/9Ixj1ULpYkMSdzu/q3hf0Kyx/91sewvClr8ICZPurrL/DEHrytAOup7j0UsUf2tqG+OyT
 q6YcG4NKAewr+dd4p6QyFCs6nsZ4iElL7Poc82/r2gIRHtRdWcCDaRZWlFvKMiR4pbqXC95Z0Zz
 s9fK2CprxcJVIOTMdjDqP0zIsBY7bn23YlXQmVkcnwj6tyDPDVeppRSNuLAC380N2f7msIhKcJQ
 hJkCfAP/LP92Cb8Yui3UoJ0pk0mYh2q1irGN9ANWu1j7Yv1py9TbXofb32r0aNUPL4eCkt6i9AX
 zFwqoAPZYFBnvUNpXZYwSzVTgpo+JA5kT7t1vKdt6z102UMhDrrYhFl/n/s7UnUZZnk+DiC45Xc
 GZeD1kOX3T1q3SuYwV8kE+G8vr+p1QLOS5wuBWwEidmkJfHGc/KRDVwreOXDAgeSMK93UbZqiDx
 +TXPEPeJ4QH2Y67axdeOdhhhsHD8xZ7XWxKOcjNoXkyIe26f4zdZ0F0NUBD47rgPILROWsCmicy
 waGD9LyfGuE8rVmiOhslBqiSQ3/fyNbBSlOfegAl1K/1fQHLCdl5E+ckDPH5j+NnzSiJGl/Ebvf
 jiLZwczT4DSEMogX90P/8nlA/WHEX+S/g9SdtVK2prE1TUsOpmany/Fame9afDjdsGeXptNT+8J g0yiZTEko+NQNlA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -DpsZbP12qs_SGYPssxedM7F7ktjfIXW
X-Proofpoint-ORIG-GUID: -DpsZbP12qs_SGYPssxedM7F7ktjfIXW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExMCBTYWx0ZWRfXwJVtlhQvBM+M
 iWxXUT/cY+2MebtIcv63IdemygFAb/zAA+EVgxkeOmyECTKzHeqjgzSgNpZPuAVevC9f15jik96
 Gu8dXN09N41RlXk4WLoetAt/njrJzk+uEP0HoNpwO2GjzptbAjWm8odhI9InkmcvVCP/f+Pa2qi
 1hRa19ZgKksYGLSBIIe4f451ObU0Col1Gzu4Jc4EFfY6Eob75+LCvOHdN6t1RN1ZpoJmENCuJju
 4/Kw7hU/mA7lUO5ospxGPXHsmL2e3fm3AE3eGIV7fw0vxttmNDfrBAKz8SrKdIDXzitT4A9hRQ/
 npB8ADmkMocrXobsOxgVLCJ4bfbZi8WkQxYKkU0jB0O/+EcdRqYIs/GN4IHIXCWvf2C0N7U9gx0
 gdQqriEL6CU25pUjWr9jt6+JGwa4DD3Z31gIW/i5sNMxoI+En3V86eKh7S7rWFADnh7AbK4ZPUZ
 tAijFXidTbt1pAvarfg==
X-Authority-Analysis: v=2.4 cv=Qahrf8bv c=1 sm=1 tr=0 ts=694be03f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=v5e_MpXYYeFlSKZv_FQA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240110
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mmc/host/sdhci-of-aspeed.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
index ca97b01996b1..4296def69436 100644
--- a/drivers/mmc/host/sdhci-of-aspeed.c
+++ b/drivers/mmc/host/sdhci-of-aspeed.c
@@ -519,7 +519,7 @@ static struct platform_driver aspeed_sdhci_driver = {
 static int aspeed_sdc_probe(struct platform_device *pdev)
 
 {
-	struct device_node *parent, *child;
+	struct device_node *parent;
 	struct aspeed_sdc *sdc;
 	int ret;
 
@@ -548,12 +548,11 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, sdc);
 
 	parent = pdev->dev.of_node;
-	for_each_available_child_of_node(parent, child) {
+	for_each_available_child_of_node_scoped(parent, child) {
 		struct platform_device *cpdev;
 
 		cpdev = of_platform_device_create(child, NULL, &pdev->dev);
 		if (!cpdev) {
-			of_node_put(child);
 			ret = -ENODEV;
 			goto err_clk;
 		}
-- 
2.51.0


