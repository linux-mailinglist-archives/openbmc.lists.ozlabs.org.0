Return-Path: <openbmc+bounces-1202-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1785D21945
	for <lists+openbmc@lfdr.de>; Wed, 14 Jan 2026 23:32:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ds16p4fg7z2yFd;
	Thu, 15 Jan 2026 09:31:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768404633;
	cv=none; b=Jhx3PXUYY17inj7E68AoxmTMdw7SR7Sm2N12SiTuPBadHvE/WZT/A6iKxE6irDMA6DJPwIH41L7q6MvNZbne65I9fvrKPYRwmoFTL8nIwlOeKf4MY+xf0ZQPfvHJqK49/KFWuFwjMsr49r087eBKQDwpGm9xv4iUn0gKiRgTv8Q6pdDW5lu7DbcIiyalE1izu6rVXYk5gSYVZgB247ZNwb3jScXe/bW0v5sq20zNiF3m9uyqaCoGBuVQScl5+KX6Upizt+1Na2Rsn45z6twFvvdsC7z8xS19eacO+TBRBD2vHbpqVbcxqaT4o5VbiqB6XJYgkFzLqWls5LTNqWRvoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768404633; c=relaxed/relaxed;
	bh=LXncEA4jW+AgdDM8Dn/nTshgL+Kv2q2dFOJVpt182v4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cHmvdr/fFeV/xkr/f3unrvFG6a8FHe5WWssoAo8a304szw3bz18DCHTE5PRJnYpxPGXGVI4vR1YbaZAwCzIXeaAGpa1f7yFUaBGI/goJ3Usb/CNfYVLm9bOphgReKjqJ767x8+pwFcVwU6gtyfOLcaE76Hb7SXcO/aBJ8i7QirgwSzI8+B8mqVpn1qnGW98bS3rxixKQjIucOfPbXgniwyInzT9SdFedtz+dKY4XV+Cy+o9D2W2Nho4Nd2kW3T/36ftRUcy3zdiUOaYYwNlpPw0iaTg5UXjsMgBRe+yJ1jQPJ7o5wO5CK8FRn9d/b+UCz9HqDjmrLbi6Vvwf4gyErQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L1bLn2gb; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZotKigHF; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L1bLn2gb;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZotKigHF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drqnP1kh3z309H
	for <openbmc@lists.ozlabs.org>; Thu, 15 Jan 2026 02:30:33 +1100 (AEDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EEULm22082100
	for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 15:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LXncEA4jW+AgdDM8Dn/nTshgL+Kv2q2dFOJVpt182v4=; b=L1bLn2gbhX1VQr5S
	DBrqZ854pXa6x0jHP6ADw0uJYdtEFgDvE4gD9u6gpzd62HMPmU14Zz2Yz+ffZGY8
	VY/nvssh6dZj5GnrLthMKJcVupO8HTQMojR7ZkiDkKR0XFxxqvBJUeKWNMxYJry8
	NwvqTbbKWLT75tdRH/42GO0jHIG6tsYxJZYxIt3+vwRt9jLFxqCKxsZvqH+nzhSP
	P37BGhyoY19MnsR0mwirGBB8vtCkN84A5wrbld369kXozOtYajjOcHWpNhrbOtSR
	u9dn/SmYXI+2ecIuTkyBKquonCEcC6bun8mA6WiUKZcz7VQzS0X7Qy1Zb+WncMs5
	/6FpjQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnu58uyxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 15:30:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c530da0691so174055485a.3
        for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 07:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404630; x=1769009430; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXncEA4jW+AgdDM8Dn/nTshgL+Kv2q2dFOJVpt182v4=;
        b=ZotKigHFrFseHv/q5DnswVqyIHuxGwj7bGQHy4Hq/RZ0/PWze4qmH3LngeSP6ibXs/
         l78XkKu1OyyIFWgPAPY3tVcnFGGgWU9FylkC0VEpHh61p6LO+EImqGCpgO4HJp7E4pXQ
         oLaBlBqm5jVpkbDbDphXfjve32C5J0yD01NbymXNSU9BBSSq91KGRvE1yH39Uyd6AU0s
         Zhi/VM0LiXQgDpp3ejwCF+O7c20BIgnjzE+9SgOrY2BTMwT3eHCXpHANoFAcmd4bosYZ
         wlz2mIlAeFxgQYSergns5EPuyYjpSGttDrAXMUtDkCVpQNDqudKguPSETRkj2JA/Ou/p
         Lxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404630; x=1769009430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LXncEA4jW+AgdDM8Dn/nTshgL+Kv2q2dFOJVpt182v4=;
        b=sGariahiJV/L1GPbMKtB+0JYTU+PJLuDWh+ELBChJ8l8NZyfFao97F/KjDNEE2JKK+
         U93ph5/8G2PGY+i+TnP3IrGZiUkfIaTV/Rkdfc+UIFG4kOa/UkA9FUs+gGkSvj2i8xng
         4tJ9R1DRRS7j5ztTptXGyud1ruvDbaV3+U9yh4orkSyA3v3b84ovou1LjxdZFkkPv7Ee
         cyxJtRp56kd8T4MM5sFSkYuA7yhuThMxHHpthoLwQVaW5AHmQlSiVu7njioCiD1+SUnn
         N9Hrj/A9sor7nWnvqtn94EdUR0hzTrnSP9s7fhi9OeMWwS9djh6YSzdj+jwBktrz8puC
         a/pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCcXILBFMKH812O7gr0j38AuKWdJ7T5WSxffhn5v4bDOLXHLusskxc2+zNr3AcBdMX2kN+GEax@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz2IH5iiJtb6/m8bzk+soVLqktbsi3/3YpTjVl+4IKdOqWBxhuP
	ODagTnV7HbNuyGPjUXe1S1cm99O4LCCIFYj8VIXdvikKZ3tJvo0kf8awdsjabyWEV+NiWW0+hyI
	UYOm9A+icR+qB74mYm+vLaLSbsDnHRl1hpPVvod6/n4dr51N0fI6WQlub6dOQ/Q==
X-Gm-Gg: AY/fxX4i1m+00lOq30DbzY3eRu9EMLjV1ZMKebftAYmpB6mneIZ9PDhkU0hmI1vhhtR
	0AAE1X5g89cZq6bjoKn7cvJK1LIZxZ3WVgH3jRw2iEjihNGUV8hnB0DeAeLDq0KFq/Y0Yi3BCLR
	JHraKFub98C8plzXRcW/cFKLMY+2BeCoMKL9kg/KQ9IUDgjQ02+fSzmvHE74CLIYnB7FXu7N+fe
	ukS6pMU2KGZwB3wWvtgqQrOuRA3upNTd2LdMiqh+20sBFLekhiBCHGA3TQ5ULsZwcx9lBX4Yvgw
	J4r1qfanY6g1W0GAwW1rGuwRDxTYw5jvIMeMpXWW60kPYKwkHZZr4HsReEV3X55xJvONiMr7yrI
	l5h9A1cQ9tMcyjXdzsNFvneVFsOmVDfeDrg==
X-Received: by 2002:a05:620a:4804:b0:8c5:1fb5:1631 with SMTP id af79cd13be357-8c52fbcf18fmr431954685a.76.1768404630170;
        Wed, 14 Jan 2026 07:30:30 -0800 (PST)
X-Received: by 2002:a05:620a:4804:b0:8c5:1fb5:1631 with SMTP id af79cd13be357-8c52fbcf18fmr431947685a.76.1768404629608;
        Wed, 14 Jan 2026 07:30:29 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:06 +0100
Subject: [PATCH 05/11] pinctrl: aw9523: Simplify locking with guard()
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
Message-Id: <20260114-pinctrl-cleanup-guard-v1-5-a14572685cd3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4481;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y+FQmd4rABqYPyTPKLcnkK9CTadziXSgsQ+69hWhimA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aELAglkIA71S9aDHg8tY0ki5ruKpcTIipIp
 9RdX4NrwWOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2hAAKCRDBN2bmhouD
 1/igD/9PwYlGol1XFHKqtfTdSYI+oQLSjl0z2sqJC/KrK4RW/0UQiErzillTKszLs1fzun100dI
 EhV3/cNFb7EkGAiUv0DOTJm2rLXXXAEKq4sfHj2AvOo4AOdm1Vhzaxohnqhz8lbieU5tgItO8kM
 CikX6JY0DNIPuK8tFa3jeDEczOXlluE7E41BjdvQjxbKKo8CAfks/3wwtIsxd1meu0Uh7pDT24v
 aYd+vgDxKOiXkiRG+CUevINMLknU969di7fKX4meZYuzU3R9984ZwT3wKVcWI1thioeP3d0iKIZ
 BLsydRVePUf0VtejFOq22/8mIaGexs7h91zpasohVsgWexuKGuKJNsUuVOnAKfAxsGZjauTVDrL
 18hpyd0FGakefMHY330a0Z2lqwnCW9k43rDquioM3Bdk17JEYl8zl6Ke/SDgqPsWJjHmhjt99ld
 hGunGrieUUrlWbMED9RW+3E0q0mHN8hMeN8k3fFjaBxIE0ScSmF/3Ln/vbtAuQF19W3wAWGZaJY
 GtZjFlirhF09jNZdVRAU8jaxTE4Y1Xh+h4BXysH0im9u+xRCGpdGx49RemYsLFWX5SsXtSUWzJE
 4DUYUyd6Czhj6ON/2GFFww6B8ToMmkk78qjK6kFM6DwCDfpPDItQEKm0PHRqNap0/QZwJwiIuvB
 W8opp7AXG42HEmA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEzMCBTYWx0ZWRfX5lxk9LzBMVZ0
 pt+g1/BH9qlGcE9e9BUJtceFX61hsUKB1ECsGxPah9cVuG/qu3rPBnwe6L/YGDTxPkLY6WUZm0n
 ZhKfVj0wvQbH7Hx3iot4t8Rj3J5KDYbL6y1qrSizhALjyjPAJjIwOV/IHfvHeYKEg3IQpyRW7CM
 joYpjPkr1xzKOKkHjQql1FG2xA37DSr82tKMEv3rjcwOcCNanpYKAG/AJRCLe7nkc+WDnwU5OOm
 uApJqjoLCrqsnkPCuximcfiR4n5rb+yjueRcnFbqfzgJ0S/MsxJ45OpRUILT7VMx+KvoGmR5Yq8
 sYR2syN5gOekhyYTtB6yS1BwyrJNXDsgCHF+me8zBXep20+lIA99P9dyP4bLSwsWN/67nw3Zs9w
 7p3Pki/vVFrAu1Y4NmvaQfIHjpdwFasD1g33yFFgVWDknZd5dvemhS+gRJ/yU2pnpl62AEPbDOq
 I5Wvrl0x12Xkgg2yB1w==
X-Authority-Analysis: v=2.4 cv=BZnVE7t2 c=1 sm=1 tr=0 ts=6967b697 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sJPWbbE6un6nfY-uGV8A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: QrAyR9qdzFFNl-X3CJJ2-X39fbhUtThY
X-Proofpoint-GUID: QrAyR9qdzFFNl-X3CJJ2-X39fbhUtThY
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

Simplify error handling (less gotos) over locks with guard() which also
removes possibility (at least by reading the code) of returning
uninitialized rc/ret value in aw9523_pconf_set() and
aw9523_gpio_get_multiple() functions.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-aw9523.c | 53 +++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-aw9523.c
index 479553a79216..02a24ac87ea4 100644
--- a/drivers/pinctrl/pinctrl-aw9523.c
+++ b/drivers/pinctrl/pinctrl-aw9523.c
@@ -291,14 +291,14 @@ static int aw9523_pconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	unsigned int mask, val;
 	int i, rc;
 
-	mutex_lock(&awi->i2c_lock);
+	guard(mutex)(&awi->i2c_lock);
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
 		arg = pinconf_to_config_argument(configs[i]);
 
 		rc = aw9523_pcfg_param_to_reg(param, pin, &reg);
 		if (rc)
-			goto end;
+			return rc;
 
 		switch (param) {
 		case PIN_CONFIG_LEVEL:
@@ -307,7 +307,7 @@ static int aw9523_pconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 						AW9523_REG_CONF_STATE(pin),
 						BIT(regbit), 0);
 			if (rc)
-				goto end;
+				return rc;
 
 			/* Then, fall through to config output level */
 			fallthrough;
@@ -323,10 +323,9 @@ static int aw9523_pconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			break;
 		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
 			/* Open-Drain is supported only on port 0 */
-			if (pin >= AW9523_PINS_PER_PORT) {
-				rc = -ENOTSUPP;
-				goto end;
-			}
+			if (pin >= AW9523_PINS_PER_PORT)
+				return -ENOTSUPP;
+
 			mask = AW9523_GCR_GPOMD_MASK;
 			val = 0;
 			break;
@@ -341,17 +340,15 @@ static int aw9523_pconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			val = AW9523_GCR_GPOMD_MASK;
 			break;
 		default:
-			rc = -ENOTSUPP;
-			goto end;
+			return -ENOTSUPP;
 		}
 
 		rc = regmap_update_bits(awi->regmap, reg, mask, val);
 		if (rc)
-			goto end;
+			return rc;
 	}
-end:
-	mutex_unlock(&awi->i2c_lock);
-	return rc;
+
+	return 0;
 }
 
 static const struct pinconf_ops aw9523_pinconf_ops = {
@@ -599,14 +596,14 @@ static int aw9523_gpio_get_multiple(struct gpio_chip *chip,
 	u8 m, state = 0;
 	int ret;
 
-	mutex_lock(&awi->i2c_lock);
+	guard(mutex)(&awi->i2c_lock);
 
 	/* Port 0 (gpio 0-7) */
 	m = *mask;
 	if (m) {
 		ret = _aw9523_gpio_get_multiple(awi, 0, &state, m);
 		if (ret)
-			goto out;
+			return ret;
 	}
 	*bits = state;
 
@@ -616,13 +613,12 @@ static int aw9523_gpio_get_multiple(struct gpio_chip *chip,
 		ret = _aw9523_gpio_get_multiple(awi, AW9523_PINS_PER_PORT,
 						&state, m);
 		if (ret)
-			goto out;
+			return ret;
 
 		*bits |= (state << 8);
 	}
-out:
-	mutex_unlock(&awi->i2c_lock);
-	return ret;
+
+	return 0;
 }
 
 static int aw9523_gpio_set_multiple(struct gpio_chip *chip,
@@ -632,30 +628,28 @@ static int aw9523_gpio_set_multiple(struct gpio_chip *chip,
 	struct aw9523 *awi = gpiochip_get_data(chip);
 	u8 mask_lo, mask_hi, bits_lo, bits_hi;
 	unsigned int reg;
-	int ret = 0;
+	int ret;
 
 	mask_lo = *mask;
 	mask_hi = *mask >> 8;
 	bits_lo = *bits;
 	bits_hi = *bits >> 8;
 
-	mutex_lock(&awi->i2c_lock);
+	guard(mutex)(&awi->i2c_lock);
 	if (mask_hi) {
 		reg = AW9523_REG_OUT_STATE(AW9523_PINS_PER_PORT);
 		ret = regmap_write_bits(awi->regmap, reg, mask_hi, bits_hi);
 		if (ret)
-			goto out;
+			return ret;
 	}
 	if (mask_lo) {
 		reg = AW9523_REG_OUT_STATE(0);
 		ret = regmap_write_bits(awi->regmap, reg, mask_lo, bits_lo);
 		if (ret)
-			goto out;
+			return ret;
 	}
 
-out:
-	mutex_unlock(&awi->i2c_lock);
-	return ret;
+	return 0;
 }
 
 static int aw9523_gpio_set(struct gpio_chip *chip, unsigned int offset,
@@ -695,16 +689,15 @@ static int aw9523_direction_output(struct gpio_chip *chip,
 	u8 regbit = offset % AW9523_PINS_PER_PORT;
 	int ret;
 
-	mutex_lock(&awi->i2c_lock);
+	guard(mutex)(&awi->i2c_lock);
 	ret = regmap_update_bits(awi->regmap, AW9523_REG_OUT_STATE(offset),
 				 BIT(regbit), value ? BIT(regbit) : 0);
 	if (ret)
-		goto end;
+		return ret;
 
 	ret = regmap_update_bits(awi->regmap, AW9523_REG_CONF_STATE(offset),
 				 BIT(regbit), 0);
-end:
-	mutex_unlock(&awi->i2c_lock);
+
 	return ret;
 }
 

-- 
2.51.0


