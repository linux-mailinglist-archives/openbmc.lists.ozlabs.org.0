Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2605736DCD0
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 18:18:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVkLx4nSDz2yyx
	for <lists+openbmc@lfdr.de>; Thu, 29 Apr 2021 02:18:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ozO7l5ie;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ozO7l5ie; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVkLh4ZWVz2xg1
 for <openbmc@lists.ozlabs.org>; Thu, 29 Apr 2021 02:17:47 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13SG33Tf172122; Wed, 28 Apr 2021 12:17:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : subject : to : cc
 : message-id : date : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=BooUZxVmDmqEaE76HE7LyUysZBhf7+EFZhmX00mjfng=;
 b=ozO7l5ie2MB1noiAm2CFOvDS2lnt89mk5UNke1vqZ8evB2ikJ++hk/+APnxAGDCpbESj
 8cUTxksz3RDQSZ7SRpv6k5YGgvUejzEBH1ShCvsW4waXKWBGuUYx3rF9LyQE57ubwmf5
 tHb2/XgO9Zy1dU8FnE9QxRbCOgVWhEFd7GJndI8G3Ad/StJ6fx/nFYRsBJSqJdJUdypY
 /307EYBWHKgW02C2Co2WczF6PpLNZQ2Ebm4Z0svvqMcc+0USd7ZZgBzg4H9kuOWupEnz
 MXWlx+X7bbnMg7dE6dzkKZLjfw5AT2oEBP0dQVxn2wK/3Eq1UMrpksE51KzZv4qFasNf zw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3879af3y1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 12:17:42 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13SG3dYD177815;
 Wed, 28 Apr 2021 12:17:42 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3879af3y1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 12:17:42 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13SGDQn6017756;
 Wed, 28 Apr 2021 16:17:41 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma05wdc.us.ibm.com with ESMTP id 384ay9p797-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 16:17:41 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13SGHeiK22610384
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Apr 2021 16:17:40 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89D756A047;
 Wed, 28 Apr 2021 16:17:40 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD29F6A04D;
 Wed, 28 Apr 2021 16:17:38 +0000 (GMT)
Received: from [9.206.162.87] (unknown [9.206.162.87])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 28 Apr 2021 16:17:38 +0000 (GMT)
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Subject: Move Inventory.Item.Board from Redfish Chassis to Redfish Assembly
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <a3b81496-b34d-9198-66b0-f335de61a677@linux.vnet.ibm.com>
Date: Wed, 28 Apr 2021 10:17:36 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nnUQv02RblYVu0mVpDj2w9IB8yhS3C4d
X-Proofpoint-GUID: REYjzRxR_Ea742__u3JBeMaJfcr55FIu
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_09:2021-04-28,
 2021-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104280103
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
Cc: jason.m.bills@linux.intel.com, Ed Tanous <ed@tanous.net>,
 Derick <derick.montague@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

 From some discussion on Discord a few weeks ago. A newer way of 
thinking in Redfish is for a simple rack server to just have one Redfish 
Chassis and things like boards modeled as Redfish Assemblies under the 
Chassis.[1][2] Today we look for inventory item chassis and inventory 
item board[3] to populate the Chassis collection.[4] I propose we move 
the "Inventory.Item.Board" from Redfish Chassis to Redfish Assembly. 
Does this break anyone? Does anyone have an inventory item board that 
can't be a Redfish Assembly?

Another option would be to only move certain inventory item boards to 
Redfish Assembly, determined by a BoardType or additional more detailed 
Inventory Item interfaces around boards. Unless this is needed though 
would prefer the former for simplicity.

https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/39574 is adding 
the Assembly schema. This would be a later commit moving 
"Inventory.Item.Board".

[1]https://redfish.dmtf.org/redfish/mockups/v1/1018
[2]https://redfishforum.com/thread/325/fru-properties-redfish

[3]https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Inventory/Item/Board.interface.yaml

[4]https://github.com/openbmc/bmcweb/blob/8d1b46d7f8d39db2ba048f9e9007106ca3a28c9b/redfish-core/lib/chassis.hpp#L189

https://redfish.dmtf.org/schemas/v1/Chassis.v1_15_0.json
https://redfish.dmtf.org/schemas/v1/Assembly.v1_3_0.json

Thanks,
Gunnar
