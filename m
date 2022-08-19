Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C545759CC5F
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 01:44:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBTTp5493z2xjd
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 09:44:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WFmCL/o8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=wrightj@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WFmCL/o8;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8Ssd4ZCfz3bm9
	for <openbmc@lists.ozlabs.org>; Sat, 20 Aug 2022 03:09:24 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27JGxP5m012380;
	Fri, 19 Aug 2022 17:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ZQLKMbTFe43FFBhFr8hovTsIBu4eTNlGTUIHVp2i5Fc=;
 b=WFmCL/o8Q5FGd/p+QSoHRiBrYiqbbBO5AODWoZDKekXgz5hIU9A6Ims+viWoZMnvOCba
 4arOTYx/meKl2czdiYKLS3LImEPTj3WT9wLppAdvwfDqhSP/EqfL0QDjmxS560q3U+/a
 xei8FfaxZeQ17G8g+42ZoeTG9bNmhZ58PObIXbKWmasbjNT/3a5NrTAF+XRqzYc2BUq5
 GuoX22iYyHiDQ0UGcR7Bfq0DLyOfuPPDS1VzSGlmmxnKJTP2Meu4QHpLSd/SA9bt3e+R
 eSL36D32UsxU4GeY59NQHGYUMaH3typsbGspsMmHidu681XDlr38i97v9hBC/sZUjfdz jg== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j2eh0gb73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 17:09:20 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27JH6ldw016499;
	Fri, 19 Aug 2022 17:09:19 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
	by ppma04dal.us.ibm.com with ESMTP id 3hx3kaq9yw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 17:09:19 +0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27JH9IpR46399946
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Aug 2022 17:09:18 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 54CD76A051;
	Fri, 19 Aug 2022 17:09:18 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DFEE26A04D;
	Fri, 19 Aug 2022 17:09:17 +0000 (GMT)
Received: from [9.211.40.181] (unknown [9.211.40.181])
	by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
	Fri, 19 Aug 2022 17:09:17 +0000 (GMT)
Message-ID: <6acbddee-fba8-b6ba-f709-9f4aff5a34e0@linux.ibm.com>
Date: Fri, 19 Aug 2022 12:09:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH linux dev-5.15 v2] ARM: dts: aspeed: Add IBM Bonnell
 system BMC devicetree
Content-Language: en-US
To: Eddie James <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <20220818202422.741275-1-eajames@linux.ibm.com>
From: Jim Wright <wrightj@linux.ibm.com>
In-Reply-To: <20220818202422.741275-1-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NjojAYUrLgD3G7p0iaEqQaWFT4DOBLQx
X-Proofpoint-GUID: NjojAYUrLgD3G7p0iaEqQaWFT4DOBLQx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_08,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=882 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208190062
X-Mailman-Approved-At: Tue, 23 Aug 2022 09:39:56 +1000
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
Cc: joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/18/2022 3:24 PM, Eddie James wrote:
> Add a devicetree for the new Bonnell system.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
> Changes since v1:
>   - Add UCD90160 on I2C bus 2

LGTM -
Reviewed-by: Jim Wright <wrightj@linux.ibm.com>
