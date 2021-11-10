Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA31544CABB
	for <lists+openbmc@lfdr.de>; Wed, 10 Nov 2021 21:39:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqGsv3Gvsz2yYS
	for <lists+openbmc@lfdr.de>; Thu, 11 Nov 2021 07:39:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qY9v5tWw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qY9v5tWw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqGsV6lQQz2xXD
 for <openbmc@lists.ozlabs.org>; Thu, 11 Nov 2021 07:38:54 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AAKCW9x020774
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 20:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : from : to : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=bs12pQz7pQJP50T2m6F24t4vpcIoH0GzEF/ZMANA6d8=;
 b=qY9v5tWwDi73zVlv8NnazeU7Ntad3pPXxhMYZwkGa0pNscJNGPavPFOekp9AO1DTwk5n
 YUyS5H0l+mCjMZX0iHOTsMCJc48m45skHpVmpA4A9TzBBG9NhGDiNOMamQqk12ZuFDrs
 jriehyFRKGI8D2SuFVStXis9Kr1hCo0lSbqT+mCqmyS2kEBNFaTN2iNeNhocLy8QqIK/
 TCfV3+P6nKUWWc5SvHR/dPEELHVfBKXe+fS+aBH4LfCGf6Kif44Yr0MzHS18bvSxKuOR
 IwPUnv6nq+SSs33S+iy+koGUVVM6sfcm5+9MKAO+4KQ+UcpzRuFvCUFlISZdGphPbnGn yA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c8mwfgh4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 20:38:49 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AAKV90s032682
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 20:38:48 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01dal.us.ibm.com with ESMTP id 3c5hbd15an-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 20:38:48 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AAKckhw46465280
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 20:38:46 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C557C6057
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 20:38:46 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1B55C6061
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 20:38:45 +0000 (GMT)
Received: from [9.65.237.168] (unknown [9.65.237.168])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 20:38:45 +0000 (GMT)
Message-ID: <d2f833d7-6707-b65e-f913-7093776296fc@linux.ibm.com>
Date: Wed, 10 Nov 2021 14:38:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Security Working Group - Nov 24 meeting cancelled: reschedule?
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <4ea0015b-3280-c5b3-9f9f-c424046f23c9@linux.ibm.com>
 <ba328007-7ade-c21f-8962-3da0c5112d16@linux.ibm.com>
In-Reply-To: <ba328007-7ade-c21f-8962-3da0c5112d16@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uZYJtxGBgm0-VwRGbc9GAID_hnayqGdz
X-Proofpoint-ORIG-GUID: uZYJtxGBgm0-VwRGbc9GAID_hnayqGdz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-10_13,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=831 suspectscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111100098
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

On 11/10/21 2:35 PM, Joseph Reynolds wrote:
> On 11/10/21 8:38 AM, Joseph Reynolds wrote:
>
> Agenda items discussed:
>
> 1 Next meeting Nov 24 “Thanksgiving eve”
>
> Votes: cancel, cancel, cancel.  Agreed.  Someone else schedule a meeting?
>

The next regularly scheduled Security Working Group meeting (Nov 24) is 
cancelled.
This would be a perfect time to for someone maybe in another time zone 
outside the US to schedule a Security Working Group call.
Any volunteers?

