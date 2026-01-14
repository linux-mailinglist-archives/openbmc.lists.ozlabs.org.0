Return-Path: <openbmc+bounces-1193-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCEED218D0
	for <lists+openbmc@lfdr.de>; Wed, 14 Jan 2026 23:23:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ds0xP4ytFz3bf8;
	Thu, 15 Jan 2026 09:23:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768404640;
	cv=none; b=nS8YFGq1qtOGTRTNQtRO1x6XlNn+GZocvDuXIkWME4dB5sKwSaHqn67UdISDcpC/nG4RoKCIT/oDJeKweI0q9OCevWo3qOvJ1TUt9RtQPVx/f8nbonW7AkfNa3dc4VGOkKBpwTBpIjulAjO1+LQyX2R9IU4LGV3JDmb4uO6vOcrf7xE0tRd1mbRJHlA9VaWgfa9Swk6qT3DjSwDFKxVdO3dmjcesGpzqHqBCKXbPtKVHMHTg116WcTDEuAmIDPmQVsM740t7MPYkTRjunkH6xm4AXdvBfz4QIb1DMBTFmFAokhHp+QcPJPSq6PtWMA5t2iTKajSbI126gk71HKUAsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768404640; c=relaxed/relaxed;
	bh=ssy8kvmbkidBSVa4bIF/Sg6F1PMs1iwvsiG9/WVtcJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X4aDD7xL8YpnhgvI6OURVY1t+cChEkM3lp+0TxFQj7RthXQstJWLO8agqW/sgp5AWKg/GpPdilWwH+/wUtAUixRi4dqpGu4GS03STcAu/KkNUIBEIjBVDc0iCvYU1T1RHda8Ps4Q3Xen8Ll7JGQ+b2ss1QfSJ+rb4y3lqJV/FGvxLtYQ0/8YXZ1VcGayWI/LNkXkg2AiZoG7axyboHZcFkrfu76KKz+lNg0jT1P/aUx4pT56u5FYw0FuNJAPYeFmtsK5Qs9puD2g1J9qKB8x1cU2YXVTcdPLoV8wprTiVP+nqdked3BJbCOJdqJguEV6zI5mDRIIQpsIBqYMZ91DQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kk8JIzgW; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FkkTufiL; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kk8JIzgW;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FkkTufiL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drqnW3TZYz2xYk
	for <openbmc@lists.ozlabs.org>; Thu, 15 Jan 2026 02:30:39 +1100 (AEDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EA4uSO2902726
	for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 15:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssy8kvmbkidBSVa4bIF/Sg6F1PMs1iwvsiG9/WVtcJY=; b=kk8JIzgWD/bAHEgM
	0ls96MNXXtEja6QlnGHg+sHWfdxg9wDNaEzJfvyQq5xMnTuFWVseT9s6RLHdO5L9
	fiiRlWgh/YHepJkNkuC0AnfkwGL0Ld6YutVOHruXFFvt2zdl1KPFXN2Cdk+9raEf
	zVwyi4HdbYB1Qm3iEm8EXAmNAB5eexz3+aKnzn6LtAne6tKxrKfpmd2Pdf1s2JA6
	PGnyZKWvZl78FlUvryh6W208cUEVgEwxQtAzboLq6Fvy6bXHKAL+r7R4mbLDWzH6
	KQ/pTMq+l2VkT7Uu6Vm/oLuuz9ef9Gr2BrJAtjOSQ6YQeOgumZ7CN3XyCY0Zv1ZS
	hqsjxw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp931h2bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 15:30:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ba026720eeso938046985a.1
        for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 07:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404637; x=1769009437; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ssy8kvmbkidBSVa4bIF/Sg6F1PMs1iwvsiG9/WVtcJY=;
        b=FkkTufiL6aaaKJDHucNWq/PsJVgJiYXksj79AB3sWzwYyEUvMTk8ybYf3cHBEO/Glu
         Rg/y0eiVwlZJqN/xitUdAGG0LJAgHmRa1JCuDDDge9FVK/mg2SwQZ883r/2Pcl4mKIby
         +6dGDqCSA0/HwHd2GMRYjaPCjo0EEBx7ZEs47nyAg5tuma457yzRhV1BbvDOj5tn3u4W
         C5OuOGtwIWa8ZRVvYNHgfENuTUAXcvfl0lMs+T1fJIupZkvM3BPUZjAHBtsdbbERp2o7
         mXaFAPRjEm5WieEk3C3VLbUOkrgfmEVmiLq4czY5Cos5EcwmDusEU2c47250sbEp5Es9
         woew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404637; x=1769009437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ssy8kvmbkidBSVa4bIF/Sg6F1PMs1iwvsiG9/WVtcJY=;
        b=jh7RVMdVsDd5sWKHsnzZTU/0h0GYGtW7eiTcEEloPmqmpz7AuvBnRckNgsSfdYPd6D
         UZrmWX6RMrXfRD5FWs912mPESBMP9a5geKDwlZ35e5Z4CxmyGBOfRlwSa7xuNEURJUYZ
         /v3kqa42l2domk4DpCL70m4FiTONqrtfKPSGf9WMymnv9wMJXHcHqSfrQLaf41rFbD66
         XQj7i3gXgHflNsjXHr8SePwK0RPxb/4SOs7efIblGfxV643dn6LQF7sUew9EmwJ3YLMR
         7L4/aV2eGjGmJlhcxOXXh/RD5jYAqDNQxxtruxwhYMUup+2HLRjC/wCMdP8xZEzJnXHO
         j0Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWPKbftgED3xC0JScdJdMRFNqXEY2RC97QLR1IbV+SIk/ByGG8dAEE0GA+gCjqiUIQ19ba16lZs@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwYyg6KTQ7RD5apTMWkwd2B3+dCPeSAOUukKpWU2o8nWmuaHrlT
	4XE+txwMLZX6r8iD6YI2BxEjnUs9GzNC01dg0UzwRc+GyJ+3JA32OuumYoSm5lvrJKiMQ+j1TIV
	XX1VoPtAqwnEJY+LImy9CgvUbmkUUJF4Xzb+oEm2qFCmD3Hs/YTwni87ujFJMsw==
X-Gm-Gg: AY/fxX6YM4MP4qkOF4xLzZcX6h/RMgS/W2TsxtbVmFJ3yrsbTLLDRpmBu9rxGpopV1m
	cA19VMOsXIzz6lNCaBp9e/WLio9b9N1aOxowgZd2INYt8O6CMeT9+4S+Yqj9DMm1fhrXrqQJHzL
	u0kTyFK7/etdxACy1PZ0awddiErKdRvWo2lozR1s2WhpjmVWrvliTBd5xx7Rh6ACax2QV882cl6
	fALT2BJED2Y/22EQ38hEb2p50+wqn4ZFg2v5XryvFDGcLubD90frbv5tR8ripeWdX3hp0LJykav
	Gt2LKNQ8o9skVjHi/wMG06TnHyjVdvOyQzg8f/Zch+7v7GT4cYuML8mHCJU1hQop7PqIp4pOmKd
	OC8TobL/mbxLZcnWM4E2qf6mwjxwIwTD4Ig==
X-Received: by 2002:a05:620a:4549:b0:8b2:db27:4268 with SMTP id af79cd13be357-8c5317f0aaamr303447685a.53.1768404636609;
        Wed, 14 Jan 2026 07:30:36 -0800 (PST)
X-Received: by 2002:a05:620a:4549:b0:8b2:db27:4268 with SMTP id af79cd13be357-8c5317f0aaamr303432485a.53.1768404635555;
        Wed, 14 Jan 2026 07:30:35 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:34 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:09 +0100
Subject: [PATCH 08/11] pinctrl: tegra-xusb: Return void in padctl
 enable/disable functions
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
Message-Id: <20260114-pinctrl-cleanup-guard-v1-8-a14572685cd3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1889;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zRGKe5UJ9yNFcA3nCyV2yle+pcJ0o698KmnQ7j+oxLg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aG1jDmkP4a6PmHCk7jxdg6pIwc6m3a2BsZu
 jfRoWqEDhyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2hgAKCRDBN2bmhouD
 18PUEACGRm9HFTgK/BMYNlKpt3lPmWT9bCXtaAiUNJGcB6ffgJheT+i457oOaT/xTx1LOOiYEau
 UWjdo7vnfye/rqPz8xYcdQr+go81raUQ3IhBxe+LqfaMunA9y3Q+s3QbktSC3PldiTWJyw6MXBt
 uq+YFH0Vtnkbp8TC6c1687wMzaJsm5xlKxC6x3Sfmws6HwZXhBuTB4Hi0wT0my3LoS8gJTHQTNq
 +qkjU0hLXmrpN6ibgVT1FxGuHDuDSNeVSEIHmrFSXVlPBywSQGm5gVuLyiQCtiarsEhPhlP1a06
 OD9Hmdkv9AZLGDb+Nyi9BewRwnASnSvswYKtqIMj+lA+fj+BdCmRx1CeX2CIRINVcIZXzU4+VMe
 uKlw9dXawo9KJHktVbqmjTBM/mP3CqYpYoLKJ/Z266veUYfVXw8zFBpEdU0xSOqRlekxTnkGZEN
 dOEKquxcczR8jUIAagMutrlY6GtaQG8YcU5pIdWXfU7Mmly/s9fuJlOFKiCuv78MnGkL2CIwOxF
 saww7DthM71jMUAZ8mCReBzVQOz3GSqWUmdqg2hOkdn6kGEQgkbdIeWBCfvFxgKmUJOw6Jx3QkV
 ceyz1gCkgjID4vnUSP0ziWiUhEXkrHazIzGuYyBPUGmzvaZk1w/COGY+KgPKeu7arJ/qiUw/2Iy
 P4nTGG0eFE6fjiA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=BOW+bVQG c=1 sm=1 tr=0 ts=6967b69d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Ed5BEzkqmhObfCaRRI0A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: pl2cC89utpZzR9SmAPPTJAOh3zJlc_o2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEyOSBTYWx0ZWRfX063ah2RmMUW1
 PWG+XmvZcm9qRR0CqC5/n7y/GxW0u2/fMDriMUtB7kS40bJtPoixmV0aUinpeftUm76vG0dTVcz
 r6BLvERCIzcwq0RPYkZUciVVKeooKZ5KXSX4vsFt1lUZnB6LoYb7euiFVtNQgIbhvsjdijUe9mh
 8tFoPNu3gOSLPQZYOsOiIcFh396devXSd5oDBM/RLmF6RJ+11owaDWhdfiJb9sa3/vprJ+qexIA
 HufwckJrD7RKIAHJrmBMm9a4Dd4vtPW4N4Yr5l2cjVZndWGofVGFBwzsq7mJU44Wm0ve0iucPkB
 N4xAyalfWUoTiZLB85hD0TG0sxFGk0KYup78KbbvHuGDf0pSEg5nCZlMhbC6U1s9vbdOhrB9kRJ
 j33lO5hQUUt3G85OD+ZVzwdn86VaMUOtqCrqQlpQYST//p4zxC2R/SITMLk+vOYwb8XkbW181OE
 tdPEYrtMQz+pXuXKNsA==
X-Proofpoint-GUID: pl2cC89utpZzR9SmAPPTJAOh3zJlc_o2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140129
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Make the padctl functions a bit simpler by returning void instead of
always '0'.  The callers - phy init/exit - still need to return 0, but
these are smaller function without if/branching.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
index 49c5edeba87f..34a373f7e04d 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
@@ -474,7 +474,7 @@ static const struct pinconf_ops tegra_xusb_padctl_pinconf_ops = {
 #endif
 };
 
-static int tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
+static void tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
 {
 	u32 value;
 
@@ -501,10 +501,9 @@ static int tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
 
 out:
 	mutex_unlock(&padctl->lock);
-	return 0;
 }
 
-static int tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
+static void tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
 {
 	u32 value;
 
@@ -534,21 +533,24 @@ static int tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
 
 out:
 	mutex_unlock(&padctl->lock);
-	return 0;
 }
 
 static int tegra_xusb_phy_init(struct phy *phy)
 {
 	struct tegra_xusb_padctl *padctl = phy_get_drvdata(phy);
 
-	return tegra_xusb_padctl_enable(padctl);
+	tegra_xusb_padctl_enable(padctl);
+
+	return 0;
 }
 
 static int tegra_xusb_phy_exit(struct phy *phy)
 {
 	struct tegra_xusb_padctl *padctl = phy_get_drvdata(phy);
 
-	return tegra_xusb_padctl_disable(padctl);
+	tegra_xusb_padctl_disable(padctl);
+
+	return 0;
 }
 
 static int pcie_phy_power_on(struct phy *phy)

-- 
2.51.0


