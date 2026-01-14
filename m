Return-Path: <openbmc+bounces-1195-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51253D218E2
	for <lists+openbmc@lfdr.de>; Wed, 14 Jan 2026 23:24:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ds0yg60vZz2xpt;
	Thu, 15 Jan 2026 09:24:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768404636;
	cv=none; b=DikXs05SKsXeCNeVg2Fsza9DL96Ohsfa9ap97RCLZ/5rLBeZ5hULJu6yg8pDrXUn1J5PzO6mhPCIJ0Bb9mR1EAwb8pJCmHbEaXkbCaa4uuOIOME2TQ/Xeg3ByPfwN577LDeTeJT9SPoB9enaN6NLBiICTeGAvVjohbIgERlzgTumXjh9c+UET4Z+5rksKxkMXGV4zi+yt/Q8kU0HJPqVIvQ0qN4Bbrbva/k7+X4oib6nOsqy2FR59f1Xxsdtyqm0Z7zgA+9/IJhDo5afB+XmqkJtrrW3mAURJy0SICp+NTrIG9Q5kHU8oCKwJGoGP+e+MfDvFS5C2L9EICCvGUmUug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768404636; c=relaxed/relaxed;
	bh=N8rDVtwaqFFOKGAdA8c98jUQvXsuqYrjM/OKm05D9ak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eJ+ihHl99DSCFxYEc3ay0EjD4A7SZYZZgZO2a9t3zS3fZ9TUUOLRAe35iIvj2wQq4SsMc2D08lDfLtqo1Bv1i4zaB4lyCuJ7M//xrVeofVBY7OEriK8i9sSrDe6Zftdyy63znux6cIbaU+XQudfUOW8qFsZuV1rRVydUb8V8i1LEdyxEUawM2Fi9YKUZczD43HhU8BuY6AxeA1OHodCfTlHAqs/TR/TtsoQab3PqxvewjYs2nPNl1hmuyQweaDz2xfK2M04fHqU41MnRpkxFAeeZWg6SvKI2pQjpO+3KYXw/s0eBGNyokqP3gDAVf4XMZ9ut+CVB0UQ+pBVPJkhfdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HcXKAq+n; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F4tqRMhz; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HcXKAq+n;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F4tqRMhz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drqnS1hgrz2xNg
	for <openbmc@lists.ozlabs.org>; Thu, 15 Jan 2026 02:30:36 +1100 (AEDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EDV2453551509
	for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 15:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N8rDVtwaqFFOKGAdA8c98jUQvXsuqYrjM/OKm05D9ak=; b=HcXKAq+nTSgWrzSK
	w1a4GoUXM/XuGU5b7mwyhHaftes3dWz2FIYh0ZaE3kTLg6bSA5zLrYkRq0l7d56I
	Zm46EvXyUcb4YHxT4q3XQ2xwvlv169s2XhxgxhrLV9wGHbn/acVHWUrKL9WeiN34
	oxI+nkOmlEgGJ40GzzFOPwIfQ1plkTis7W6XEwSy+BEcDfNNCKZeJK6ntJDy2gJT
	7cNvU/N9ASdtjEEo+ywOMZabQlMvmsZWBwHPkVfHcbdvH7QZIMXscPa1ebEWAwza
	qmm4xfI7i4asmD1X0oDozzuRdnBuTqOGzH+RTAb0dKUgJPvntm6VZtTm/Ycu5NDd
	OjjOJQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpc3jrd4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 15:30:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52d3be24cso190123985a.0
        for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 07:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404633; x=1769009433; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8rDVtwaqFFOKGAdA8c98jUQvXsuqYrjM/OKm05D9ak=;
        b=F4tqRMhz7rxoCL86bd71jRjuGLTETK1A1zqDQDzMPuZ8UNSJCKJlZRutX9Dxo7jB9y
         Wc3Ex4pL+APXuKJpDLFhHL0JKY8z+8a1iyfDwayWJdHGOkHVmxaGlt3UJOIAqjEt8WjV
         Y7F6DXJSu7re1n9PRe3bgi90TII+n+HEC5ctd3nv5rMaoHpulsNLKYfl6/oJ07mfLmcu
         BlVIRgCxnn1XwB6bEjLgPzLC5keb4Cz6Qwqwj9RfCooE23XmpthSmq18wPrUtE5alunw
         vJDuI2QLekxdoIQph062DaL+QnBXwBX0SwbzqH1/gKISV2FeER/xgHao4C519YMXGGcj
         zFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404633; x=1769009433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N8rDVtwaqFFOKGAdA8c98jUQvXsuqYrjM/OKm05D9ak=;
        b=LQfcBt16SHK7GyrjJ8wahXN2CgiWUa8SguhXWVhBoRny6mxYJ/WY4DVqWOUJTX7xzT
         E1a82FjYYuZEYVaunJYfHnhfhp1jQyaUOiHTmW3llA6dn6fLJR7pUM9VMLMpClo67K6g
         Rp0flJAiGJtMjYRxB/y1BVaa6JlF7D1QmQ4BD9Wb0MTFEJpMu8gNnRJXKDd9DKsxXk1H
         vXEhZkNLk7XUIGJWc/chgGsasFa42NBH+wKc+zXc0189oupio21j2sFt1EAsMKaqr9q6
         C0WzJ/WniJYKzVdDY0xpCQ28wnt4HB+TOUJ3um1sFgGIP5i3DLJXXtlnwB2xCfO0g1s1
         GDug==
X-Forwarded-Encrypted: i=1; AJvYcCXI0AS2DZAXzwJwJTbWGqaM3mgnawM5GxqhrkEnOoDeIv7x6z24TX/WPfSgqWFX+1n8k9hLg8s4@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx2NH4VoS2IThpDqS2253UmucvvpkSPLR8sy7W3qLPUdSYs9EO9
	z0reAOoOhsTkAZpyYGH6wHh++koKYCreGRicFkxXKMRCmF1W8lO5yn6RyBWs9W/HoTSAiFz5TtJ
	QzqC5ceXYJ5YNYmSm2WlR3UM3ff6nXd+ZIN/Tm8N09dOVNajqyXxPIV84ql4tTA==
X-Gm-Gg: AY/fxX7g8h8i17jp1OxCtid3oB+gwIulhq4SKOl9n5/ZS9E6W1tNOzItzVnpJTIwixY
	pjx9rsuRfqCZILrSbgyQwf+T18YtY69nWHRZ2AkA+ODT3dv+VE+sKhoGlZn7D7ETSozhRQW8dT2
	VeqOYisx38DedIn0kHJ0xtZTwQClF6RT+RBWwOeQEpQqv3golLxziixA0O1WP9Zkm5F9obKy2fc
	kWGur7sPCAN7WAHSHWVAHL++gTxhXLWJuqDqKZ2q4cX4CyABAv5glGlCIhMr2+qdK14Pukg5r9I
	1WJux0l8jvqHFHWDxxVFX3Y6qbcs4MMaRTVBz2up9w1e1O3T5YutIQm6PDNmtjCXhrB5tmWKB1+
	2cCBLOzGj4qW39sg0eibvVyW2hLr4hBXlkg==
X-Received: by 2002:a05:620a:46a6:b0:8c5:2ce6:dc9 with SMTP id af79cd13be357-8c52fb4f058mr411705685a.23.1768404632250;
        Wed, 14 Jan 2026 07:30:32 -0800 (PST)
X-Received: by 2002:a05:620a:46a6:b0:8c5:2ce6:dc9 with SMTP id af79cd13be357-8c52fb4f058mr411698485a.23.1768404631550;
        Wed, 14 Jan 2026 07:30:31 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:07 +0100
Subject: [PATCH 06/11] pinctrl: microchip-sgpio: Simplify locking with
 guard()
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
Message-Id: <20260114-pinctrl-cleanup-guard-v1-6-a14572685cd3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7TcfQldnwsgDeNj9THUL7ZJpvo8wBH6EB0ftex+EuCs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aFcSlR3KaVGiIyNYG8oZHo4izzrC/c7v2QI
 ELyljV0aeOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2hQAKCRDBN2bmhouD
 1/c+D/9JCP7uMMFoU+h75eykrt0KHmHUnHV3rqtg3g7Ut1d2/As83e5bk85vikvVmZM/NczFXe7
 tQxswgbhKLPilQU4gCP3Ga6silueQpxzqiLbJaccYmtFmcy4rr0I3ATIJuzeZ+xjLqKsMvlDsBN
 5CciXjKG5O5Br5wwG9eSTc/INEM73B0rn+881EzVNAJtEBSP1fNhWwkx5nIiBvGhEp49M99L5nS
 Bxm1JS8AA76I0eJm+s3lVShXx6sccqHmnDTkkB6m8kAdFeJ7lqn0UpVpX6q93orxxxwlAPeVs92
 gp4l4zUpAWVSv5rvRJCGzn3CRbKUXlJ+XXT3EVZsRL4mvrX4OY18izt1M0rKQ2jLVDxHs7pKBKF
 WZMNHrrcyTlCIQ7WSfVzTKuXZaeUtqQezfcYz4QJu73AoUPusr4JilaxDmzkvLOvxaeGWx1aQA3
 XxTSCpYcLEW+07K8mVmDNCtsc3UUybPPwSxVRYBMSHfr0R/Yq+w13B92RZUz3SvitQ1RsSGFGPP
 tZPDshniy8mMJMUivX7pjR39HjGg1DJXYUG1sch9D6IG+YQgxZvHQ5G9tDMnhlrjry3n+cjsAxb
 tBNq5GvN/JX4WDvzpXbCaXdN9IH2zgxN5gPkt0cindxysAHiXqL0N4ohP4zkibgluS7P0+DFsIC
 uJx7nBKwy1ooASQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEzMCBTYWx0ZWRfXwnn5SFnudIHg
 iuvN1pNcIHgU8iKYBaGi+5t9OfztTfiQjHHbqFyWjG3z9N+G2REzdcBH2uDQtSvJQcL+H5ra4Oo
 sgapnHDd5wBUhvk5bHqUqWnmFvthreJwBio3kVB64G9JO19Pm+S7O6oEnaVEEJwzlgSudUQOjK8
 96hcTHfcT5x5Jr2GQsjOWnUpmHzfYSBm1MV7MK28tfCr5g2raCF4DRbSDEld4cNMhqMIdj3iixl
 LBy4dt+I8cyhO0EtC9Ly9PWFfpvcTOYObGAC2TIuQ5NQrPKmm6exU/9rP6xMXtFhHdmFE1Mg4gP
 HKZqaiZu5+AE/FNXW4ovrqk4JXDAsiF5b7OeLmnwaMHdWaEnEFN1dui9wR2svybKAGix5lwkqdn
 HMHfZIUeAnVxysjkmOtMrD8lE/9Znhv025vHViAgaY3EVAdodWjFO+qGC4lNoTGCh/POSEzmksJ
 WZDXiHE/F4VlvYcN3cQ==
X-Authority-Analysis: v=2.4 cv=RLO+3oi+ c=1 sm=1 tr=0 ts=6967b69a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6VTnscBjb5kX48BWP-sA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: MqliuLy6K6Gu2qmZ0INhGtjEoL0bHF39
X-Proofpoint-ORIG-GUID: MqliuLy6K6Gu2qmZ0INhGtjEoL0bHF39
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140130
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Simplify error handling (less gotos) over locks with guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-microchip-sgpio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-microchip-sgpio.c b/drivers/pinctrl/pinctrl-microchip-sgpio.c
index b6363f3cdce9..7a6cb5f502b0 100644
--- a/drivers/pinctrl/pinctrl-microchip-sgpio.c
+++ b/drivers/pinctrl/pinctrl-microchip-sgpio.c
@@ -264,19 +264,17 @@ static int sgpio_single_shot(struct sgpio_priv *priv)
 	 * setting.
 	 * After the manual burst, reenable the auto repeat mode again.
 	 */
-	mutex_lock(&priv->poll_lock);
+	guard(mutex)(&priv->poll_lock);
 	ret = regmap_update_bits(priv->regs, addr, single_shot | auto_repeat,
 				 single_shot);
 	if (ret)
-		goto out;
+		return ret;
 
 	ret = regmap_read_poll_timeout(priv->regs, addr, ctrl,
 				       !(ctrl & single_shot), 100, 60000);
 
 	/* reenable auto repeat mode even if there was an error */
 	ret2 = regmap_update_bits(priv->regs, addr, auto_repeat, auto_repeat);
-out:
-	mutex_unlock(&priv->poll_lock);
 
 	return ret ?: ret2;
 }

-- 
2.51.0


