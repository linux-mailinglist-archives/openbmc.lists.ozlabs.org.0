Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4260E71639A
	for <lists+openbmc@lfdr.de>; Tue, 30 May 2023 16:19:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVvds6GkFz3f6j
	for <lists+openbmc@lfdr.de>; Wed, 31 May 2023 00:18:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aKd99wQh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aKd99wQh;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVvdC3RnXz3bkD;
	Wed, 31 May 2023 00:18:23 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34UDeSY5011649;
	Tue, 30 May 2023 14:18:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=X+BCio2225xDSjN0IY0e48DYq1CNHg9Y4ZY/uoMoLrk=;
 b=aKd99wQhOv/FUspt8ryXzv/Dr9otr42CVjiZ/puiMy5IZU97ub1xXsg7V8NlUcEDXnfw
 fYNsD8wZ98z0S3p9sZmzFtOjI52XNTWVtXLfdKSDBsfc1vIKWolwE5NVNu5gPjT0WETU
 Y4J7yvbHKrtrNHEVbtCdUaXS762TMMzemZfbMzrymmhawBb2YbD9x9x5rEmVBtalW5ZE
 noFAJGeSc+hOSLM9basje8LFDPdwv5KML80piKC+RpyXBWgDfNpCrBN2DFafmc5l5vvx
 18+vIDHD2J0/pVZ0nAouTFHMpMqUclbAmf81j3IrG4He3LcfFHAlYKxZQlHwVuc7uZsC MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qwj0e9hew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 May 2023 14:18:09 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34UDeVEX011730;
	Tue, 30 May 2023 14:18:08 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qwj0e9heh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 May 2023 14:18:08 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34UDPFoI009520;
	Tue, 30 May 2023 14:18:08 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
	by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3qu9g5q6cx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 May 2023 14:18:08 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34UEI6pd5178044
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 May 2023 14:18:06 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79DDC58058;
	Tue, 30 May 2023 14:18:06 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 491DF58057;
	Tue, 30 May 2023 14:18:06 +0000 (GMT)
Received: from [9.61.0.144] (unknown [9.61.0.144])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 30 May 2023 14:18:06 +0000 (GMT)
Message-ID: <e123f9a1-e316-a80d-1431-1d3528c25ba5@linux.ibm.com>
Date: Tue, 30 May 2023 09:18:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] aspeed-video.c: Fix error checking for debugfs_create_dir
To: Osama Muhammad <osmtendev@gmail.com>, mchehab@kernel.org, joel@jms.id.au,
        andrew@aj.id.au
References: <20230524171137.22128-1-osmtendev@gmail.com>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20230524171137.22128-1-osmtendev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DSF5jfKcmHE-ax3BFAKGbt1dgredKQN2
X-Proofpoint-ORIG-GUID: tMGJsXcu9DFzvcK79DzGAD4azZowQp1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_10,2023-05-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0
 adultscore=0 clxscore=1011 mlxlogscore=999 malwarescore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305300114
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
Cc: openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 5/24/23 12:11, Osama Muhammad wrote:
> This patch fixes the error checking in aspeed-video.c in
> debugfs_create_dir. The correct way to check if an error occurred
> is using 'IS_ERR' inline function.


Thanks.

Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Osama Muhammad <osmtendev@gmail.com>
> ---
>   drivers/media/platform/aspeed/aspeed-video.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
> index 374eb7781936..97847f44964a 100644
> --- a/drivers/media/platform/aspeed/aspeed-video.c
> +++ b/drivers/media/platform/aspeed/aspeed-video.c
> @@ -1976,7 +1976,7 @@ static int aspeed_video_debugfs_create(struct aspeed_video *video)
>   	debugfs_entry = debugfs_create_file(DEVICE_NAME, 0444, NULL,
>   					    video,
>   					    &aspeed_video_debugfs_fops);
> -	if (!debugfs_entry)
> +	if (IS_ERR(debugfs_entry))
>   		aspeed_video_debugfs_remove(video);
>   
>   	return !debugfs_entry ? -EIO : 0;
