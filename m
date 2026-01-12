Return-Path: <openbmc+bounces-1170-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B27D15983
	for <lists+openbmc@lfdr.de>; Mon, 12 Jan 2026 23:41:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqnRF1WS9z2xKx;
	Tue, 13 Jan 2026 09:41:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768214487;
	cv=none; b=LaM63TmorLXi3GrRaGAzYrPo25+C0gMeQMNrPvmshFsgytUT4nGEGKArAK3p9xcJLdGglTuAJHcCOYaSxWffD7HcH+KN9n6Fk+lKoNj/HwlxDyvPaZobk3zHg35+JwhMJ5tHzhM37P239fU/d00sj8CQnOOsvv4n/ddFtcnOSGBIT7qApGuV7qIogtFe0V50Vn0uIgZzK3oVcMLnpn7DkSt2xCNo9/5WYUtZHECSflaYw3Y6mAmkdywMlNPnwrtTq+VIsMk5qgOvEVIuPySqo5lAhq8ftRmXk5shmS1c9/PtRD2ujMp1y7wDOLpB5sLDqjdebEI8DwdYNOHX2fWZyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768214487; c=relaxed/relaxed;
	bh=3QWgSirYzzznIwBV9Rl6utuizoHR4CF5kfxtFtGNuPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R9bc/WwsJVnwFZ1mloJHKC02sq2kut4Jn+9vLrDX4zo9zvA3R2HY6ASp/13c7RRtrO9fI+rR4Yadn2gIelGXc/LVb1abpYwJ672tA1h46uAtohggZ3Jxmhs9LW2cXaEvnRFl2gw5Ei+IEPWqhxFyTUowSf5KouRZIQanRsbLsIqKmV1fJnj6R7D2HCU+/u8w6ppvKa/gwIDjIhQWlEyQ133fnMuW3z+rj2c2DBxqshkI+WuNLJkcZPZ8ZZG1TRNREHqakBZkIXwkBq7Z3hNKAehswLGInEOFnaG1j/O24nCrdr5sv6tNlCCiC5YHO2DbvPgw7Tk+BQBWpijrGyQfbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=otdsNDEb; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XWMXOB2+; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=otdsNDEb;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XWMXOB2+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqTSk3xkxz301Y
	for <openbmc@lists.ozlabs.org>; Mon, 12 Jan 2026 21:41:25 +1100 (AEDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C7uDlx3232586
	for <openbmc@lists.ozlabs.org>; Mon, 12 Jan 2026 10:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3QWgSirYzzznIwBV9Rl6utuizoHR4CF5kfxtFtGNuPs=; b=otdsNDEbba2Yd4Ir
	EuxYcD828lRecEgPcHnDKMFjawb6ulNWlOGzkem7mE32lBqYarViufT9FW3Mrz0V
	bT8zHzsQf3GIzqqMXJGsqfRGnrwZp1FolsOQKKnyhKclbEQE2AJ3bvAvKE8+n+ka
	ub3A6cni5D+tYTrdN8ougHTj+XxInIkrSF5tiZCw+PZihJS8G1vAD3UhsQAZwGk9
	C+L9H8haI4Vp4nxZI1pCg1Wp+X+2yYekq42dWR9i/gNuYrUk/fLe5AprbP01h64+
	8kMewHoKoc4FHyZOg6A/cTkj29HyLzRoIrAP9wrl5bEkSzNn2Bz6JUTo4iYH+y4n
	8LSD2A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bke3e4p2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Mon, 12 Jan 2026 10:41:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb3388703dso2569673385a.1
        for <openbmc@lists.ozlabs.org>; Mon, 12 Jan 2026 02:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768214481; x=1768819281; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QWgSirYzzznIwBV9Rl6utuizoHR4CF5kfxtFtGNuPs=;
        b=XWMXOB2+/TC1uWDFUoUkmxJlPT75kZL6AMKPBHZf9MnXqeCpIDh//BiBWEHhofjV37
         NcYSZVun9/adApUkvuBUr+zK5N0dQdT0HD7qRKXlsyH5FaQZe4O4otBfC9CM+Aa/x/JZ
         rXsDr714QGx34W/v+qPrSpUxpu6w88G7XG0htTcvG+XtxReD5Rj7Dcx847U6drBiGEyC
         tw84Cnaf00oRVbtYBpVSlmwPwuZabV6IvTgux9bQr3Z2xBe/cATEcmdJdn0Rxlwe+KDD
         WjDeFAIB4YcSHHzv65O5O1uOhM8dujmtCtvosD2xfS2VyyvOQnc3tZiy0hZc/FZiVhUQ
         57Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214481; x=1768819281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3QWgSirYzzznIwBV9Rl6utuizoHR4CF5kfxtFtGNuPs=;
        b=AIiICfCbhnz7SEOj/gD+ADCDTmAOuMyIqVdqEqPrFhDDlmg1TPWyfKDLL0sWPR2TS6
         y4wXVNqXRK2n7w8UVWJkxp2Sm1HX5IxUOE6/4WVuoI9UCvcBi825luffY9v/PcWMaeVh
         c5IANaRMMdHJWKikYj750PhN4DviG3qcAS4qimNE6z5dS8KEghsSaBtYaHUOOwZk8gT6
         oele6jhKYvdTOmgeU9hzgfWMCiexklAhUv+P3K+161yHATs2qwMB6WmcCfucSTGoLVFf
         UlEbCiRkgAgFD0bHWPWRtor+k7PEjQEXsyJ8FCbk4x8SG6Tl+xcDJ9IuAM03kCg9JhGA
         aQiw==
X-Forwarded-Encrypted: i=1; AJvYcCUPJ309wtiS8odWvkpbbodaoLQZaoxGeBzZTiYkCFjJ0VAnQGe8acVnnn5UbY9DyS64rRTnk64z@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwSEA1QVaK2fUwJW5/0NOJdqBOogp4mnSpqa5Fioj+5UxPjSHMn
	PUTG/+t4Oomb7XceyTp6rBTSj96CHPD8XgmHSu8/w+rOJDYGzoXGHB7lCCTU79JG8PuahSQa5Kh
	uKCJ7dZiPlHb87F8PXNgl3ahoITzoI3kQl4qEuM0qtKP2xPIWhuiDsPoYpzrMtA==
X-Gm-Gg: AY/fxX7n71E5xuHN6uy+apIG7SQJyiMf/ESMKuCLkBXVDMnggDbA9z5RswaNkr2ceUP
	SwCVNbP4ms+k1cs98StHzr/lqV+Y8tqO8rFfGd5CXvEWaU9L35LT44dTkw14T6nMEMcPIjYO7/f
	Eo50DZx0SLuRTTuiJBDHbX8qhQl+DsTn4uFXuS/Leysna7oC1Naz0wK7QT+YV0FrkEhyBJSyvwo
	E1/cPfYQiGuNMSkJWpjUSI+PcDQZd2covkbYTaWit2Xcu/lMgiP1ksQjzm+KWHphjWlCo5lRGLi
	/Dlbpbgh7zY4n8TiZfaU6lcptI2wtWNZ6orODggtTnW2jKJ2+o75uV1YARCAZThJHkJ2phcJNGo
	5H4Bnl5dFIcZqyq6dPLmar9EAgLGgAHUgdRHVCJM=
X-Received: by 2002:a05:620a:4512:b0:8b2:dcea:fc78 with SMTP id af79cd13be357-8c389379cddmr2455489185a.16.1768214481435;
        Mon, 12 Jan 2026 02:41:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnMJKdD7TnoiXuy9wag/M2gnhHbRsN2onqBx2A3Hz1wFnxTGgE2cSjLR7f1TtAtXTfMYr5oQ==
X-Received: by 2002:a05:620a:4512:b0:8b2:dcea:fc78 with SMTP id af79cd13be357-8c389379cddmr2455486985a.16.1768214480994;
        Mon, 12 Jan 2026 02:41:20 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:eb74:bf66:83a8:4e98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e1adbsm38437424f8f.17.2026.01.12.02.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:41:20 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Swark Yang <syang@axiado.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, Tzu-Hao Wei <twei@axiado.com>
Subject: Re: [PATCH v2 0/2] gpio: cadence: Add Axiado AX3000 support and edge interrupts
Date: Mon, 12 Jan 2026 11:41:19 +0100
Message-ID: <176821447522.14821.3003241286321804635.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260109-axiado-ax3000-cadence-gpio-support-v2-0-fc1e28edf68a@axiado.com>
References: <20260109-axiado-ax3000-cadence-gpio-support-v2-0-fc1e28edf68a@axiado.com>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vzZ4V_GLXdb4TDPVvNjGeZcCoYq3JOK1
X-Proofpoint-ORIG-GUID: vzZ4V_GLXdb4TDPVvNjGeZcCoYq3JOK1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NSBTYWx0ZWRfX0rC3rZChT+GT
 HDZ7HhQqXFQwKq2jyCN0NJbb0+N0s+mme2WMoj+UCAuKF4zOaEWT1a4P5jU97s9iNpMqlYTZtL8
 YJLCnD1s2wrnEDNjri6rCSHUGW+opZV5u/9YwKWGxA/5W1ak3/2r/9K6k+41sQpoHmaeL5Sb79C
 aeAFDQfWgTX2YPi/gNT2hUncxpofl8d6fyKUmcLp8IHhORwu93QcFUpOhGmyd1uwg1WZSrBbJve
 rT9Zja/2qQZeaayLCiraRXQMobs9oprfkVABkOzJoJ6BVzQhqZy5MtBw6CSLF+YmtIGKUSYISx4
 2BhYdREKM1Wvfh1ma84iOONodzuqbLAjoIGmteCk59VgHH0Uja12L0W0lchRfStLClWkbitzDoq
 MtqT5PemD+0G2yT/0+sEjFqpphLvMtY280wQS2uQzab470N7GIY+sDcbBDViKroa/bixlwWTd8B
 jqtHDByKtsoPWo1o6aw==
X-Authority-Analysis: v=2.4 cv=Dckaa/tW c=1 sm=1 tr=0 ts=6964cfd2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=bCYjfYi5PzCXYrtmsVUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120085
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Fri, 09 Jan 2026 01:26:05 -0800, Swark Yang wrote:
> This patch series updates the gpio-cadence driver to support the Axiado
> AX3000 platform and extends its interrupt capabilities.
> 
> On the Axiado AX3000 platform, pinmux and pin configuration (such as
> direction and output enable) are configured by the hardware/firmware at
> boot time before Linux boots. To support this architecture, this series
> introduces a platform-specific quirk to skip default pin initialization
> during the probe sequence, preserving the pre-boot configuration.
> 
> [...]

Applied, thanks!

[1/2] gpio: cadence: Add quirk for Axiado AX3000 platform
      commit: ea5b4c68e097412f2d3ca13314b672837718a446
[2/2] gpio: cadence: Add support for edge-triggered interrupts
      commit: 43f37d44f2b8a75a896e218bac1e43d75063f8d3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

