Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9262828DF06
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 12:39:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CB86t72ynzDqmh
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 21:39:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fy95Fbso; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CB84r1zvyzDqlJ
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2020 21:37:47 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09EAXDSU069265
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2020 06:37:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 cc : to; s=pp1; bh=3rSRHLeOlroj9LNugJrOKksZBJw2EVBsnYDjCHBIfuI=;
 b=fy95FbsoL8sNZujFe0Ig5+blFXwkpvAw6gTjsmMcITp+KpXqy5BMR9vn/2pzCe0+LvF2
 iWqeXaQu9WoHsGkO9bikeafC8AX06CGf2lmadJ0M26K4ef9aIOiusLERrf5zfte6mrdY
 m+3BTlurJef0JFAuK5dqS6t8OrRk0IFMYzDvzj7gJuJXcMybyZ4higNuOLEPPiMxPNsu
 ZAzeBd9yGK2C9f7kaXP6m7J8Yx9O5YywtQaljExCTr/xq0VZ6S8ohb53gFsHqkcWaIo3
 62MWvhOHb1LEJBD5JJKQO9NX0RSUwTq5/RABAIc3jbmLZDLupUQ2RXq0v+2J8AbwdZnP 9Q== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 345yeyrhwb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2020 06:37:45 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09EAbZZk021206
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2020 10:37:43 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 344558sf2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2020 10:37:43 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09EAbfCU31392172
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Oct 2020 10:37:41 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DC2A42047;
 Wed, 14 Oct 2020 10:37:41 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C51342045;
 Wed, 14 Oct 2020 10:37:40 +0000 (GMT)
Received: from [9.85.75.86] (unknown [9.85.75.86])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 14 Oct 2020 10:37:40 +0000 (GMT)
From: vishwanatha subbanna <vishwa@linux.vnet.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Representing PCIE slots as Inventory Item in OpenBMC
Message-Id: <5D5E39C1-7614-423E-B3CC-5434CAE8C900@linux.vnet.ibm.com>
Date: Wed, 14 Oct 2020 16:05:28 +0530
To: openbmc@lists.ozlabs.org
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_06:2020-10-14,
 2020-10-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=507 bulkscore=0 priorityscore=1501 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010140072
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

Hello,

IBM has a need to represent PCIE slots as Inventory Item and I have =
pushed the interface commit:
=
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/=
37392/

Our proposal is to represent each PCIE slot as : =
/xyz/openbmc_project/inventory/<$board>/pcieslot/<$slot_number>

To represent 'em in Redfish, we would use the PCIeSlot schema: =
https://redfish.dmtf.org/schemas/v1/PCIeSlots.v1_4_0.yaml

Would the community have any feedback ?

Thank you,
!! Vishwa !!=
