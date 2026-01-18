Return-Path: <openbmc+bounces-1226-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DEED39B30
	for <lists+openbmc@lfdr.de>; Mon, 19 Jan 2026 00:21:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvV2X505lz2xjb;
	Mon, 19 Jan 2026 10:21:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768759826;
	cv=none; b=DMS3MMnX9yE1qaFOj+z1JiET3lSEzClyGNXku+2YFk0UC344tDXeYSvHnZ1/cBWu1JJkyzAhZWQIGvkbKO01hX7oYRRZnXI6KWln2B2uKmJHkioA6JIFhUBiv8uIGKtj59YzLaX1pYzk8UyvqZQ1jmFp9EThbdhYPX+SxGFdGDaPegreAic9kMwWQxUZpXqfKYe8Cb7W7HCEpvDrwcoUvbTgvfKU9x9V4nK4E/1JBn7iC8Yvr0HEeTHsaKH3tyfkpdlaFyHRB4Cd5EdHlY1xnOcqmYEzanbJ0h22L7SiXeg53HX2o+xteIoia5cGN1LiJ4j+uQHYNFHKkh7fwIJ7Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768759826; c=relaxed/relaxed;
	bh=RvEwfJnzPB9SKmFVJEQfF/6xbtK/stkjY8FP5vkfIg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IeVUbExrVF6f5xvnR3C0foYgB/fObLl8TvwgIpkksTmauJ1RGcTbxJwXl6dkXLII2zBrjlK6/m0InFGJrDThmehe/RE40bqcb2Ex6r46bLe9hHtCOX/b+aKKvqo2jXbHg2p56ycRq+uiwuVNKNKarvIhdBNGBBH5XAu+v9eBgippPXel55pf47Vr2+PehCPmnEsIC0Gzr77xejuymjiF5kRJ2HkLNfo02NuoMh0Y3/S7NmwRWdFtDdFTJ2D3wDceWqYe26PaTZ4GRW7KWSioxhSzW+V9vLpWF8WREn4I96s7tdz2gDJkJnHQ5w2ittqMVW1w0dZsmzcZEwC4rEXO1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oRpcLxOS; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hy7czgWi; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oRpcLxOS;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hy7czgWi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvM812lzpz2xpt
	for <openbmc@lists.ozlabs.org>; Mon, 19 Jan 2026 05:10:25 +1100 (AEDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IDe7003281269
	for <openbmc@lists.ozlabs.org>; Sun, 18 Jan 2026 18:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RvEwfJnzPB9SKmFVJEQfF/6xbtK/stkjY8FP5vkfIg8=; b=oRpcLxOSIgnQcj/G
	yg8Hyar8Un3q7Ovi/gBJnj3R+oluHlUQFC1DHjF2h+VTk000kvwcmxlLWX/zOVUh
	w9fRrrwLuCluyalYVdPb3sZJZpCc/r/UNmi6zxL129lxgfQnpDDPVroP9f/ethIv
	c70ogb4hngTCCYaYJiWKzGJZLPlO4m8JtHNoJSa1MkMfEu7IoaWDAtkf6sJGjaRA
	ZsHfxqXTxLw9yGMPfIhg8nSFt/MiFAFZ+zVDeEuz121NLy0+IiSSFsIOgTKm5U4b
	S1oRRECpIpwXLg7Zc4h059rZyp9AmllxgFuqiGNWeKo/C6u4MPf7QevOiUl755ST
	oqvn7Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2guju2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Sun, 18 Jan 2026 18:10:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52af6855fso497422385a.1
        for <openbmc@lists.ozlabs.org>; Sun, 18 Jan 2026 10:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759822; x=1769364622; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvEwfJnzPB9SKmFVJEQfF/6xbtK/stkjY8FP5vkfIg8=;
        b=hy7czgWi7VmUQJij3tZd7A5zIFhb9iHBb6Kq2t7ZYW2wRwA90bHP7mPbfSMdmefPlV
         JE+f4dXHukxUoUU/8lqqdr+nfAttoHMhMzb4GFln+s26JLXAHUQPL8TN7XNYj3oeF20M
         pZ8QS7JecLMbbo1cUqb7rhnPHhNZIifnz+C68P2VHWrHFR6qLZR9T+DH7zFyAaPhfVY9
         cMDclCi1CqTglFPpK9FAIArwpV6aQMHbBotdCBwCciSD/ZYioxEESlPnTlTBAc69XUrD
         r1U0+jaaxCn4/usJGhV7akbUDRSaC0sQLOMwz/ZSVxzFhC/f+U+LXQZoz7MAN94TD99i
         Y+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759822; x=1769364622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RvEwfJnzPB9SKmFVJEQfF/6xbtK/stkjY8FP5vkfIg8=;
        b=VNf7pQ/A1V4uwkl1mwUep7t06oZ0RmHphdYrqis2MMzwnnqSwe59EzZRz+fmh3GML7
         T06o63ecNIEN7Yu63Yh0vBNG0xDNB6bCrdunb3Gerivo/7jTD3Adh2foTiRZpsYlnib3
         8oeAL//XWo5yrrSBkhVyrEpry1Qfn7DLkU4C4FRLgqvvB6HVUvOMiMoquMHmnns0FLxe
         fnbmin3yor8cY+q1EDXWAQZ1BE1gQWE5l0nY8s7OqpAmLRkQGummInuqPkEbkI2SplSP
         HfObKkXb/FcP1dlacu2ueCaew1XzI4Ky2wr3vw1H5djqVS1lnvdkj3gfgIYV94042hpH
         UqtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQIDKai/Nzmc3MhVVP/ffXK7OHwB7Q/4+jERbkrrtW2c0BexWy3Yl+ofyImhRmcHEBx3Pq56lD@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxJdarcRXAdz07nXZf2TY/L3Vw6WIv1RgdOvkNgvL8Kog7hFQeR
	YPUsJOxlz+PJPfFqsbj3yN+kSQ1obve+9/dsJxZDB2FZt011UpUFNzP30lIX76rjihIhTCtyGJY
	AsiXV7j7OiBj2m0kipTkn39MbYIrLwcr6oIQsYBVs3dlvLyjp5xyeZ/djEEQ2BQ==
X-Gm-Gg: AY/fxX5HnxPMHfOUdLAvILscboYcnWjN9VBldBZZW0lteFWRtGpLfzSQdMz3zsH4o0l
	MTbTCUTVaCSG172G8Q0W7nKvynt6nJvQ4PagMKcKUkpCLo9MOzlhjltmReTRkLWxIHAVDukXZZ7
	bU2+PrwppOGU3iuTOkqMX9LVgTRgAprAtUgbYZ5PSdSBHbPMXAHlvehMRLtUke+TXbVVbphTKoL
	ccze2jXUCMUiTh3wAirLUlau3tIRaBVyEi1Fr4x3Jlmp86p+Kk7WHGbIRVyWc9z4AWvc+RVLg5l
	VqMBGvkJBvzwx77Lfy/TiQGkvfrWOMcxiTqxFhHApFmXC8PQkY3Cq2+o8yJTKviGiZli09QuhqI
	H/b5YFS7tLMQ75nFC8Q2jQL8DTlBwBHg+YQ==
X-Received: by 2002:a05:620a:1a8b:b0:8c6:b315:1452 with SMTP id af79cd13be357-8c6b315184fmr728110985a.7.1768759822598;
        Sun, 18 Jan 2026 10:10:22 -0800 (PST)
X-Received: by 2002:a05:620a:1a8b:b0:8c6:b315:1452 with SMTP id af79cd13be357-8c6b315184fmr728105485a.7.1768759822113;
        Sun, 18 Jan 2026 10:10:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:32 +0100
Subject: [PATCH v2 09/11] pinctrl: tegra-xusb: Simplify locking with
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
Message-Id: <20260118-pinctrl-cleanup-guard-v2-9-bd36f681bdc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2035;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=FLZSR96VBkRrzhSP3/2OgTuUg9DxmOscsEadYFKjqPY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSH12QqDR9lyHrdfWBYKu5wDAWLJ9ZakzQ3LT
 0UuYPASn5+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h9QAKCRDBN2bmhouD
 12VHD/9unxdOGDL9Cvw8qMe+777M4gAqFDHe661yf+QCRAMfaXbN3WSV5wByRbqTx3YfWy21YOQ
 PmUn8RHfADZRESRLJ40apeyBHwmf+X3aiVzCvJrIhssAEg8e6K7zet9KS39Wxq+ggSw4RMklgwR
 648adqt9vMbooDA18DkIXowYvJNwPJKcEnez2js1gOhYtk9Et0iy/q7sWb1Pdi265zTYwxv9fSN
 1XA2P6oDR2vvTZGfRM3Y3qL9sYGLOq+7J9B2IhXGsT4h0bakUH/HwP+otw1LPAta+OerExiolHI
 mYexTPNF9qC1iJTWw9c0TKj9KMWD6/7qUHNH6Na0WwHWYNyqKi68kjfdg8ye2KAuFsHc4AFBrlg
 D4+GUG4Z5YjPvImtD+ZxD49iaeWlpHrIs9/oPs8qcDvb4tIp237aGABh+JBRAXZIneYCMNNZaT1
 StSPdDt7VhSHoNzlof1zSlpuaWaw1Pabz/Tr+4F1xEqFkZZFTdO26JMZcQMyZox72x7c/QHRR5A
 +YvVe+Z5+GsaGQttt1PTi5ccnDiKJoTagTW/dEGBAtL7aTvBTSan7k10tRuwFKj8ZWVzxHG4TSI
 Uw+E/NGfkjEagoYcsHuN9QA27EJwqMeW9WQTpq7JAAHx4NjypWFW+haLBXvrjgznmhZ8d0reg6W
 wSCbjewNTPr6JfA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfX6EcZlciUiCGG
 /PfLpM/ULpR0USXyjMDQs/vcpZidrGNB0n0K0JNYRCEQVRkhIla0SUZOJp2PmgKTWhYkYs/oSA3
 rgH+fPtweJv8a+esxY7sM/kHMk03IkTDrX57Iaczf5d6T00+nLgZNosyrFx657UG1cY9AcXx9J8
 rb8Lt6fHg2ouiqVRt4kMYReOLSAstkFZ/IswDhH3pS5NIsz/k13qIUm5FN75KgEGpuXcxZLu8oy
 kSc9G889nAgJuv1fwZa8eAZFTzpfEbMMJF1Cs7xWtTr42FnyoFZQcY7zoqF2FsAPIErdqkAgkdk
 JxxoKQAcN/ExdXjC0aohF5c+EkRbn3GpZzNqe2JHE8GuatY1X+UjVgF87wVcQTrfIcbzjWMn+TD
 7BH8d12n5I+9I2TG/0zMqlFdf5pgMEOboc6UD1YXSvDjvNYs0bgKA+gibSWywF3QXHeKQ/Dp6s3
 P4NIAvpymbDInYoWFxg==
X-Authority-Analysis: v=2.4 cv=Sev6t/Ru c=1 sm=1 tr=0 ts=696d220f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=aRO1tsgHJH1V1zxVpf4A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Rxv1tbGZwxR1aF6ffrT7kOD2HvQ3ynyq
X-Proofpoint-ORIG-GUID: Rxv1tbGZwxR1aF6ffrT7kOD2HvQ3ynyq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601180159
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Simplify error handling (less gotos) over locks with guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Drop stale mutex_unlock (Jon)
---
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
index 34a373f7e04d..c6a51bb21215 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
@@ -478,10 +478,10 @@ static void tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
 {
 	u32 value;
 
-	mutex_lock(&padctl->lock);
+	guard(mutex)(&padctl->lock);
 
 	if (padctl->enable++ > 0)
-		goto out;
+		return;
 
 	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
 	value &= ~XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_CLAMP_EN;
@@ -498,22 +498,19 @@ static void tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
 	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
 	value &= ~XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_VCORE_DOWN;
 	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
-
-out:
-	mutex_unlock(&padctl->lock);
 }
 
 static void tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
 {
 	u32 value;
 
-	mutex_lock(&padctl->lock);
+	guard(mutex)(&padctl->lock);
 
 	if (WARN_ON(padctl->enable == 0))
-		goto out;
+		return;
 
 	if (--padctl->enable > 0)
-		goto out;
+		return;
 
 	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
 	value |= XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_VCORE_DOWN;
@@ -530,9 +527,6 @@ static void tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
 	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
 	value |= XUSB_PADCTL_ELPG_PROGRAM_AUX_MUX_LP0_CLAMP_EN;
 	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
-
-out:
-	mutex_unlock(&padctl->lock);
 }
 
 static int tegra_xusb_phy_init(struct phy *phy)

-- 
2.51.0


