Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E4E23CA6E
	for <lists+openbmc@lfdr.de>; Wed,  5 Aug 2020 14:13:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BM9Wd1DhbzDqch
	for <lists+openbmc@lfdr.de>; Wed,  5 Aug 2020 22:13:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BM9VQ5X07zDqcN
 for <openbmc@lists.ozlabs.org>; Wed,  5 Aug 2020 22:12:26 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 075CArDI130273
 for <openbmc@lists.ozlabs.org>; Wed, 5 Aug 2020 08:12:22 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32qssamtmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 05 Aug 2020 08:12:22 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 075C9cjY003758
 for <openbmc@lists.ozlabs.org>; Wed, 5 Aug 2020 12:12:22 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02wdc.us.ibm.com with ESMTP id 32n0198h9j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 05 Aug 2020 12:12:22 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 075CCLg549217872
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Aug 2020 12:12:21 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 787F1AC059;
 Wed,  5 Aug 2020 12:12:21 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2303AAC05E;
 Wed,  5 Aug 2020 12:12:21 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  5 Aug 2020 12:12:20 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 05 Aug 2020 17:42:20 +0530
From: Vishwanatha Subbanna <vishwa@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: IBM :: LEDS::  Virtual System Attention Indicator functionality
Message-ID: <360a44adbed21863229cdc89c82e356d@linux.vnet.ibm.com>
X-Sender: vishwa@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-05_08:2020-08-03,
 2020-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=81
 phishscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=-63 spamscore=81 mlxscore=81 priorityscore=1501
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008050097
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

Hello,

Sending this email to get feedback on one of the features that IBM would 
need to implement and is called "Virtual System Attention Indicator".

*What is a System Attention Indicator ( SAI )* : When an error happens 
in the system, usually, it is isolated to a part to be replaced and the 
LED for that faulty part would be turned on.

However, in some cases, it may not be possible to isolate the issue to a 
particular part. In those cases, IBM systems turn on Amber LED that is 
mostly at the front of the system and is called "System Attention 
Indicator".

So, it means, there is some issue in the system and that demands service 
events to be examined to isolate the part.

Such errors can be detected either by Platform management functionality, 
BMC; or can be detected by the upper layer partitions. When we turn on 
the System Attention Indicator, it would be useful to say why it is 
turned on. As in, is it turned on due to an error seen by BMC or is it 
due to an error seen by the partition.

If BMC encounters an error that falls under SAI, then BMC will set a 
virtual SAI, which is nothing but a software setting indicating so and 
is called "Platform Service Attention".

Similarly, if a partition encounters an error, then a virtual SAI will 
be set and is called "Partition Service Attention".

So, the Physical SAI LED will be turned on if either of these virtual 
SAs are on.

Admins should be able to clear these software settings and that would 
result in clearing the real SAI LED under the cover.

As an addition, Admins can say [I know I have an issue in the system] 
and would chose to turn off the real SAI LED. In that case, both the 
virtual SA would be turned off as well.

My current proposal is to have an interface defined in 
phosphor-dbbus-interfaces depicting these above.

The other thing is representing this in Redfish and I have it posted :

https://redfishforum.com/thread/361/virtual-system-attention-indicator-functional

Is anyone in the community having such a need / would be interested ?.

Thank you,
!! Vishwa !!
