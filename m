Return-Path: <openbmc+bounces-1074-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A2FCE5B30
	for <lists+openbmc@lfdr.de>; Mon, 29 Dec 2025 02:46:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dffFX2vvhz2yFg;
	Mon, 29 Dec 2025 12:46:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766580288;
	cv=none; b=bp2oNtjwaXI00Kqi1zee4y+lETMqmKLCUw+ehHpLsOjOWLme5ZU0gyR4XKaxcCe2/bG8CUg8D4f1Tl8G25vePYF8zHaa2NdPehhObe5VZMT7ly3uixNnoh/VxV8rdC/ys7qrcZWCK9DJkLcoDqimMsfP4BF6n6jrJnRpPImrY8eiOjKyrV35+2ZpaK5andblQlhXnBOeMKyK4VwW1ZXdvXZqVYBMqAS9NfVi97qItv9Bo17bK14Q6ZGNW33GLu8GV5fOQDKKz3eo0r3DZCV3VWP5diY+NgiGr9x9MkZEihZgzMGlW1NsfSTSMvvKaSDc+bL4COeai/P+oI8NKc1SOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766580288; c=relaxed/relaxed;
	bh=Q42Wt6YQQMyV5WzJ6PsXaJWt4ok5u3HGH6HCtPPT8tI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CqOzJzheb0L+ayVZZqhFHfAQBSYNmjpNg1qMX2D3GoQxyFdPNqIE2povQHMgK9Nh/ybaEK+EUqz+PPAqArRuBTvNr/oKURabUeTbFXFguiYHwtr+lccl3IwJn08IVu5uFwZofEe49etl4acWe5kG0wsFRUjmocmHdTpR04a8Z1QTNmJPUlFK2bogMTXjTZu20tktab2I82NYgM7EyE/1I1oprsGONty8xTz7G+cBkqAG4nq3fTN34sjRiWRKIE2mli6rrglBUQoMgDctq2IozvMFO300/erbjOPXfBJW9WZ7deAS8qStF37V5y6zQRFgIodRxQ1z4E7/qsrIWQGdIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EyG039ql; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J92ZsUUA; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EyG039ql;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J92ZsUUA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krzysztof.kozlowski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbs5q675Zz2yMv
	for <openbmc@lists.ozlabs.org>; Wed, 24 Dec 2025 23:44:47 +1100 (AEDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO7uCfZ1056162
	for <openbmc@lists.ozlabs.org>; Wed, 24 Dec 2025 12:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q42Wt6YQQMy
	V5WzJ6PsXaJWt4ok5u3HGH6HCtPPT8tI=; b=EyG039qluJLQrwOHYmf1TPfuYqJ
	EUv7Si2+J+Yn4uUZQAHmtkD2Rg90l0SeNMEz7XgDKh4ZAvhfjTvU6b40xhh9vqya
	QYhhgscCfAFpUCr9EdDFV1TbT9Oy9DALM839ltVE0aOmedJGJxfCfuESXwvCIf/v
	IX2Q2vjQlSkiFafQ+8THJPo6azKMMB1TBtzM22/I1bP1r9J4btfzErn2cuRYDcqo
	tejMeOlQkNLjqgOTx1J6AGwl8GpWyoiKnhdoYtSj/NpOWP/DCffI+IcrS6e0pYfu
	CZkTeai7dCau3/EpMmdrrzO9YvxPQ8mQ+ThyMmbeK5CJqbGYLttAosUY+Yw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v2erm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 24 Dec 2025 12:44:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edb6a94873so114771921cf.0
        for <openbmc@lists.ozlabs.org>; Wed, 24 Dec 2025 04:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766580284; x=1767185084; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q42Wt6YQQMyV5WzJ6PsXaJWt4ok5u3HGH6HCtPPT8tI=;
        b=J92ZsUUAHwnbNDMI0/52jgGXL7g9n8vc3qQZ1oanAyPmfyMM77Qp2vWSmwHVOQG7/o
         0iNUwdot3h44kMlE47dG5rrQnhppYOUzTjavvxDanTIV8YMqsU7Og6tY6Mg4AFYk/MuL
         zh2tmHG6mSiYbMGH/ctXm35zx/fa461cJI2p+/k0oq5Kq3I7Nq2Vp/+W1NyS5W5IN6wk
         fRJFBXiNj4gVeuGRfkuN5EBOQnmKt9NADRQPLsIzkueQHbSsjnYDPiSDpDunnDg8tItp
         kHAdwWnqRKKa75uTPzWDDGcL65CxgqfmX8rvlGldGQcDU+mOOd+0v54aDIeGlce2vr5C
         krMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766580284; x=1767185084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q42Wt6YQQMyV5WzJ6PsXaJWt4ok5u3HGH6HCtPPT8tI=;
        b=krYNh9isyQZ+TNurIWQpDPBQK6s4eMuctnUndWtTaj/yJV0sw7zg6EGWKYU9WI2eH/
         JpG1IIE7suowuNTX7GLriC28OQIFQDfczKba13wMrzxLRYaT1sj2sefAedvlZl+9GMwS
         uZwuvznjzCvCt20UaCWbgcmoeWjVnFnZAgiOJpD1qpPuMYwPzucyr5AG7YPDGKHVpWvt
         TcOcgqoJUImX8SEm+fXdNeEOuuBx3PKXwQKO81YdEme6uMjkb503IVkL1i5Nzfovp2MW
         7tdmelYj9rJm0SU3dTSQkb3yq0usGwzLqFGOQf+jhxasuGwymt7ri0nkcGC63T0z6emd
         UyGA==
X-Forwarded-Encrypted: i=1; AJvYcCW0szzj0uLM3QmiXUzu9YBeK7f3p3ndcrzKDBXtlpYZYfcQOnjsUje1njgASZLWslfwFBYzXQkp@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxXh+OBLX9gD0heSgbGZwzdSIomk+ow48pOTvCt+x+fIT8DmXeX
	xKO0Nfz13u0cdcgko816haeEZcJgh/VfHXr1jqBwftnV4PJAtVd0d4l7fTAtUpu0QSyg8vpXS4V
	J5WMxBRF2nKm/go1cZmOKG+5qzg3/6pkdi0rS8Iz3yyyYwCADubAXDDmo3eRJHg==
X-Gm-Gg: AY/fxX7cG/aJZEH5u1wfBVhOhZ0Qijm8bHbB/cSr0qbC6IT31vob7r51jukebH+T7u4
	YXJ8N9pcZ+cxiMNxWe3WnmIcPNcz5npjl11gqMqbUImXRlqZP/3DHXryBgypSRBePqBI2p/iB3W
	vdldYPmnCGNtvsdfKVeLNomZ09eQZi+WmUm9tQ0emei2XcA4aR3XTVatSQjPXbfFpulOrfObSmi
	wf56ibsEFUcEb4HVS7cK9IB0E1cigf0b6lQd6VximBZuYuSzVuitP0qexJMXolGgCOE232JO0fa
	PP+i30gUmvWI6IAkzz6tKWv2ZX7GdLhOtRFlIf644QVqffJmAdnZe6riN4XwyKycGVGxriaVfpK
	zJZaUgrhLS5UchZKLyWsf+g0drrz2XKQK7Bk1sEXhAng1HerwdsmslZyI0D4HplrK05IFlg==
X-Received: by 2002:a05:622a:5c91:b0:4ed:dcf0:6c42 with SMTP id d75a77b69052e-4f4abd8cb47mr285724301cf.40.1766580284053;
        Wed, 24 Dec 2025 04:44:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6SEHMYDYA8cOoMdGU+wI1nJZyyHIVwBwMN0zDb8qXgGwcSCAA2ns9/RvpbF4+vcO82fQYuQ==
X-Received: by 2002:a05:622a:5c91:b0:4ed:dcf0:6c42 with SMTP id d75a77b69052e-4f4abd8cb47mr285724031cf.40.1766580283705;
        Wed, 24 Dec 2025 04:44:43 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159a6d0sm16832679a12.28.2025.12.24.04.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:44:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Aubin Constans <aubin.constans@microchip.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Robert Richter <rric@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Adrian Hunter <adrian.hunter@intel.com>, Joel Stanley <joel@jms.id.au>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/4] mmc: jz4740: Fix Wvoid-pointer-to-enum-cast warning
Date: Wed, 24 Dec 2025 13:44:34 +0100
Message-ID: <20251224124431.208434-7-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=951; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=2mcyqiagsyS6KbHVm6G4XsCoUJ2/y8VeNfievVmr+/E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS+AwLY++OPJe0PmtQ519o76/sm2PjQUF16HOk
 5iqYI9gB/eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvgMAAKCRDBN2bmhouD
 18i4D/4yKnoNGj9XpY+uqY/3QBwS5rDae2aCSD3dEpBSWOOULCNZiFsS1J55iA/S2FXDgqAr9F3
 ckKd+btf1+IFsLDViCAYXw7uLQeSeOmvLWK+ra9wtVw2Zp43jK6FRIZwfGtO581/yi4ugP9snz8
 pahyOm9mxmpCnrc6Io+WxpDN4w2Fiy45MrdkXDXaex95uwShbSPrGHyO6y3yOHPi/wyk5kD5B/m
 uW9j/KUatAOWoi6nXS1k0d9uKc7URL89nuGuuh84WLnfzBcgFdGp58RIffvya28RIdhu37sObjJ
 Ec2BSI8YxhhuaceTY9AbfQxMvMQx0lrZNdSSVcwSsiAa+UO0oC28mimD0wMs3FcQkyzWDA7X9Pe
 5ErZ4zczTBfA6iU6r68IIbYDBpEcB2bUZvcRBOgUh41ZYEGcoRDzCO1WPLXE7FHuvxocAqQoW4u
 f4hywtji9qeLHRe6+KCIshDCJjRsD8OinSUPQrb1wJgWlllBXd5HZE1oFknBrzKTq3nlE/ycH9q
 UWat9qr2fi5qeXsRKA3ofMyxButI9zWvOlY8Qa2U3WRnHewg84VcGpJVDjQf8i5kVHnruSHANVY
 wtpCrR+aH0q64B5p1JLWwY+ErdIISyVeUe76i7y2aNq7e2xGc1amo3YgbMBT7QCe8aO4SoHKjoo taDYynggtM6k2dw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExMCBTYWx0ZWRfX5np0k1L41hlC
 GzHTpVGyYVg5h2aVgsg5WAflBkMP2r6k9VxWA+k6RxB9YXCMVyMf+rEFCBjfobBX0WxbyIKGjsP
 zfL6jAyPMO2MOnejE1yHG92mNLS5S2nLIZzXxK1JFCT+hnO+Ex0acrUENFfCijKRUCCKeeP3wpk
 CaVmFsn88eECG/boF/9rHsFcT9FCrX0D2I5hpRZD9uIzF3tQ1kCNxJjug36LV5P0ygLGGPLcrtX
 FUwhK19jnFafS+CMHXNq2PU0tG47SEiMzV57RHtJIC4RihPSLcvlzwxY0BM91K0yhZxeGnU+C0t
 yhqJ6NJc/P0aPhZBE2quFCebvVqWtrSbwJsHv6v5/VS6ayo/5yBGsH5Gbzo0CJxQU+WzjrcXfLO
 sxU7RoR69J20ACxLKc03FVci0Wvy47qzmRM4sJNoPNPK3O3O2FyGo310WqINMxPczhw7gweVz4G
 nuU/4f07de5sD02ZbNA==
X-Proofpoint-ORIG-GUID: 2fJTayBx5m8T0O5QZaYFYNqnJAKycS8H
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694be03d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hUqV6_F3YIy6dExb4dYA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 2fJTayBx5m8T0O5QZaYFYNqnJAKycS8H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240110
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

"jz4740" is an enum, thus cast of pointer on 64-bit compile test with
clang W=1 causes:

  jz4740_mmc.c:1055:18: error: cast to smaller integer type 'enum jz4740_mmc_version' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mmc/host/jz4740_mmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
index 6a0d0250d47b..6a3c26b7c82d 100644
--- a/drivers/mmc/host/jz4740_mmc.c
+++ b/drivers/mmc/host/jz4740_mmc.c
@@ -1052,7 +1052,7 @@ static int jz4740_mmc_probe(struct platform_device* pdev)
 	host = mmc_priv(mmc);
 
 	/* Default if no match is JZ4740 */
-	host->version = (enum jz4740_mmc_version)device_get_match_data(&pdev->dev);
+	host->version = (unsigned long)device_get_match_data(&pdev->dev);
 
 	ret = mmc_of_parse(mmc);
 	if (ret)
-- 
2.51.0


