Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 272452732DB
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 21:31:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwF1S2NJTzDqgB
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 05:31:40 +1000 (AEST)
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
 header.s=pp1 header.b=ao5NjqCj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwF0T4W02zDqSp
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 05:30:49 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08LJHKBx120230
 for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2020 15:30:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-type : content-transfer-encoding : date : from : to : cc : subject
 : in-reply-to : references : message-id; s=pp1;
 bh=tqqf77kgVhR9f6o2SzXPcmAidx02rxKIU+szXNJCVpQ=;
 b=ao5NjqCjhn+832gOhDYkxv6tDKHqgPhQdml3dCU3L/0bM/mhUe0jwla3QwTgqOBCyF64
 7+9j12bLsjkKIrh2cPg6AbCjaRsbr4oT+svoREny0UVva2l0slOBk9pdj+bK8W828v7v
 /EE2OV4f5n+T2M8VFXpLAvTzMcuNbG7JRAnrCm2RKQW6I3YZ2hzM1LgvFcndIttF/VAm
 01Gljfa9enksbwqxn6yV6dGSs2sZGphKW3+hpKO83Be/QdubofBXB9/p62nKUgx86hNj
 Y6SX+cGqu+x2+v65538zau40IiK/ARxjucPQ49CFvXUZ1x1wOhR3ZWjOzOs8rHyjlfi4 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33q24w8by5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2020 15:30:45 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08LJHOj8120709
 for <openbmc@lists.ozlabs.org>; Mon, 21 Sep 2020 15:30:45 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33q24w8bxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Sep 2020 15:30:45 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08LJHggt010384;
 Mon, 21 Sep 2020 19:30:44 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 33n9m8nxhf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Sep 2020 19:30:44 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08LJUd6f57344452
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Sep 2020 19:30:40 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D4C26E050;
 Mon, 21 Sep 2020 19:30:43 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 605DD6E054;
 Mon, 21 Sep 2020 19:30:43 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 21 Sep 2020 19:30:43 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 21 Sep 2020 14:30:43 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Subject: Re: Enable UBI support for a platform
In-Reply-To: <1cdecd8a-4382-45ad-7932-a604001d7ed8@linux.vnet.ibm.com>
References: <BYAPR14MB23426A9032F9FDAF87F1BC19CF2D0@BYAPR14MB2342.namprd14.prod.outlook.com>
 <242dee50-7e1b-3fc3-5105-ca33f288d959@linux.vnet.ibm.com>
 <BYAPR14MB2342A17C9B9BE853C0616E9CDC280@BYAPR14MB2342.namprd14.prod.outlook.com>
 <4e89c963-1ddd-2627-47c8-be13b903bc64@linux.vnet.ibm.com>
 <BYAPR14MB23426BE881262C70C81FFDAEDC200@BYAPR14MB2342.namprd14.prod.outlook.com>
 <b7c9296d-00a1-0137-ae67-4d2d24a6cfac@linux.vnet.ibm.com>
 <07d8dc67fb6a451151d77c035313c936@linux.vnet.ibm.com>
 <BYAPR14MB234246D31202193B89B1E713DC3F0@BYAPR14MB2342.namprd14.prod.outlook.com>
 <1cdecd8a-4382-45ad-7932-a604001d7ed8@linux.vnet.ibm.com>
Message-ID: <bbb51843c428113f56f8082373758811@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-21_08:2020-09-21,
 2020-09-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=795
 lowpriorityscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009210138
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

> 
> That could matter. Is there a reason you're on that branch? There are
> 800+ commits to master since that branch. In general what we follow is
> "live at head" of the master branch.
> 
> Also, I was able to boot Tiogapass QEMU with the UBIFS layout with the
> following changes (I'm based off of the latest master) :

Thanks Deepak for providing this working example! I agree that using 
master would be best.


>> BTW, Adriana, could you also take a look at this email thread 
>> https://lists.ozlabs.org/pipermail/openbmc/2020-September/022834.html? 
>> It was why I was going to enable ubifs but I'm not sure if ubifs can 
>> solve that problem.
>> 

Early in the beginning of implementing UBIFS in OpenBMC, we also 
encountered UBIFS corruption due to core dumps, and the only recovery 
was to run a factory reset which deletes and clears the read-write 
filesystem. So corruption may not be tied only to the jffs2 filesystem.

The corruption was so common that core dumps were disabled in OpenBMC - 
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/6699

I don't remember what was fixed, maybe it was something in upstream 
systemd, and core dumps were eventually re-enabled.

If you want to stay at 2.9, you could disable core dumps.
Or you can try moving up to master to see if that solves the corruption 
issues.
And if you do move to master, you can choose UBI if you like (following 
Deepak's example), we haven't seen UBIFS corruption is a very long time, 
also haven't see jffs2 corruption for that matter.
