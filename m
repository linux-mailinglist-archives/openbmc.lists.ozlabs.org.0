Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B588841BC32
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 03:35:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJzTg4XZCz2ymr
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 11:35:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dorzW+AC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dorzW+AC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJzTC49bBz2yNY
 for <openbmc@lists.ozlabs.org>; Wed, 29 Sep 2021 11:35:10 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18T0x1K5030102
 for <openbmc@lists.ozlabs.org>; Tue, 28 Sep 2021 21:35:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : from : subject :
 message-id : date : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=agENvqUaWoBudGjRLf/Tw7oMZjjMpUfr0K3aWswG26o=;
 b=dorzW+ACfZoC8selMflVcDNvpC+m95lfnwBcznEvkSS+4arg1E7JYGy/uT98TdNjSfzU
 OVlSOyRCmObvFU+6mktMocnF8lyIEwAJHh0F951d+U0liKoPKb7QCbEM1STbW+JLDaLN
 NIcq/VooItrYcJXnJ15gL2nXd8IjuvQySXywHQO0YecSTbAk1bvhkrlaUSfx0uxSLY+i
 +/Z+YI2x81Z26XRZgHpMYtA1Gs7wu84r/2QbQoLsk2PKu4H7pkeowcE/sGSRnHSBrDg3
 QXg4pq288uXWtNsM584tf9IUTXkG9TGesO+q2E6DMm92Lpuqc/js+tAZxtJ2kjXhp04A bQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bce32gkwj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 28 Sep 2021 21:35:07 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18T1Ruj8007924
 for <openbmc@lists.ozlabs.org>; Wed, 29 Sep 2021 01:35:07 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 3b9udbp84y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 29 Sep 2021 01:35:06 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18T1Z5nW20316552
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 29 Sep 2021 01:35:05 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 427AF136053
 for <openbmc@lists.ozlabs.org>; Wed, 29 Sep 2021 01:35:05 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDAB313605D
 for <openbmc@lists.ozlabs.org>; Wed, 29 Sep 2021 01:35:04 +0000 (GMT)
Received: from demeter.local (unknown [9.65.194.119])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 29 Sep 2021 01:35:04 +0000 (GMT)
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Security Working Group meeting - Wednesday September 29
Message-ID: <bb3c031e-cbe3-36c5-0db6-d1ef454300fd@linux.ibm.com>
Date: Tue, 28 Sep 2021 20:35:03 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: k5_ChFATx_vTZLNdyni9BJfLUP0AWj_B
X-Proofpoint-ORIG-GUID: k5_ChFATx_vTZLNdyni9BJfLUP0AWj_B
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-28_11,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=596 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109290005
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
scheduled for this Wednesday September 29 at 10:00am PDT.

We'll discuss the following items on the agenda 
<https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
and anything else that comes up:

1. Continue discussion: Password based auth for IPMI over DTLS 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/31548 
<https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/31548>
2. (Joseph) Who wants a function to enable/disable BMC USB ports? 
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/47180 
<https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/47180>



Access, agenda and notes are in the wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group 
<https://github.com/openbmc/openbmc/wiki/Security-working-group>

- Joseph
