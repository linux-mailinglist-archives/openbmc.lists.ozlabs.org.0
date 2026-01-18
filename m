Return-Path: <openbmc+bounces-1231-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A37D39B3C
	for <lists+openbmc@lfdr.de>; Mon, 19 Jan 2026 00:22:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvV2f28gJz3c2k;
	Mon, 19 Jan 2026 10:21:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768759810;
	cv=none; b=mNSEKkloG4McdePBP13WVJOiZWMy/d4HmJCeNtVNoIQcAT4JDY/BHRiqT8HnTf1OuWUxnHu52AFhJrdRdj1edg/OE1htxxcBjqm7CMzTLQPYTkrYEw4kvXHPLf3lSxb5Nvm755InkO44zn4Hd2mgyWnuzDMerVV+pyDeNrNL7N9BJPSt/TZHuo/78UFKFDOFoOhmkjTYDzvY+3J9Dh1kItieYpcYcGtpSfoaE43PMaI+4ZoaLE1dTTN94hyeHeL1693gm67GTdjp6J4udYruCyQwQhZmSTZUeftiFdb1v+68bUWlS7TbqV3zfQwKXGbwB2+UBD1XQyTKiZv9kEt8nw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768759810; c=relaxed/relaxed;
	bh=cvBXEQRwk0vB9MxtistlWfSV6Vaus6aoeJvtQZzjTG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lw4fbOrIkkJd6Y5WyXY282fKBnE4kXgqJQe7b16XJv5BSq2poYYE9s++FR7BvGD5iyZ44waS2A+MV8hORz/VlUSWnxVL3VJqxq9Pl76diWHg4sqqCTTd1yNSwjaiqlyXwL1lQsCiwZ/X3GK+AuCfpYspDWdUGL9bq06JEH5WPpYrY7puNy/BGn2hqOzt3vuAJd3lUTppzVFyzEiuKiyDfPdO4LBxzX6XoQHyNPk1vJSasahOQQXjN4bQMFWdGXu1auGFssWS/3BDR5I9iaypeaKNksAGJTLXdTZSjZ/QNW8gdxV6kdeiuy+IN/T3Zgly60iScZ5ex73XFQLV5oOdnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K4oQQsBN; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DZyVWHhQ; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K4oQQsBN;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DZyVWHhQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvM7h312wz2yFW
	for <openbmc@lists.ozlabs.org>; Mon, 19 Jan 2026 05:10:08 +1100 (AEDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60I2tt5u1712303
	for <openbmc@lists.ozlabs.org>; Sun, 18 Jan 2026 18:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cvBXEQRwk0vB9MxtistlWfSV6Vaus6aoeJvtQZzjTG8=; b=K4oQQsBNqYVZw4QH
	PjC93dzL+Hz3LWNfTQn9Viz2RAWjfWaMdQn+XQT1jUJQ1eVTll4XbPiZYIT+fVmi
	x3jDEAb3C1dOVGQjURrLEAeFU8nBZnO9SpeOqanXZAbvzSZge+gZufuN9ZeyAeUt
	VTjwhd8Lcu6dok0QAc6B8iEhMhncREgFSCjkTR1s5IkSFJpOF19qirc4gu2x20/U
	O2ZBSKiSBzFkmb0qaoaO299bc02LShw2HQovLbVbnGpCKtuxd2fbUYTRAF2El+rS
	Ox8De3k7GnXYCb/Sv2uTpimVD4QuaJ32BAyW4oXQvIexvZJU1c/dARph3HFIPOb0
	risUjA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br04e34xg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Sun, 18 Jan 2026 18:10:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c538971a16so824012185a.1
        for <openbmc@lists.ozlabs.org>; Sun, 18 Jan 2026 10:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759805; x=1769364605; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvBXEQRwk0vB9MxtistlWfSV6Vaus6aoeJvtQZzjTG8=;
        b=DZyVWHhQC3yG2y4pMsarwbDk6LdTx/EliWzJQ+dc2qKB4ywIjoexkgGxwhtH2d6JFx
         e8MwQ00OvMc0GQMujTtiWpR1zEdaVqmk4kz88q1F4ZAiibWeCeg2Y7V+PYf6fb54Isil
         0PWFciBnDLOzDDukTkB8sgxMoEIKwareZ3aa9Fh0RdRmJE7G5DnF/m77YXj2c5oI6hUm
         L6fqRJHoY+UCg0eF62tVdPpUQEfYm7YCt5Ux56pLxstTuj9R7iKldfbixbJkTeStpMiH
         5qxU2aF0GA7XuAqV8F3MRuIfj37AafwfxcktmLz8UdwkTJwpQZ0hR1gqEn90jBWL6l2w
         rWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759805; x=1769364605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cvBXEQRwk0vB9MxtistlWfSV6Vaus6aoeJvtQZzjTG8=;
        b=q6vT3ZW/MVYXClrdaJ44bRCsntDfNEuCxHieFrEtYNURmFLiY8zkwbi9D3qIjs6LgV
         jJM/Dd4wFGvNwEz12e9ObQwhDfe5OzC83wqyJzxrp58gRzpBVLRUV68YUkWa81Qr3f+f
         t+5cUDprREUW4z+lyy2wVkNmdJm/c4Zw4R38O+ApAVtluPI5VK+L753qCnwDLHqQeVHf
         ecDTN64XvUbQy+auz4Yx/AORluaeqLeAQJ39yIhyxjgPxy/t5dxu5BxwWVA66hCUK0vR
         l+H3PRFBM3w1zCLSZ4Febr/iHbSUQKCkE20Lc9wxBt5Ib7OZXHSziEBhNfE898we1Myx
         2BLw==
X-Forwarded-Encrypted: i=1; AJvYcCWF81JRqgjbaMQEjIfgHSBljAEw6KcLp695VkoS3ysRLrwlitG95Ddr/9wdy2Baz0JL1frTfr9u@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy/97hOjNtpJRDw4VaA12xzBfEBP9vNWyME1ahtrPnkyoRdU+Rb
	jkxCnd0taOBWwxpnYThK+0zrPg4wdbtwxFseMC2o0Lca0CJfLh4fb5LhFz0/AWe5KU60KhiFVKo
	qR0Vpc+kUCDQtAVvpToZTkQxvuCwtYj4I2gXyFZUfxgan/RmIBbspGledBmqBHw==
X-Gm-Gg: AY/fxX70XDWzg4DdKpgNgNw9FgNPjkjRzi/gqJu1vJMc3lja2jKdYd8VRzFjnt2Aoi3
	txWGtaUhfIuKxmv4KZ5zNkcbDBoU6/d6YoGN9DmPcfB4RoWbVY3jW5wGHnXXtMFdoJC+dQQX2Us
	BIfym+wuQLmB4Kyr3fHcTdUQqwdsem/DWmYbQr4pS9wCYvh6OcC1CT4ofLc6373NiDsP371WKEw
	wWejBYNrgUZb9s/ztIthrUR+y6I4QZQ2IV2EKa3jPxcPE4Q8D1iRALx3oszZknQLSShrH6SLqJx
	VOSUO6IWxrPdGSjL/OipAarXfpCF7WeJP7Dr2IRpG+/igR2Jfb1Byhwgf7/2JQs1+a5JLWZIaAb
	THap0mb71BSJIk4jM4fsZR/NQKSxZavJMjA==
X-Received: by 2002:a05:620a:2592:b0:8c3:7016:1d8c with SMTP id af79cd13be357-8c6a67bf39bmr1240340185a.88.1768759805378;
        Sun, 18 Jan 2026 10:10:05 -0800 (PST)
X-Received: by 2002:a05:620a:2592:b0:8c3:7016:1d8c with SMTP id af79cd13be357-8c6a67bf39bmr1240334885a.88.1768759804930;
        Sun, 18 Jan 2026 10:10:04 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:24 +0100
Subject: [PATCH v2 01/11] pinctrl: aspeed: Cleanup header includes
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
Message-Id: <20260118-pinctrl-cleanup-guard-v2-1-bd36f681bdc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2575;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=baKkcqSJ65hc0ts9jVcHMZU7FH4i9Uox6/iD2KuATX8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSHuEhmtjxve35yyh5CVKYE/OjzBr9jYAtTm2
 cuacE/vqP6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h7gAKCRDBN2bmhouD
 1+Z+D/9vnrXlH3u/GiXeOxQWIyZXbZQDkyEdActKpj2rvX7bL507HlztUm4KVnLg35wNcK5pjlI
 AB27rCgLeJSaUUY/Z1tYqFhPj5AMpwXMcHuMxxSsOZw4TZaGs8C74Tux+ZKoLxIjPHKBuGxhVTG
 xRvrIRns0lwCv3l1Vt61RY2eQWZ3cRzuTG70D1VNUCafSZyqBMfrseeOIJTQUka5DMx6p0OSCNh
 Pbide0KGADmwPF108KMVzyfXXSC7q3IhmoeLbX7y7tiru/iIGv623GQl0c3JCGE7E8wjQ+M8lDB
 CvSyDGn7tL9cDEbOm+G0FPZ9RXouXBE6EckA0eRvoQJGjFjdDAIc1Qai40rB+bydAmeDpHes8FD
 b9gsxIQnnhRFlHMwVSUB4QQ6Ue+xko4RD9aEy62jqjnnGbobSLUbADUwz+9ljllkjUsJo3MAwG6
 fwyIWtfhX9Hm0aMzMd3+d52ZQvzknxii2yMiTgrMsN/mDi0PAy647DljHlE2xCa85qCqU47Tff4
 V7uA0WcXPa4O0fVCDzDd4Eq5NRHKTtMDSMyx95WwGIp3uxnub4mphQkFe+0KnI/aXUX4PRJXLz3
 RiAGGtePI2G/UzMvmMhFoRFIFDBUBZVOoiZB1ZQ+re/oz01WEe6LXPUmCBORP+EAN2EtF3Ah6kL
 TBkAdeCK1+yugAg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=J5OnLQnS c=1 sm=1 tr=0 ts=696d21fe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7KBfExy5AAAA:8 a=EUspDBNiAAAA:8
 a=GlqkQvVaQCEososwM9MA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=eL7OMsOqQ-6kYQPn45L1:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfX5i4g5vsW6N9j
 9JI1FeZGsUS3WnNfMlphD5Xun1WNWJQAVN4FbWSUUB33hERiIivsBd/1EJihbPadlyNNUcmqAkx
 zZI3TZpN3FNMZAZAJOP7Lp2/senO+6pMtnTFcgJH9lJ82Aj4mlHbiGLJaTtRR0ccNOCIjYJYhds
 9knmqn4OX+tkzaj9W/vD4IfO7NopMXqZ3reYh1mggaIojwkuuvJaKuKj21rEt/9txX2eLv2v1F3
 S8P4qgR7i5c3JK+6Q6hQh0h3oTlsqtlMcPzjJINisG7nz/p0WZsJkxJB3onVqcVv/LcuEoCNJG2
 JKSF6D/ejXugAT3B6T7Drb02+Ww83uE+IpTdkcxGpAZsWiOWvkZfLWk7z9MO1fXnOnBsHwba/Xv
 RWklglMXtReo9/zClW3v7Mzs7ck1YrtAbReHsQ3A8gifTyUfV0IPKjcQmNsmk5EVuSZx8r61BEB
 vU12ci2r2hCfszecRgA==
X-Proofpoint-GUID: aWjEdvob0tcDvyxWzkUVzF5viTkO2AaE
X-Proofpoint-ORIG-GUID: aWjEdvob0tcDvyxWzkUVzF5viTkO2AaE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601180159
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Remove unused includes (no mutexes, string functions, no OF functions)
and bring directly used mod_devicetable.h (previously pulled via of.h).

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
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


