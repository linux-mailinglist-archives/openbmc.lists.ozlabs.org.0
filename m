Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6BBA726A7
	for <lists+openbmc@lfdr.de>; Wed, 26 Mar 2025 23:51:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZNMT96Xr6z3fpn
	for <lists+openbmc@lfdr.de>; Thu, 27 Mar 2025 09:50:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742965459;
	cv=none; b=Xr6N7LJrJS99buAJY2psRhPX5FGsvivecZEsi/MKJqqZoFEMfQxuHRH1Cu7RdnX5EJbBPTneklipcsjqUOPOaKaVR9PwekSOq3SmQWQC/kXoR+t2+C4yVhA95+1erYxjhpJwNJLFnN7S7qbpnUFz0L+RHB9RKB5xTVGpeUJjfSk0507/A7+fzGJFuDSaiwrBjaEGHuCke9yEPPFV0ArlhllZsCUsFieToKI4PYhpUWs7Sge5VzEcQBdmVCUfMQKwOkVEGRCYt2TcLCJ+HYicIaSlYNZoiXWir6Cfubg57qQ4Z1o4yVfk2cq/48vW+BQUIUJFGRozZpppsaztIXV+pw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742965459; c=relaxed/relaxed;
	bh=ordMkqhPURoJANwH3hW5zg5e3kC1S+uEc5nh5B32xAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=j88Wstvh97kS1fDJML9Njf1X9Lz4WGSY7sXjcYk1U+pX5rnQiMRpJb6BWPKOOTElvguW+1Pz/fcAefj2vYfZ+IgDL/zuLKetkSXRI0iLQTF1Itt9tFEhNwar13NMkhZq+Z5zjxiWW7x681UKtH2IzE+PVHSdEzfGB0bakQ8IOBe/MCEHDKx6kpeAAbjmVqWpUsNLx53Vkz38aJ3u2UxrrbcjMQvUGYcVdWVk4FI8rlnbyRbToFLHD7NCZgrf+bkJP0C/UnqCejjLyBd4SHDgZeNQciuACOESllD+YiG4XWkuZw9G8NPfy2PBwyKyxe0zcCfP8Y/N3rEz7A/I+G1eFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pJMddc46; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=quic_msavaliy@quicinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=quicinc.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pJMddc46;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=quic_msavaliy@quicinc.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZMvpV51vFz2yql
	for <openbmc@lists.ozlabs.org>; Wed, 26 Mar 2025 16:04:18 +1100 (AEDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q4XbXE023552;
	Wed, 26 Mar 2025 04:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ordMkqhPURoJANwH3hW5zg5e3kC1S+uEc5nh5B32xAY=; b=pJMddc46Sbrx4PRY
	PaT1C7P9CDYlP4ha2yn4gQshzS6byxHd0lV6i2Wa5EmzZriSykW33nRWTrQElk2S
	S0YHavkeUNvSjpw2bS3PpNxoGqdyL6Pz45ST0PtteSAWLYZoyLoYHp0SqWE4AU8h
	wgb52PHJ1Oy4BVk0PAoUH6ePlXdmZVm6UEYPY0pO8oU7kJ2E3DIK7ySRd+3NwF/x
	GUCCoBSWgf2DmbBCw7jXh19J4HvibBd5SohGmJlbwrg6bekGc0y6of1YeImWJhaO
	4YN8ez/PzOT6lpasOl8s+lIAu8wUFU5pvFeska7m4mrJ9bUtblzxreyi7ysNWZhB
	aC+bOA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45manj00p5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 04:43:33 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52Q4hWp2001689
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 04:43:32 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Mar
 2025 21:43:28 -0700
Message-ID: <ced540e5-7804-4569-9805-991a12d43c22@quicinc.com>
Date: Wed, 26 Mar 2025 10:13:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] i2c: npcm: Add clock toggle recovery
To: <mohammed.0.elbadry@gmail.com>
References: <20250324203233.1266772-2-mohammed.0.elbadry@gmail.com>
 <20250324205901.1274708-1-mohammed.0.elbadry@gmail.com>
 <20250324205901.1274708-2-mohammed.0.elbadry@gmail.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250324205901.1274708-2-mohammed.0.elbadry@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MHwPG1N0QwuRxFb7A_k0yYQtV68e-Nqt
X-Proofpoint-ORIG-GUID: MHwPG1N0QwuRxFb7A_k0yYQtV68e-Nqt
X-Authority-Analysis: v=2.4 cv=KvJN2XWN c=1 sm=1 tr=0 ts=67e385f5 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=XycGwPUB66WHHuA_nGUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_10,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 clxscore=1011 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260025
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 27 Mar 2025 09:50:43 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 3/25/2025 2:28 AM, mohammed.0.elbadry@gmail.com wrote:
> From: Tali Perry <tali.perry1@gmail.com>
> 
> During init of the bus, the module checks that the bus is idle.
> If one of the lines are stuck try to recover them first before failing.
> Sometimes SDA and SCL are low if improper reset occurs (e.g., reboot).
> 
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Signed-off-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
> ---
>   drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 3ad6124be80f..78c85015d955 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -2043,10 +2043,14 @@ static int npcm_i2c_init_module(struct npcm_i2c *bus, enum i2c_mode mode,
>   
>   	/* Check HW is OK: SDA and SCL should be high at this point. */
>   	if ((npcm_i2c_get_SDA(&bus->adap) == 0) || (npcm_i2c_get_SCL(&bus->adap) == 0)) {
> -		dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus->num);
> -		dev_err(bus->dev, "SDA=%d SCL=%d\n", npcm_i2c_get_SDA(&bus->adap),
> -			npcm_i2c_get_SCL(&bus->adap));
> -		return -ENXIO;
> +		dev_warn(bus->dev, " I2C%d SDA=%d SCL=%d, attempt recover\n", bus->num,
> +				 npcm_i2c_get_SDA(&bus->adap), npcm_i2c_get_SCL(&bus->adap));
> +		if (npcm_i2c_recovery_tgclk(&bus->adap)) {
> +			dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus->num);
> +			dev_err(bus->dev, "SDA=%d SCL=%d\n", npcm_i2c_get_SDA(&bus->adap),
> +				npcm_i2c_get_SCL(&bus->adap));
Should combine logging into one line. First line you say they are low, 
second line you are printing the actual status, may be conflicting ?
> +			return -ENXIO;
> +		}
>   	}
>   
>   	npcm_i2c_int_enable(bus, true);

