Return-Path: <openbmc+bounces-1194-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EF9D218D9
	for <lists+openbmc@lfdr.de>; Wed, 14 Jan 2026 23:23:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ds0xh5pFyz2xnl;
	Thu, 15 Jan 2026 09:23:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768404638;
	cv=none; b=NhwRR/r+zO2pN0VsUJzsuI0NLdI4/S90K4Ij9NzU3cAmiGkdFtpScfDZC8a2XW7wasvY/ORZCPGiVWsJB6LlAlhDiUmDf0WCnNavDvCCFxZpLygg+4xB1emOPhZDiZfIyPJKg6yd26XlRN8+CXc8lGxUaP87g7edFpd/VdxVFhm2T9g23bQMpNR30KGddfgAAAu19fc8WtMlqocmFCMx2sfiAMOnblWG0rdtaoYqeWfYavWjx36w1OEqYpsa2PpmImy3HgVxJk1q6uAgLa8Ew8OsWNm71caTGi+lQSJi7YgLcLNKH7/QUTSobPOanhM2V9o/Orjux3FB30dOrdY3jg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768404638; c=relaxed/relaxed;
	bh=VMrQrzLzDincZEvSf3IY0LWe8Yq0vnY3RbOd9IgAleU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PK5ExVLtyVVqRZt9p24AxVkzcWH8N4FiXAW2tHCe7U1zrIl1SiM7g1f6ZXTsKuBedf606SahAKbkR4uKZIxhl6QJoKHLKHLbDSplR9DCAaMd6XeyjayMrCsEUJ2FUO6W5bvlYvGYaTvi4anh7YyTV+joSJNJvWfBL2Y5CO3yD6DfcHQbEAsWTNYMXmLgBz991HlW3t5z1y9uEFItIQjmfPFXrhPO2q5W/O1WFNl5GdWVEr2zO7lbq9wSXCM20sUpCrMw4N//oZk6enhz5R7+Oe4EhQNwXXpRbsYOl6jtNpAcTm7b/8CFUNYRGvCoCp8IEB1kZOn4RgsMHxxVJg+oHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I6kkEHcw; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UNk7nMOd; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I6kkEHcw;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UNk7nMOd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drqnT1jvLz2xYk
	for <openbmc@lists.ozlabs.org>; Thu, 15 Jan 2026 02:30:37 +1100 (AEDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EFFxZC1942984
	for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 15:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VMrQrzLzDincZEvSf3IY0LWe8Yq0vnY3RbOd9IgAleU=; b=I6kkEHcwYHnmLqcC
	bCog3zsSNQt83q1g15rqSXMAHoCS6ayKBCuK/od57mJZRARRmEKWePBZ++KRDRFf
	nA/wQ3gmm9OmhEdA75fhn5wCblufkPBQS4FPjA1MLG8XjHUW5rpj3ThuLbR54inW
	ZC5Wo+bUgahzHKYqqo6mScjg1mnK/iL0PhMHXVhGcvGY9zbAELUEeRa23OKCvh3x
	urMzRY5AmgIdBLrvSeX0LZzwdcJr7L2+2n1AHSumMEuqSkZsHx4g6FgrUQB+0/FM
	xIJf0EElVUNgq68df0rWEdMcPXSuVq5wvOXdMLZwdMvExgqGYam5JXWk6HI6mWVO
	XotTrg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp7b6sjqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 15:30:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52d3be24cso190127785a.0
        for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 07:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404634; x=1769009434; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMrQrzLzDincZEvSf3IY0LWe8Yq0vnY3RbOd9IgAleU=;
        b=UNk7nMOd0iNoBtQj2IlD9wKZXVrlEHgR1NtkTf30PNJylPGrdu4y2pWTbPCAXkWyaO
         9c8x6FESlGaSiMVIg5T+sjVVlsqIBlH/bdackngzglEvNTKTFspWVrvg/6v+1j8pdaxD
         n5drQMdxxZwT76dZwTnikDREGhg0aMsa+iinfFpUKAoCFhFzK01y42oEfER9qEZDwIf6
         4I72aAVBbQ+ve7ieQ1j+5nv6zwXsbvWF2pF13DHe+Ct1ISDA+YDN0gcb4+HAEGHAFLvN
         VNnfDlVvbJBHrWoD5jBmUItOjIuEMGkruePhmO+mWIRFRmpBe5xdWku/DLt43Z6OL/Yc
         4gUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404634; x=1769009434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VMrQrzLzDincZEvSf3IY0LWe8Yq0vnY3RbOd9IgAleU=;
        b=rmFUJQM+TCUGn5vOVYL8eO7G+8CE5/FFA7Qe38CwsXtrsiLRmnWRAM/gP81AAq+YVy
         B88XE8DUnQinC6UkkEAfL0Ttq1UR/cV+GdkkPxlP6EHogjCI70Vv0HZP1slpO7hE69Mm
         t2kP8PMJObPRlp2UMcWvZxphXk06eCEGPRLxVkJPrX3VsNxThRMBtmom+pv+O28KUq69
         IsiCJCJbFT5ewciipED9J6GSXjcWsdo0YqXg39MJRpx9u7dzBTBuULS4vIfZlRYxcD3P
         ilyEo8jYcC65lHJYt26BnYcBUe0Fks2u7J/ONxuaD7X2irFwlxJ1EmEu1xRCQjpYpIse
         QhfA==
X-Forwarded-Encrypted: i=1; AJvYcCU/cUoYwgjAZNXGiBLuWC1JI1wttCaStF4QvbsF5XoKQSlkeTjrD2RVvPPSi0WZNzJAHGv25mpC@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwLuLPr2oKxILGAuqvFNwScvtrZCMaUXxRwbIf9i1lMkj8QqPRY
	a3OcZcdY3LsTbmJUUSuxoGamlI7V1nxkMYNl/P8CzxJdPuokgxJRN285khN2MJ/Y8Y8LBqlC0qT
	RbCc0z3JLZn3mjopGZT7lM3YkdGl6MzXok0azKhg9ZI1Y8YwawPhQp4ZhBFGbGA==
X-Gm-Gg: AY/fxX4RbIZUc6BA8rG8ciQ711P8UOxzvHa/fSp0rJSBKpUIevh3X+VdN4S0mRvPweh
	yv09UvOVvJsLy70JveNiQw0vNHV5LXtfjTTwnfUl+RLUp7MkDfyLKHBptqBSl4qti8Q/MRYaAiI
	CHJEAuNUBcvW87WXnXgG9nTxjthGmCj2OXo4jCRfYnwedaNoL21WK+cjsZ5KsbCywVLwznDbbQm
	iB/hUzllGT/u+pRhpBJWkHlW1xBMxnrQMEUIx3BN7otp7TWfhIlc0AZPkwzEYVW3O2t5+GDfRHV
	WglwnIny1LLcTFOuPA4ChyenOKPJdrTZnczJI+Rd9Sr3Ar4ltTVKCwMuMsC/3zID0uSYjpkS0ye
	uxy5z8h/5Hj4mwMADsgeImvHO3boyGxz5rQ==
X-Received: by 2002:a05:620a:4101:b0:8b2:d56a:f301 with SMTP id af79cd13be357-8c52fb32b67mr343234985a.14.1768404634299;
        Wed, 14 Jan 2026 07:30:34 -0800 (PST)
X-Received: by 2002:a05:620a:4101:b0:8b2:d56a:f301 with SMTP id af79cd13be357-8c52fb32b67mr343223385a.14.1768404633459;
        Wed, 14 Jan 2026 07:30:33 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:08 +0100
Subject: [PATCH 07/11] pinctrl: tb10x: Simplify locking with guard()
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
Message-Id: <20260114-pinctrl-cleanup-guard-v1-7-a14572685cd3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2163;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=adtV57CgOwnY60Si6YEP4k65ve4WmCO5x4rzf1ZqeaM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aFRdTPwiFL/h2YLFk/n9wL4n9QTdVBj0L6r
 8aUJ0hOsNiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2hQAKCRDBN2bmhouD
 15BvD/4sSskWeqqie+QnWNfV5njoEI/Dxm+OQU6hvQfAn6W+mFLEoVNCYY1DYciSU2Abpt2R3nR
 +qvBID4STILG6i8SyHTuaGcand6oW9yUTQpRJAmZLQwTU6t5Txha1TR6xku+5Oy8NyzMaHRuJTv
 +q5GGceQij71KHq+iN7y+f2Kh47ZLjY4bh5UEgUQ2UIoWQOKsKGVqFMR4D+URpgUMijJNLMK1eY
 OiA7jL0EBA0jRXolicdtAQTBVHk5WKJIlq2dKAIVzHYv12gvTtggiJd6gKyNR8t5tX+yOxZqM0D
 Jd4RwOyuhKazwxCfXv+bUlaqLfNnifpec2mksBSbNjseAfzxvkqxCt+VMZHZVoZ9mzpRmAppP30
 i9SP4gbwW16v6PBBhPIiLG0HrWfQ9XJ2JH7MYWKjn2JypFxHEA9Db766OZxcFqNRKVlsMAtIK06
 ZKalbIjY3hmQO2RLFsbhmE9qgNQm5n6vPYCORIFGTSFmcIKyeFghhXkkuZqhqTORTVXwOoPyhnb
 rrCyYVw4Twlq3ASI88CvQgLBkMD2dmqaPlhTZ37MJzVXVgufCKwBDhrq6xhuAlBI1vufryly9SE
 iw2aWK83dO7QfgeR/uYrjPKYMLwUfoTt6nq5Ph8Apc8jGok5zHX7/Xej2gYuXZnBbrTOGD48Hiy
 LRCCfd8e1rw2F9w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: jq_fyo3zeqhBPWQ1Gi3zQLOemFT62XbQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEzMCBTYWx0ZWRfX/nbHc71cepY/
 szlDUPm/igwtFJVVGSCTjPxJjZOLrF9zR/DJ1ud4gebRglhgo6pbDO8IxtP9lbge9rUezJUz5oG
 YDb7UbFu0bsz42+q3xcisHRRnh/AuDmwMypVXVZ8lEp2LyMfRX+mKorhsKdzAfDf/QiOKeCQrix
 DFq57AvPLbLvfMj/GDhUvnhWECZ+QBlSion9cUe8qrNiPvd3PNh4hvGWb9BUqd0qCrcDeHrwGPP
 aDom3VVI1UTfszCp/1W7UKrg1yjGEMewzSXD1PDNu3l1+0miY+JCGbe1UCOjYXW27dShceBLXrR
 ke60Kb/eeMy8PitcNAjLsWFJ2/wUS+RphYlNdgLYgnhfEkZvxTFtD3KQGRmMtywWYs7/Po+0Cn4
 q+q5QemncpMfvJn83UC787YEytUxqDV0e33OoOGerucmk2ddVLpnhZohdCGp6QawBGZnv5K6FFs
 AawyEZTMbYGVDcq6LNA==
X-Authority-Analysis: v=2.4 cv=W+w1lBWk c=1 sm=1 tr=0 ts=6967b69a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fB2tTgKqvhDdEbG57mcA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: jq_fyo3zeqhBPWQ1Gi3zQLOemFT62XbQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140130
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


