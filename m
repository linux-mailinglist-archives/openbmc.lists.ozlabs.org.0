Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8849610A2DF
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 17:59:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Mqqv5qRlzDqWv
	for <lists+openbmc@lfdr.de>; Wed, 27 Nov 2019 03:59:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Mqq46kq5zDqWv
 for <openbmc@lists.ozlabs.org>; Wed, 27 Nov 2019 03:58:23 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAQGrHtt014730
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 11:58:20 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wh6pgv43c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 11:58:19 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAQGslFq010649
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 16:58:19 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 2wevd6m2ve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 16:58:19 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAQGwIu758720536
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 16:58:18 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E8068BE058
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 16:58:17 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF15BBE051
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 16:58:17 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Tue, 26 Nov 2019 16:58:17 +0000 (GMT)
Subject: Re: Security Working Group meeting - Wednesday November 13
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <e09ab4b0-3f7f-4615-da0f-ebbc2ca07592@linux.ibm.com>
Message-ID: <5d0b1478-5a2a-8e95-a5d0-05a60f54d029@linux.ibm.com>
Date: Tue, 26 Nov 2019 10:58:16 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e09ab4b0-3f7f-4615-da0f-ebbc2ca07592@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_04:2019-11-26,2019-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 mlxscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1911260141
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

On 11/11/19 3:50 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday November 13 at 10:00am PDT.
>
> * * NOTE - the USA went off daylight savings time since the previous 
> meeting  * *
> This means the meeting may be an hour later for you.  Please check 
> your caneldar.
>
> As usual, we'll discuss current development items, and anything else 
> that comes up.  There are currently three topics:
>  1. Allow BMC Admin to enable and disable BMC interfaces.
>  2. BMC secure boot design.
>  3. Disable SSL Renegotiation.

We spent the entire time discussing the BMC's interfaces.  The full 
meeting minutes (such as they are) are in the google doc 2019-11-13 
Highlights: - Interfaces which should be enabled by default: BMC network 
interface, HTTPS, Redfish. - However, the question of which interfaces 
which should be enabled by default depends on the use case for 
provisioning and operation of the BMC. A counter example is a BMC 
operated by its host system (which may not need network). - Next steps:
    1. Refine the list of interfaces and figure out which we are willing 
to implement controls for.
    2. Work to understand how the interfaces are structured, including 
various use cases.
    3. Continue to look for standards from Redfish, etc.

- Joseph

>
> NOTE:  * * There is some level of excitement to discuss the BMC's 
> interfaces, and some new folks may be joining the call.
>
> Access, agenda, and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group
>
> - Joseph

