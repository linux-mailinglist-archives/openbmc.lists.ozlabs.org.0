Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D88ECA2
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 00:17:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tJtG54WczDqQr
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 08:17:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tJsK64VzzDqNP
 for <openbmc@lists.ozlabs.org>; Tue, 30 Apr 2019 08:16:20 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3TM2PJ1070474; Mon, 29 Apr 2019 18:16:08 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2s6917hpwd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Apr 2019 18:16:07 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x3TGIq8S012554;
 Mon, 29 Apr 2019 16:19:59 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 2s4eq3rkqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Apr 2019 16:19:59 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3TMG5HU21430416
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Apr 2019 22:16:06 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6CF01125B5;
 Mon, 29 Apr 2019 22:16:05 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 668FA1125B9;
 Mon, 29 Apr 2019 22:16:05 +0000 (GMT)
Received: from [9.80.207.28] (unknown [9.80.207.28])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 29 Apr 2019 22:16:05 +0000 (GMT)
Subject: Re: [PATCH dev-5.0 1/4] media: aspeed: remove IRQF_SHARED flag
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20190425222040.2413-1-jae.hyun.yoo@linux.intel.com>
 <20190425222040.2413-2-jae.hyun.yoo@linux.intel.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <c387f18e-9a50-94d8-0473-ccb8905b4be7@linux.ibm.com>
Date: Mon, 29 Apr 2019 17:16:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190425222040.2413-2-jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-29_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904290143
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 4/25/19 5:20 PM, Jae Hyun Yoo wrote:
> Video Engine has a dedicated interrupt line so this driver doesn't
> need to use IRQF_SHARED flag so remove it. Also, it'd be good for
> following what Thomas recommended in the IRQF_ONESHOT support
> patch like below:
>
> "Note that for now IRQF_ONESHOT cannot be used with IRQF_SHARED to
> avoid complex accounting mechanisms."


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>   drivers/media/platform/aspeed-video.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index 9da61beeef52..4475c6e6d0ae 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -1616,8 +1616,7 @@ static int aspeed_video_init(struct aspeed_video *video)
>   	}
>   
>   	rc = devm_request_threaded_irq(dev, irq, NULL, aspeed_video_irq,
> -				       IRQF_ONESHOT | IRQF_SHARED, DEVICE_NAME,
> -				       video);
> +				       IRQF_ONESHOT, DEVICE_NAME, video);
>   	if (rc < 0) {
>   		dev_err(dev, "Unable to request IRQ %d\n", irq);
>   		return rc;
