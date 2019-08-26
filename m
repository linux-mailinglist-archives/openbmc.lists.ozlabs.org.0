Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0AF9D268
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2019 17:13:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HFs01114zDqSm
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 01:13:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HFr56rCrzDqSd;
 Tue, 27 Aug 2019 01:13:08 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7QF6wUB089934; Mon, 26 Aug 2019 11:12:50 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2umggp3tqc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Aug 2019 11:12:50 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7QFAdhV028102;
 Mon, 26 Aug 2019 15:12:49 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 2ujvv6gwhw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Aug 2019 15:12:49 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7QFCmRg51904774
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Aug 2019 15:12:48 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 783C0112066;
 Mon, 26 Aug 2019 15:12:48 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFAD6112062;
 Mon, 26 Aug 2019 15:12:47 +0000 (GMT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 26 Aug 2019 15:12:47 +0000 (GMT)
Subject: Re: [PATCH 3/7] media: aspeed-video: address a protential usage of an
 unit var
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
References: <4a411ba155eb062b6575aba0824123c840806c0b.1566502743.git.mchehab+samsung@kernel.org>
 <7c85f7dc159927a7316dc13f52697f157fb6e2bd.1566502743.git.mchehab+samsung@kernel.org>
From: Eddie James <eajames@linux.vnet.ibm.com>
Message-ID: <64b90f55-2d8d-718d-0562-528063f3edab@linux.vnet.ibm.com>
Date: Mon, 26 Aug 2019 10:12:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7c85f7dc159927a7316dc13f52697f157fb6e2bd.1566502743.git.mchehab+samsung@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-26_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908260158
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 8/22/19 2:39 PM, Mauro Carvalho Chehab wrote:
> While this might not occur in practice, if the device is doing
> the right thing, it would be teoretically be possible to have
> both hsync_counter and vsync_counter negatives.
>
> If this ever happen, ctrl will be undefined, but the driver
> will still call:
>
> 	aspeed_video_update(video, VE_CTRL, 0, ctrl);
>
> Change the code to prevent this to happen.
>
> This was warned by cppcheck:
>
> 	[drivers/media/platform/aspeed-video.c:653]: (error) Uninitialized variable: ctrl


Thanks Mauro.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>   drivers/media/platform/aspeed-video.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
> index f899ac3b4a61..4ef37cfc8446 100644
> --- a/drivers/media/platform/aspeed-video.c
> +++ b/drivers/media/platform/aspeed-video.c
> @@ -630,7 +630,7 @@ static void aspeed_video_check_and_set_polarity(struct aspeed_video *video)
>   	}
>   
>   	if (hsync_counter < 0 || vsync_counter < 0) {
> -		u32 ctrl;
> +		u32 ctrl = 0;
>   
>   		if (hsync_counter < 0) {
>   			ctrl = VE_CTRL_HSYNC_POL;
> @@ -650,7 +650,8 @@ static void aspeed_video_check_and_set_polarity(struct aspeed_video *video)
>   				V4L2_DV_VSYNC_POS_POL;
>   		}
>   
> -		aspeed_video_update(video, VE_CTRL, 0, ctrl);
> +		if (ctrl)
> +			aspeed_video_update(video, VE_CTRL, 0, ctrl);
>   	}
>   }
>   
