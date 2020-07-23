Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEBA22B281
	for <lists+openbmc@lfdr.de>; Thu, 23 Jul 2020 17:28:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCGSV11VhzDrPV
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 01:28:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCGPV0RFzzDrP0
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 01:25:49 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06NF4Hv4008273
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 11:25:45 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32fb8xkchg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 11:25:45 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06NFKBYh019504
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 15:25:44 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 32d5dqpdpb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 15:25:43 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06NFPgXE3080866
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 15:25:42 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 862F16A04D
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 15:25:42 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F4956A058
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 15:25:42 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.172.74])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 15:25:41 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: BMCWeb policy for HTTPS site identity certificate
To: openbmc <openbmc@lists.ozlabs.org>
Message-ID: <d50417a7-3cc2-1674-b4d1-09283c4ddaf5@linux.ibm.com>
Date: Thu, 23 Jul 2020 10:25:40 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-23_06:2020-07-23,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=964 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007230109
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

This is a followup to the OpenBMC security working group meeting 
discussion on 2020-07-22 
(https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI).

Background:
Per [BMCWeb configuration 
policy](https://github.com/openbmc/bmcweb#configuration), BMCWeb 
generates a new HTTPS site identity certificate if a usable one cannot 
be found.  You can upload one via APIs described here: 
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Certs/README.md#redfish-certificate-support

Problem:
BMCWeb apparently treats certificates that are either expired or not 
valid until a future date as unusable (investigation needed).  And 
BMCWeb deletes unusable certificates.  This can confuse the 
administrator, especially considering the BMC's time-of-day clock may 
not be set as expected.

Proposal:
What certificate management policy should BMCWeb use?  Here is an 
initial proposal:
1. certificate is perfectly good - Use the certificate.
2. certificate is good but expired or not yet valid - Use the 
certificate and log a warning.
3. certificate is missing or bad format or algorithm too old - Use 
another certificate or self-generate a certificate (and log that action).
In no case should BMCWeb should delete any certificate.

Discussion?

