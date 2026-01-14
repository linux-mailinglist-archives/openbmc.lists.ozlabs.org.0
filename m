Return-Path: <openbmc+bounces-1201-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5950CD21940
	for <lists+openbmc@lfdr.de>; Wed, 14 Jan 2026 23:31:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ds16n5Dfbz2xqG;
	Thu, 15 Jan 2026 09:31:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768404630;
	cv=none; b=jE4/EHXhLhv6ahSwwg/W/70g9HSkQ7UJoMkcDbr/syzfUVNEfxfTu+eKjRDSOJ6ualHyGevfc2yDAb/4ZuzD1xOK6uzBznk2QWRg3rhHHVHMeCSVy7T67eSuDsIbU0u4Vwftt1OMbU36/0WaTjhU77Ea5BlsNPdcPLywCc3evQ58//hzdZIhNeiFet23gi11iM32lPB4hdNOXl53grA4oH7YsI4ThIBwol8TSvPYlu5oTTrfPNOifjpd8V9N12dfdpNI0hJPyy9anNABFxAtK/XiuX5wzdllfblt4p8im+bBU41TlKoTGRUJ/en9mM1ypjWCy1RmBaticiQgIB53/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768404630; c=relaxed/relaxed;
	bh=TQOWmZ4i8qr9JpAuK61Y9RoWdOmJcEUPWfdU+wHADeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oaONW8yjovRu/91HKAYNKNypXBlaxmm+32Ckm09hi96Rgu93+rR+Ob4CVVvmn+60IVMKtbZL/YAhQM9SOo0Rt/V9gmQPnKrZwfQvVe9k5dTtD40OBaCX5uZZ3y+XSPOeHqG2YFQIVlTcjO2NtY1canUR8Lvlh0u121CsXJzt0ltQ1xeDs0y94UBT0GqyXeLBs3e7+i0SDyMkJfN+x60qRWUP/fLh+Xs4xILiJ9CN0dtk8FjcEA7L+5jeVKflKyh58e8rVwE2oNzhZ0uAF7vazMIwy96XRlDOBRmltb2XYISVCrx6GSXCH0s9NQXTuy3wDQdNRshd8LP2l+X0M0W5PQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nd+c0nG/; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W9KuUvCF; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nd+c0nG/;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W9KuUvCF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drqnK5mHMz30Sv
	for <openbmc@lists.ozlabs.org>; Thu, 15 Jan 2026 02:30:29 +1100 (AEDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EB2aS13416172
	for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 15:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TQOWmZ4i8qr9JpAuK61Y9RoWdOmJcEUPWfdU+wHADeY=; b=Nd+c0nG/FDs7XoIV
	szExDaUVSYkyrbiaHalQ7Ap9+Ae6UJ/LuHmENsYmw2Y917XAkpOSA5PDn/ucsIXw
	RLjTwBfwp+vw9JlBmnZtHYYPA+nuxAqdd1pB4mQdMxi8gLqJiqMqFue9dtxzWhhw
	z2Mh4kP3YONo/VwuqMbCWqIdg2ZulAZiBjr4/v+VsHOzRPeea0BMSLLBuepXEfaK
	4TcnFo8VnR36XVqUEY+VzZlVDB5GSRQreJSVMoii0SAdOXRljAxbNb1718WPAMnT
	H1EH+vCGRqzwWc6iLgCOM8ppr/Cv0FkS9cCCOv2YBPPewR6rimIDRchIvZsKHfwn
	UwREZQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp9x2guaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 15:30:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52fd4cca2so247824785a.3
        for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 07:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404627; x=1769009427; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TQOWmZ4i8qr9JpAuK61Y9RoWdOmJcEUPWfdU+wHADeY=;
        b=W9KuUvCFyFb8l1Mq0tJJKUMwlJMS6Pwq2BSfdyOD+359ImeGWADppCvE9yMIV6TxM4
         +uMy2X+X5Z0s8+R+tn+UFLsbGTRg71U+CwD7eMkMJqohZsir/Z9qqeKPWYVkl+vl3CGZ
         9EF0TURF+YGDqN/K9dDkVjU3Dt9kpTRFgJf5Z0ecskmtZJJ/tmd4kvcXCr0+LgRKe47+
         wRbK0HQUgHXax9Sx9No+5tdGM1XqsWUNrSgXrdrL15JZ8Y75VFtPrSQlOsSsQpuCP3Vn
         6GKfruBS+6DWZlPLKQDoPLj+964b9SP7vo8r77M21kjLC4MSZL5k7PX4Z2RUzt42Nq5r
         NYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404627; x=1769009427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TQOWmZ4i8qr9JpAuK61Y9RoWdOmJcEUPWfdU+wHADeY=;
        b=DnUzwhqM9ul5W523hu6s8KR5EK2CtzNWsyzb+EbO1+hhpNVVYHDmxNTMt6GKKKgt27
         flNVeV4wpdgaCLJlH1LzZrLrQGZiKFzCQ1ztJJdqwcQ07FR+dNCTyMasdmXs+jSuQolQ
         B3un2wEdJipx3zRSUyE2yAgEdmU1Fk88OOgifTqlO05AQspud6/LnDVddKvCgF2nYHxA
         tvMc2Fk0BERMfhzGUNeuHwbIWVwtI2X9cAyK2+B+bGiup1nqxRY1sBoVMUaz0qbz+YV1
         dd92L86euujqQhkxige3faCY5VqW+8Q1kvOFqzOkHPs0JgZBbwrLLuvGlj7uKsgVJmiX
         8C/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVuodtZASLe6JAqQBdUIxWk6UBu31PHjiH4Mh0QZwvkq/BsdGSIBpE4uUblI1COUc1eaQnOVh8R@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy7+MbaXiYX43VEMGdqaY5vRAe/aVaxgEcfIzCxELU9WE78psf/
	tz1abeympiWKzYk8ds3sby6QL8uXm9apjDttVIyFbMVshR4NItxK090ob8Ht9HBZhEDKpT9Ow2J
	FMgY8HNYQxtn09VN8gSIa3CPcSOTcXWwEWuszzvmC+Sy5WbKm+bnOWNI50cVlcw==
X-Gm-Gg: AY/fxX553mqq0RPdEjUti2YdB2TUxi9lRzRMJJIVc0A8u+dRB6X4jhloGr5ketFmOMl
	VC2LoxQpqte1PdGxnnvhMKF1MNcz16D7A1UpgokuD27DRyKIUGjFaRchLmF3GsFmDVOjtjJUC3K
	rkOKBiCAkmImHsawCeGGnQ08HGc//t8FAyY+PGn8iBCjSVZ0tWOr2nn3v2Vl074yvkxcg2gvBwg
	pkV+etsOu9XlfhuR+A4TyPi7mnBvLST5ci/hRtCN2vx0IGsiuLOEofqNF4aJf8QkCIvbcpXZvap
	9bA4nP4E3Gzqorjr9Ln+JKohEX8x7XGdSsCEHNT8atddMmPIqikOgRMuMoFiVTXWykbIJfYu3Bi
	SNEdQw+jCgyUV/yfSppkvQNVfHJsQMrrAtw==
X-Received: by 2002:a05:620a:44c4:b0:8ba:5255:107 with SMTP id af79cd13be357-8c52fb2406emr386805685a.18.1768404625675;
        Wed, 14 Jan 2026 07:30:25 -0800 (PST)
X-Received: by 2002:a05:620a:44c4:b0:8ba:5255:107 with SMTP id af79cd13be357-8c52fb2406emr386788385a.18.1768404624120;
        Wed, 14 Jan 2026 07:30:24 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:03 +0100
Subject: [PATCH 02/11] pinctrl: starfive: jh7110-sys: Cleanup header
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
Message-Id: <20260114-pinctrl-cleanup-guard-v1-2-a14572685cd3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=906;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vQTc4Cx1cuzPah8LLXL26kybe/0nRvPEYAbDNlVXaL0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aBbIM2DWPBQNuBnGlAmRqfublmk+ABnSOCP
 +eX7CJ/kqCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2gQAKCRDBN2bmhouD
 13B7D/9HNpUgwKflmRiVEQKiqAHJlihytGsm6xhqvuPk0OXM6g4wK8KWJ7AoXqklkhVGJfLYvjS
 EVoKICEkLULEFDlMFEFKdNqN/uGc1TUwNp5gMcRJRrlIE+ZYvRo4LIknCsvHV1jT9i+Y2L23c3p
 +uDVB8dH2uwJv3IuhJUnA1gGMQM4xpw4ac7NB+UCOk2LnfcACtKncHKQ7jr4vbc3O0f3pfTQpJp
 dZkWVtWxp4BQm+5d1XuZwVzvgj4b/xAJcvhU0BzFKw41RORAakfzsVxAkTHHtP62LHFxnKZSwKi
 E8XvqOwq5O+74OFdv+vHFLcG/6f+rPsNDMLHCxupzCLkx6Pwqg6qJp9qYbsQJCEuj1EJyrotryy
 ANOtROt7QabL1HCVBOeWE7/I1c/PzdUslygkZyhowuMmtTrgMAsawR3fzOXHuQOQhjeKsN9lt/M
 fx0zuszc+shjokj+huAOTlufmrLlWzFxqM4Hu67hEma3ScG2iv485ncOEg87MQQpuFfjrtb+vDK
 ICaUVJAoHNSRifaTDmw6lMDG1ZAAU7vvujZpio8eHVdgOh3jPCnAMmeTePFgqI8N3JIJ+bkQyuz
 2wHidhJCNQckjPlFZ10HKxqor1PXsDvliPHX6i68yW1W61YZ+wIbn5bOmZ0GIDO6/jOlooNoy63
 tkrtX+1GbUIJE4Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: JgldYu-nesPvazweAaPPMlBz0wllswJT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEyOSBTYWx0ZWRfX38Yfpwac1CPk
 aCNmsDB1kytCtKOANkdqdHQcPa1NJo9Xx4GiVbKuTFgjD9bMRQBVx/w3jJyQZ2U7ebvfI7DrafO
 rHNpurPWWW+uj2kWPATLCf0KpSFMK08NrOp0tnf4JV0i5LzsAE+dxb7MkwXYWjfF2ohp2eYGi5J
 A+jHk3EGqN7gMivlDOvYcV268mddOi6UxHBMkc0bGxhVfwE8Vr17SMUoXHXjBtf0rTlGWXWOa/v
 e6QZ3H4m2C10szc5rHTrJqeutRySvHfvbmo0g1E7hH1/RQuSzP1dLdk9/WLrUERVqYlV/dggfFc
 jpLs3KjQVhcTJrOT6ca0nsukj36sLT8jQ2RoetWAo7YvnZR0Q6kiyZYA+AlHLx+89DUZnnD70Jq
 WKrPOsOZR8f9fdLMfxYf9H8bbMzn7YBFTj5gVgH5/daGvd7MWQ+omwp46SPvi1aTKc1g1l7JNh/
 cIkLWwu/sEt2EYfQCbg==
X-Authority-Analysis: v=2.4 cv=Fr0IPmrq c=1 sm=1 tr=0 ts=6967b693 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=b-TtO4hhcUHcL_E8iecA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: JgldYu-nesPvazweAaPPMlBz0wllswJT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140129
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Remove unused includes: no clocks, mutexes and resets.

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


