Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6609F26D034
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 02:49:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsJJJ5XNCzDqPy
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 10:49:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FsP7ldya; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsHvn6nY6zDqKb
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 10:31:32 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08GK1h9a131388
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 16:05:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-type : content-transfer-encoding : date : from : to : cc : subject
 : in-reply-to : references : message-id; s=pp1;
 bh=C08uQSY9tgilyD+EgOuBW3Kp5/RBNPq3gPTbHWNsN4I=;
 b=FsP7ldyaCcGZSdSs0Xnaevt3Kg+kJDEdyzzxEy4aDI49F+cRFDTwt1YNV5oANZ7MGumr
 fmU3UtDG3HiExexR9pKJb6KzvipFwwPHtFwwCxl46CsGl4qM15uXe/5VeO8AuRzOBIsJ
 ZNiRe9zaH5WxuR4DnZKVjBai7INe95Bn+l85a+uVttbZjuqvbMxVZzspUHacRyPQ/M+E
 scGqTImWpyzfraFAwZQw9DWy4KTwAFSHfb1B9au4CCL9yKoppRIYXzVmQYxqyj07E72s
 A81A2Bc2cMct0T/yPqh90/yvki1BlTPOfFkJfr+1ofzIMSqnDeVlq3eOfqmQ2ic5f24n Ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33kpprvyhn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 16:05:52 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08GK2Hev133132
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 16:05:51 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33kpprvyh1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2020 16:05:51 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08GK1wrv025220;
 Wed, 16 Sep 2020 20:05:50 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 33k675y2rt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2020 20:05:50 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08GK5joT59769280
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Sep 2020 20:05:45 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4323D6E056;
 Wed, 16 Sep 2020 20:05:49 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19F336E053;
 Wed, 16 Sep 2020 20:05:48 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Sep 2020 20:05:48 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 16 Sep 2020 15:05:48 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Subject: Re: Enable UBI support for a platform
In-Reply-To: <b7c9296d-00a1-0137-ae67-4d2d24a6cfac@linux.vnet.ibm.com>
References: <BYAPR14MB23426A9032F9FDAF87F1BC19CF2D0@BYAPR14MB2342.namprd14.prod.outlook.com>
 <242dee50-7e1b-3fc3-5105-ca33f288d959@linux.vnet.ibm.com>
 <BYAPR14MB2342A17C9B9BE853C0616E9CDC280@BYAPR14MB2342.namprd14.prod.outlook.com>
 <4e89c963-1ddd-2627-47c8-be13b903bc64@linux.vnet.ibm.com>
 <BYAPR14MB23426BE881262C70C81FFDAEDC200@BYAPR14MB2342.namprd14.prod.outlook.com>
 <b7c9296d-00a1-0137-ae67-4d2d24a6cfac@linux.vnet.ibm.com>
Message-ID: <07d8dc67fb6a451151d77c035313c936@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-16_12:2020-09-16,
 2020-09-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009160138
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
Cc: openbmc@lists.ozlabs.org, Kun Zhao <zkxz@hotmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


>> |
>> . done
>> UBI init error 12
>> Error, no UBI device/partition selected!
>> Wrong Image Format for bootm command
>> ERROR: can't get kernel image!
>> 
>> Any thought?
> 
> Some thoughts:
> 
> - Have you validated your recipe and device tree changes by trying to
> boot on QEMU an existing supported platform (for eg
> Romulus/Tiogapass)?
> 
> - I don't think not having the partitions for the alt side in your
> devicetree should be a problem, unless the BMC is actually switching
> to the secondary flash. 'md.l 0x1e785030 1' at the u-boot prompt can
> tell us the boot side.
> 
> Adriana - do you have any thoughts on this problem?
> 

Check if you can list the ubi partitions from u-boot:

ast# ubi part obmc-ubi
ast# ubi info layout

It should print some output like this:

Volume information dump:
         vol_id          0
...
         name            kernel-3a859116
Volume information dump:
         vol_id          1
...
         name            rofs-3a859116


Check that the kernel name on that output is "kernel-3a859116" which is 
the value that your kernelname variable is set to, and also check that 
the rofs volume is in volume 1 since the root and ubiblock variables are 
set to (primary chip (0) volume 1 (ubiblock=0,1)).
