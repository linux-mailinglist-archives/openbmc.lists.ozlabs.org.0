Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8691D3F0566
	for <lists+openbmc@lfdr.de>; Wed, 18 Aug 2021 15:55:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqTv32wcTz3dhk
	for <lists+openbmc@lfdr.de>; Wed, 18 Aug 2021 23:55:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JIpZlkz5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JIpZlkz5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqTtd4x9nz307n
 for <openbmc@lists.ozlabs.org>; Wed, 18 Aug 2021 23:55:21 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17IDZC6m165970
 for <openbmc@lists.ozlabs.org>; Wed, 18 Aug 2021 09:55:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : from : subject :
 message-id : date : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=W3m5rA5G5svBtDTvB/iu+74DCQNH0q4vNn98anX2EL4=;
 b=JIpZlkz5Gh7un2lWfOAaKQQvFMsPyDWTHwmlkZIQyDIN1VSN/jLyl5Lf8b2aSy6+Almq
 CITb7X8A726i4BI3USjY1cTf9RhEKCM7+G9vV4371i2lAuYJhoDUjpDq0jQtHd+KW5c8
 FOVBaCaJZNOJuU9nuBZX4/727QbA1+QN4H9lKZE+8MibCTG9Yhh6sTU/mfX5lzHhKLIU
 dbczdWUdyLtlVEWRZol2LfjXGv8bOuPSZOBkZgM3dYy/0JDIFLt/j2EgDnQ9aY73bZsD
 J3v3BHuOZaboW3P9B5ZOVSQOkTe8AioB60YMbj7v27F3+2B+NsgJmewzToPPk7xb6qQ5 TA== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3agp2bvs7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 18 Aug 2021 09:55:18 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17IDrDm8002356
 for <openbmc@lists.ozlabs.org>; Wed, 18 Aug 2021 13:55:18 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04wdc.us.ibm.com with ESMTP id 3ae5fdf8x2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 18 Aug 2021 13:55:18 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17IDtH2l28574140
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 18 Aug 2021 13:55:17 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CD2D136618
 for <openbmc@lists.ozlabs.org>; Wed, 18 Aug 2021 13:55:16 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C51781367D0
 for <openbmc@lists.ozlabs.org>; Wed, 18 Aug 2021 13:54:53 +0000 (GMT)
Received: from demeter.local (unknown [9.163.42.82])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 18 Aug 2021 13:54:53 +0000 (GMT)
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Security Working Group meeting - Wednesday September 18
Message-ID: <5dfb0b20-2c1b-8d6e-343d-2df228b3fdb3@linux.ibm.com>
Date: Wed, 18 Aug 2021 08:54:52 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Qc4Y3SpKEeQUqEn5WkuVkadJOkz9IlaV
X-Proofpoint-GUID: Qc4Y3SpKEeQUqEn5WkuVkadJOkz9IlaV
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-18_04:2021-08-17,
 2021-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 bulkscore=0 adultscore=0 mlxlogscore=914 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108180085
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
scheduled for this Wednesday September 18 at 10:00am PDT.

We'll discuss the following items on the agenda 
<https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
and anything else that comes up:

1. Wholesale changes to bitbake recipes were made.  See 
https://lore.kernel.org/openbmc/YQ1FD5q8KbhbXVBK@heinlein/T/#u 
<https://lore.kernel.org/openbmc/YQ1FD5q8KbhbXVBK@heinlein/T/#u>  My 
non-specific security concern (Joseph) is accidentally mis-configuring 
something with these changes.
2. Gerrit review - The BMCWeb session idle timeout changed to 30 minutes 
(was 60): https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/45658 
<https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/45658>
3. Yocto is planning a security configuration guide.  See 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14509 
<https://bugzilla.yoctoproject.org/show_bug.cgi?id=14509>

Access, agenda and notes are in the wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group 
<https://github.com/openbmc/openbmc/wiki/Security-working-group>

- Joseph
