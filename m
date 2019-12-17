Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38236123316
	for <lists+openbmc@lfdr.de>; Tue, 17 Dec 2019 18:00:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cksx0pxKzDqWq
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 04:00:37 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cks92NjmzDqPf
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 03:59:56 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBHGlRYb105595
 for <openbmc@lists.ozlabs.org>; Tue, 17 Dec 2019 11:59:53 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wy2ahhjts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 17 Dec 2019 11:59:53 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xBHGlW0S106259
 for <openbmc@lists.ozlabs.org>; Tue, 17 Dec 2019 11:59:53 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wy2ahhjtf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2019 11:59:53 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBHGv99x002510;
 Tue, 17 Dec 2019 16:59:52 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02dal.us.ibm.com with ESMTP id 2wvqc6nf1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2019 16:59:52 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBHGxpo739322090
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Dec 2019 16:59:51 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D44228058;
 Tue, 17 Dec 2019 16:59:51 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50B7F28059;
 Tue, 17 Dec 2019 16:59:51 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 17 Dec 2019 16:59:51 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 17 Dec 2019 11:01:06 -0600
From: Adriana Kobylak <anoo@linux.ibm.com>
To: rgrs <rgrs@protonmail.com>
Subject: Re: Firmware update error: Cannot UBI create volume
In-Reply-To: <1i6T-_CIXkSAHAqGbzb3IZW6jbo0mDc2nF7amahFYZ_d-4bMaTTMJeG2rb-1wE6J0OPb7NZRJ0Zx80eTDA5ukPs9CknlPBlw6IGMfHTwedI=@protonmail.com>
References: <1i6T-_CIXkSAHAqGbzb3IZW6jbo0mDc2nF7amahFYZ_d-4bMaTTMJeG2rb-1wE6J0OPb7NZRJ0Zx80eTDA5ukPs9CknlPBlw6IGMfHTwedI=@protonmail.com>
Message-ID: <0bedefae291dc69d048fd5806d17d385@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-17_03:2019-12-17,2019-12-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912170134
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2019-12-17 03:52, rgrs wrote:
> Hi All,
> 
> I have a strange behavior where only one image is visible in webUI.
> I get UBI "no space left" errors when I try to update/flash new image.
> I dont have steps to reproduce and dont know how my BMC ended up in
> this state.
> 
> How do I recover from this error? /proc/mtd shows all
> partitions/volumes properly.
> Is there any way to recover alternate partition without erasing SPI
> from uboot?

Seems there's an 'orphan' volume which you can manually delete to make 
space. A while back there was an issue at some point where not all the 
volumes were deleted during a firmware update.

> 
> root@obmc:~# ubinfo -d 4 -n 1
> Volume ID: 1 (on ubi4)
> Type: static
> Alignment: 1
> Size: 43 LEBs (2812544 bytes, 2.6 MiB)
> Data bytes: 2767008 bytes (2.6 MiB)
> State: OK
> Name: kernel-7e7e1530

This seems to be the 'orphan' since there's not a corresponding 
'rofs-7e7e1530' volume, you can manually delete it with "ubirmvol 
/dev/ubi4 -n 1". You can also list all the volumes of a device with 
"ubinfo -a -d 0" for example.
