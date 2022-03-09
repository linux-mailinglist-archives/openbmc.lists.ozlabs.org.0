Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBD24D2626
	for <lists+openbmc@lfdr.de>; Wed,  9 Mar 2022 03:32:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCx6r5HKNz30K0
	for <lists+openbmc@lfdr.de>; Wed,  9 Mar 2022 13:32:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kfWg8t2T;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kfWg8t2T; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCx6K6sDkz30H3
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2022 13:31:53 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 229109jZ016449
 for <openbmc@lists.ozlabs.org>; Wed, 9 Mar 2022 02:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=YSB4yIvm4LvMVZG1ZYmvi4vTvYCrWm3PMJgkfjMnuXE=;
 b=kfWg8t2Te70jF+LcpZMAwmdPzdodOBG4+GQurVLCkD0boKz1qCEucyT+5fU5xFcXOrVH
 y6EOwVgEF1edqjuu1/EVx3O7KZ6AHBx4nqu2qCgMnRP0Te8R/XT7EogP7PnWZ/k+QoOW
 GzAO1aHIKZs1MQAEfCcVVO83zxboEgjNXYdFH0WI8Uor7AjU8AXU7uxSztzOXzj+5JuR
 HHxBUxBDfVPkbFugpJWatHBXSQC89Ak6aBDrbXRlfBLpfZB5mIGB9vpTuHeYreSTSBsH
 WvkzKQcJo4rf8OFiMCQ8p8lMgIqs52X9LFdZymP4WXpFMRiy1IeMStTyQUB8WMo+knFs xQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ep106pkgp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 09 Mar 2022 02:31:50 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2292KS8t020215
 for <openbmc@lists.ozlabs.org>; Wed, 9 Mar 2022 02:31:49 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ep106pkgc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Mar 2022 02:31:49 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2292CSNT016940;
 Wed, 9 Mar 2022 02:31:48 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 3emgakt8kx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Mar 2022 02:31:48 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2292Vl3947514036
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Mar 2022 02:31:47 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2A79112062;
 Wed,  9 Mar 2022 02:31:47 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90FA5112064;
 Wed,  9 Mar 2022 02:31:47 +0000 (GMT)
Received: from [9.211.71.222] (unknown [9.211.71.222])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  9 Mar 2022 02:31:47 +0000 (GMT)
Message-ID: <7534667b-ba7c-135f-2589-bbdde00b4c64@linux.vnet.ibm.com>
Date: Tue, 8 Mar 2022 19:31:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: cant see page with sensors and hardware status in webui
Content-Language: en-US
To: Nikita Pavlov <niikita@yahoo.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <112372010.885280.1646309860262.ref@mail.yahoo.com>
 <112372010.885280.1646309860262@mail.yahoo.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
In-Reply-To: <112372010.885280.1646309860262@mail.yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yNtnzroCqqUweEFyUoF_PirtbzzzhMks
X-Proofpoint-GUID: 2jbd3Zq421r1O8XtXT4Dah5XmmtqJ0KX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-08_09,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxlogscore=823 malwarescore=0 impostorscore=0
 clxscore=1011 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203090011
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

On 3/3/2022 5:17 AM, Nikita Pavlov wrote:
> Hello, I am beginner in openbmc. I download from jenkins romulus image 
> and emulate this in qemu. And I cant to see page with sensors and 
> hardware in webui. How I can resolve this ? ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ 

I would suggest looking at the browser debug tools. Tools like the Web 
Console and the Network Monitor are useful to debug what is going wrong. 
Are there errors in the Web Console? Are there network requests failing? 
Do the same requests succeed with tools like cURL?

- Gunnar

