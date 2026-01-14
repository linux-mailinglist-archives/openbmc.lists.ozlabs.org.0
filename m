Return-Path: <openbmc+bounces-1203-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 803A7D21948
	for <lists+openbmc@lfdr.de>; Wed, 14 Jan 2026 23:32:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ds16q4ZzWz3bmR;
	Thu, 15 Jan 2026 09:31:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768404630;
	cv=none; b=bz7PdjP61hN7MOfugLqaBgxnNT2dU0ZYQ3oinmDYH4n3nGkaEdObaP05spJMMeIYckA/dlIzoRA31WpoRMfFN3sDtUaL7BwrIXqtcJMt6Xz6Yy73m2ShsgC8eUi1nonYVe3Rfjd/VlThyJ2g2HaFoI89rfG/YZvW6H9v8cvqrQopApYrfu4FIGzk5kM7lUSSPI3PRGMrfbAcQu0YM/M9BFGq+/sJ4TboDCqV0tnzdsW95FPZ1ZW1Z/xpaFiUbJXCI5RPR+FSjX3kOXklQ+k093m7cfn3Uki5LdeiCkRb0MWFYN3h/KHvjZbzexOh2xFN2uA96bDvNSaNIlQrZHMyeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768404630; c=relaxed/relaxed;
	bh=Td023EyNphU3HomQn2sLFQM9CKKDLSqiy1q/KAZbFDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lM3E30eDDApPfEom+RvgtZzL71Wmoku8XI1FZe+Gk0KhaGtwT66a8ipICgwTs6HOBTKAiTX2uFh6lH23Th5R5WKggSx2ke86cinFfq7DcOY3QTmxO/SEb/OYp8GohlB8q66GwsJyDKKdqVY2wlSN5dmmgvkrF6u6Sur+rUTce/wZKbMwV0/Fu7ngCJQ0hrcYmYV9ptIIVnSs1/tBpjndLA2k8XSFUQwrZ7TDwNn89VNXEGtnVuw0C+cSoBAA66wt0SP6V7s6spOdKiejuG9hVLn0HL96sKYCRXCUJtaDPstELNGYKYd2Y24QnSrYLvG6BsTK4ibJ92phtoq4GN48Mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m9guE2VH; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F3THicS9; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m9guE2VH;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F3THicS9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drqnK41wcz30M6
	for <openbmc@lists.ozlabs.org>; Thu, 15 Jan 2026 02:30:29 +1100 (AEDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EE4iX62081596
	for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 15:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Td023EyNphU3HomQn2sLFQM9CKKDLSqiy1q/KAZbFDo=; b=m9guE2VH4qUM/cRJ
	F9CSne1yWYFXLejgSGprT79ctgmVOvU0Un8d+0E8aaesqKyWhy39p/Y5Nk+zgulz
	Nj6F97jEeXMdB7O/77IKakV+NC9vzbhiwyv0+JxNix0O24cIR3nPDmsy2ToeuooL
	eg5rtcsqs5cHJVQRQsNOMX2C29hm+J9lhkLUgwwKjku/sN51CRNUJXXhiP0Sqfoy
	ypK0q0R2Lu2+oyU+x76U7mJA9dHP9si/D0jfLUBBlngAHXOWYjQdmWkUXTJ/Cuy6
	hpIlMQ2m9ih2/r4ADu+T3z57erTicOBqKkLRdQ9hDxgyp6sNsVw+p5Or6YsQ+5tK
	PtqQ8w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnu58uyxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 15:30:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c53919fbfcso12721985a.2
        for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 07:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404627; x=1769009427; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Td023EyNphU3HomQn2sLFQM9CKKDLSqiy1q/KAZbFDo=;
        b=F3THicS9Bo4fQlRmtZIyPGbmGqLXYXEltRTT4tQxTgBnOn8rqcVp0lQsfMkFnGB4m4
         tKg22/q+QAbUWtCoqWeWta8Q1UQ7J9ioMVaf29TdyPZFn0up14PCqTkvEBcHRQph/g9i
         d/5j+LMtL6+q2iPVnfHWuOPMnq474JMqpULtL+WH6R1pQEx3h/JmapV4al4fmyDR8MLW
         iaFZXPnDv7KntI64wJEyELcNzzt2epgrKTnmD3+MOSGlF+GT6Y5kNiauoyLDHLwq3wZR
         cjcBI5vzK4AfPibM/895nFHnFZC5AIuJcJBHHP8o/oAsX+tHB6pahsMJEU/p2qBGfBTF
         IEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404627; x=1769009427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Td023EyNphU3HomQn2sLFQM9CKKDLSqiy1q/KAZbFDo=;
        b=G+095xZBulYxzqjhfI58lI4jjoghw8eXCfLNVvX+Xil619BLJKZHwIEs7XVzANIKQZ
         SdL8Xlqy7ZWZSkciHuoBjj0jvxVc6m1RBsLAi+qFeALDLRpJuPXcDgDSk3ZxfB4OKfuw
         qlVWnStUS319v611q3uFphotiyqJ3eehI6T7yGKoiKt8hoDcJ+KmRo+qYQCO/wt6qYg5
         lGlwez/GWC0tLjSlYr48DIzeG9peeyqBNw3MwILmeJg6sXJybnuH7ieK2a2gnA5RbElw
         pUAcu6N0eyFGhIwrqBkze3ah8GVrqabtGhIlen6A+I874XcH73AoW/kWlZwpKjOH+phv
         xUTA==
X-Forwarded-Encrypted: i=1; AJvYcCVMfoHMJWfq47okh2R7k8oBFKfZ8BYCFxDXZMSKyI5VQUr+kwndvamAQmVPtm/Oqc0g2Ued3CTx@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz/r5cf3ejzatCWo1QUfVPNpb810hnuSdzKGwCfub2Hr+EJeFXj
	BE5lKIys2fugaLOZ+fqvgKtnoK2YlYyqiiMfXGhqnLrH7yuVWvaDa/I4IKO92D8m1cUt0kbmKPm
	wYMcBLORgSDIk/41q0lADa9/Lfd5wZwqGdy32tk2uXYWPirywtytrxij80g8a2w==
X-Gm-Gg: AY/fxX5zcV0GRmeqJROY8OIjDw9rld48bm9iqMeUUwC2CXYMf9tRdE3EikvWjCTh2Ik
	dUQ++PlSnbZ+bafEpnChXlX1dQnlaarg0zrYqJcBLf/hOR6Y+CHif+yjP3PHr2acozL5pEQERW2
	weBldGuXeKt+eIUMriPKOV6+nssGHvozBiCL4vBgfdc5Qy8VR1Z78fInwXKOPHmmaTsPWtI+Y5M
	YZCFQRCB+4lD34bDES5CgvmwJuIjZ3FasxEWC1Nx3LAT1iW1wiZ4fl4ajEYI69Ei903vvJGQrGu
	/3+ZQqCjnQH56KMKQlwMyifwjdF59KdV+r6ZZ+3dYrZFvfzz/q4/6QW3GXrtHCM2PfWeX+atg+4
	hm0WTo9cgDaOKjIbN6e6mErPR5vCwaJPyTQ==
X-Received: by 2002:a05:620a:178a:b0:8b2:63ed:dd10 with SMTP id af79cd13be357-8c531817444mr270061285a.78.1768404626568;
        Wed, 14 Jan 2026 07:30:26 -0800 (PST)
X-Received: by 2002:a05:620a:178a:b0:8b2:63ed:dd10 with SMTP id af79cd13be357-8c531817444mr270052985a.78.1768404625897;
        Wed, 14 Jan 2026 07:30:25 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:04 +0100
Subject: [PATCH 03/11] pinctrl: sophgo: Cleanup header includes
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
Message-Id: <20260114-pinctrl-cleanup-guard-v1-3-a14572685cd3@oss.qualcomm.com>
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1597;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4PObio8XO1Yv8S6gHkX3VQh/PJ6tCJixfC8ij3DGRyo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aCHz5EDoUoqxZYrNILSL7sGe0v1k0RWIrht
 2xoRozKYP6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2ggAKCRDBN2bmhouD
 1w/tD/4gze1JdYhn1yRw9z1Dt7upNwMEXwviunBaUWTiyScupfZYrZZ+mi8XAQ3h7sV+pqVxDTa
 PlkvxnU6zlG9dkymlIE0QgQwLo9fLEkTv385MPjlesnC9lrc/f4FDfX+4dPN/oXA39A4biQkB+c
 +amG/ZurwftY7LyIH7q30PDuDYI4vF65nRj/b1+hVgqxfAvp9gAvZSRqpQHvBejFn4Y/0jwRz9U
 a/edRO1L1nMLZLFNbB8+8W6lcAPnWlYV4bma5tTKPxGMBTZSNBHmnLG78ad7y2kuVLduxRIgZZL
 BGStla564Uwnso8MjSs87/BMaJR+GTfNwesX1/LRok3T6S4JdM6K1/KHCtI/jz/+gWrLYZokrkU
 ecfBDZj08Vkc/2LTaQ5kpQDxJdktYM9STLZFAlNercSl7aVzW8OmmGBOw+iLV3swzbnsI1tUfQf
 kFwmjYQ0S4oqnI7TBdpuzYuPOn9N71vc66VV3r2ngU9DZFiWSO1ZhGwyfvLqDUvvLW1+JElj8Db
 jdcFgyCm0Tzu8bpsTC+DfNskjK/kXhSqapyyboNwAEEnFX0NZ34wopWT0mmkUiYg36PGz5siF3w
 nIvRqmBVbenaq9nzL8bCWZLjfudHFcAUvDUbRkL6uD45begdv/TVys2yD0mRpm6Z8qUVqmIDry0
 uvlzYRfNG+QaVoQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEzMCBTYWx0ZWRfXzgjtF4fe3FNd
 5fIzX05DcFp65mZJ6/O6YESZ28T+94NYH0/XD+ejDzfT9ULeu8gRr5hjaAv0QPFbw//xZbQO5Cx
 jnKx7ZSkhRBTde1vEnyanEPagaL9Uf7TcKqS7iTr0rzKnNbrQ9fp4daxyCfJYTI76b6URREJAHW
 9CkHwK5KJIYM2XtLNNUP8vsf/EAZ4ISVEMLszQtEhoY7n145eHbWBur0QmhoxjHnAXkPwrnJoSr
 zd4hy3/QZDWtPY+3Jo7nCsNBZS7eCX0aeJpr2kjM7QwiJ0R9H213MJP+MRG5UEReufwJ5gyK4+0
 mnTX+O/Sc5cvfok5S/SiTgsdtcbszfGIBjVJZsVfKhB/FjN+TpupVGSRuGPk81G4vApSHHViD1O
 SKWZ9KMZaa4hioxZsOoyMSXrVxGUYdWS0E3clFKMwI9dhjqOpyqKhm7tjXE/NNvOTvo3+UtSiXq
 waaqC70ejrk06zx7RPA==
X-Authority-Analysis: v=2.4 cv=BZnVE7t2 c=1 sm=1 tr=0 ts=6967b693 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XMepgddcWT0EFqeyVMQA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: L_bdFG8T6IPbeD1eBVMgkJyohpdzwOE9
X-Proofpoint-GUID: L_bdFG8T6IPbeD1eBVMgkJyohpdzwOE9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140130
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Remove unused includes from internal headers, because they do not have
following: bit manipulations, mutexes, spinlocks and struct devices.
These headers are included by actual C files, which seem to have all
necessary includes.

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


