Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5422CF559
	for <lists+openbmc@lfdr.de>; Fri,  4 Dec 2020 21:12:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnkQB1JrgzDrVP
	for <lists+openbmc@lfdr.de>; Sat,  5 Dec 2020 07:12:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sn/UCI0d; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnkPD4RCYzDqCp
 for <openbmc@lists.ozlabs.org>; Sat,  5 Dec 2020 07:11:28 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B4K3Tij130086
 for <openbmc@lists.ozlabs.org>; Fri, 4 Dec 2020 15:11:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : from : subject :
 message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=dsoeJ8+IOIiRmdwHwXeHBPCRVr4NuQAgJphNUDoeLDQ=;
 b=sn/UCI0daOkiCBnWxiQNg7xxMPXzvPISuivj1DiiYQ2NttWMJ6TMyaPi/KN4Aqywn1xY
 XweXlma1qNZFH6+JB+hbm2KH42qIW61KHPmHuwrYgaJe/Mt7rUZ9baK+gCnMMLDyv0Pz
 tYFNqEwecD3F1dwTYhY5xXG/Jypp8bxqaI6IrldbAyvTZhupLDaHpDsnFJzdXa0N9E/x
 abQdaB75gpnsDuwHc0Z9zdA6GmN1pFcTMPT7YYJP/sw9IKBLEtL7HD2oBUbG5cGt2Gsj
 TuQeMuxSjzYVw4LcfgsE7ZnyJPoPxc/y73ErUK/NGS2yWouT3XwTdq55roCrluxOrkg/ pA== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357uq6gdf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 04 Dec 2020 15:11:25 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B4JqPgZ004789
 for <openbmc@lists.ozlabs.org>; Fri, 4 Dec 2020 20:11:24 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 355vrgddek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 04 Dec 2020 20:11:24 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B4KBNGI22217060
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Fri, 4 Dec 2020 20:11:23 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E4BDBE05D
 for <openbmc@lists.ozlabs.org>; Fri,  4 Dec 2020 20:11:23 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65B95BE059
 for <openbmc@lists.ozlabs.org>; Fri,  4 Dec 2020 20:11:23 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.165.167])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Fri,  4 Dec 2020 20:11:23 +0000 (GMT)
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Proposal add PerformService privilege
Message-ID: <1bfe87ea-9fc5-8664-d1de-d3138616a427@linux.ibm.com>
Date: Fri, 4 Dec 2020 14:11:21 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_09:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=709 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012040114
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

This is a proposal to add an OemOpenBMCPerformService privilege to BMCWeb.

See https://redfishforum.com/thread/397/redfish-direction-update-eeproms
As mentioned in the Redfish forum thread, the use case is that some 
OpenBMC use cases require isolating manufacturing and service functions 
away from the customer/admin (including updating FRU serial numbers, and 
updating a permanent MAC address), and this is a Redfish compatible way 
to do it.

The work items would be like:
- Add this OEM privilege to the base BMCWeb implementation.
- Identify URIs that we need to be able to isolate away from 
customer/admins.  Then modify the privilege mapping to require this 
privilege to PUT to those URIs.
- Add this privilege to the Administrator role (but not Operator or 
ReadOnly).
- Document how to isolate these operations.  Specifically, remove this 
privilege from Administrator, and create a custom OEM role that has this 
privilege

What do you think?
- Joseph

