Return-Path: <openbmc+bounces-1230-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF8DD39B38
	for <lists+openbmc@lfdr.de>; Mon, 19 Jan 2026 00:22:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvV2d30yKz3bmR;
	Mon, 19 Jan 2026 10:21:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768759822;
	cv=none; b=LhAACdwZcAYCIh3AptBeicqaSf77lcC15XKJJ/r68/D9YRSgbVt/6WTYt2MYHctWhZ5mq5T5FHm2XISXOCqxjdBI9u2q1KXpyBdEnDKzp4nXoDw3hgbLkzmTCrKMmEKpLXnckPIg9X6YiBtm4lldnNyOTuOq6rUnvbo5WxSNus5WWrHGDk5UnKJOnaDxyJWHh2qaNcNeoh/jPMpKBQo3+ml01FYec/RyyBAWi8l6mhZL1Woactc1Uhs+elqccQ1TMccVli1gdwDbHCdcfVy7e1SDM5kMTzN2rnm3roEwCstc5h/gXFYsoW4Y99wGhpZZIdOhbBZOxLe+jeW+PNNYAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768759822; c=relaxed/relaxed;
	bh=VMrQrzLzDincZEvSf3IY0LWe8Yq0vnY3RbOd9IgAleU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gKujjkz6mniAGYvhDIYjNTdYo9p5fVDQApOt0stzdX2PTUqotHuRrMds/zo3TOevfCB7rdtGj+OmaP295JcI/nTg0v8/3B0GO8Yyasq01Wqaax77BvGX8HMdLz27bhR4LSxx1ectCxxs7w2kFg5fac+AfJjJypVlXgtJoO4GUXZOmQPGH+xujXPWKF9HUt6J6PJGrwVZdAzl3XDQ4hIGpYMfc43HO876oeiDIzDirQOnzhA8AAmY3iTyfCAM6qsmHAOmGoGViIqRJ0X+ToWnj8AqjY/sJ5/ig/RnWR15TqE31EQsH8t6qW5EfdG/BY1PuDQ/FOZxU7ITZNcDq8YnQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FLHmcbh8; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P0zRZzjA; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FLHmcbh8;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P0zRZzjA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvM7x4wGHz30Lw
	for <openbmc@lists.ozlabs.org>; Mon, 19 Jan 2026 05:10:21 +1100 (AEDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IAe2w63367764
	for <openbmc@lists.ozlabs.org>; Sun, 18 Jan 2026 18:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VMrQrzLzDincZEvSf3IY0LWe8Yq0vnY3RbOd9IgAleU=; b=FLHmcbh8VeT0Xx7u
	ocCWXxIuvjB9tBx5LxiCDtIBDccJU379nP+UmbRcoyBcr+3edNEdpueWK9J+M9dg
	On/6tG/zQrLm8kIshV6N+0lPrvBMlNib7FFNeOZ8S06q3klUrsezMEtoWQSE7x8a
	iEZVX+2oCVORqUTkeyErZZCtqx37t6TybdAYQxnbiueXwqeFCCkNWbDhB/sk9zJO
	wyGw/a/G1LG/16y68VMQZIcKCntDh2BsmDjLvW1Mt+2eHXhh9/2Fc79ypv3cnxJq
	yymNkMmzrvQoaprecP+D3OwcUzhJd+k9MUIKezJvfuCKhbJaAMB2BIcNG0+2rc9i
	yD93uQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br1e5jygx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Sun, 18 Jan 2026 18:10:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a316ddbacso89999136d6.2
        for <openbmc@lists.ozlabs.org>; Sun, 18 Jan 2026 10:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759818; x=1769364618; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMrQrzLzDincZEvSf3IY0LWe8Yq0vnY3RbOd9IgAleU=;
        b=P0zRZzjAv9E/7M7G3M05VhAH7y1dh2o9gTADclbRNHksJy7vvNOd0ZPGtseTbevFFn
         c7e5s86pFQOwu09YIFeoQHziYiRCCi0FLTWbpqZG+Lc4Ig3obS+tT/0TB+entYPzvTp6
         a5GBLledwK+XEx4QCJzu+Ph7HP1UBgbECZLD6N3SSDE6paw9nN7Xy0/a9qBOsep7yf4o
         EzzJGi2kkohx2f9dXdWmKW+RIyv/BMbOy6ptXHnpeu5bG8V8wLptnfCNb9UQ+dazU43w
         TgSte1WQzHXiAZfYyTb3WaNvsFCgV0T3WQpHLyEI7k1Ou/xOHSBLLMYNp0cppmyPU09a
         Rjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759818; x=1769364618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VMrQrzLzDincZEvSf3IY0LWe8Yq0vnY3RbOd9IgAleU=;
        b=TvuaKjD1ZOYeJesBG1pe6rX/59e6HV1tySJ+BCRLi1+r3mvIYTbHbRt80mZQs4jtRQ
         ho3F2HBjolH08CdO+yJH2KuNykqO95V1kAzihntZpgm+8K1cZUWQJSLqnFrVVJzCpAhr
         nmttVJUYsDchHksUFoN8cqSHIu5f2GuiSZ7s613091bVnEZHckzPSrYt9m/8pE9EOvae
         AXlUKeCqwG4hpWk++cx0F6q3+sCdjASJCTJmz/OBfQdis77Q3rN2BIEOMj6sU6Dxf+x3
         DfRRj3s93YCwMUMCCxIEvKaei78OzofLmLjs2WYeEfuwftqSoj9XBTG9FFpKnV22fRw7
         3RSA==
X-Forwarded-Encrypted: i=1; AJvYcCUEZ6EuahWKcQap4WuZ/Iq9v65jkR8sL49s1Ure1qpdfyA1UDGUbCmdW6d/wz8x6OkTm0DawPle@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw1qVbORjCoa2YrK5NaQS2scQm4CGgBvov2119FsEGin9nCoX0J
	WL5V1qxHtSpYGlakfDDga/Agng4fgJPc7TiPs1d4A7dlMaC2zdP1BJeazKFb+FZG6AQ2eo7GUzI
	fzJtM/WdiXiWPY3z7fWZqI5QHxRxzF0QrXmVdP/s4JCC6pfxtKFJAg61wSF4DTCCC73fWQg==
X-Gm-Gg: AY/fxX6t+Avn1omW4QFK4/aNEW86muwg0jVsVG4U+J+h/WzK4gQ3OzCjMtn23/FJDzc
	HQb8cYelfkQioTDzWkDWNkoodPzqbT5uAep83VL/HS8v+t7adS4Y2IGDA7VK+uc5QAeCROul/CY
	TmCrBTDBfTNZiNm8VDcuEfCyeuhV+8feklR1iy9K/FbrDDkQfwl8fWpkqIiF8a+4fYVv1kx3zgH
	s4/gu4SZeSRSprnpk25IraRO+XhTFEqB++goAaRX3UUqWISBGyavUXx5IZpK3ZlHzVEpu9aEyZq
	pK/R8qDxhqD8H5TLRsWB505CaWGd8bMhs0llmRdSkenzWqWMfw83ikN8AyhQMvCxd07sYiNZCeP
	qogYp9xp19+Yed9NxSaeO8iDulp1rp6DsvQ==
X-Received: by 2002:a05:620a:4543:b0:8c5:af6:3efa with SMTP id af79cd13be357-8c6a67bcd01mr1262131485a.86.1768759818310;
        Sun, 18 Jan 2026 10:10:18 -0800 (PST)
X-Received: by 2002:a05:620a:4543:b0:8c5:af6:3efa with SMTP id af79cd13be357-8c6a67bcd01mr1262128485a.86.1768759817837;
        Sun, 18 Jan 2026 10:10:17 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:30 +0100
Subject: [PATCH v2 07/11] pinctrl: tb10x: Simplify locking with guard()
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
Message-Id: <20260118-pinctrl-cleanup-guard-v2-7-bd36f681bdc0@oss.qualcomm.com>
References: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
In-Reply-To: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2163;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=adtV57CgOwnY60Si6YEP4k65ve4WmCO5x4rzf1ZqeaM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSH0P3baB5JzE0xj4EquivvpaBBrqdpm6amOt
 juDbwiBC2KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h9AAKCRDBN2bmhouD
 18o1EACUQyCgNzHZcDtTGGjP0XngZqctytCl/BhtXdiN2scGWH47PeJ1EbokGmcu35oOMeMoF/P
 Ai/yJjffW+dvyctYiUkUjdX8qhiC2jEMnBnR8HZEw07kz1ropOT3VtM9UNzcOP4VVa6XiU986gx
 +A9IxfYMZgbHYem1kw5uWedXNzll31yR6NXl+qm3YmcapiaWrXfhMQr5W3+Y014NvLqFh0h0nY+
 VxNPqKS0K7Oc6imDFiXRU50DUa2PRBddUY72TCkg8IbNE9LNnC+IouRZfrpjgzU+o1sRF5zlhhE
 I42rY1W2TwyfNm25FScOIOwekUr/tt7XHK3Q3KNa7vNG+uurb06yeOS0NW5zEIh+fH0e0tevRbL
 5txnHIVmMgsVP9qzzc3Br1lDZbc52FUcLV7vvC9rMpyHoyONur5eBHMB2UKz3Xqa2NBtZPpWsFo
 wo5+VFlpkkdh5y2iBoS1iDvXQLvtiqBpaHj6Suu/4MiSLX+PkV0aId7KrTqfcC2PmJjOYVi5Q9Z
 vShD+pW5GDt3E9qbXvJRxs0a8bvIwVXqG8pg4P9bsL9v+rGt5VbCvR6FyNIf67jL9QRcUvEn4Px
 54ALdRQJBLaZ4OkpCq7oTGr0tO4yjqNJDKYKdrn03h/zNzPbiXClpfTtiL9qzncdjmoS9IgEOV/
 vTudhlAhqE6ovOA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfXzfYojkQh7ebL
 dFQwLHec/g688xXHkMNK/RZNrs3q3EE3/QI7i1jrXZMfobAuPVNzwOt/jH5FQm9MEZa4tHQqHu1
 VCJxXCnAj2w54e1te9XwTQZ3AEtHWt3wWKrlerQW5wY7LSDq4YJxEL9QomcOZrZg62dzEOsdYmA
 luggoahq/i/yAMCq0TVeXmaVF3Vc35FUJp6zzhTC+gbaiqaxCPd2tqdYioJth0dXH+55EYbICTC
 /cVddHpsmh8tXO/ReftUyzVvQAsvpaDYIpOprOOIH8Ho/3KvE3l+x8OBkkQT2jefYXeoXlmHpFD
 MhIiv3A3oC57V4BuktTRUwZieA0bS/GSUiJUBKR6tiVfzmYwR/FFgEFYT1Cradp5z83x2wxGxKJ
 LI7lf1fPENOnRRi6pVOg4GOQJtghUdWfg54ArEFF2NaBvvzkam1B0vOLdq+Y3XWLsZfpN4XqM+h
 MWnv+yqHXqd3SpzV0kQ==
X-Proofpoint-GUID: wAqDK2f7VNf0Kfwdw3kO-OJgueekk7A5
X-Authority-Analysis: v=2.4 cv=U5yfzOru c=1 sm=1 tr=0 ts=696d220b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fB2tTgKqvhDdEbG57mcA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: wAqDK2f7VNf0Kfwdw3kO-OJgueekk7A5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601180159
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Simplify error handling (less code in error case) over locks with
guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-tb10x.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tb10x.c b/drivers/pinctrl/pinctrl-tb10x.c
index 129fa51d13b1..3f581404a9b9 100644
--- a/drivers/pinctrl/pinctrl-tb10x.c
+++ b/drivers/pinctrl/pinctrl-tb10x.c
@@ -607,7 +607,7 @@ static int tb10x_gpio_request_enable(struct pinctrl_dev *pctl,
 	int muxmode = -1;
 	int i;
 
-	mutex_lock(&state->mutex);
+	guard(mutex)(&state->mutex);
 
 	/*
 	 * Figure out to which port the requested GPIO belongs and how to
@@ -642,7 +642,6 @@ static int tb10x_gpio_request_enable(struct pinctrl_dev *pctl,
 					 * Error: The requested pin is already
 					 * used for something else.
 					 */
-					mutex_unlock(&state->mutex);
 					return -EBUSY;
 				}
 				break;
@@ -667,8 +666,6 @@ static int tb10x_gpio_request_enable(struct pinctrl_dev *pctl,
 	if (muxport >= 0)
 		tb10x_pinctrl_set_config(state, muxport, muxmode);
 
-	mutex_unlock(&state->mutex);
-
 	return 0;
 }
 
@@ -695,34 +692,28 @@ static int tb10x_pctl_set_mux(struct pinctrl_dev *pctl,
 	if (grp->port < 0)
 		return 0;
 
-	mutex_lock(&state->mutex);
+	guard(mutex)(&state->mutex);
 
 	/*
 	 * Check if the requested function is compatible with previously
 	 * requested functions.
 	 */
 	if (state->ports[grp->port].count
-			&& (state->ports[grp->port].mode != grp->mode)) {
-		mutex_unlock(&state->mutex);
+			&& (state->ports[grp->port].mode != grp->mode))
 		return -EBUSY;
-	}
 
 	/*
 	 * Check if the requested function is compatible with previously
 	 * requested GPIOs.
 	 */
 	for (i = 0; i < grp->pincnt; i++)
-		if (test_bit(grp->pins[i], state->gpios)) {
-			mutex_unlock(&state->mutex);
+		if (test_bit(grp->pins[i], state->gpios))
 			return -EBUSY;
-		}
 
 	tb10x_pinctrl_set_config(state, grp->port, grp->mode);
 
 	state->ports[grp->port].count++;
 
-	mutex_unlock(&state->mutex);
-
 	return 0;
 }
 

-- 
2.51.0


