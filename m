Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B288DA726A3
	for <lists+openbmc@lfdr.de>; Wed, 26 Mar 2025 23:50:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZNMT22B3Dz3bwF
	for <lists+openbmc@lfdr.de>; Thu, 27 Mar 2025 09:50:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742964373;
	cv=none; b=UQwm9iDPj90plR+Ko/ZglbYum2r7mDJvr2w9/ZmIJkB1SaXC1s5r3ytcX+CgKUySIkwozVGWSUYVljGAdMCtARmtNgHfW3sSDR1Yalrzxll8YH4/o9+nstxVMTiiImdW9KqyauHsqswQAtnanNf6YN5SYF8BDx9IVt5CRpaYklEPdMaF4Ow8P6GH1QhHK9zS88JIiwufaJQzOK/38u9Z8fLaHpfo2FNuaXGlUzQfNKXlpD7MXlzks5Dhi9eEQiJ7OHGXl7+z5kuzwNFC8Bbin3lL7uIl9pcyKUcwy+jLjnqx+Iqo5WGYCx8sbMQhMKM6/HbL0DChFHhooQNc3wHBBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742964373; c=relaxed/relaxed;
	bh=weWf/etmMjUF0Qb0F8flw9F+ix2U8LpDumfAERq0wIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HCGNgp2VQoOg9HbIRYIrZ5hUP8btadJ1D0vuyQBSTM2u6XOHC2/4yd0TGE9cLCwYP41ybZNBFZA8oslNjZuZV33m1s4caPAsH9r4jiKiRkM8u4wiro9VhWneAchkO9ns1fOxQopd68aBM91Fr1KcrSGdR+XWr/eTgpWogL8Vggqn3bS9owloRXJPla+MN2Z6CYB3mhzYb8WLV2W1eJ1T4HQFjmKSWUNzaQEBm9GUbHF9vF35eVFVU3LrbrtgTRxMyDooJ+U2ppyaTi9qPE6XQqRrhKR5sAH+aqbNdJZX0XG3gCHLx60LCXzVYt5rcffQvIiJEBysU9ls8xcrRABfnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KbjRNdC9; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=quic_msavaliy@quicinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=quicinc.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KbjRNdC9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=quic_msavaliy@quicinc.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 140 seconds by postgrey-1.37 at boromir; Wed, 26 Mar 2025 15:46:08 AEDT
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZMvPX5QVjz2ynR
	for <openbmc@lists.ozlabs.org>; Wed, 26 Mar 2025 15:46:08 +1100 (AEDT)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PGahFA018583;
	Wed, 26 Mar 2025 04:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	weWf/etmMjUF0Qb0F8flw9F+ix2U8LpDumfAERq0wIo=; b=KbjRNdC9g+pJre7T
	8v4jMcyHIMePqKPaXihKmoO45L27P6ejDBpny+VfK5k4FJyoPVJ29NhB9BkhqIRC
	4YhftUvL/kqDLMpxY1ldfDgKgHwXawTRm48ESOsEbBaC/yuavIaM9kWz7s4UhjJQ
	N9Yl+Bvvz2EnBt3Ql5sT2wgi0YQ8p/4ONUOT7Fi2XfjikQvKWR8foXxv+ZphG4ZE
	64H8q3aQA3GM8nfVoDrs5OJ9RU+SC4XntoltuQ1Cv/H+IyBV7zqW2hSwOZ7Duo+Z
	Gkj9l5wl7o4SG+1gGQBI8k86bmWub4EWGnIlTp01tZ1lOxBzioiJw++vyOPXNsk9
	WpOZDA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kyr9heu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 04:46:01 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52Q4k0He006920
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 04:46:00 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Mar
 2025 21:45:57 -0700
Message-ID: <4025b7b8-e4ea-4853-83d9-7f9fd0d0f159@quicinc.com>
Date: Wed, 26 Mar 2025 10:15:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/1] i2c: npcm: Add clock toggle recovery
To: <mohammed.0.elbadry@gmail.com>
References: <20250324203233.1266772-2-mohammed.0.elbadry@gmail.com>
 <20250324205901.1274708-1-mohammed.0.elbadry@gmail.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250324205901.1274708-1-mohammed.0.elbadry@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ujOo-8RAHsdOMXFr2ttSnhpHxo-yvLlT
X-Authority-Analysis: v=2.4 cv=UblRSLSN c=1 sm=1 tr=0 ts=67e38689 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=vFwDpYeKrAHsOwN9NGAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: ujOo-8RAHsdOMXFr2ttSnhpHxo-yvLlT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_10,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 mlxscore=0 impostorscore=0
 adultscore=0 clxscore=1011 mlxlogscore=676 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260026
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
> Hi,
> 
> During init of the bus, the module checks that the bus is idle.
> If one of the lines are stuck try to toggle them first.
> 
As such there is one file change and single patch. You may go ahead 
without cover-letter. Just my thought.
> Fixes: 76487532f797 (i2c: npcm: Add slave enable/disable function)
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> Signed-off-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
> ---
> 
> Tali Perry (1):
>    i2c: npcm: Add clock toggle recovery
> 
>   drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 

