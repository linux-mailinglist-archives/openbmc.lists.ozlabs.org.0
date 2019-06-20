Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 547224D4BD
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 19:22:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45V7td0ZltzDrH8
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 03:22:49 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45V7st18y6zDrG3;
 Fri, 21 Jun 2019 03:22:09 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5KH2ub2052679; Thu, 20 Jun 2019 13:22:06 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t8e4v0t21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jun 2019 13:22:06 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5KH6cwT009015;
 Thu, 20 Jun 2019 17:22:05 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 2t4ra6jyt2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jun 2019 17:22:05 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5KHM40Q59441412
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jun 2019 17:22:04 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2FAEFC6057;
 Thu, 20 Jun 2019 17:22:04 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0ECD4C605A;
 Thu, 20 Jun 2019 17:22:04 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 20 Jun 2019 17:22:03 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 20 Jun 2019 12:23:43 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: Re: OpenBMC on eMMC NAND
In-Reply-To: <c757a592b3587a40807012d2cfa4d129@linux.vnet.ibm.com>
References: <2e42e3a31de54d202fb5a9d867414a87@linux.vnet.ibm.com>
 <c757a592b3587a40807012d2cfa4d129@linux.vnet.ibm.com>
Message-ID: <bde282e4cce70ffa10586d8c09536f70@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-20_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906200124
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

On 2019-06-17 13:15, Adriana Kobylak wrote:
> On 2019-06-17 11:26, Adriana Kobylak wrote:
>> Hi all,
>> 
>> Joel and I have been working on getting OpenBMC to run on an eMMC 
>> NAND.
>> For the kernel, there'll be some patches coming to support it.
>> For the rootfs, the proposal is to have an ext4 filesystem, and use
>> lvm for volume management, which allows for dynamic partitioning.
> 
> I'll be filling up a design doc to document this proposal. Also we 
> don't

Design proposal up in the gerrit for review/comment[4].

> have documentation for the currently supported filesystems, so I'll be
> pushing up new docs based on Milton's writeup[2] to document the 
> existing
> implementations. The initial commit to propose a subdir to hold these
> upcoming docs is in gerrit for review[3].
> 
>> For proof of concept, we're starting to build an ext4 BMC image for
>> IBM's system Swift[1]. Up next is creating an initramfs that supports
>> lvm, and update the code update apps to handle ext4 images and lvm
>> volumes. Thinking of creating an 'lvm' or 'ext4' distro feature like
>> the 'ubi' one to enable this new support during build time.
>> Let us know if there are any opinions, questions, or interest. Look
>> for updates on the mailing list as we continue to make progress.
>> 
>> 
>> [1] https://gerrit.openbmc-project.xyz/c/openbmc/meta-ibm/+/22436
> 
> [2] https://lists.ozlabs.org/pipermail/openbmc/2017-August/008703.html
> [3] https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/22666

[4] https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/22854
