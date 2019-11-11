Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E553F7FE4
	for <lists+openbmc@lfdr.de>; Mon, 11 Nov 2019 20:28:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BgrY030KzDqcq
	for <lists+openbmc@lfdr.de>; Tue, 12 Nov 2019 06:27:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Bgq93SDFzF2D1
 for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2019 06:26:44 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xABJMtpQ135791
 for <openbmc@lists.ozlabs.org>; Mon, 11 Nov 2019 14:26:41 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w7cujt78q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 11 Nov 2019 14:26:41 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xABJP2DX022628
 for <openbmc@lists.ozlabs.org>; Mon, 11 Nov 2019 19:26:40 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 2w5n3663bu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 11 Nov 2019 19:26:40 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xABJQdOA34996690
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 11 Nov 2019 19:26:39 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AF62B2065
 for <openbmc@lists.ozlabs.org>; Mon, 11 Nov 2019 19:26:39 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 148D4B205F
 for <openbmc@lists.ozlabs.org>; Mon, 11 Nov 2019 19:26:39 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Mon, 11 Nov 2019 19:26:38 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 11 Nov 2019 13:28:11 -0600
From: Adriana Kobylak <anoo@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: Packaging and deploying multiple firmware image types in one
Message-ID: <d9a820f4778cc2964d6f0a9b8a78d722@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-11_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=982 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911110173
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

There was some discussion in the "PSU firmware update" proposal[1] about 
bundling firmware images together such as the BMC and PSU firmware. The 
Software interface defines these bundles as a "System" version[2].

At IBM, we're starting to create a "System" bundle of BMC + host 
firmware by adding a recipe that would add the host's firmware files to 
the BMC's squashfs[3].

One of the pending items is determining how to showcase the version of 
these System images in Redfish. We can assume that the version of a 
System image corresponds to the BMC's "FirmwareVersion", but it's 
unknown what else the bundle contains (host fw, PSU fw, PCIe fw,..), in 
order to populate the other version fields such as "BiosVersion". 
There's a D-Bus "Extended Version" property[4] that could be leveraged 
to add the additional image information.

Feel free to share if you have any thoughts on this item or any aspect 
of these "System" images.


---
[1] https://lists.ozlabs.org/pipermail/openbmc/2019-June/016573.html
[2] 
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Software/Version.interface.yaml
[3] 
https://github.com/openbmc/meta-openpower/blob/master/recipes-phosphor/flash/host-fw_git.bb
[4] 
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Software/ExtendedVersion.interface.yaml
