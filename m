Return-Path: <openbmc+bounces-1071-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCFCCE5B15
	for <lists+openbmc@lfdr.de>; Mon, 29 Dec 2025 02:42:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dff8R4prRz2yFk;
	Mon, 29 Dec 2025 12:41:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766584091;
	cv=none; b=aGTMfY4XnhqRtaJle1tMh6QhUgba7jQ+GVlPE7r+lpOkUk4/apZDJRl/bpcR7Kod5z+yteDIU4doM6w75X3n+VKoGrDTIMUUufnrOfd4XUdC/slSG0VOYfynJ1EA8WeTVluoCxMbfP1Tl+J8QfiGtoqQYF09vsDu8AXptZMJJIrXa1YLT8MgZsB1eaUVwngeu2bynPAb8jZUMG/ImhR+UvxePiXtoyyEZK+SAQVU2EMzFkUPaL7+PDG4RdBCZUBGwdiWfOkdTNZKDzaRYZzGxMO2w+XpVvpvKemqFFT/WzFtkMqQ92az084/BdCJTnHRbksEVI5ruByCRRQ0zLQpuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766584091; c=relaxed/relaxed;
	bh=KNilgW2hQVLA4gLgVez5G1ooyvmxPr2+tpwPGpuLFvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NXL0KKInT8vK5ZXFwhz4dknLYqKvqGcSkR/WZxNjwQ6lV35RmKgMvmVZ5bQyQ4I2/hVZTenOWw5X1rCOWZVIDqg7atXHy+iZ2SMycI0vfc60MLLPiTuuX/lYyEJ+5yPkU78ENNVUGpgAv4+9a9RC9w4qYnE103n6h/6J2TWUjiNoLQR9O+16hFYj3TbghzG4tXGYITTPtUG3CDmlYa4VfAMJrNL/qudwR4qh6HryXrBjIQKhK+tpKHXwhLkfHD/BNqNAeJbS5HvT1FXAnRQWOQgMZZlHWkiBPJnI+mFRMYQimTLyaw9q/K7pYS5ai7thq8SbbEGXN3unwghOtpgF4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OYv/QbS9; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AEckgmFn; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OYv/QbS9;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AEckgmFn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbtVy0Gq0z2yHB
	for <openbmc@lists.ozlabs.org>; Thu, 25 Dec 2025 00:48:08 +1100 (AEDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOCSsip913442
	for <openbmc@lists.ozlabs.org>; Wed, 24 Dec 2025 12:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KNilgW2hQVL
	A4gLgVez5G1ooyvmxPr2+tpwPGpuLFvo=; b=OYv/QbS9aElI5G5BGNnWjL6XO02
	WgVgefJa+aL3ab57iZqGYNa3drsUElqFpIzmnFd8kVZHqgJQZbsP8tFFCPHP1X0e
	xPLgoLq7gr93/JC7zzSQmeEK8RL8Ojw4do9qDtvsRhjnRa4fgNsZRg1CnxEWsGDs
	g1yOJJhJBVNG1a4NKOsul4cxqODezrmnKnk7D5AVtor0aQ9S9fvJv//VPn/hvhNi
	p2dGmPx51k37IrtpaAr+w6b4p12ieo6pihlO1I58l27jrTkuScbpyGuTeM4mpPJ/
	FyMwcoelU2AA8SGCP1GShqSOL/KWgA9yT7vYMRfG1ILIAPWgx6h/VNVV+nA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7vt2k7ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 24 Dec 2025 12:44:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee416413a8so64618021cf.1
        for <openbmc@lists.ozlabs.org>; Wed, 24 Dec 2025 04:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766580282; x=1767185082; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNilgW2hQVLA4gLgVez5G1ooyvmxPr2+tpwPGpuLFvo=;
        b=AEckgmFn5sCj3AqbsLHf8fvjqD7vjGKItD7TC+1b1s3KjnTl4JlSHY0441USk7KTfB
         4aev2b0tZ2viAX92Fqyixngb7ruP13648l1iOql/EhNmoCva4OYKMfz+Qhk1+XvaKdMC
         YkCKPLgZTGfIYjOEIvx3xRwYXd8ijEWvVv0l1KbJz1LUZcy1fMQhEX2XfjNVRwCC9LjC
         dst6PbIgcggCzPwUl+hMbKBOnZRmecBknCzPFv4nNauQitcZKSJplRAtR/0YdnHQZ4et
         HiL4vMkRVlEV4d/9qFMEpliIJH0E8mmi6cbejA0giKXIjBHwJZupL5TXsMLBzV3RZ3Dk
         KdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766580282; x=1767185082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KNilgW2hQVLA4gLgVez5G1ooyvmxPr2+tpwPGpuLFvo=;
        b=kki000K+nwM8+t14D7odO9qq46W1H8znXghzHTN7UqSKnEhJjSrpK9rPi8xM9FQoOK
         cyh9SevzUOHdJAPW/882m21PwckUAmm5pPB85kU+lcMIYCrphfpSyct/Ky4+0pJ9FCP3
         72uL/Azw/Q5mXe76JqTQChO2sMZzlKDWuk4e9oppv1vg8qI2r4LvfUlW8no11Ib/l1BX
         5lnTHrTyOi8ueUeiYf8apPAqjHW5qnEG1D//b/BEBSt2Pa1BejEh2mM519s7Yh9lybEE
         GH5eAwF2/XgFJaEip7TjWIp2H55D/O4lc0tX/6rTrp7rhhSBiyBqws9eXOdCADBL7ibg
         DiGg==
X-Forwarded-Encrypted: i=1; AJvYcCUM4+1nYJuKMCi9S1enhtkSlHZmNqEPcfOd2UApc2A1eXCow62Ye2MafSknz0hj7rOS+YoDJHxn@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwUI2RR3LRvD8idSZHU6kT6uhJo14S5kYGnlgRoJIkRRfzbhmfM
	+fQIFWJzBuNvmhB398V3DJtZelUvjmT7VfnkhfPTa6mMqSqF5JEE5aibbmXTfRsUs37qjGBq1Qd
	sw74JpjEsP5LDiFC9kX4OyJbnzb4k2mlamaWKT7vcwfaf7NonLWD3McZYVLEHiw==
X-Gm-Gg: AY/fxX745j0Dr1S48EmI3uT6nG9w5/AAe7MV5XytDZ6+Ninm3mHyv2I2S6Wz/hQ07iW
	9J2wnFkPxi1Bo1bq4OcxCm2fT3E4RKjAo4Nv0pJXFXf6UNplR3hJoII70NctFf/UCYRVr0bPvbM
	KO3CfeaGxQQPnkD9vIFKkSYm/dVsYhp/+QlK0eUz1D80IO2Bpo+XplvmrcJFkht1dxWr37JJo5d
	ESaKT6J5wYWSFwyHRwKCG7kH/aAr/vxFEmQtQFdvW6smWkf1x/U4ZBKZABtLyVV7YA1M3kI7VDg
	jJDGTNkPC6d/A4L1o41fPxdO/gw3lNgafT/eav5Y6m3hu+Z/RpA7GNygaO5hlYKsauM+kOteg3u
	r6gvv8wZqj3UwgAdHfGmuJ93CDVN9HShws9P+YiDVd87Iab2ix+nwMwemiL5CTdQdLhnM2w==
X-Received: by 2002:a05:622a:2488:b0:4f1:ccfa:377c with SMTP id d75a77b69052e-4f4abd61335mr226687381cf.45.1766580282425;
        Wed, 24 Dec 2025 04:44:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjvpN7s+TXKm4SLsrLkne4UHksiC+p6orY9KBQYhq92eh57vEMHcnwzJgX6up3Vu2ofSSjDQ==
X-Received: by 2002:a05:622a:2488:b0:4f1:ccfa:377c with SMTP id d75a77b69052e-4f4abd61335mr226687071cf.45.1766580282043;
        Wed, 24 Dec 2025 04:44:42 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159a6d0sm16832679a12.28.2025.12.24.04.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:44:41 -0800 (PST)
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
Subject: [PATCH 2/4] mmc: cavium-octeon: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 13:44:33 +0100
Message-ID: <20251224124431.208434-6-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1379; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=FSxaYZxRQw8NtKxY6K+zMOwodj+OLUAUfn5MDuEJjsw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS+AwQ5nt6vw2D5baL22d3lRE3rCSSx3sNXoft
 Vv4+URvpJyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvgMAAKCRDBN2bmhouD
 17PtD/9fPRxk2QKcs6uPuvMXpzzcrsQbQfN62ZHe0qNSRHZVjUZYRSclOZTFYSAbcTufyVWU6XQ
 +BeXZ/vHxvBypyatbdEQ/LlDjI3iPFTROp1xfZXNwjSVhfKs2YgngMDhBjdYLnj+PO1gfBKveQ/
 WwFiSASnRWqMBH/MQ5yzsuoZS5/HBB0S5yeY3HNKZAASCVsXKPmGsyQlDKc+aobVqSXIIit1Cnq
 phLUeHtgWO8BxwNRAPJCvAIeevCY2cUwoeaZC0sgO6BvTtHF3XAAVthEob/V7TANCFkQpFkIa9k
 ugZ7raeZuoEN251R028d1ihz5HO6XpvwTDDqgi7urpjhDixnoPAVWDrKpOcENAJg2jl4xIKfxFj
 6iepzuyHXalf/4fbXWTmTmQUjW1G0ohdRcb+AMvl60nnz7If3RHoNIxEM43ZJLlAK5BT/NMpEcw
 +AT7kZGOsqZ0y85GzBe5wzqqcrrsDxtBdCHnqh4v84nD0/D+pm/T4HKjfymo+Ld5Vs5Rb3kKEAB
 GUuyNEvbawqC/3EtNgnNYrHAEEqJ9BQyeDrJcIkrco854b3FknW5scT3l1XW2hQa8nLSTjrl/Zy
 Y5reUj7YPS6HmfNfkhtjmZQ6CAXdK58bZ0BcUGWK+XIFbmovY+QRNWftxWEVKJMWqhELo95L0rv +AeqG72kM21k/yQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExMCBTYWx0ZWRfX3YM3AYLYFZgj
 BDGNzcOY7r4IxknCZehXgmLtqlhwsb2T4WrWbdSICxUk+ntEmG67StNJaYHHp8X/S7UJoBA7Apz
 6vKL9YmQ+Ujx5fdRhDuxBI/xb40a6+XqtNdsx70lE3MDxJLqE9RnY4Rgj0YdYDKrhwZnESnu2LS
 gsH3+jTBDCfQTKh7CNuJBboVqMLqmNQwyoquvVqS2o3eJGlNHvVv8FrtgeT2xBtp+byXGBgxYsR
 0qjTuFNX1Vc1w9kLXeIti5iR1UWVG1WkXKHLzblTCBnBL8nGlNW2x1O0k8lGIcLdUHD0dTq/pP0
 PNdS7rXTwfcYgaqrovkDvzmP8q5W7/GxrlZgH9icvrG07LYwC65Da/CsssRQQr5e0uWMbyPz9Yu
 012CuLX1VCzRZBTVyZFEmTt5csJlP3uqPKQG/z7zxb/qshSLEztXbS70Pt1rv5EAIDK+DAbb+OS
 UNUHj1KUT6/y3YXTWtw==
X-Proofpoint-GUID: xz-MHlhimdKtxmcG0oFjKs_AP0WFpQNW
X-Proofpoint-ORIG-GUID: xz-MHlhimdKtxmcG0oFjKs_AP0WFpQNW
X-Authority-Analysis: v=2.4 cv=brtBxUai c=1 sm=1 tr=0 ts=694be03b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240110
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mmc/host/cavium-octeon.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/cavium-octeon.c b/drivers/mmc/host/cavium-octeon.c
index 0592f356b1e5..8a0daddd9200 100644
--- a/drivers/mmc/host/cavium-octeon.c
+++ b/drivers/mmc/host/cavium-octeon.c
@@ -148,7 +148,7 @@ static void octeon_mmc_dmar_fixup_done(struct cvm_mmc_host *host)
 
 static int octeon_mmc_probe(struct platform_device *pdev)
 {
-	struct device_node *cn, *node = pdev->dev.of_node;
+	struct device_node *node = pdev->dev.of_node;
 	struct cvm_mmc_host *host;
 	void __iomem *base;
 	int mmc_irq[9];
@@ -268,7 +268,7 @@ static int octeon_mmc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, host);
 
 	i = 0;
-	for_each_child_of_node(node, cn) {
+	for_each_child_of_node_scoped(node, cn) {
 		host->slot_pdev[i] =
 			of_platform_device_create(cn, NULL, &pdev->dev);
 		if (!host->slot_pdev[i]) {
@@ -279,7 +279,6 @@ static int octeon_mmc_probe(struct platform_device *pdev)
 		if (ret) {
 			dev_err(&pdev->dev, "Error populating slots\n");
 			octeon_mmc_set_shared_power(host, 0);
-			of_node_put(cn);
 			goto error;
 		}
 		i++;
-- 
2.51.0


