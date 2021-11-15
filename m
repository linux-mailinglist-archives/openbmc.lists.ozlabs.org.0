Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD334509C5
	for <lists+openbmc@lfdr.de>; Mon, 15 Nov 2021 17:37:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtFGN5xSjz2yLv
	for <lists+openbmc@lfdr.de>; Tue, 16 Nov 2021 03:37:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m8klIvex;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=m8klIvex; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtFFw5pK3z2xr3
 for <openbmc@lists.ozlabs.org>; Tue, 16 Nov 2021 03:36:51 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AFF981r010670; 
 Mon, 15 Nov 2021 16:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date : from
 : subject : to : content-type : content-transfer-encoding : mime-version;
 s=pp1; bh=Ua2PPvSdFRNyJj8jYsJLYrtuogWR4a5TNWwhBI9QVto=;
 b=m8klIvexwK/+qqMxabRc5AEScsYffs4ACpu6fxoakW7wRUtBSkydEtWTaUc9R/odGSsa
 i0pBNQWg97P3kfn2pmoMGG0L4bBEnd3SOZRn5xvem7YiOOGL/+oP20OIJI7DLCImegR7
 P8kvVOhZ/ieONv1qdwGDRravIUQGNwGXmYR4t0wJNdEaeQYNanHqv5XZO9itYMdw4VVu
 gWimCHJxNlokD8JdBgcnCtOpEfwNvhrDK6crWh6nucWaTKvmSabW/1Pik/DRFvDFnVOx
 bRlB0UhYgYYvAforHLrzCrJKHCzdUFmii1CIyK/EyqffN8NVmpIE2rOoWbqKFRqJO0uN 5Q== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cbkd52qsg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Nov 2021 16:36:46 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AFGRVgS030343;
 Mon, 15 Nov 2021 16:36:45 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 3ca50b28vu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Nov 2021 16:36:45 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AFGajeb29753616
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Nov 2021 16:36:45 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EBC8728073;
 Mon, 15 Nov 2021 16:36:44 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F2AD28058;
 Mon, 15 Nov 2021 16:36:44 +0000 (GMT)
Received: from [9.160.88.214] (unknown [9.160.88.214])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 15 Nov 2021 16:36:44 +0000 (GMT)
Message-ID: <d204389c-abf0-3547-ebfc-94af0b659bab@linux.ibm.com>
Date: Mon, 15 Nov 2021 10:36:42 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Service-config-manager persistence expectations across BMC reboots
To: AppaRao Puli <apparao.puli@linux.intel.com>,
 Richard Marian Thomaiyar <richard.marian.thomaiyar@linux.intel.com>,
 openbmc <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rjsg--UPyxHTqEr9bqvCjJUFEYcCP9mO
X-Proofpoint-GUID: rjsg--UPyxHTqEr9bqvCjJUFEYcCP9mO
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-15_10,2021-11-15_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 clxscore=1011 phishscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 spamscore=0 mlxlogscore=958 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111150086
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


What are the expectations for the service config manager application?  
[1][2]  Specifically, when service config manager is used to enable or 
disable a service (like bmcweb, network IPMI, SSH, etc.) - is that 
setting expected to persist across rebooting the BMC?

I believe the settings must persist across BMC reboots.  This question 
came up in gerrit review 48780 [3].

The test scenario would be:
1. Disable aservice (and validate its state).
2. Reboot the BMC.
3. Validate the service' state.
4. Repeat the above steps for the "enabled" state.

1. Is this expectation consistent across the OpenBMC community?

2. Can this knowledge be added to the service-config-manager README file?

3. Do we have test cases for each service's settings?

Joseph

References:
1. https://github.com/openbmc/service-config-manager

2. 
https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/yaml/xyz/openbmc_project/Control/Service

3. 
https://gerrit.openbmc-project.xyz/c/openbmc/service-config-manager/+/48780

