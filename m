Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F14BC4D29C
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 17:59:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45V62L2sJlzDrDN
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 01:59:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45V61m5jRZzDrF1
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jun 2019 01:58:52 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5KFvBfx075628
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 11:58:49 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t8amn81s0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 11:58:49 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.ibm.com>;
 Thu, 20 Jun 2019 16:58:48 +0100
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 20 Jun 2019 16:58:45 +0100
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5KFwiUp49283574
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jun 2019 15:58:44 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68B2B78063;
 Thu, 20 Jun 2019 15:58:44 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F81E7805C;
 Thu, 20 Jun 2019 15:58:44 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 20 Jun 2019 15:58:44 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Thu, 20 Jun 2019 11:00:23 -0500
From: Joseph Reynolds <jrey@linux.ibm.com>
To: Stewart Smith <stewart@linux.ibm.com>
Subject: Re: Move away from default password
In-Reply-To: <871rzr6cqt.fsf@linux.vnet.ibm.com>
References: <1164a9a82b2b59087059c59391e65d04@linux.vnet.ibm.com>
 <1ec23c9c-6fd1-1a37-150e-6ac7c950cc0d@linux.intel.com>
 <67d4cc41211749ef9ff888a31d9e8615@linux.vnet.ibm.com>
 <871rzr6cqt.fsf@linux.vnet.ibm.com>
X-Sender: jrey@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19062015-0016-0000-0000-000009C41795
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011297; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01220763; UDB=6.00642211; IPR=6.01001901; 
 MB=3.00027394; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-20 15:58:47
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062015-0017-0000-0000-000043B7A037
Message-Id: <d1b5f822cff4611fd21d537a9ef0c041@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-20_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906200116
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
Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 Openbmc <openbmc@lists.ozlabs.org>, "Thomaiyar,
 Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2019-06-17 17:58, Stewart Smith wrote:
> Adriana Kobylak <anoo@linux.ibm.com> writes:
>>>> 1. Unique password per BMC.
>>>> In this approach, there is a way to change the factory default
>>>> password.  Example flow: assemble the BMC, test it, factory reset,
>>>> generate unique password (such as `pwgen`), then use a new function
>>>> “save factory default settings” which would save the current
>>>> setting into a new “factory settings” flash partition. After 
>>>> that,
>>>> a factory reset would reset to the factory installed password, not 
>>>> to
>>>> the setting in the source code.
>> 
>> How would this new "factory settings" flash partition be protected
>> against being modified by an unauthorized or malicious user?
> 
> My guess would be it'd be protected the same way that the default
> password is today: not at all. If an attacker can write to flash, the
> only way to reset the box is to dediprog the BMC flash chip.

Access to the flash would be protected from attack by network agents via 
password access to the BMC at two critical points.

In this scenario:
1. The factory assembles and tests the BMC, then changes its password to 
a new value.  The password hash is stored on the flash "factory 
settings" partition.  The BMC is then shipped to its new owner with the 
new password.
At this point, only the owner has password access to the BMC (unless the 
factory keeps a record of the new password).
2. The owner installs the BMC and configures it, including its network.  
For example, change the password, creates new accounts, and set up IP.
At this point, only the owner and owner's agents have password access to 
the BMC.

At this point, one of the owner's agents could use ssh to access the 
flash partition.  (But why would they need to?)

