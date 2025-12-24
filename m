Return-Path: <openbmc+bounces-1070-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6411BCE5B0C
	for <lists+openbmc@lfdr.de>; Mon, 29 Dec 2025 02:41:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dff8Q0w9Mz2xKh;
	Mon, 29 Dec 2025 12:41:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766582646;
	cv=none; b=oVEXxc65SM6fzNQnBgFLhNoRnsPrYT+U7CbJNvs+I4T5WBiuAzBT0VZXxtMJ4RbnAzD/wyZZIksaTS7v68jgVfS2SS1Or1FzZd7bChEgcHXnO7TqDSUkMiWaVSNPyHnqTCKMyvQMPVBce1XfieOlfjzajxqe8iadTFcUalXtwuE477SAw9rYqpxJy7r+rRfo/xpBejk4hUc8QO/pZmUFt1hae5hlmiHtpMvXPJ4rskQDkrmqjAawQ/3C0V6Wmet3kLZjYalOmj86gySqN+zeiix1sthuGDkWU1/kktdjUlciyNZDMCvz0rl7blkYu9v/XqgiWBhxR8mP+AcMTZKneg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766582646; c=relaxed/relaxed;
	bh=m9r1P67fE5RYVgK7sJ1zYioAmxa+nW61YwB51X9ls6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L07ZfHpRg8fMdrmn4+YEtHw4PdB14ut9PIRPOQDxLLmObKNImVydkohVWRo879M3QxNqHKLemY/zTzQZG1xcuhZhralXro0FJmzZEsCM065h22mu6KTAyfDy3Gn0Jf5gHcFnPGy0IU77W8bGuI9RZ5HwE7riWpRyJSSudk5YeFyWgm+x6SBTVyExhlCVSDEBBvIYzGRVRCyvnjO5zkKbIHIJXCuuz6qUA0rdJGfka+E8+eXdGc4sajMW514fmZ9E7huO8v9wCTmu7wG2F/ei+GOJeBgwf6LbYobz/UEKnDTPrchFwXED3SNNx50WJNOmg3QWR+okb7FsBCZXf5l18A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fldrpCj+; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S0S1hHkr; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fldrpCj+;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S0S1hHkr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2361 seconds by postgrey-1.37 at boromir; Thu, 25 Dec 2025 00:24:05 AEDT
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbsz92LGhz2yLg
	for <openbmc@lists.ozlabs.org>; Thu, 25 Dec 2025 00:24:04 +1100 (AEDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO5Y2IS1018267
	for <openbmc@lists.ozlabs.org>; Wed, 24 Dec 2025 12:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=m9r1P67fE5RYVgK7sJ1zYioAmxa+nW61YwB
	51X9ls6I=; b=fldrpCj+zA9Q7h/0byn4xtx/X+g2HVNthktaN8KT3CGaPx18Eeu
	ZhgJsqk+U2LEM5K848P1u9lcbDdFs/Khx/O6Svo+Whi74m1Mpo2HVFq1ZyRbaFm7
	FR+LI/bJ210Qj95lb2XVxhhV4IiAM/dhKI29cjmc5z9G0QcpqRsMDKqMEnnk9vdW
	USDUGebEx5Bm3wxnkkWgHGHUJTWuTq1VVLSx/i9AvMFY5ir8V7JBPvubHtnWW3Hr
	QcBZauX+sDL4uoJQt4t2tHim/XbTLT8JdR4dZ/GjRpYAwhDkmTQ3+B/IBpt2U0Xb
	kcDr/k7K10BXVAahHytAxbDKQ+4kgg96tnQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjsavgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 24 Dec 2025 12:44:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edb6a94873so114771021cf.0
        for <openbmc@lists.ozlabs.org>; Wed, 24 Dec 2025 04:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766580279; x=1767185079; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m9r1P67fE5RYVgK7sJ1zYioAmxa+nW61YwB51X9ls6I=;
        b=S0S1hHkr97VlRg+3tKjwuuhL9pyRyo29b+BNm2Z5SKA8bBp/sm8Qxo7Uzq2GfKd7Y7
         0oSb2ai54r3bhBrZDotJCDFWcrxt8OT/+6nsj3hFUeZ1K5ZE9CaLGXDLWqvqKQnt9dld
         4O3oHAykP5JSH0+xvbIqWMV/kWiG35VwRSnjggZEUpYYe8D0GteuqcstgEulMj3a0ajl
         36XcblMjddsx9wRyQY8i+tQERsbimxKtn1DohrQqZ7Rl38LLi4PgX4LT3ujNFlNfz62W
         9qLsDJs5UFGMoWg+rdZlwzQQcZWzKCihmaE/RoAsRP+zywsdKh0RptjjFY5c9PiFlT68
         7epA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766580279; x=1767185079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9r1P67fE5RYVgK7sJ1zYioAmxa+nW61YwB51X9ls6I=;
        b=EM3ifvmuBmgVy82EvOlySqIDh1+TgV1K42XYL3Fl0QDVsfMOpR039caArTrcC+ApXr
         hJQgA0JoFtwo7HgDSM06eytvk8oZIxUxoyHuC+Ab3XDRVK3YaoYEpnBlzNMLGQ/JRGSK
         oM43eMActnSTmViR0F2yWP3eZ2zqNjqmQSto8k4SrE+H6mg9eGUIHQcWFWxBF5+xF5qD
         ulF63GbrRweB267Vj0/E7ecKzAyPcdvS4mzQjn79C8htQcyuEf29ApPU4aXreESjD7al
         ZqDXYxnbYBWVYqaolVtMb+ZM/jSKzOEqRToq2JHxuRBOfq3PQoT6YQifltPU5GpZSsDK
         x2vA==
X-Forwarded-Encrypted: i=1; AJvYcCVzrW9pT12VKj2CaD0EG+pNWyLsyXftIT4ahtFLDvvKeXH8lM9nQ8U12YY1q9c260446txVpSt2@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzsrZDfsDXL3DIxwdZpAhG550O3+1zs5JGgSLpgmoFqx2VoVip+
	HQtJkGSw+YNOCJGbeG3CcyY+Zwevykt4C0/7kaWNAuHzhOtnhmp5uwNjOMglcFYp7Mpb9g0b2Zk
	AylOnTPW8/fPctLm2O5sdFwWKdWXUs+nu/h+R1zCreLDhupx6LiKfy1+Ef3CY+Q==
X-Gm-Gg: AY/fxX7B2ZgPcvkpY0HQRTuaLigq6QlBlIK7i1IYXgF22dy6QLdgPCaJn7aXY9DVvNH
	xJdnwO8DlZxjhrsFXpsRnCfqQUANn9ACAGH5RZzsofqRejU7hOWJ3c2/PBrqrj4f0k/n3vgPvS3
	mHvqfbeY0Uy7/xHO/NyNZXrDjlJXArfchnbBYmh6gpyQotHm/9QAMEW2Noj8mdichxPxSLTmga0
	okA1WNejPBAf0jTnrlGI4lU+4kVivYBR9Oo3ju8BInrEhq36rCcx3bZThDUx1jM7iPoz1q/TVQQ
	htn8lx4ljZoY11pf/Rpm/ZT+eU6LwfQTdMkVuZotcpUT+AeqGjggBC/Soka4KzWxn3NuS5VjSrz
	rRocUoUf8TA7JxlKNio/0VjRZ4brAhkxfvaGhm0Jeh6MPlBS1WgNtD9uJT4BA2pXWb5vmtw==
X-Received: by 2002:a05:622a:1c0b:b0:4e7:2dac:95b7 with SMTP id d75a77b69052e-4f4abd2b668mr288449151cf.37.1766580279400;
        Wed, 24 Dec 2025 04:44:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+NA1y+53V5FjdDZScyPo8qs3w+gs5u6C1SMipwvVq0kLIBUeyMoHc8CouFvb8Es/3VC8oWA==
X-Received: by 2002:a05:622a:1c0b:b0:4e7:2dac:95b7 with SMTP id d75a77b69052e-4f4abd2b668mr288448641cf.37.1766580278931;
        Wed, 24 Dec 2025 04:44:38 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159a6d0sm16832679a12.28.2025.12.24.04.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:44:38 -0800 (PST)
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
Subject: [PATCH 1/4] mmc: atmel-mci: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 13:44:32 +0100
Message-ID: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1902; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=yM7PsCJOfo1O8B7Z+MHBYKtQYFgSA+XM28CKwgjSXg0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS+AvGomzzRiYXzxCRUVc56q7ljsbdKRtMaPH+
 BmIj4M47laJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvgLwAKCRDBN2bmhouD
 1wBbD/91aQO1mFxSqslLTeFr4Dl5APuLTTk/ILf/WeP5bXwicwB+MKjkIBB/JMvW4h/70qH6Z0x
 l09ct2wktyCrkWbBXtou6V1Y7rQsfK5mBLfeoxl2z/dp0pdlPJ+qsTGLXvYBdllFC+pDR+g2a0z
 CfRUHflxj7UxVculnSnhluQuS2OrR3hG3fGC4hSE0ZHz3Cz91jZDiaif43yekqT14EMViCjISYR
 H6kMCEtvfb0MIxvAWqKiV5Q1h8khWIqVX12yPrf4VBGyBBXHt7B3QZfYeHKZCJsaDfOsJkUV6AM
 AVVwK/wByZHE6ifGhM6wfijBfJ14+RW5pP0GKmymxenVLVK5UfT5BzLb4k3GG33U50rZduZkfnw
 eb4Bs1IFB38KkbXmaqGOKFwpSesJzlAy+im5tpxruX59GaZgLflrwRxkG/bi3jqwRV0yBpjGzuF
 e+/PdMNsicVjYO+w6R3MtfXc57BiM4CTKFuJNIf370wI4+L+0KQiLwvsmMV2BaSLDHHNL0JKSsj
 vjYF2o3X8hNSkyG45ET2MNOjWnEdUMSgjSbImKE/Z7lsX1lkdTiF0tjBDqlqNie+zMUsjPkQVH9
 qVzme2ry1K2D/fe6OqB4TZTznqd3WBI5cl4kmaZ5rzs+cDgLAacpGV20A9n3wfVZMEiM9MBVLDA KYGhqVe3L36+D5Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExMCBTYWx0ZWRfXxnFDyCiHTtGh
 D7xXD2DOA4gZ6t7OUMZySFwDZ+DJ/93KHrl7ds6qcJ5zejzh0K0LIgQr4hWB+osF9jGA4wHe5NE
 j7f909Vx2pz/4V8trZzxblq57HI9TCrjols6Q7w4xPaUWwAo2Lcbilb2gBf6+qBSP85Yf92rIFv
 Be5CntvCFEtpUZ/XrMaEIPVam+vepko9BwNNr/egWYXOHbIQcIxPq1aNJF/dlG+xng+7Jx9gYs0
 wk576NutESkzHBXzeuW5Mo/zMl6RaBuEjo00NMEXEbaopAMH/m3kjmRHokJUeFM++bOJxdDx66S
 7Y0sJKcZ3FweaGkNzhM2c6qMPtOdssCXkkihrxNeDijKJ9kXW0hFusQ6BWIM0XQp5BgbAIHuInF
 y/GAYPqSUlwUFIPpoO2B2gVhDpcCVjRFz4t61A3iwArsJcHF9UBoARog+yFTl6yIZbtorNCO3Oj
 DWSPiGSJdtVLrGgNZVw==
X-Proofpoint-ORIG-GUID: uoxMRaRgvlblC2fowANT7e9weQm2JIYI
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694be037 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8ZTf1ciMPyF_Hyv9z0sA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: uoxMRaRgvlblC2fowANT7e9weQm2JIYI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1011 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240110
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mmc/host/atmel-mci.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
index fdf6926ea468..3b4928f5b9b2 100644
--- a/drivers/mmc/host/atmel-mci.c
+++ b/drivers/mmc/host/atmel-mci.c
@@ -629,14 +629,13 @@ static int atmci_of_init(struct atmel_mci *host)
 {
 	struct device *dev = host->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *cnp;
 	u32 slot_id;
 	int err;
 
 	if (!np)
 		return dev_err_probe(dev, -EINVAL, "device node not found\n");
 
-	for_each_child_of_node(np, cnp) {
+	for_each_child_of_node_scoped(np, cnp) {
 		if (of_property_read_u32(cnp, "reg", &slot_id)) {
 			dev_warn(dev, "reg property is missing for %pOF\n", cnp);
 			continue;
@@ -645,7 +644,6 @@ static int atmci_of_init(struct atmel_mci *host)
 		if (slot_id >= ATMCI_MAX_NR_SLOTS) {
 			dev_warn(dev, "can't have more than %d slots\n",
 			         ATMCI_MAX_NR_SLOTS);
-			of_node_put(cnp);
 			break;
 		}
 
@@ -658,10 +656,8 @@ static int atmci_of_init(struct atmel_mci *host)
 					      "cd", GPIOD_IN, "cd-gpios");
 		err = PTR_ERR_OR_ZERO(host->pdata[slot_id].detect_pin);
 		if (err) {
-			if (err != -ENOENT) {
-				of_node_put(cnp);
+			if (err != -ENOENT)
 				return err;
-			}
 			host->pdata[slot_id].detect_pin = NULL;
 		}
 
@@ -673,10 +669,8 @@ static int atmci_of_init(struct atmel_mci *host)
 					      "wp", GPIOD_IN, "wp-gpios");
 		err = PTR_ERR_OR_ZERO(host->pdata[slot_id].wp_pin);
 		if (err) {
-			if (err != -ENOENT) {
-				of_node_put(cnp);
+			if (err != -ENOENT)
 				return err;
-			}
 			host->pdata[slot_id].wp_pin = NULL;
 		}
 	}
-- 
2.51.0


