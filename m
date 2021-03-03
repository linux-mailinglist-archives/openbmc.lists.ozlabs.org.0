Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE28732B9AD
	for <lists+openbmc@lfdr.de>; Wed,  3 Mar 2021 19:00:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrMH45QHQz3d91
	for <lists+openbmc@lfdr.de>; Thu,  4 Mar 2021 05:00:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RC+Qs7yr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RC+Qs7yr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrMGr5Xv4z30Hd
 for <openbmc@lists.ozlabs.org>; Thu,  4 Mar 2021 05:00:20 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 123HqCj1086572; Wed, 3 Mar 2021 13:00:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=RsOurdUH5bhZ4zg9iJwporkSyx3SyvYnMq+Gs5X0gdM=;
 b=RC+Qs7yrAyR6Df7kNAQKYmrR2HtSPPnh8Cy08rXRvnha9D/Bp/xxWJbcE5YN2Mn0Iq6S
 MyTYVAXcvQdOvWyi6CJ9U8SIG5x4b0j5Dq2jGjzpKIvJXDf5wq0NCkH1ptAPKMgQ6Axw
 ErruuaDWzAZvNd37mLhHkDQz5jVUdm6Jh+D+6HxtPkJ5x1R1/SB4MjRAd52Gzd8fONfR
 ObtyZWxLqUdZYjyl3pFN//yjUeLamRgKyZAVLaLYhde+vRGdi1a/JOGr4lXzy3Lv8MWt
 HWltAbgrfgmoDOAUsH9VjlMBYWcvRnY5msRnj3sLmLTiNB0oLK4d4IXwY+wpzPGEHcL8 nA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 372f8289uu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 13:00:12 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 123HqeR0089034;
 Wed, 3 Mar 2021 13:00:12 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 372f8289u8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 13:00:12 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 123HgIhn006885;
 Wed, 3 Mar 2021 18:00:11 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 3720r0erfq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 18:00:11 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 123I0A1r18284814
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Mar 2021 18:00:10 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D3666A047;
 Wed,  3 Mar 2021 18:00:10 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34B1C6A081;
 Wed,  3 Mar 2021 18:00:09 +0000 (GMT)
Received: from demeter.local (unknown [9.160.55.6])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed,  3 Mar 2021 18:00:08 +0000 (GMT)
Subject: Re: overlayFS security concern - threat model
To: Kun Zhao <zkxz@hotmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "chunhui.jia" <chunhui.jia@linux.intel.com>, Andrew Jeffery
 <andrew@aj.id.au>, Patrick Williams <patrick@stwcx.xyz>,
 Michael Richardson <mcr@sandelman.ca>
References: <BYAPR14MB23420BA1183F22A48EF8B97ACF839@BYAPR14MB2342.namprd14.prod.outlook.com>
 <fc76b6b2-5231-da28-cfb4-d591e1797732@linux.ibm.com>
 <BYAPR14MB2342DF41E889D2E05209A2BEDC989@BYAPR14MB2342.namprd14.prod.outlook.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <7a264749-3028-3274-e02d-6fc5790c02cd@linux.ibm.com>
Date: Wed, 3 Mar 2021 12:00:07 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <BYAPR14MB2342DF41E889D2E05209A2BEDC989@BYAPR14MB2342.namprd14.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-03_05:2021-03-03,
 2021-03-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103030124
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

On 3/3/21 11:55 AM, Kun Zhao wrote:
> Thanks, Joseph. Seems we have several options to solve the problem.

I wrote an issue to address the /etc readwrite overlayfs issue.
https://github.com/openbmc/openbmc/issues/3766

- joseph

>
> Kun
>
...snip...
