Return-Path: <openbmc+bounces-1196-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE18D218F1
	for <lists+openbmc@lfdr.de>; Wed, 14 Jan 2026 23:25:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ds0zr2JlNz2xqG;
	Thu, 15 Jan 2026 09:25:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768404628;
	cv=none; b=XtPOHTS62ZugiWX4rgMkwtNz9Mpnkb6aOLFwp5ZkUXjaD+Xs4WQPdc4S2IK+R6fV/+/PkD2xf5duxXlsunK+xhJZ2uO1iVvsq0uS2c+rhGCeSqyL+bD+FPJIDdFjRXgL4s+IZpPHr06ThtnbSFJvFTAkFLFy0aPI5j7fxWJLpaYGK7cjr0nRbzAc4+WC+T77rJBzDZdQoKvEjrW3kQL8eCOBT9siDTcf9wV4/SmCXz7KXjlmbJd37qqD8k4dvfNW/GOabEQYvnqqN2rfw+UHddbHXdJZRUTJ5It8GBpp+lOkUbTBNvwpeDf51s4SUhyaTWclumBwjnwulyOqSmxwbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768404628; c=relaxed/relaxed;
	bh=RTM8QP4WDE86GBG0NkZNuey0Iun+lulG+w2rdXJWnfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hgjnTLpdj9pPL0L43YYksJ8efm7ckzkx91BQoPriInM0Sd94mExALvkILEf1572ErOSdxQkYh//d1zSCf9TEL+b5qzelvZTshp9rRsxdA7zs9Q5l4uVq1oHLzXCk1sL9uO4k1XKXKFAjyIf/hy4CPld1CWA+HEZR7LVhcq/Hw33yAcgrINymrXceEDDFLvk/A8kVVx0/2hq11X8gHgzTkMhoIDfc5tSpdN3NtLWVYOh46FsmcdiGh7V/+17f3IWEqTEJML1Pw+0DZFq47bk5qulSJtGyExrI53iM8vDJ9gzu6MwURBenwejecmakqAZOP+wwhxFlBY4mvjHaFomeQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AzCSBoD9; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CJL8XMVP; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AzCSBoD9;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CJL8XMVP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drqnG5kKYz309C
	for <openbmc@lists.ozlabs.org>; Thu, 15 Jan 2026 02:30:26 +1100 (AEDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EEHAZv2081702
	for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 15:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RTM8QP4WDE86GBG0NkZNuey0Iun+lulG+w2rdXJWnfI=; b=AzCSBoD9J/kAgn5b
	NYPVaY6w6+Qs5o+wVDPdmbCawKNIhRSVPAqH4gl4pai6bAKuHoVYlq7/WKsYLNjB
	KQrB6jYs0vWaY6+W+3SN1noeudRgeyidixzfP+OYATvIPWpHkiBDpg3e23JWTX1p
	4fhGq2IJnlZ5KJqbzP+NLxCB5Fc1xLFL8bw49SWoU1rGDiQ5rHou2y4mHufOcRST
	Ob3AkdvukE7IKJsynwD1ZBbOatQM6y+aklUfu6NiWhUft8INyUsny/4bx+2bR/QX
	ghWJPg8SbaF1jmdhlrH19G4Z/HY6XW41soqrc0WF1wihTWOXPxte9gbGFoCEMnSl
	JSycfQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnu58uyx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 15:30:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b234bae2a7so2469155385a.3
        for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 07:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404624; x=1769009424; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTM8QP4WDE86GBG0NkZNuey0Iun+lulG+w2rdXJWnfI=;
        b=CJL8XMVP8rht0QoTsjFzVoh0aTP8zFqbO/J5Mfc+xAiziL2Jh32ufx28MhAKKpeFYh
         ecgrwr86BvI+F/XQ9NT/vrrYWdftgupo9npvTxW8ncL7GSbK/4YgtPvsWDHOwCkQhuUQ
         aDuuj4QJ5Av9NbZ5FETUYlwbRjWLfgNAQfFy6b5jYvNNILyLMK8/2FU3IlCrri9rO8Kn
         Frkab4vV5n5Y/MLp1JHC2ym2B1Rnfpr4dzrqNjx3QRFRwq9HTiXEg3D9sgYZj1iaXzfa
         /isnvamaARtjRVmXvQDzKMucY6U0Sj3UcW62nrjAOU1cPAvcW0DtrTh3Of1ObAsiuYzg
         WbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404624; x=1769009424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RTM8QP4WDE86GBG0NkZNuey0Iun+lulG+w2rdXJWnfI=;
        b=CLhvzXHc1DAQ00tNMinwjI8Yq85fFNE0LMAVNeU6+xxBp/lUkXNQdcV4nMRSBusUGC
         lOcFK7ira82J6a87CCrHMZ/TSEkm4y35S16e4L9Th/LhOaDx8VssXd1al74nmDVQGbC2
         Cdmg1WObj/mQyR2xQrvlJ49H/KCU/ickM6TLVT4CJOJjJUQMlSSu+NRxTmPQvpc2RIGb
         tLeKAozUlPwGG6lM/UnN3NNcf+JoViTaLaqR43Jj6MWQZNs/mu4Y63foQGzuZ7k58sFN
         7Q3m4kVjJqmhjLa/hg2rIdtsAZz8PPOr683gblRGYOiMbqsnugMPXz9nxe3Kdfgpj+NJ
         0a1g==
X-Forwarded-Encrypted: i=1; AJvYcCXfpQc4Z4f55wpSYulz6vQyvCyRHDEZzBw/pUtamVj75MLMmkG+8zALffYwhueN22GDrYVBjRuc@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyqWZ1u+aE8alFHKDBuaCKaxETNQZ9fGg/oHUsIa19i9TRDbIQw
	3yxUj+XW/yt3VZokTIcaJCzWt36gI5U9gVdJxxeIVjijiRuYcx8cONHlhpGGm7NxlppII8n6avW
	wwfgGTGB5SDudAC5nb//U/FDF5bFaZjg2bi22AWLGI7xh8qidWjO/fLh9L7Q6WA==
X-Gm-Gg: AY/fxX6DLeffDeMSdOX+ul83Wqdk+hLRwwFlRH89tpaTgvIp31z/mJ+x2Az9mz4u9H9
	c/ffHnS1WqTGDOyLFic9fVBe1BYEYnyzQT3FYHCZ3fOsqwt7BlbngIqTJbvoPW0Z97wvG7SgB0l
	zHLL9nE+ZMA41DMsb/Zb5wh1w6jufCYO0xr+vBGaWoqzdLji2AtQkT1qy6v0lZyAwSqrnzm5mz4
	yf2W+LX7+8D6qJoYpbFtKqq6kgT1Tvmx/ozWTbRBGOZsBfZydOkLaP8hhEZ5Bm/Gg6gC34gaAMP
	95VC4jTOkkRRK15COhZ33aZ+nphD3WHpFI42qfiqHdcniqdHjXcOg3m4pso6JaoMYl/PIVoWX5f
	HAe3CcL+1Polb60ofjFHDmQsRWQZtnummhQ==
X-Received: by 2002:a05:620a:2556:b0:8b2:d72d:e41b with SMTP id af79cd13be357-8c52fbdd3aamr433297685a.44.1768404622694;
        Wed, 14 Jan 2026 07:30:22 -0800 (PST)
X-Received: by 2002:a05:620a:2556:b0:8b2:d72d:e41b with SMTP id af79cd13be357-8c52fbdd3aamr433288585a.44.1768404622116;
        Wed, 14 Jan 2026 07:30:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:02 +0100
Subject: [PATCH 01/11] pinctrl: aspeed: Cleanup header includes
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
Message-Id: <20260114-pinctrl-cleanup-guard-v1-1-a14572685cd3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2516;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BOg98/1JJXf+vGTTUwHW2mMQjVbfd13nI6bPXirGFB4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aA2bajX7HJFoPmqSFCGOiGBqLJt6NM8LzAd
 XAIqmeyi3uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2gAAKCRDBN2bmhouD
 1zSHD/97RdnKd17RjQ4GZXnl1GK1sM4fAIbv/Er4l/nCYrCsRStOmpsNfQQNQ7KbiFIy6ka6EQQ
 RmCybnj6DI01+PJ7LKfZjIhsVOdQRCKSSRsSOzZ2sWtH7UtF7Qco6eaNduwhfUDaSknYVE8yIKS
 q89qtgMa00kGUI0EqHfiZ8qCSnSWxZL+xPFwD+VaK2PMANj3eijWok9TKqlbKkGTmMKho7c3WOD
 kkTSfcVXpAaccbQNmgEAkCUer3aTG6Z0QKWdyinivpOZRSpzni6zy3iZTvH5qnQ5okqQ8+u1yVL
 ZcUZ45bRE9Lxm2YaqTb/8FMSOpMAAXKgnB8X6QA+InLQGRJSNoaNEwmu6nNF/vR2K8ztj6axVXY
 0vmcCDYOnJbcX5YBUAIDooVFlUG0XDfrGrUzdObWOPhSE4k/LWR6KvxxHSM13yiEttuiUh5j5Wc
 uyOWQQHPn+CHVSxzd/HqrsGACkpKblq5HaElBupSYgsEcP/sLU1GEEwHHqCpdn+EPpwcITg6hft
 gzyvN7ZCzN1S8gDsA7ykKbGnB5dKBWHADzwQtqQEP8YvZiOnvQuPH0X2k8Vbd6e0GSxIUydR1xh
 u9u70zyMvvsb2RcwG5zaIi3AprWfNihRSpPswPd5WpF2M6sS9zQbZzeHDly67NBW2wG1jPitQdo
 U7H9zvpSdKlaUmA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEzMCBTYWx0ZWRfX6CiqNYn5rQZK
 YALrqxcpTPRlpx35JeYLKJClXvgJON7ckGjuYDRe3Cd07EZzkrF4bxajkrJTuhRaR0jqv/DndNs
 RTt/xlIxPEROUMEvrQZp1oL9IfBao+MOCGOA0VhOoiNSmqfDkqY+vJEyyCqZlEAWaoAT3PNivT+
 VAZpVKuwsO8yo9yI5LTHHi8M8krf/hcLgLcTSLu2ZF2qHD7WnzHlfcoR1kGLVr5rmy/SQAj/xWn
 ui28XoKFXgs3SiMW+L1l0jbTP8gfviA3Mo5zjGrpwJ3bAEbFxHwS1pWUUGD23MrcpRTZ125K+F/
 QCVH13raGule7ienSaF86iu4cLVC/ijoEuN+tTGBfmoG8+FGirBXahJGkVQwvfZzS/iM4M0TLlV
 +radSA+Ybucsj3BIBnXXeiwG10q7A22b0qLi5cwCaxe46B7+R5+Vor9lFFYIIw7660s+NTR8DQv
 MQs7MHLpfBmtOYsm7qw==
X-Authority-Analysis: v=2.4 cv=BZnVE7t2 c=1 sm=1 tr=0 ts=6967b690 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KvQaFmux51imLjMCrhIA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: a-A-ovXvHW5iyBGBzxVBms4unlsNnkjy
X-Proofpoint-GUID: a-A-ovXvHW5iyBGBzxVBms4unlsNnkjy
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

Remove unused includes (no mutexes, string functions, no OF functions)
and bring directly used mod_devicetable.h (previously pulled via of.h).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 4 +---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 3 +--
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 5 +----
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
index cb295856dda1..f9d8fb1ab1ec 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
@@ -6,14 +6,12 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
-#include <linux/mutex.h>
-#include <linux/of.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
-#include <linux/string.h>
 #include <linux/types.h>
 
 #include "../core.h"
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 792089628362..9934ef6205d6 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -7,14 +7,13 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
-#include <linux/mutex.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
-#include <linux/string.h>
 #include <linux/types.h>
 
 #include "../core.h"
diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index b0c7e4f6df9c..8cf61aab81b1 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -4,13 +4,10 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
-#include <linux/mfd/syscon.h>
-#include <linux/mutex.h>
-#include <linux/of.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
-#include <linux/string.h>
 #include <linux/types.h>
 
 #include "../core.h"

-- 
2.51.0


