Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AF331D315
	for <lists+openbmc@lfdr.de>; Wed, 17 Feb 2021 00:54:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DgHqz6DK7z3cK9
	for <lists+openbmc@lfdr.de>; Wed, 17 Feb 2021 10:54:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NZdGD9Gn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NZdGD9Gn; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DgHqk5X5Pz30MR
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 10:53:53 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11GNY80x028752
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2021 18:53:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : from : subject :
 message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=kp4mutmQwhpLV9HGqHpbuRHaxsnPPcDFlrWyVSzN0pM=;
 b=NZdGD9GnBEkmwIidYy9fv8Xs5c5+0uy5tXYrFuDvltbbZvR3GzqNaSIW+jSHkxJK4pQ8
 kPEsi4c/jOH2LKRZxMQeKl5CZp2Hz6uqq7+msPdeDXEtvK7cqVObSLhgfyE3mxEEP8Mh
 jnxybzjAbY0sKcTeczDhwoGtX7eGgLfi2DT2yn1+3Iby5xraGpJE2i4DrPlbJ/5JoEAP
 vqSaFT5sYQVqopXgGV8OhcNldNgXRNrb15HI2lgtAmFu4LIoVFIXXkJvDTDmIH0GZki7
 JAQHOp1uDZwajOg2ujxAVzcyshJsS52dkXXJLRNVnb7fZ2PDL3uGQTnr3j27AWmdoF3I VQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36rqkjrss8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2021 18:53:50 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11GNq2j2023865
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2021 23:53:49 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04dal.us.ibm.com with ESMTP id 36p6d9gg9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2021 23:53:49 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11GNrmDr14811594
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2021 23:53:48 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CF76C605B
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2021 23:53:48 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB5DCC605D
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2021 23:53:47 +0000 (GMT)
Received: from demeter.local (unknown [9.85.178.5])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2021 23:53:47 +0000 (GMT)
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Security Working Group meeting - Wednesday February 17
Message-ID: <f6a11337-711a-81db-23a8-44bc24b0072f@linux.ibm.com>
Date: Tue, 16 Feb 2021 17:53:46 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-16_15:2021-02-16,
 2021-02-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxlogscore=589 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102160187
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
scheduled for this Wednesday February 17 at 10:00am PDT.

We'll discuss the following items on the agenda 
<https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
and anything else that comes up:

1. Gerrit review FYI: log failed authentication attempts 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/39872

2. Gerrit review FTI: tie-in between Redfish sessions and IPMI 
sessions.  Redfish will GET & DELETE IMPI sessions 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/37785

3. (Joseph) Discuss adding Web-based SSH to BMCWeb ~ 
https://github.com/ibm-openbmc/dev/issues/2243

Access, agenda and notes are in the wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group 
<https://github.com/openbmc/openbmc/wiki/Security-working-group>
