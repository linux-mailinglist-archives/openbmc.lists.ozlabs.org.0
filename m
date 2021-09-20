Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1AE412404
	for <lists+openbmc@lfdr.de>; Mon, 20 Sep 2021 20:28:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HCtNq6hhHz2yZ6
	for <lists+openbmc@lfdr.de>; Tue, 21 Sep 2021 04:28:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OVl5G6xY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OVl5G6xY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HCtMY12Lsz2yYd
 for <openbmc@lists.ozlabs.org>; Tue, 21 Sep 2021 04:27:36 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18KHT9aH013197
 for <openbmc@lists.ozlabs.org>; Mon, 20 Sep 2021 14:27:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=r2/IbahM/Ef0LaqS4/KmHzwDAxSsj5LRk/mzRvEj5Us=;
 b=OVl5G6xYlVjhLkhCIrLko1nwKY1/KEFuQKNY4nrSRxKtTuqKN1tjeqqg84xSuYfOJpYq
 sbbIE3SPLPQFcQyj38SixmEZDQKE7FZ7woc8smrTiqY7nT8o9r9q3DaNC6jfkX7SHPo9
 DpfuU5sVWRZV9SFZTAn0r4MY8uvmLrrakdj7TlZmoAhj3WjI/SeZLqkGb2rO/+pJUNXj
 6qLwlqtSb+VfpbISqvNBgSCqKFdYgIeALbnHbbaqGvP0BlDyfMtUwo8bdMz4nLwo+lEr
 uyOq3yFVe+BxUxfQfGBDh8w/yZfcuyHHIB78+SJUkq7ytGb57JjAzMyjqt1EtwAlHbp3 IA== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b5w3g31qu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 20 Sep 2021 14:27:34 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18KIH55K003395
 for <openbmc@lists.ozlabs.org>; Mon, 20 Sep 2021 18:27:33 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 3b57ra7cxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 20 Sep 2021 18:27:33 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18KIRVIJ52625908
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Sep 2021 18:27:31 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B3876A054;
 Mon, 20 Sep 2021 18:27:31 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59EDF6A05F;
 Mon, 20 Sep 2021 18:27:31 +0000 (GMT)
Received: from [9.211.87.144] (unknown [9.211.87.144])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 Sep 2021 18:27:31 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.10 v2 3/3] ARM: dts: everest: Define name for
 gpio line B6
To: Ben Tyner <bentyner@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <20210920150549.6431-1-bentyner@linux.ibm.com>
 <20210920150549.6431-4-bentyner@linux.ibm.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <29a94d80-5890-114e-1d7e-7a84ce141714@linux.ibm.com>
Date: Mon, 20 Sep 2021 13:27:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920150549.6431-4-bentyner@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JKMAetZOqAewKr7iOv7Tl0TStWtFgvBE
X-Proofpoint-GUID: JKMAetZOqAewKr7iOv7Tl0TStWtFgvBE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-20_07,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 mlxscore=0 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109200108
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
Cc: Ben Tyner <ben.tyner@ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 9/20/21 10:05 AM, Ben Tyner wrote:
> From: Ben Tyner <ben.tyner@ibm.com>
>
> gpio-line-names B6 set to checkstop


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Ben Tyner <ben.tyner@ibm.com>
> ---
>   arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> index bc21a7f56642..789462827db5 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> @@ -248,7 +248,7 @@ led-pcieslot-power {
>   &gpio0 {
>   	gpio-line-names =
>   	/*A0-A7*/	"","","","","","","","",
> -	/*B0-B7*/	"USERSPACE_RSTIND_BUFF","","","","","","","",
> +	/*B0-B7*/	"USERSPACE_RSTIND_BUFF","","","","","","checkstop","",
>   	/*C0-C7*/	"","","","","","","","",
>   	/*D0-D7*/	"","","","","","","","",
>   	/*E0-E7*/	"","","","","","","","",
