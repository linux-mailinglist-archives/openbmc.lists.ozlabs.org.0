Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 546BF1040F7
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 17:39:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47J7gh6Ck1zDqsQ
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 03:39:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47J7fr1FWgzDqqD
 for <openbmc@lists.ozlabs.org>; Thu, 21 Nov 2019 03:38:27 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAKGcJDN013643
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 11:38:24 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wcf5qys12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 11:38:24 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xAKGcKIA013782
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 11:38:23 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wcf5qys0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Nov 2019 11:38:23 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAKGGCni022166;
 Wed, 20 Nov 2019 16:38:22 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 2wa8r6yxjm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Nov 2019 16:38:22 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAKGcL6R50528610
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Nov 2019 16:38:21 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 704587805C;
 Wed, 20 Nov 2019 16:38:21 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0454B7805E;
 Wed, 20 Nov 2019 16:38:20 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.80.219.76])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 20 Nov 2019 16:38:20 +0000 (GMT)
Subject: Re: Add build date to image
To: www <ouyangxuan10@163.com>
References: <275367c1.6307.16e63b2e1cf.Coremail.ouyangxuan10@163.com>
 <adf92df5-06d4-ea38-ad9f-55dde92148b2@linux.ibm.com>
 <136be35a.269c.16e7c360818.Coremail.ouyangxuan10@163.com>
 <17d14e7a-1dc8-3375-a8a6-ea61c60e3bb7@linux.ibm.com>
 <67ca8d1c.28cc.16e8141d457.Coremail.ouyangxuan10@163.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <0592b224-ccbc-30ad-d2aa-5c39f6481989@linux.ibm.com>
Date: Wed, 20 Nov 2019 10:38:19 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <67ca8d1c.28cc.16e8141d457.Coremail.ouyangxuan10@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_04:2019-11-20,2019-11-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911200143
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 11/18/19 7:23 PM, www wrote:
> Dear Joseph，
>
> Thank you very much for your help. I just want to show the compile 
> time of firmware to the user. If  only show the version, it can't 
> correspond to the time. When both are displayed at the same time, the 
> information will be clearer. thanks again.
>

Byron, thanks for that.  I think I understand your use case. However, 
does this practice assume the build date is close to the date when the 
software version was created?
- For example, I assume you'll merge a git commit to create a new 
software version, and then build an image based on that commit.  In this 
way, the build date correlates closely with the version.
- However, if you build an image from an older commit, or wait a long 
time before building an image, the build date will not correlate closely 
with the version.  This can be misleading and lead to errors in handling 
images.

Is that a concern for you?

- Joseph

> thanks,
> Byron
>
...snip...

