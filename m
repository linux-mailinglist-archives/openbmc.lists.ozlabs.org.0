Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E96063E0975
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 22:40:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gg3XF62K3z3cSJ
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 06:40:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VOi/28SA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VOi/28SA; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gg3Wt03YCz30R3
 for <openbmc@lists.ozlabs.org>; Thu,  5 Aug 2021 06:39:53 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 174KZNoN119683; Wed, 4 Aug 2021 16:39:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=PeY4MA6P4WbT72uHpViBpvUf1kEenXwyFvsb2OL6U2I=;
 b=VOi/28SASbix4Xdlno+tcW6eCTRKbw7+ldRihTdFMD41FTNpfDZiociTpOViITxPJ6Tc
 RnD4XvWjk1OqaeeYPq6dco4y9Lq6hE8HI95fuSVF9mc3NeDNKfNp4LjC55nPi9zaE9UR
 8SmlaVpEcdIud/dymKff436YuZqeHvfVEh48l2xOYKPmHKeVUUiXSvMyl87qMOny7enm
 A8lv0XRazNDrRPJNRZFfYcwX3Bz91xLAtyRpCOh1qIkvoYX9dq/2n65j91dYiBbZduK2
 G6WbdNBLB7P/KZWHA0AkKbOFLBlD8LlEhEJbYIN/16rQWsl9zjiE5Xk9IuEJhelFANOf fg== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a7pejdabv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Aug 2021 16:39:47 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 174KcBuC031974;
 Wed, 4 Aug 2021 20:39:46 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01wdc.us.ibm.com with ESMTP id 3a4x5dssw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Aug 2021 20:39:46 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 174Kdkfu31588684
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Aug 2021 20:39:46 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B882124055;
 Wed,  4 Aug 2021 20:39:46 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F05A512405B;
 Wed,  4 Aug 2021 20:39:45 +0000 (GMT)
Received: from demeter.local (unknown [9.160.63.222])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed,  4 Aug 2021 20:39:45 +0000 (GMT)
Subject: Re: Security Working Group meeting - Wednesday August 4 - results
To: Patrick Williams <patrick@stwcx.xyz>
References: <89b3524f-a1b3-513c-fc6a-1d888e479238@linux.ibm.com>
 <638695c3-c0ac-1249-d3d1-fe2cf439432e@linux.ibm.com>
 <YQr0E+NP+7QKIrf1@heinlein>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <1fb3f67c-84d1-a84b-c44f-a9c2774cfd9b@linux.ibm.com>
Date: Wed, 4 Aug 2021 15:39:45 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
In-Reply-To: <YQr0E+NP+7QKIrf1@heinlein>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QgKgCREfj9Kel-oCBvMxukZySnVpCK2N
X-Proofpoint-GUID: QgKgCREfj9Kel-oCBvMxukZySnVpCK2N
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-04_07:2021-08-04,
 2021-08-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxscore=0 spamscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108040126
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
Cc: openbmc@lists.ozlabs.org, Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/4/21 3:09 PM, Patrick Williams wrote:
> On Wed, Aug 04, 2021 at 01:47:31PM -0500, Joseph Reynolds wrote:
>   
>> 4 Surya set up a bugzilla within Intel and will administer it.  Demo’d
>> the database. We briefly examined the database fields and agreed it
>> looks like a good start.
>>
> Once again I'll ask ***WHY***??!?
>
> https://lore.kernel.org/openbmc/YNzsE1ipYQR7yfDq@heinlein/
> https://lore.kernel.org/openbmc/YPiK8xqFPJFZDa1+@heinlein/
>
> Can we please create a private Github repository and be done with this topic?

I don't have any insight into how to resolve this question.

 From today's meeting: using bugzilla has advantages over github issues:
- lets us define the fields we need: fix commitID, CVSS score, etc.
- has desirable access controls, specifically acess by the security 
respone tram plus we can add access for the problem submitter and the 
problem fixer

- Joseph
