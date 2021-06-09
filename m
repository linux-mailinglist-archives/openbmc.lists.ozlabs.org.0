Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E673A16DE
	for <lists+openbmc@lfdr.de>; Wed,  9 Jun 2021 16:14:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0Td05khTz3bsB
	for <lists+openbmc@lfdr.de>; Thu, 10 Jun 2021 00:14:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MaxPgF/P;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MaxPgF/P; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0Tch4mpLz2yXd
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jun 2021 00:14:12 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 159E5jKC170473
 for <openbmc@lists.ozlabs.org>; Wed, 9 Jun 2021 10:14:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 message-id : date : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=WbcSaxdc30jANf/W0YamwYW9Ez24aBKoHYdFWvXbDB4=;
 b=MaxPgF/PeKuu3a74Sc4VhOQ/Eu6SQPWZrm60Nia73h3Ed00iH/ShHYqxlenyj6DydNSu
 JoKMRDeuqk63F1psN71Cgh/ygzuzCA99y1k0Bdg2r1GbDjw4Gk+0iDOgI4LR4bHZGyb3
 3L2h7BZvp7kjLU55pb4W8sfhxa3w0EfOdf2wMqfrWj0Rplp4nAeLKViQamHbK+JWUcfZ
 Bh+vTs+4xE8zaxsJvr3nhgR1o4rYcw6jPjMuAqlljI+kernM+XDhAx5lEJ1DeTSbcjSw
 aHc8wJPTG/Tjiy84NvJMNmRf6gDQ3i6V+gB7VExHCrXTTPqTnXMFPD6VWJSrTgu3m9FY Jw== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 392y3t88ug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 09 Jun 2021 10:14:08 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 159E3Dam009358
 for <openbmc@lists.ozlabs.org>; Wed, 9 Jun 2021 14:14:07 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 3900wa05pr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 09 Jun 2021 14:14:07 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 159EE6QL37355834
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 9 Jun 2021 14:14:06 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97D42136053
 for <openbmc@lists.ozlabs.org>; Wed,  9 Jun 2021 14:14:06 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6263B13605E
 for <openbmc@lists.ozlabs.org>; Wed,  9 Jun 2021 14:14:06 +0000 (GMT)
Received: from demeter.local (unknown [9.65.208.95])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed,  9 Jun 2021 14:14:06 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: Security Working Group meeting - Wednesday June 9
Message-ID: <c725fe55-cebc-849e-5424-71f894cc0359@linux.ibm.com>
Date: Wed, 9 Jun 2021 09:14:05 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XPcH9-2RuGmoH08lB-tZI7i17ixhQztM
X-Proofpoint-ORIG-GUID: XPcH9-2RuGmoH08lB-tZI7i17ixhQztM
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-09_04:2021-06-04,
 2021-06-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 bulkscore=0 phishscore=0 mlxlogscore=795 impostorscore=0
 mlxscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106090070
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
scheduled for this Wednesday June 9 at 10:00am PDT.

We'll discuss the following items on the agenda 
<https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
and anything else that comes up:

1. (Joseph) Updated the wiki “Purpose” section.
2. (Joseph) Will resume recording meeting attendance
3. (Joseph) Cancel the July 7 meeting (US Holiday)?  Interest in someone 
else running?  And possibly scheduling for daytime in 
Australia/China/India?
4. (Discord discussion June 3) Interest in BMC command line via BMC web 
interface.  See https://github.com/openbmc/obmc-console/issues/17.  
IBM’s interest here: https://github.com/ibm-openbmc/dev/issues/2243.
5. (gerrit review) BMCWeb change affects login/authentication function 
“Move Sessions to non Node structure” 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/43759

Access, agenda and notes are in the wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group 
<https://github.com/openbmc/openbmc/wiki/Security-working-group>

- Joseph

