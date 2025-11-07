Return-Path: <openbmc+bounces-858-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAA2C420B1
	for <lists+openbmc@lfdr.de>; Sat, 08 Nov 2025 00:49:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d3G4r0mbzz30Qk;
	Sat,  8 Nov 2025 10:49:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762559388;
	cv=none; b=XQsL98d8GdXxFksTtcy0E9OnhRJWPWDb5XQEuQg52FxysAMD2ACW37S+LKZBpABy7nUB/IeJdo90BHr6+LS/FALybi/HH+x4/wCfv2FjWqk8r1vmlRyhOevjbcLOO9jmdSO7tvevlColA0lE/7CVPA7PwhQzysQNAWfPAoS1flj58Z/SLxMYNEhAUwbKeEOAWnCkwxVerNCDYXCXTT0mAMNXfObogCemfQU5W/TuT2xTChOu0y6qV4zG8+Ch5PmNqZpEEzft/T41+WLf5qyOpyFqqvkS6Y9n7I2DITC8xqd//ID5qsBY6G9gM5zDCvWpTRQx59tHPcmtyy2UoSLS8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762559388; c=relaxed/relaxed;
	bh=JrAmSA5BdwcrTdGcgekVRkIjRdfQs+pfWYGhRccUzVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TX3nJea3XJ+42dxOuMPoVDGjjzn7POYqgGHQ1uDDrF+N22Jw/hIKKts61Fh6gR/zZvpcd+9RmuQk/5fTIJ76dwAmgJ6vpcaqtMA8ghz5YWzjNG+2kLem7g/zwQlGddLmcoVeBp19xIaLbd72QevhiUxxIrvghOSInM6Lff/pVLuXrPJ1rkMyte/1QJyjyOkar1Hu1gUoALqm2VZu4VFgzfsm/q4YTRHRGWNPeHGUUEUQjSKNyFoDjSq4TtdGjRHZmV/M8MOxRJYbLZOL+nUiN6o6Z1byi2AoAdPBsJbLSWOw1HW8NN5Gop/wMy/rJxpOTtOIXOkbUjIQNBViDybDVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OgD++bij; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OgD++bij;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d3G4q18G4z2ynf
	for <openbmc@lists.ozlabs.org>; Sat,  8 Nov 2025 10:49:46 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A7INsPQ001084;
	Fri, 7 Nov 2025 23:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=JrAmSA
	5BdwcrTdGcgekVRkIjRdfQs+pfWYGhRccUzVE=; b=OgD++bijhOJ3+i6gBF4pD4
	f9R2OPsLCdMQ3V9ZMg7xHOyDl2vqgr7UDTwFq7qeYgRFv3YqCWFy2Jks2+YUi0p7
	E0x0s4uOvv7crKi/wzZ4nusvExUVsW61Tt2BE0XDSMACtkvEzxgExQm7NdwblW/w
	UznEPnKGsZJ8v5ulCmuSn+FzlkX7BHfwP43FuPmO/zuz6WAgC7BRSTY0HOvoBq0q
	Fzzt5C2uU5Fl44enNtC1ObUKzNuapFoN88dVCfbO68mCgZomc0pUvakvm41rL3AY
	B1yq7DlP7D/zyQ7HVs3NPetgq6b40OBCfM11ziqYSP/0yuRzF00dfX6r5mDgh7LA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9p0j9420-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 23:49:35 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A7NnZfL023197;
	Fri, 7 Nov 2025 23:49:35 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9p0j941w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 23:49:35 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A7Mpkx1018784;
	Fri, 7 Nov 2025 23:49:34 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a5whnwagb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 23:49:34 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A7NnXVL56033542
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Nov 2025 23:49:34 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF78C5805A;
	Fri,  7 Nov 2025 23:49:33 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D2DE58051;
	Fri,  7 Nov 2025 23:49:33 +0000 (GMT)
Received: from [9.61.104.176] (unknown [9.61.104.176])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  7 Nov 2025 23:49:33 +0000 (GMT)
Message-ID: <84354d51-bfa2-4d6b-895f-f9cf610d4bb6@linux.ibm.com>
Date: Fri, 7 Nov 2025 17:49:33 -0600
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
User-Agent: Mozilla Thunderbird
Subject: Re: UBIFS errors since Linux 5.15
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
        chengzhihao1 <chengzhihao1@huawei.com>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        linux-kernel <linux-kernel@vger.kernel.org>, sethjenkins@google.com,
        adobriyan <adobriyan@gmail.com>
References: <068ba254-0053-46d5-bff4-74c948d2e8ac@linux.ibm.com>
 <55378147.159026.1762545799936.JavaMail.zimbra@nod.at>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <55378147.159026.1762545799936.JavaMail.zimbra@nod.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: L0WOTQbhFUvL-8cou71wMTniaW70b_Zq
X-Authority-Analysis: v=2.4 cv=J9enLQnS c=1 sm=1 tr=0 ts=690e858f cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=JfrnYn6hAAAA:8 a=i0EeH86SAAAA:8 a=voM4FWlXAAAA:8
 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=pGLkceISAAAA:8 a=nqgInfV_ZEBXBheio9IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22
 a=IC2XNlieTeVoXbcui8wp:22 a=HhbK4dLum7pmb74im6QT:22 a=cPQSjfK2_nFv0Q5t_7PE:22
 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDE1MiBTYWx0ZWRfX1k3PHk+j8Dt0
 cMZeqSga0+OjtpH80ajmkygex0suaKwe+TwcNYuL8T9jFP/tBGUC+4l+KH6iWDlncnqaxWIdK22
 IC5L7ew1Kn/uYLDliSK5BztvuY7+1dtC7k7Z02UhAbKnktuE8Y2LMokd/2H8QWcr+EGAZfojysP
 kS9iRew5NDcFn3ZKPMUC1aV5E0Rq8dClw3UMNnSkgxK1Nq+dS4cPPMDF4sJuUwygKs8BtvZ7Bwh
 JIKUtCXbh4eCXT6SEmJO7hjg85z7VwylqrbZAO3Y/qxxXxwu0gXwd/IjT2IpTwkN3xeiy0y86kO
 TRTbDJe9XIEFZKR+8ClqKMkLtPZtBWxV/TtHTkNLoAHO5/GrC0i/4Y8aE/Pld6IEu7ObeVxneSz
 I4btkb5k+BzGG+aVEhWFfXJW3z+rbg==
X-Proofpoint-GUID: -SncNA1_bQtn9klT9qKdm9kGWUfGckyo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_07,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511070152
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 11/7/25 2:03 PM, Richard Weinberger wrote:
> Eddie,
>
> ----- Ursprüngliche Mail -----
>> Von: "Eddie James" <eajames@linux.ibm.com>
>> An: "linux-mtd" <linux-mtd@lists.infradead.org>, "richard" <richard@nod.at>, "chengzhihao1" <chengzhihao1@huawei.com>,
>> "OpenBMC Maillist" <openbmc@lists.ozlabs.org>, "linux-kernel" <linux-kernel@vger.kernel.org>, sethjenkins@google.com,
>> "adobriyan" <adobriyan@gmail.com>
>> Gesendet: Freitag, 7. November 2025 18:38:54
>> Betreff: UBIFS errors since Linux 5.15
>> Hello,
>>
>> We are updating some BMC (Aspeed AST2600, ARM32) systems that were on
>> Linux 5.4 but observe consistent UBIFS errors with Linux 5.15 and later.
>> The errors seem to vary; there is a sampling below.
>>
>>
>> We performed a git bisect and came up with the following commit, which
>> of course is completely unrelated to UBIFS. Reverting it does prevent
>> the issue... Does anyone have any suggestions?
>>
>> commit 33fc9e26b7cb39f0d4219c875a2451802249c225
>> Author: Seth Jenkins <sethjenkins@google.com>
>> Date:   Thu Oct 27 11:36:52 2022 -0400
> That's indeed strange.
> Are you absolutely sure that this commit triggers the issue?
> E.g. if you revert it on top of 5.15 the issue vanishes and when you
> re-apply it, the issue is back?


Thanks for your quick reply. Yes, that is the case; it's not very 
logical. We are currently running more extended tests with 5.15 with 
33fc9e26b reverted. I assume the potential for corruption is there 
without this commit too, but somehow it doesn't happen.


Eddie


>
> Thanks,
> //richard
>

