Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 339C57BE18F
	for <lists+openbmc@lfdr.de>; Mon,  9 Oct 2023 15:51:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EZ0CRI7w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S40nN05XYz3cTd
	for <lists+openbmc@lfdr.de>; Tue, 10 Oct 2023 00:51:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EZ0CRI7w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S40mf3m32z3cBK;
	Tue, 10 Oct 2023 00:50:58 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 399DlQpn004790;
	Mon, 9 Oct 2023 13:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=pw+QQksQadWIgnFZNk+Puxy7QV1QN65+aZdJTCJHqL0=;
 b=EZ0CRI7w68lI6zyNV88ta/P3spp/w3opYEhPt91FP+yxWfQ615I3XTiRKDmgAS0KqyDM
 3udZ9apSxLuMPSmwJIa6ZE8hItLUbUUGdT7ekKS8GKXTRNIQXBErgzNeja0DOjaOvioN
 f+Gmh2vG4Uy8Dk+OA8iQPISl1YwAkF0bvWZ5DFM0tXlZIed/RoEqmZ1B7dxPFD3LnZmr
 ucmPSTpGtM84M+twdSOtNFLTRqThYb0VHVxJd7U/UuJz/in+gHuSP6ALpeeWx8KC8jDX
 tjw2UgKYWrkKTKsGeWI1gupsyGsTWfgFk4TqvZ4NBIQ0hivHpK5mUwoshi55NqSfzp4a Ig== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmjq8840b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 13:50:25 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 399CkiDM000693;
	Mon, 9 Oct 2023 13:50:24 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkk5k94xk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 13:50:24 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 399DoNNX63832530
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Oct 2023 13:50:23 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 538C95806C;
	Mon,  9 Oct 2023 13:50:23 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 15C425806E;
	Mon,  9 Oct 2023 13:50:23 +0000 (GMT)
Received: from [9.61.118.13] (unknown [9.61.118.13])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Oct 2023 13:50:23 +0000 (GMT)
Message-ID: <a606fd9a-5cc0-1158-e72e-f675f19c9dd8@linux.ibm.com>
Date: Mon, 9 Oct 2023 08:50:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] media: aspeed: Drop unnecessary error check for
 debugfs_create_file()
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jammy Huang <jammy_huang@aspeedtech.com>
References: <20231007084339.3160130-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20231007084339.3160130-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: j128ooKeKZHll53gcka645iUhCJJqyIV
X-Proofpoint-ORIG-GUID: j128ooKeKZHll53gcka645iUhCJJqyIV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_11,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1011 phishscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090113
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 10/7/23 03:43, Jinjie Ruan wrote:
> debugfs_create_file() return ERR_PTR and never return NULL.
>
> When calling debugfs functions, there is no need to ever check the
> return value. The function can work or not, but the code logic should
> never do something different based on this.


Thanks!

Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Fixes: 52fed10ad756 ("media: aspeed: add debugfs")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Suggested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> v2:
> - Remove the err check instead of using IS_ERR to replace NULL check.
> - Add suggested-by.
> - Update the commit title and message.
> ---
>   drivers/media/platform/aspeed/aspeed-video.c | 15 +++------------
>   1 file changed, 3 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
> index a9c2c69b2ed9..d08aa7f73d4f 100644
> --- a/drivers/media/platform/aspeed/aspeed-video.c
> +++ b/drivers/media/platform/aspeed/aspeed-video.c
> @@ -1970,22 +1970,15 @@ static void aspeed_video_debugfs_remove(struct aspeed_video *video)
>   	debugfs_entry = NULL;
>   }
>   
> -static int aspeed_video_debugfs_create(struct aspeed_video *video)
> +static void aspeed_video_debugfs_create(struct aspeed_video *video)
>   {
>   	debugfs_entry = debugfs_create_file(DEVICE_NAME, 0444, NULL,
>   					    video,
>   					    &aspeed_video_debugfs_fops);
> -	if (!debugfs_entry)
> -		aspeed_video_debugfs_remove(video);
> -
> -	return !debugfs_entry ? -EIO : 0;
>   }
>   #else
>   static void aspeed_video_debugfs_remove(struct aspeed_video *video) { }
> -static int aspeed_video_debugfs_create(struct aspeed_video *video)
> -{
> -	return 0;
> -}
> +static void aspeed_video_debugfs_create(struct aspeed_video *video) { }
>   #endif /* CONFIG_DEBUG_FS */
>   
>   static int aspeed_video_setup_video(struct aspeed_video *video)
> @@ -2198,9 +2191,7 @@ static int aspeed_video_probe(struct platform_device *pdev)
>   		return rc;
>   	}
>   
> -	rc = aspeed_video_debugfs_create(video);
> -	if (rc)
> -		dev_err(video->dev, "debugfs create failed\n");
> +	aspeed_video_debugfs_create(video);
>   
>   	return 0;
>   }
