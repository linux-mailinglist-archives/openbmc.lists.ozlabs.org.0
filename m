Return-Path: <openbmc+bounces-1191-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4438D218B8
	for <lists+openbmc@lfdr.de>; Wed, 14 Jan 2026 23:22:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ds0wh4M10z2xpg;
	Thu, 15 Jan 2026 09:22:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768404644;
	cv=none; b=Bbza1YONAyGxBjw358CzFLvIDKzH6CUJCXMJVrwxtNNVL9nnhnOUqAVveRIBGr+WGr3hL1D1YreXou02/vijgp+krHE4x+Qd+01UKrdXVs6Go+qUa2sbvDLhBGYcqfcsT6hEB6M3lQDss3jk+pn/zM+8b4AC4fAkXJBQK6dUtzd77P4ozzVVdojiOi7OgEjvptNOaSvYoYm++hHAkHZoQoxv08mFxeqJB8dWL+ItGDcKxvZGupEHeuoL+zpwa8VKnIGoz8Nw+BX4uf82RagWUgeoJXvDQR2ttWCKiwJ91m2R2NDHsZ6hpwHN1bvJMZyZxBeD50YxgnMuc16QBBSpRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768404644; c=relaxed/relaxed;
	bh=HcnR/89Wj03lP73SJG9uZUh4OsLus8WiGZb1fxJLAxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aVrRMOAdcDO5EDr3qxMOKusKo0lpYpj4oigpCGFgUQHCWQVyRYMIs85u7Mxe1JcmUcPmVeNMs07GOke4YSmM4vdGANIZh5IpEYnTU6k3MwF8N3uYTuh4zP0PGnBcENSPkc4/wrLlqWv5zETtWHj9zdT01f7Lo+5KpUJ15JSvJwwp+X0C5Fi2698/xG7TvadR9h4VilCIYvx9HSdls0cHn54SuWXiGl99+oAaVTg7EniCIZnA582fA2I0PFfWV3a3rHLBLjulINu3YTvGwqn9KTxWQ1sFjyat3ZsQatV2rJ+w8cyjvrN1Dqf6R32nerPx3XmNC1z0myMRZ7M55o6LVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c0gmla3n; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a2aYzuVt; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c0gmla3n;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a2aYzuVt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drqnb51nvz30Lv
	for <openbmc@lists.ozlabs.org>; Thu, 15 Jan 2026 02:30:43 +1100 (AEDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EE1JuH3850524
	for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 15:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HcnR/89Wj03lP73SJG9uZUh4OsLus8WiGZb1fxJLAxE=; b=c0gmla3nEwW1grom
	dXfhMbs2CUA0nDw7P+mN/FxD+dkR3rvaLg1kj3Nh9uN83L54wADzxSvhai1Czh3o
	2Z4/Gt1Ftvc2cgOWr3LZiD7Uq4ypjP8ZT+7sDuhbqb3HYJDQpZ7OrzIf81BX0H4J
	lF1mR5L9zhlV6RdlrxyvfNJjXvrj6xgubK3JL0usnUC2m/6pPMzEsOqSyd7zVVdT
	uZolIq0Q9qTwubXeuXWTAJbOaeGgW8HmvOOKNw2Z3XPfK7RiY4Nd1H40O0BGDa4R
	EQ1XpTh5M4lrFkiSZ1EUhg58ozURytLvOpuOMTchVUUu0v7sRbxOU/92dxJcw1iO
	O68bPg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp8t2s5r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 15:30:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2194e266aso812150185a.3
        for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 07:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404641; x=1769009441; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HcnR/89Wj03lP73SJG9uZUh4OsLus8WiGZb1fxJLAxE=;
        b=a2aYzuVtlfRd8Ka9OwU+0gR0v9Kh1XghRsDQUHx92rGAIzYP5U/h6p+Rm4wFRGLFES
         GQ36qRN9X2m6wxhPVe4ApTcrkDjma3XgR3iT5ZCVCiyyHk6KoUieYBbr8MUXArAaUJb6
         Q2qsbWrXOGyWx8dC8y0oMvvqWaYjJkrKCeYTJPalOODmAJo9KztWqKl/XWfjGC3wwJw6
         7LNGxKgfjBsuIGh3VTYK8PWPVZnBbazyZ7eoY0iDo3A5pNvyMSIwtdGCIcN90LFB/5F2
         yGl/M4imzZdqaSqhcsqMVaAHgXI459g1hDKrkC2W6aNFu5mtitHcK9E4BNGcfKJjoiCY
         INZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404641; x=1769009441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HcnR/89Wj03lP73SJG9uZUh4OsLus8WiGZb1fxJLAxE=;
        b=DJLw4f1nokjOU6/+Et/uu754hghYIuCf1hFJL5aZDEpCSJQcUul4XYhm9rAg3HDAMO
         BcF2T10HDfQg7zwcQgRZnOfOxL1EPOZ318l0HMJA6NfgvG+g/KB3HgKsXP0SG+aLt34O
         xvSp5yeM2ae1Ymus5tpkSIp1slRsC2Fgx7juK/0oFmb6pRiOnqSvzROj3DiTFzv8n1QW
         pLDWY3cS4yaghvE41dTMQP/TNUzeilr11FrqIIDGGmVwgBZhTutZdjvGhHtls1AmeoKj
         Lp0VQbCOPxZr/HasyuaVjDNZLCSl/dcro/s5HdsK0P/Vn9oTBp5A/uw6D3m4mvhu0NTi
         0nNA==
X-Forwarded-Encrypted: i=1; AJvYcCVSACe9HaB9Vq6DkvJTU0V+ZkcGZMgQ8I6lGZ5xTA06RPaPxYThGn0LhUdvZ8FfUeCQbJGyqMLZ@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywr17tWL7P3jT0gQbcCD12jUgFb8TDTRUMaO3xRR/XtMJIwyMmq
	6WHaRV9xwNFL//ZZgD/2fZP3itH4/ecYJ9L1pLRoyKr1v1v9NVM1AuTd0cRM1ezA05Cc0ge5KQ7
	ev7e27K2rMpfAsZwuIkW5CIXVgIam3qbEXvKxMfbeEWVzAlfW6qnWgI0zLTfesw==
X-Gm-Gg: AY/fxX5UUsqNVjVxGNwM92On5usf7UnZM5U+m5WxjAFGuOPsEDEOZ6ACJba1MGs7dAf
	9g8B4NGA12SydZNboGhsRDzw7MYG2uVhIrC3i1Xc1JFwJBFQyU8TnOmRF6zul1hSHReVqLN1Op6
	W69VRp3YywTESxtEmUWifoFQhKQ/Oj2ol/k0kBrjja6W/IyQcaW1fYUAH5tUpTEABLM4RyJ+Ner
	ZXlhlm3Stbvwc0+VwX7tBP3ZtmF9wBKD2dRy4ZmcGwSqhXyRqYdWo0hIu1DjmwXvJSAyfRk6xof
	9NzdLkal/933C2itZtcwPir85AgMlOatAfGHOM1pAPg2XZbZB4O5DIbBiZ7uiU+AwK0F7QlMjSu
	eo3kcVlAwxK7j3Aw/h61WCxVPBYfDlxa75w==
X-Received: by 2002:a05:620a:6cc1:b0:8c3:7f27:a65d with SMTP id af79cd13be357-8c53168ec37mr311805885a.28.1768404640527;
        Wed, 14 Jan 2026 07:30:40 -0800 (PST)
X-Received: by 2002:a05:620a:6cc1:b0:8c3:7f27:a65d with SMTP id af79cd13be357-8c53168ec37mr311794785a.28.1768404639752;
        Wed, 14 Jan 2026 07:30:39 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:11 +0100
Subject: [PATCH 10/11] pinctrl: rockchip: Simplify locking with
 scoped_guard()
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
Message-Id: <20260114-pinctrl-cleanup-guard-v1-10-a14572685cd3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9+1hnIFGck3b+xQzUfQOk+LUFT1gQJKcE/unZtByYAA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aIvjtMFFp1u5KZIz3s1rXIH/N4W/pA1awz0
 axCd4PEfTeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2iAAKCRDBN2bmhouD
 16PJD/4udox+AT0qW++6/oS92v662DKt4vHflxhkYd1Y7cNFl6VsgBSRfzaoloaz0MEHOAVFGMt
 1UyMr93P+dS8fvc4VILacc5vZbJ/kr00OTwdcwQvdnsePTgGSF9jxGxB1yMVKlFjDrLF1zPkwpl
 29wGLZ37hS0UH0TeGW2udTIV1YUSrFiYFUZYsEcMt39OwgRdby8TpKGWJUjQxIvBk+/3xZOt/e7
 NPVy4lUSbhDTBQIXlTFIVTRce1yycOyBjEl+kvd/FhG6SHcCL61dVRC/HGbXL0M/wiiofXEdasR
 r9lwXPamriRLmuyjJw24hnarxswAqVCniTLhEcripalHasg+sQl3suIahqkaLyitP7Cnd/tzwbK
 +0IG7HVcQKU3c99Eb4MDp1+DQhaoB7hYCDuhAfVj131lDaC23kfGy82We0gW1UU3HljSGp/099i
 9dIEF1tOdwQ3Fn8QJ63QNMNDQrnXvvHNhKtSsvxkruUtxPw5PxcVn3TXp4E7SFojcFSU03Vjr6P
 1PerYKudeLt4fYL25YhswZnxQ55f9YEHdXOpcT6ioYr1ADvhmpbxvYqiutI5oF079O96zENLJW6
 XqeT+zpnIQ6JT3SXsguxvuciBugFqYtmWU6xsPv/UBK4NLPnIsNYRhMDUmDpn3uqmgo9awP1tGd
 9qrQnqhwTfT+JiA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=YPaSCBGx c=1 sm=1 tr=0 ts=6967b6a1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zo1y7j5tH0XFdPBYKCAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEzMCBTYWx0ZWRfXyPRSDmwLN9A+
 mgYBMtymjxXOOIwdnw4i8fIeyaQMybZteU5gHRsAgQqqQ1MUikBAbdIOjoOis2giL6we01yYxIa
 9X/43Qt0Kv/nUSzYIpsAXXDTdKTGfrSnr9hzF6C8wrXz1sv+LXoYQh4RNJAwvcXhdchS78mSnbz
 Ot2KrMviJGxqy1owvWYc9NWYFKlXb4l839+5ExyGq/dhpjgJxSPC1m/Waf94VwHUI8mMLvG7+iS
 g3S5Z8K90dH+UbfH2oBqWkeOy9v764L4qYa+iVIONPR2w58HwQznE2GjktL7Df0iKJE6wsfxoVh
 5xipkemfZDwWMC+zgk2x9AG6dFgZwotlS9HcUnAREcp5SAal01u29eK7mM6KYwZ9Sgp3ciQ5VCK
 f/vBQjJ7cIq1sotHgTTRb9z90Ylc+u3RyyMNCRVJ13T7QT5yA/JhFio60pBV5dKRfcH0/suHhvn
 ltU3srcRVXxTZ1lEkNw==
X-Proofpoint-GUID: PB0dzC5tnmNQt5cze0GmDt1hRi4Qel--
X-Proofpoint-ORIG-GUID: PB0dzC5tnmNQt5cze0GmDt1hRi4Qel--
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140130
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Simplify error handling by removing two mutex_unlock() calls with
scoped_guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index e44ef262beec..bbe1cf712965 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3640,17 +3640,16 @@ static int rockchip_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			 * The lock makes sure that either gpio-probe has completed
 			 * or the gpio driver hasn't probed yet.
 			 */
-			mutex_lock(&bank->deferred_lock);
-			if (!gpio || !gpio->direction_output) {
-				rc = rockchip_pinconf_defer_pin(bank, pin - bank->pin_base, param,
-								arg);
-				mutex_unlock(&bank->deferred_lock);
-				if (rc)
-					return rc;
-
-				break;
+			scoped_guard(mutex, &bank->deferred_lock) {
+				if (!gpio || !gpio->direction_output) {
+					rc = rockchip_pinconf_defer_pin(bank,
+									pin - bank->pin_base,
+									param, arg);
+					if (rc)
+						return rc;
+					break;
+				}
 			}
-			mutex_unlock(&bank->deferred_lock);
 		}
 
 		switch (param) {

-- 
2.51.0


