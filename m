Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 108E31E6CE0
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 22:51:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Y0HL16ZNzDqZC
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 06:51:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LYST7Um+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Y0GQ4MKvzDqZC
 for <openbmc@lists.ozlabs.org>; Fri, 29 May 2020 06:50:53 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04SKXGfc166715; Thu, 28 May 2020 16:50:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-type : content-transfer-encoding : date : from : to : cc : subject
 : in-reply-to : references : message-id; s=pp1;
 bh=36MZN6czGBaxI5Tfk85C0SDNy9YvNIPuU3QokukftkM=;
 b=LYST7Um+jFsyyHVdCxj3W6HVxO2mHy8IbfJ/N2Izt90NLfb74RBnxqsgRel9fV17cC3F
 UqO2zBUDQrsua+E18ftpuctUGtjGyHmwCxDV3gNXM9B2gUd+BcZZcM+N/Fy1Pzm+MOwN
 7q4Yolzw2mT+5v3fLxC5AFy8F4D/JMTEeJw29qgE8iN00MJ1z5eNjFuPrGrb+io90ZXA
 xYWvnwWZSWR37D+W+tO18yJGd6IYPHlNQ/6V+PRb56p0PJg4I80+8/wcicrFjYp6L6R/
 fPYaQ+dUyxVOu2FAntoXJNlvb9i4FkHlKvef+YzxsJPXCIyblz5yfU0mjs3VtJsPXLPZ 6w== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31akh99xk5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 May 2020 16:50:43 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04SKfXsa019565;
 Thu, 28 May 2020 20:50:43 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04dal.us.ibm.com with ESMTP id 316ufas50k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 May 2020 20:50:43 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04SKofiU27853246
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 May 2020 20:50:41 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB87CBE04F;
 Thu, 28 May 2020 20:50:41 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74BF6BE053;
 Thu, 28 May 2020 20:50:41 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 28 May 2020 20:50:41 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 28 May 2020 15:50:41 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: "Bodireddy, Vikram" <vikram.bodireddy@linux.intel.com>
Subject: Re: openBMC eMMC image support
In-Reply-To: <48aa2966-cca6-342c-32f3-13493cfd9399@linux.intel.com>
References: <c2d7ecb8-b0b8-c5a3-12e7-7201fbd86b1a@linux.intel.com>
 <b13a0e82-4f88-f35b-0d3f-8f7d6a91351b@linux.intel.com>
 <b8407f3ebaa1e5d24750551f4ad4f3aa@linux.vnet.ibm.com>
 <48aa2966-cca6-342c-32f3-13493cfd9399@linux.intel.com>
Message-ID: <0b6e67b600d2f75b9f5b2c9cb9985c77@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-28_07:2020-05-28,
 2020-05-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 cotscore=-2147483648 phishscore=0 mlxlogscore=737
 mlxscore=0 impostorscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005280131
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
Cc: andrew@aj.id.au, openbmc@lists.ozlabs.org,
 richard.marian.thomaiyar@linux.intel.com, suryakanth.sekar@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2020-05-28 11:45, Bodireddy, Vikram wrote:
> Thanks Adriana.
> 
> I will ping you on IRC. Can you please add me and Surya to all of the
> eMMC reviews.

Done.

> 
> Do we have any document on the image build changes that needed for 
> eMMC?

The design doc alludes to the changes needed but does not exactly spell 
out what files need to be created/changed - 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/28443

Most of the build changes are now up in gerrit for review. Leave a 
comment if you have any questions or feedback.

In summary:
u-boot: Pending.
kernel: fitImage as a file in first partition mmcblk0p1 configured as an 
ext4 filesystem mounted on /boot/
user space: device mappers in second partition mmcblk0p2

Secure boot will be addressed at a future iteration.
