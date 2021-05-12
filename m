Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E91F37D33F
	for <lists+openbmc@lfdr.de>; Wed, 12 May 2021 20:19:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgNNK3cbyz302m
	for <lists+openbmc@lfdr.de>; Thu, 13 May 2021 04:19:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oMie9CzA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oMie9CzA; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgNMy72bZz2yXN
 for <openbmc@lists.ozlabs.org>; Thu, 13 May 2021 04:18:54 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14CI2hM9133954
 for <openbmc@lists.ozlabs.org>; Wed, 12 May 2021 14:18:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=qqeV/SOsSBR7GWXGd4nyNx3DVgDlxAkAfHLIceJiXZw=;
 b=oMie9CzAPogp4Qc5fx0Z/3x58GDGRumTXTeCRfu+4rFaADd+QfbhMH6dlP2vNZVu4I9e
 tkJ65xiLQn910QxyOt/hcFYqWS0yvrlvTrTmok+hUY3sICZ8DsVMPJ2IBGUc19QvTG31
 nPGt6ZljHOIzgl7oFLFaERyZitUaSgOe/zJe9IsWYsLeI07ZUDRZp0cntWfLbQT0eIo0
 Baps/mPJlKvS/eqxk6hBdLTJFsMBj/AdUGDI1dEmYb/QqLnFE5wDnhJWps0trLEUGriT
 DUriG72RICr0fLgJ0inU+d8DHxTC3T+6u1h+mpO4sCTzxbbHUYBapBdi6eaNE0PlvqdE EQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38gk82hq9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 12 May 2021 14:18:52 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14CICZoR003947
 for <openbmc@lists.ozlabs.org>; Wed, 12 May 2021 18:18:51 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 38dj99f5db-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 12 May 2021 18:18:51 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14CIIoue29360550
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 12 May 2021 18:18:50 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF03A136051
 for <openbmc@lists.ozlabs.org>; Wed, 12 May 2021 18:18:49 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A742F13604F
 for <openbmc@lists.ozlabs.org>; Wed, 12 May 2021 18:18:49 +0000 (GMT)
Received: from demeter.local (unknown [9.160.45.189])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 12 May 2021 18:18:49 +0000 (GMT)
Subject: Re: Security Working Group - Wednesday May 12 - results
To: openbmc@lists.ozlabs.org
References: <35156c27-e195-c238-1bb9-d20a30db3c63@linux.ibm.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <8febdc9d-08bb-4094-9cad-7e6035c5bd71@linux.ibm.com>
Date: Wed, 12 May 2021 13:18:48 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
In-Reply-To: <35156c27-e195-c238-1bb9-d20a30db3c63@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: O54RxP_alGEKoQTufce6taqVmJ8qOiG2
X-Proofpoint-ORIG-GUID: O54RxP_alGEKoQTufce6taqVmJ8qOiG2
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-12_09:2021-05-12,
 2021-05-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105120118
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

On 5/11/21 8:59 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday May 12 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
> and anything else that comes up:
>

Three items were discussed.  You might want to start with item 3 first 
to introduce the first two.  Summary:

1. Security impacts of enabling kexec (load and optionally execute new 
kernel) in the BMC's production kernel.  How does this work and play 
with secure boot and with IMA?

2. What are the security impacts of having the proc file system file 
/proc/sysrq-triggerwhich can cause kernel panics which can cause the BMC 
to terminate processing?

3. In general, how can you (an operator or the BMC's host system) 
recover a BMC which has become unresponsive, for example, because its 
kernel processing has failed.  A design introduces using 
/proc/sysrq-triggertogether with a recovery kernel installed by kexec.

Details, including links to the gerrit code reviews, are in the wiki.

- Joseph

>
>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

