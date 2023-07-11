Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BD174FB43
	for <lists+openbmc@lfdr.de>; Wed, 12 Jul 2023 00:49:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=icPcw4D1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0wzQ6hj4z3bx0
	for <lists+openbmc@lfdr.de>; Wed, 12 Jul 2023 08:49:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=icPcw4D1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=lakshmiy@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0wyr5rxXz3bTk
	for <openbmc@lists.ozlabs.org>; Wed, 12 Jul 2023 08:48:52 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36BMlnfb030463
	for <openbmc@lists.ozlabs.org>; Tue, 11 Jul 2023 22:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to :
 subject : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=ON6lUntqlgyjkwMyY2FNtX/I5g66UPNShzm3looDcY4=;
 b=icPcw4D16C8wkrxBeuUcufNkFKK/5brwdIcQpU1j70wz7JJRcp7ZYGUX0CEDZvbppDp+
 Hy/x07XPmDAHe7cZtvAeCkFSvqFoPtzxDblzs79/Fv4H3Vex0wjUjpLAlGIGzv727xyh
 wuye07IaXVT3pP3bvxw1PWbRhDFhyGMPwLNCm+Rp8WIv3N+Qq6eVNd4nRrPxIsw2c8bP
 4fsnattXSCnT8d0Q4fi33tW+SaGgYbd3te+xeFqZnVDiA32XHZJ7EVI2m1e/mADB70lP
 jNY+gW9WCfKqqPtj638nR99Z0Ghb9jDLWRMOsFUMESSI9rJh07nSROJiztFKkRUifr/h nQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rsg6980b9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Tue, 11 Jul 2023 22:48:48 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36BM9vwF027322
	for <openbmc@lists.ozlabs.org>; Tue, 11 Jul 2023 22:48:47 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3rpye68ybs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Tue, 11 Jul 2023 22:48:47 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36BMmktT1966676
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openbmc@lists.ozlabs.org>; Tue, 11 Jul 2023 22:48:46 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0EB6C58059
	for <openbmc@lists.ozlabs.org>; Tue, 11 Jul 2023 22:48:46 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C5E6658058
	for <openbmc@lists.ozlabs.org>; Tue, 11 Jul 2023 22:48:45 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.5.196.140])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP
	for <openbmc@lists.ozlabs.org>; Tue, 11 Jul 2023 22:48:45 +0000 (GMT)
Date: Tue, 11 Jul 2023 17:48:45 -0500
From: lakshmiy <lakshmiy@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: Implementing the Slot information in the PCIeDevice schema
Message-ID: <02a15f1e4669516f6912a5e97a5bff32@linux.vnet.ibm.com>
X-Sender: lakshmiy@linux.vnet.ibm.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: e2_H68gimmqfKQIQl7I8pS1aRpVSocsI
X-Proofpoint-GUID: e2_H68gimmqfKQIQl7I8pS1aRpVSocsI
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_12,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 clxscore=1011 bulkscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=312 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307110205
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

Redfish has moved away from the PCIeSlots schema and instead includes 
the PCIeSlot information within the PCIeDevice schema. This matches 
other Redfish schemas like Dimm or Processor.

The key highlights of this update include:
1. Integration of PCIeSlot information within the PCIeDevice schema.
        https://gerrit.openbmc.org/c/openbmc/bmcweb/+/62737
2. Inclusion of empty PCIeSlots in the PCIeDevice list, providing a 
comprehensive view of the PCIe infrastructure.
        https://gerrit.openbmc.org/c/openbmc/bmcweb/+/62073

Please note that while PCIeSlots is still present in the bmcweb, it may 
be considered for deprecation in the future as we transition to the new 
design.

Thanks,
Lakshmi Yadlapati
