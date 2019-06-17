Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D35ED48BB1
	for <lists+openbmc@lfdr.de>; Mon, 17 Jun 2019 20:14:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SK9d130czDqPw
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2019 04:14:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SK925sx2zDq9s
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2019 04:13:58 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5HI7Z9d018553
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2019 14:13:54 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t6dnhe1ym-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2019 14:13:54 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Mon, 17 Jun 2019 19:13:53 +0100
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 17 Jun 2019 19:13:52 +0100
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5HIDpcq35389772
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 18:13:51 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA0D72805A;
 Mon, 17 Jun 2019 18:13:50 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9793528058;
 Mon, 17 Jun 2019 18:13:50 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 17 Jun 2019 18:13:50 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 17 Jun 2019 13:15:22 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: Re: OpenBMC on eMMC NAND
In-Reply-To: <2e42e3a31de54d202fb5a9d867414a87@linux.vnet.ibm.com>
References: <2e42e3a31de54d202fb5a9d867414a87@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19061718-0060-0000-0000-000003517E58
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011280; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01219368; UDB=6.00641375; IPR=6.01000509; 
 MB=3.00027347; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-17 18:13:53
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061718-0061-0000-0000-000049CE644E
Message-Id: <c757a592b3587a40807012d2cfa4d129@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-17_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906170162
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
Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2019-06-17 11:26, Adriana Kobylak wrote:
> Hi all,
> 
> Joel and I have been working on getting OpenBMC to run on an eMMC NAND.
> For the kernel, there'll be some patches coming to support it.
> For the rootfs, the proposal is to have an ext4 filesystem, and use
> lvm for volume management, which allows for dynamic partitioning.

I'll be filling up a design doc to document this proposal. Also we don't
have documentation for the currently supported filesystems, so I'll be
pushing up new docs based on Milton's writeup[2] to document the 
existing
implementations. The initial commit to propose a subdir to hold these
upcoming docs is in gerrit for review[3].

> For proof of concept, we're starting to build an ext4 BMC image for
> IBM's system Swift[1]. Up next is creating an initramfs that supports
> lvm, and update the code update apps to handle ext4 images and lvm
> volumes. Thinking of creating an 'lvm' or 'ext4' distro feature like
> the 'ubi' one to enable this new support during build time.
> Let us know if there are any opinions, questions, or interest. Look
> for updates on the mailing list as we continue to make progress.
> 
> 
> [1] https://gerrit.openbmc-project.xyz/c/openbmc/meta-ibm/+/22436

[2] https://lists.ozlabs.org/pipermail/openbmc/2017-August/008703.html
[3] https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/22666

