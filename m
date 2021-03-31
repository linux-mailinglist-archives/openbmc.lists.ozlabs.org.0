Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1107A34F5A2
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 02:56:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F97Dj0NF7z3bvk
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 11:56:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CDHUsOqc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CDHUsOqc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F97DS0bdCz3bpZ
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 11:56:23 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12V0WxtJ192296
 for <openbmc@lists.ozlabs.org>; Tue, 30 Mar 2021 20:56:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : from : subject :
 message-id : date : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=UV1hR8SZu7iLoJqDHgBcXwnzyaBDC/LPjKlIgC2qGLE=;
 b=CDHUsOqc6/8ZOe2ge5ykHXbYeN08gBtlQEulF/JVyE33XpcMvu1EnLmGN74sCcRjsYHo
 apptBIw2FDcDWFiUdhhMITWsUvcQRjqAVZ8ljeOE0A10Ipt0m/RpNKU4xXy6ldFxod0D
 NWIcGEmRoDV8+wGRkmcz5TqQBhnXGf18C/UrnLnNz399FRK8unzX67BBHzWG91Bp6bsb
 fL3ysfyzwGQcVux1lQhWYe6Sp992y6GX+iQtKHSC/FtyXODSmr60mbiz6FUj3wS+ZgII
 sLmCYr96nunzHZNLCFFoFWzA8lN8AAp3iAZUWmoj/yU94xIxBSijC1WWUV5ka6V6fgQc Vw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37mb4qvyh8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 30 Mar 2021 20:56:21 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12V0q8Ti028007
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 00:56:20 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01dal.us.ibm.com with ESMTP id 37maaw9xt8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 00:56:20 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12V0uJcT26476850
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 00:56:19 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BAC72805E
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 00:56:19 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED69D2805A
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 00:56:18 +0000 (GMT)
Received: from demeter.local (unknown [9.160.39.65])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 00:56:18 +0000 (GMT)
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Security Working Group - Wednesday March 31
Message-ID: <a8366b66-4a8a-2492-7034-a35b06421961@linux.ibm.com>
Date: Tue, 30 Mar 2021 19:56:18 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0h47eblepyIl2mPcmMHA8X4Dj2MHqZra
X-Proofpoint-ORIG-GUID: 0h47eblepyIl2mPcmMHA8X4Dj2MHqZra
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-30_13:2021-03-30,
 2021-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=747 mlxscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2103300000 definitions=main-2103310000
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
scheduled for this Wednesday March 31 at 10:00am PDT.

We'll discuss the following items on the agenda 
<https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
and anything else that comes up:

 1.

    Joseph: https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/41560
    <https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/41560>  Add
    PerformService privilege.

 2.

    Joseph: Design for User role configuration
    https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/41652
    <https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/41652>

 3.

    Joseph: Interest in OpenBMC learning series talk “OpenBMC secure
    engineering”?

 4.

    Anton: Privilege separation
    <https://docs.google.com/document/d/1EI-HfPb_NMp9GD0fY6-XCpnKAX6-ZsdpDEsmiX5d6fc/edit#heading=h.b167mnkkse22>



Access, agenda and notes are in the wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group 
<https://github.com/openbmc/openbmc/wiki/Security-working-group>

- Joseph


