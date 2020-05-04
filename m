Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CD21C4961
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 00:09:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GH8Q2fGHzDqYK
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 08:09:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GH7Z4JT9zDqMV
 for <openbmc@lists.ozlabs.org>; Tue,  5 May 2020 08:08:58 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 044LWYpS074858
 for <openbmc@lists.ozlabs.org>; Mon, 4 May 2020 18:08:54 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30s50g13n4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 04 May 2020 18:08:54 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 044Lxomq132601
 for <openbmc@lists.ozlabs.org>; Mon, 4 May 2020 18:08:54 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30s50g13mw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 May 2020 18:08:54 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 044M4oJR002085;
 Mon, 4 May 2020 22:08:53 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 30s0g641f1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 May 2020 22:08:53 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 044M8rlT55509374
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 May 2020 22:08:53 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03704AC094;
 Mon,  4 May 2020 22:08:53 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF53BAC08E;
 Mon,  4 May 2020 22:08:52 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  4 May 2020 22:08:52 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 04 May 2020 17:08:52 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: rgrs <rgrs@protonmail.com>
Subject: Re: Setting up a system for first time
In-Reply-To: <IsJ8ZyIQ3y0MDj6HTH_0rkhRb9VbXdh67uddwFYhenESjgI2EEDfuKY3jedGwQZrXELtYL7v34EqyAPj9Y9haqWzv6oMkARQ0rZjvO-aB5M=@protonmail.com>
References: <3O7HBbmKi-6nXjhfbxxIFC2_17vjRSv84dvD3kk0lKURP-469mYH0pa_Xkb38JIDG6kFXn6jbyvFHQIiz8-LqfWX1Uvlqdn-Av_TYLJBzU4=@protonmail.com>
 <IsJ8ZyIQ3y0MDj6HTH_0rkhRb9VbXdh67uddwFYhenESjgI2EEDfuKY3jedGwQZrXELtYL7v34EqyAPj9Y9haqWzv6oMkARQ0rZjvO-aB5M=@protonmail.com>
Message-ID: <2e8ba477c2a3128ba4e88d44e1bad6d5@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-04_11:2020-05-04,
 2020-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=815
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005040169
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

On 2020-04-27 10:53, rgrs wrote:
> Hi,
> 
> Please can anyone help with this?
> 
> when just same phosphor image flashed on both SPI, I am not able to
> upgrade to new firmware.
> 
> What is the right way to install images to new board with empty SPIs?
> 

Yeah there are some limitations that I'll explain below, the 
recommendation
would be to build a 2nd image with a dummy commit so that you have 2 
version
ids to start with, then you can code update to a new 3rd image from 
there
when you need to put new code on the system.

>> 
>> The board has two SPI NOR for BMC flash.
>> 
>> If I flash same image on both SPI, WebUI displays only one entry
>> since versioning is same.

Right. This is a limitation that we're exploring on solving so that the
customer can have their 'backup' devices at the same software version.

>> 
>> When I flash two different images in each SPI, activation of second
>> image is not working.
>> 
>> U-boot goes into a loop and is not able boot.

The issue is that u-boot can't read the volume from the alternate SPI,
therefore during a code update it creates 2 volumes with the new kernel 
image,
one on each SPI, to work around this limitation.
After flashing the two SPIs, one with a dummy commit, use code update to
flash a new image.

>> 
>> Do we have any sequence to be followed when flashing the images?
>> 
