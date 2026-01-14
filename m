Return-Path: <openbmc+bounces-1205-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66660D21951
	for <lists+openbmc@lfdr.de>; Wed, 14 Jan 2026 23:32:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ds16v1Gltz3bhq;
	Thu, 15 Jan 2026 09:31:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768404631;
	cv=none; b=UP5d/CLK4IgoNl76WlXxSrsJVT47GhMMSwHczy6hUtRB1XRS8xqYA2HHHpR7xI91hMJ1QJibD//bUuHTULuqTqwzx2Mhr6n7ZvRNUr8lW0KWeRDxBLhWY/0KIOIY+3HQzqv80ch5hzJvtgg0WH4AxpgzVpwdLKRH7VRtCk4vf31qZ/HfAzEMbptoYooR7T97FG3/+84thRv49DZZfm/M1Rz62Zwp0BXJYyfXcjsS17BHAVj2JeOsZlfa3V3mE+sCXR0llgBhytU9jVi/63yA7yW98RFJthii896swoCkXjhz/aKTTid3w95up9SVj+4Ep4pN2hoazijxy6aKGXeZcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768404631; c=relaxed/relaxed;
	bh=Mv0nQD2Fz+xmN887PWY6S7g+L/xnSZWABnal0geai9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QmXAKBAtZwQeefyUqf5Nns747lKxKj3eSn+sg1Sak2N77opUZGf9hP3Mj7C9gx35Of01KOOCAAkwKKXlrbgfVN2MdFrvk8XSoCCu3UyUl3QbunHZrVs0Bj+C3K6hVcksKs6JxtuZxzgaf1mmebeigl1Rsb/EDkhdg5niRfDLdmFpcQclowVO2ZHvgA30cmY+r/1PZ1yRH5RER0DRp8fO306/EV4MrUrMY4n0m5kqWqEcLSSDGiKuCYF6RC5wQZ5gxKfoDjiIvMyqcCwPvflmJn32VCurt+7/Y9MWa70jGQ07MBmx5t0GIYin/3hIkLKHp7sm4IAlAEj3fdxdGnjzxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ja6yf+55; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Du97iaHw; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ja6yf+55;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Du97iaHw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drqnM0qvJz309H
	for <openbmc@lists.ozlabs.org>; Thu, 15 Jan 2026 02:30:30 +1100 (AEDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EF45BS1943025
	for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 15:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mv0nQD2Fz+xmN887PWY6S7g+L/xnSZWABnal0geai9Y=; b=Ja6yf+55fHq9cr9+
	3BmQxbt5bpN7SHtBWVenCY2tSp/rN7yEiuQCqdkiBXi67+06a/9pLEqUAeXLTdNc
	a1grs8LrblCreo1vw7SXp2xl5M9w4EIMROi0sTqscq5x2HqimEYP+t9LG7NSfIN0
	oW0mJSmKZfsrffOl10LCS9I+c68oIPg6PMdbu9NWlAbfYeIljtZ5LwgkSSYHwo0I
	3JOnKWXYOoVsAlspcsRJg5tELpY5u/wJniUo+jZfwG6wj8mYx63YcXGrOMDwboK7
	SOhO1+6gPKgS8ghvVXEQWk1ZVwZqbf1Hap0Q/5oJrgreJR5QtLCL1pFJaKpiTSIP
	2G8J/Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp7b6sjq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 15:30:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-890587d4e87so221011146d6.0
        for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 07:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404628; x=1769009428; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mv0nQD2Fz+xmN887PWY6S7g+L/xnSZWABnal0geai9Y=;
        b=Du97iaHwAUUkXPbJ/q/W8woHuE40mjzL5lz67VYp3qK7gqGHjovjB8RltACKQL/xCS
         B9Vq4yAJQFo4pXbApSCRWgX8DCWr/4N1yXNiACzJD+mZcOnfl+Xo4Wa5UkB7p+dQEaNO
         t+2HySRLTroP0xvxjr9fjr/vy7nthFcSgaUZqmLRm0fhLgPICu/ehmPo2WddBgsDJvAe
         JOMdrrL+vCxGOiL/fVzU5muMsKKGsBEoWlf/C4IXmf/C/gA+sMNoJVX3tDL7vp8AN5R/
         yS3/X6V9simbKS3A85wLlLjNrjrjJCp10RP+Y2qOdgxnQnKuXkf/C2vatMzLNqsfXpV2
         trzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404628; x=1769009428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mv0nQD2Fz+xmN887PWY6S7g+L/xnSZWABnal0geai9Y=;
        b=sScYnzF+cnIj5n4msiri1XmjVz1bdc1/CCSOUwZMp7WU+jAeWdlFYHF0fZ587aXm4b
         fnnzQ/5zLsnpzHLlGlRid6Mzku5iVLa/aMGIA99gSxY4U9H0qrIX9MtbK370O8XlzB5j
         sw8cfE+JdqTA10htIV6L5aGQeO4Wp9FpnOFqCU/hxDWVD5Lt7K9bb05xdF4OQQR1yun4
         H3sktnk7R7iOtCV+Zj6NgLaja53cHMXCWll6xyIdVKnPgmE6zJq+wr2pffDfWsDrir8r
         9qeKdrr7VOaS4p1BSPwwutINMIgqrwOvAoypXDIDYNWkDLVoWbdg3QiwEYkb3jB5xs6e
         ZaKw==
X-Forwarded-Encrypted: i=1; AJvYcCUlXXbTbN8lsHPt3dUW3jRSG77ktQqm0CLSVdVHLmBPAzTyBUPMe6WxFqNtB4esqxQ0XoC22MBJ@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyshEwaBFSr0QVsyrrUdNN8K4YmmW0q894fFSItUz8mvuPAu28B
	TE8h3FoJNz5Pgrw3T/5kM0hsLhcBi72XzGSQeAU9TVTxLEXI1qApvPjyE08sRFHKmCwDohdVXXr
	+rpJNdTUdHmq+DA8MtIRBxSutv7TivTaCUXVTEYaSE1rgClsRjLSt6owzf8wZXQ==
X-Gm-Gg: AY/fxX6kGXmZNgt/is4hyeNWtlJOlZwENJPOPp0ZVqmyubEXt9j4Zo6XQQi8Nb7MbQs
	8FT4Flm1PeQGXG9L6tBz4QnQCQ4YyeCHcXYAB+4eCkPMG0Z39WcVLORWhiWQumR90DJ1e3X1XI9
	TfgcXQIQXxmbwVobsm94Z5DFbMi6+/c1kRVXXLjBjTBnT/SfdSGD9Bz+8jHOUxgmg5XwQlstyqr
	GRSvmsBJwGyABSW2hZmkYm9Qqzbcrjk7xtxQ1QiyV06kawTXoAd9rJf9Spnv5Xj2i0j0cfudXyB
	qAfuQN2KxlLSjffx7jeZe/w4bueGXIr6LYZu8jYn3tlbN3xqgEv/67ExhhXS2tfcCFFh3QnWQGz
	rdDZM/4ZMxKtmoMYXMJt3V3Vd3OE+p1z8Gg==
X-Received: by 2002:a05:620a:4443:b0:8c5:2dbc:6244 with SMTP id af79cd13be357-8c52fbcf013mr422898085a.47.1768404628288;
        Wed, 14 Jan 2026 07:30:28 -0800 (PST)
X-Received: by 2002:a05:620a:4443:b0:8c5:2dbc:6244 with SMTP id af79cd13be357-8c52fbcf013mr422891285a.47.1768404627841;
        Wed, 14 Jan 2026 07:30:27 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:05 +0100
Subject: [PATCH 04/11] pinctrl: amd: Cleanup header includes
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
Message-Id: <20260114-pinctrl-cleanup-guard-v1-4-a14572685cd3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KS2A41254/IzptP8+yKUiwH8wnfKT/gY+cirH/V2Wao=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aDV+noj7ZcYLzGFw85urth6DKCl65+zERGB
 6whzCjLMW2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2gwAKCRDBN2bmhouD
 13ELD/9w2SYmYalYA5vFc6Rf1PTVYZ4B1dYRonz1b2DQNyOu2VbPve8mcP3qP5S8Lunlmu9pnM9
 XxA6ShVzZzR8X9u1+aHI18FkeFftaZO1X/ipHiRgWYmwxHee50F43GoRYkUKtL5EeGs+pgVFtvS
 N35v5ZOaS4dRcJ97oRggrrqF3+rewugdNfcOjABy9z+5McTb/al3fNFk7obz1H3xjL77Jo3RQcb
 jKwvKaJYn+puhraiSHisoI1Q8H0GnWywr6Yq12zvOzY10VAU828u15UF1rvvfdSZBMNoDaZN8YR
 MY/C4aYFC0Y84PtJu62kmJ4n4v4JBd/PrIYVnOSEvIoAZkqMo4it79WoNtuEoNx+OhSQ0P0+FTw
 ncPMJVQ0RwPTjUhmgU+Siqc1uuFokQOIgc8sWxA187rXXifisB8e0Qz8cofr4vT2YdFLTDQlTtb
 DsVJhtQvL20afD8ktEE3e9SBn/kC2U5XBha9yUQiLszF7/SkefUvWkoLphBJoHJQesPlcSGwLES
 8ZjODkLNTik+YIzT+y6r9oBPDa+Ft1z/sPRZtZpjZCeGeSqLeOkBl2iH5kgzmgSjGANsVseb/1k
 xn+gb1RtR8rDo4/67L+lt6mr4ki4euFWZMFfg8c6VM8c7ZQonmBPCX9sGdbGnfFG3z8Loh8tgWe
 NlXvgC6SiJVTR6A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: QAhmzOFAWxEB4VhmXliOAvgaYaK55p4v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEyOSBTYWx0ZWRfX3YolIWQRmuTx
 QqiXlS8lhZjs+1WwWQTqyrLQ8jTzv1K08EjVMUluplL6EhhUPHQVHkkr0mg4RTeCTFQkL+3nK/J
 EcYMEOlKvhHMN4c68Og81Tlml5T/gcvFrAl2U2UKlghIcVAanPc3a7yX0bO0zQMe0I0XaILWE3N
 8ls6b2L6jTrUWYi/BakYp0xtAthSMDiN/gjPcc7W6QUgVjTYmvl9Gz0tkUvM7wKBh6LbBDcH7vx
 KGON3WBraSZvz/anKO9eDbPNuLBugp/NB4uc5M0CK4SskuwylKPq5NdECWdzZIyIfCmoCbdf176
 bXS/mrF8upn2/nEgj+16NptUfmhdKfKC7YTBIflAY0DivDCSyNXafAvabwLXF9hD13CDoav7xZx
 4zv1qOuFfNSM9CJmirAWNJr81wSpbeUJ0oDiBo4TQzx6PDurNOwV+oyUYJ6VSH67NUOYLgp7rVx
 81OC6BHZYLpyvEIX9mw==
X-Authority-Analysis: v=2.4 cv=W+w1lBWk c=1 sm=1 tr=0 ts=6967b694 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=tMXyHTyi87mTYQFNLaMA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: QAhmzOFAWxEB4VhmXliOAvgaYaK55p4v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140129
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
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


