Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B2419ADBE
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 16:22:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48spLs3Fq6zDqYj
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 01:22:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ratagupt@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48spGX0WRLzDqm6
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 01:18:58 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031E4FJA017588
 for <openbmc@lists.ozlabs.org>; Wed, 1 Apr 2020 10:18:55 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3043g8ccry-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 01 Apr 2020 10:18:54 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Wed, 1 Apr 2020 15:18:41 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 1 Apr 2020 15:18:40 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 031EIoRB53018746
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 1 Apr 2020 14:18:50 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C58F0AE04D
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 14:18:50 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 659F2AE045
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 14:18:50 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.41.2])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 14:18:50 +0000 (GMT)
Subject: Re: Security Working Group - Wednesday April 1
To: openbmc@lists.ozlabs.org
References: <44bae429-2507-e044-2d0e-c4e110dfa700@linux.ibm.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Wed, 1 Apr 2020 19:48:49 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <44bae429-2507-e044-2d0e-c4e110dfa700@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20040114-0008-0000-0000-000003688385
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040114-0009-0000-0000-00004A8A0C33
Message-Id: <9e9929c1-1c55-43ea-236d-b14c82aacf88@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_01:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 malwarescore=0 mlxlogscore=865 impostorscore=0 clxscore=1015
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010127
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

Hi Joseph,

We did some POC around selinux, will share the detailed use-cases with 
selinux which can be useful in openbmc stack.

selinux is taking around 18MB space on flash, Is it a concern?

Regards

Ratan

On 3/31/20 9:51 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday April 1 at 10:00am PDT.
>
> We'll discuss current development items, and anything else that comes up.
>
> The current topics:
>
> 1. SELinux or AppArmor plans
>
> Access, agenda, and notes are in the wiki:
>
> https://github.com/openbmc/openbmc/wiki/Security-working-group
>
> - Joseph
>

