Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D311B40B728
	for <lists+openbmc@lfdr.de>; Tue, 14 Sep 2021 20:49:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8C704jP5z2yQB
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 04:49:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IC9O26PR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IC9O26PR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8C6W4wPLz2yKQ
 for <openbmc@lists.ozlabs.org>; Wed, 15 Sep 2021 04:48:34 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18EGhX95028857
 for <openbmc@lists.ozlabs.org>; Tue, 14 Sep 2021 14:48:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : from : subject :
 message-id : date : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=462tuzZLSL9aevcG0IaPbo/luJZC4wIv3+42xlyeAGg=;
 b=IC9O26PRvHcTbYyFURHNWlAKhfpLqRoYUVMB5iWo1WVRl1qqcWIPK8rDwTlisrSHbQ+J
 oidIwSUIPWS8AqZ8DsWQJ3CfZ3x5b7sxDs3p6V5aCA47lH3G8NZN0Yity/4aMoe5t/Wu
 qy6buguiamPXnlkxuBiiTtuqS8CP55P3KeB7YkmsrM/L2I9pG0PuGf3MaGXghSAXBsYj
 IoWFvY/lB5k7VhccJTnVEXhNB0YxdStAL5uJ/BOouP8f51IIOl0vIYx4Ce31GM9X1wQZ
 q9R/vLYVVlo1zUt5iZZeKL5srJMvYsyrXNN19Vfe7gARXd7YZDz/2PbWIkjDv2lJ1/WP 6w== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3b2ygt31vx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 14 Sep 2021 14:48:30 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18EIlQNt015605
 for <openbmc@lists.ozlabs.org>; Tue, 14 Sep 2021 18:48:30 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03wdc.us.ibm.com with ESMTP id 3b0m3b00bu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 14 Sep 2021 18:48:30 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18EImTT250397684
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 14 Sep 2021 18:48:29 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BDB47805C
 for <openbmc@lists.ozlabs.org>; Tue, 14 Sep 2021 18:48:29 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E850478078
 for <openbmc@lists.ozlabs.org>; Tue, 14 Sep 2021 18:48:28 +0000 (GMT)
Received: from demeter.local (unknown [9.160.139.66])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Tue, 14 Sep 2021 18:48:28 +0000 (GMT)
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Security Working Group meeting - Wednesday September 15
Message-ID: <6bf4d910-f484-f5c9-6c3a-679d7c78ce1b@linux.ibm.com>
Date: Tue, 14 Sep 2021 13:48:27 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: glXRtbBy9DjLVa_9VhxrVx9NsK3X4YmS
X-Proofpoint-GUID: glXRtbBy9DjLVa_9VhxrVx9NsK3X4YmS
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxlogscore=749
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109140092
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

This is a reminder of the OpenBMC Security Working Group meeting 
scheduled for this Wednesday September 15 at 10:00am PDT.

We'll discuss the following items on the agenda 
<https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
and anything else that comes up:

1. (gerrit review) Encrypted eMMC design - 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/46573 
<https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/46573>


2. (email) Reminder that configuration matters. 
https://lore.kernel.org/openbmc/6593206c0bc90186f255c6ea86339576576f70dc.camel@codeconstruct.com.au/ 
<https://lore.kernel.org/openbmc/6593206c0bc90186f255c6ea86339576576f70dc.camel@codeconstruct.com.au/>Discusses 
AST2500 default register configuration (ESPICTRL[9] = 0) which allows 
the host to have full control over the GPIOs.

More?


Access, agenda and notes are in the wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group 
<https://github.com/openbmc/openbmc/wiki/Security-working-group>

- Joseph
