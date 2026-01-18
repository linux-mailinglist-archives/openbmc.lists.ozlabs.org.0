Return-Path: <openbmc+bounces-1224-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4847CD39B21
	for <lists+openbmc@lfdr.de>; Mon, 19 Jan 2026 00:16:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvTwq2hv1z2yDk;
	Mon, 19 Jan 2026 10:16:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768759831;
	cv=none; b=QSU9r6aNtzw2nJwpJHXMrerQKt2SB/XdPsOIA0ciDl2Q/b4ghd72zWyPhSJw2hIazK4fYAOqVyQQ3P1nzgL8KJJhyWSnITBgbcV2gJHN3GX+/nRUBt0L9b4dxJnfE8kPFwA6WCpXPk+vq3SAAG2JUoygpq4eCB9c5dtf6Nqtf4TpEOH9wwB/oyBopQswCnV2EuNmD46dDSAFCFM1pxWuFfdMLn1NnGGIBTldABx6MwvWHV6aoHLIN+RXQ66ALlS63x+ykLJD0nRyDuttQe24I6LGjou54++GH7wy7Vn+x2gnjV5DtBAfVsf9YkpegxGmCetu5iSPLGxfsLiX3urFjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768759831; c=relaxed/relaxed;
	bh=N48lIvtnLb2IcsLS8pOSE3K1e123fF19xLaS4IvtzNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kvqiuDtYD2UbQjRl/CrJD/4eSXDdAxuwvPKwRvZd6X7h8xtMobVkUJYL1fAPFRSU0SiaVTMvysCxXZISSebSZpuO0RGfBgRl0K5IHoHz5uyybPCj8aFX6MGAk920bJfxTdFYJnQMQ51m4ZNvujnpjyR7arv4lL3I8vypvcYHqbBsKKhuTnK6ELKMfaA3nM9g15TH+hTy2AuQfph5nHczF5DeWxokvlhBeLUSZ0GNzbQQ9raGeSGSeVDGYd/9fgct/UhK+UgaNJditXti9SUX8W8FrIOrfGQWR0xO6B8CVeslj1I+maFHyfsb37SEAkb94igqyp/3hMXCN1MJU0nV1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CAJnBbDn; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VijULM9A; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CAJnBbDn;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VijULM9A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvM872FF0z2yFW
	for <openbmc@lists.ozlabs.org>; Mon, 19 Jan 2026 05:10:31 +1100 (AEDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IEhYTv2847004
	for <openbmc@lists.ozlabs.org>; Sun, 18 Jan 2026 18:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N48lIvtnLb2IcsLS8pOSE3K1e123fF19xLaS4IvtzNQ=; b=CAJnBbDnA61W8ImL
	SnAgPRZ26uidWw6/crkIz13LXLfpToynIHrH8fGSxXxetED4wm5RJiZrZDg3rIfp
	I+yQhrd1CBcJ2Ad1lFGyf0FsGqwUca3zvkkfCL3ZCW32iOW4+BU+zFImpamvkP5L
	3osMGujdYac1/k+nkBafEmhc9umBL/i3W2CHMm3rb7+w1xHJXWCVXvQUKh2K6id9
	bp6GniMk26pToQycFEVVN2Av0pqMYej4EFc/gwjGx53qUMEe/dVECDdxjQSVVBKJ
	QGMQkydLLEne96NU+CuKEKwSYdrZH2VFYby+MaKWI8kzKlyfM27gyaBY1pIwxY0N
	TkbXFg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2ke2rbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Sun, 18 Jan 2026 18:10:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6ae763d03so210443985a.3
        for <openbmc@lists.ozlabs.org>; Sun, 18 Jan 2026 10:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759828; x=1769364628; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N48lIvtnLb2IcsLS8pOSE3K1e123fF19xLaS4IvtzNQ=;
        b=VijULM9ADTLsnQZuxZthlECci0BtANMzXWDRexoYl7Rs/NogKweMhLC8zA/0J/tY4U
         wQp/Anf034Q8gwLNbtJivkAfnXUFd/ZTqRgZp4TqSd/o9N/QX9GpqGNAM/khagbhWcn7
         Z7VP4+n1dZCukptNfhRM6opjORaqR9g6cyQnkPy263uutZ3CA8BPBoEVCPi//3Gr7RBi
         fvRG6b3MEo9uW9YBtX+8D87wd2ZhAmKwKdQwXG0WlMZKWkEus98cfrvnSsYND/zL0gL1
         fdu3SChNNpbfFd/TYFrf8lcJTEN1sXYw00zZhTz7+t+DwUTq6AYwX18p8d4b5h66vIJY
         mD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759828; x=1769364628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N48lIvtnLb2IcsLS8pOSE3K1e123fF19xLaS4IvtzNQ=;
        b=WiCpvMvDNtx1fvMnpTWu4ma1uoBnmS62HUM9uIkw1H8b8Rsev3cPdhGvnfCU6+qMHd
         lmWiw2Lk/94RcKI6B3iP85BT0HsClVAd8pveiUY05slYpaZgvw2eoKuevRJvbr1Oy9DQ
         wAd43T6tW2ZovYO4DW9Vzf9h7jfU/Mzm27+XAVckcH5V29VVm5qRz+1UqW/vNcibpCYy
         6AN0zLW0XHHlVwUFZEKzAYNGsxUew9/jucaZBICQhTQ7dA7JT+RI1nWLaq8ZVg3mwpY9
         HZCauBf4DURBeLRs18SgaD1dvo+jVk++tRTTvWhlNbXtOrKtEVZ/EY0OtCyb6XAoiA+C
         kvmg==
X-Forwarded-Encrypted: i=1; AJvYcCU4pBcAV7MCmj7QV5/MzCO0bZieSpS4sTdguxYALDeqlYAVcYqdLoB8Jt/dMjJCogKnMTXIUKee@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwhPo0gFNM/0J1N7YWOL+Tz4fRDLcAqyPmCc+VD2RtetvjpeNpj
	PkTewYywgWl6a8mu0eGFibO6PGSMTvyY+RsevxSE1NYh+FrBlAozC0WyPXro1HbvH0dezqhzNhp
	JC4m74o3DsJGScgLh27hK/N/B13imsN2hBEsG05BX67p7S/czg4ShP+77W1DdaQ==
X-Gm-Gg: AY/fxX7PFSUezsYfkpCWrUBtQqjrnSn6hU/rXrRkv2OhMlRPN8m4Zm+FDmjALISi7r8
	SRNIooXKDQzs74hdy1/k1IDf0924jIvhydieunE27I8JwwMdY+Gl4MsligqtPZ7dfkdf8sF58g4
	wXIDZH0mRfPlPemlyrARhtYrZ0lEmcDBS2/sAV3kcKbGbexQqDHLt8JZW1A7NUCpgj5kTEBfCYo
	U/Xq1uSTbk5lg4LqCi5oyDI2lrcej4F3Wqta/+gmwCVZzn1L+PK7QCndpwdmdnYnyuLfkI0GT66
	ldwiolCXn7aktQVO9pqsj2iqb7LkffP2ec4EGP5/cAiw1aVQNhKRfq+PB0x5h8bpS/scFBwkn0B
	OhFwFl+TUZ3+aiqz3qNH8KaA8rpwA4KGVCA==
X-Received: by 2002:a05:620a:2808:b0:8c1:ab1c:f2da with SMTP id af79cd13be357-8c6a67b79c5mr1285494885a.70.1768759828483;
        Sun, 18 Jan 2026 10:10:28 -0800 (PST)
X-Received: by 2002:a05:620a:2808:b0:8c1:ab1c:f2da with SMTP id af79cd13be357-8c6a67b79c5mr1285491785a.70.1768759828043;
        Sun, 18 Jan 2026 10:10:28 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:34 +0100
Subject: [PATCH v2 11/11] pinctrl: st: Annotate st_pinconf_dbg_show() as
 holding mutex
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
Message-Id: <20260118-pinctrl-cleanup-guard-v2-11-bd36f681bdc0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1221;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=k1GvsBNYWO8pFPyazMMNabsh3Vpjdc1LSTY4GGhIuOk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSH3xTqF1UPuWpw21q5i4y/0ItOY7uFl5LJRk
 I/zBJTe0SiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h9wAKCRDBN2bmhouD
 14rID/9CmPz1fyhRfWxv8BXOtmT8JzPxM3Qn1vrvoEw3Redb2US4V07grJBDpsNMH2yrzXble41
 qSybWyUX5o3mUWc71wO3IsMFu4uIK1mOxv3WeIRfETEaVH6Sn7DYx472fLtIqS9oZ+qA+sCBJja
 VZqb59C2Wu6FxIQy5jRXgkXFhzpMZX0nRzYzDwyQb/gPSnWoiBOSRkxbAxvnAWqmPNWAHehSuS+
 S3lTrzXTkY98p1nxFqfdeU8afywPvhvwDpfmevQNjxy7iF3EVPf2z4pyHTOQREBUBBmC1perTa0
 ANxtLXo2E8BaPttpb8EoZLHxfX7PIAA3ibfLPS0dPI9Yhlhkq9HgRSbSvTKCGxLSk4sxrjTofoP
 8reJpHpMVSLdOfwPApz5sWcX+oq/L74sPON1vtXunQcS1QSf50DL+Abn0WjuoQWPqg6LsySITQc
 oE9X/C6PfDtxOP7YFCEU74SomVt5ZtAwYGK9tgAjJIhKXro4U0APc9TE5T0ekdeapQyKRAkQIlh
 2oeg70iEhT2N/f16R6mk9EaIeneSiNYN/wqgMiPo418GRPwnMZVANUWr/har+gk+z3ScAHAYU4w
 LCmu/3TUFx8+BZXGjyqMjtcINUApT5RxEOVxvgAkv9Z4jn0eIIZd+UQuZn5nKG9jKV3FlgN0K7J
 BiN1rYOCb1j6Hng==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfXxpHumGD3+Tuu
 1SHikcftHvAed+ccnIp7DOk4Ghnt9n7TWeXjVbutbHSJudKqz/wboCXpdIlU+dSWWrK9SXNDnPF
 BFM75LrLC4WgbfCXONWFgaT8GuMqnD1cyqQK6OMNeOok2lDnDHtTPplL+8on9HULRrl66dh9y0V
 5IMj7UdqhyR4GIoTH4IfQOsLtYvO84UaK6IGHLb/NnSZj2ryWzWCtk+5rf2UnTr4YAKZK3t+3KM
 HAlm1lMIR1xh1Wp0YBl2GKNsJA+PQ/FAhOqbbb3+hUR2lAColJVtqF4yRlxM5lqQtELQ5tTYJG2
 uxeAPk0c/sFKB8ocvSQLLBx0NcyGcsPoSstDozWayPfsPAaoC4LGnsJWDkNkSRExvxSHb8sgefv
 D4y7jm9T5pqb+EFxZIV+4DkmLwXtK+gOudsCDNpxVSKq85gvlved9541UJJEBPYlOdm4XdxKQDz
 SQ0w3D0b79ImhzvGeKA==
X-Proofpoint-GUID: 8FWCVNeZj1prZuu3tQimPyUKCxTFr7R2
X-Authority-Analysis: v=2.4 cv=EJgLElZC c=1 sm=1 tr=0 ts=696d2215 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=EUspDBNiAAAA:8
 a=RIxbnQC35JVfspY8PfAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: 8FWCVNeZj1prZuu3tQimPyUKCxTFr7R2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601180159
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

st_pinconf_dbg_show() unlocks and locks the pinctrl_dev mutex, so it
must be called by the pinctrl core with the mutex hold.  Annotate the
function with sparse __must_hold, so any changes in pinctrl locking will
be statically detected.

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

I think this is still useful, although maybe a bit pointless if core
explicitly always locks every pin_config_dbg_show() call? Anyway,
pattern of unlock+lock feels to me like something worth annotating.

I left the patch at the end of the set so it can be nicely discarded.
---
 drivers/pinctrl/pinctrl-st.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index d3cea3437d7f..8ce88e591f47 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -987,6 +987,7 @@ static int st_pinconf_get(struct pinctrl_dev *pctldev,
 
 static void st_pinconf_dbg_show(struct pinctrl_dev *pctldev,
 				   struct seq_file *s, unsigned pin_id)
+	__must_hold(&pctldev->mutex)
 {
 	struct st_pio_control *pc;
 	unsigned long config;

-- 
2.51.0


