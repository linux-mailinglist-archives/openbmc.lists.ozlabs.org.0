Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A1045A6CA
	for <lists+openbmc@lfdr.de>; Tue, 23 Nov 2021 16:50:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz7r63B6Zz2yfm
	for <lists+openbmc@lfdr.de>; Wed, 24 Nov 2021 02:49:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SuA8468h;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SuA8468h; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hz7qb2s4Nz2yfg
 for <openbmc@lists.ozlabs.org>; Wed, 24 Nov 2021 02:49:30 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ANElVNC025825
 for <openbmc@lists.ozlabs.org>; Tue, 23 Nov 2021 15:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : from : to : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=f+ne82GGiduKr0R6mC5tdw9Cf2H6HzyLdrs4B2qxnzc=;
 b=SuA8468hNUT1HgY1XRgiQjLNeWgnXiFL+Rfcr8Zs+M6XeDalA7MHqpAStdOPZKsuXJRY
 nZFerbi4FOaDkFYNl3H6XnAELS12LRx+EdTugYaWexxc8F0aimWDz7c9fUMn2Rf0hX6h
 nevT5pOFEWL/30uF6IdFggFJ6RpghqeAxMtayw3tc/8SvWZdHyn10Mvae5tzFE53mBm/
 UMJ+KeJm27QwB/GHQffMdDgYNu/AOD3r0OGMN9G10iSqYGyIzDfkTq29T4LzK/AwSEWF
 fQA+Gig8xQIa7vQ39SMXO/B799Vsjs3HQS7Rv3dLto1lG8QalEbRrtXROyuX9Z7e5xKQ 2Q== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ch2cg1d0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 23 Nov 2021 15:49:25 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ANFn1oa011045
 for <openbmc@lists.ozlabs.org>; Tue, 23 Nov 2021 15:49:25 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03wdc.us.ibm.com with ESMTP id 3cernapc1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 23 Nov 2021 15:49:25 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ANFnOEP24969640
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 23 Nov 2021 15:49:24 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D633AB206C
 for <openbmc@lists.ozlabs.org>; Tue, 23 Nov 2021 15:49:23 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1A28B2071
 for <openbmc@lists.ozlabs.org>; Tue, 23 Nov 2021 15:49:23 +0000 (GMT)
Received: from [9.65.77.58] (unknown [9.65.77.58])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Tue, 23 Nov 2021 15:49:23 +0000 (GMT)
Message-ID: <fad942e8-6714-2f1f-6141-86032bacafc4@linux.ibm.com>
Date: Tue, 23 Nov 2021 09:49:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: Security Working Group - Nov 24 meeting cancelled: reschedule?
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <4ea0015b-3280-c5b3-9f9f-c424046f23c9@linux.ibm.com>
 <ba328007-7ade-c21f-8962-3da0c5112d16@linux.ibm.com>
 <d2f833d7-6707-b65e-f913-7093776296fc@linux.ibm.com>
In-Reply-To: <d2f833d7-6707-b65e-f913-7093776296fc@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UBGpgSu02sxTLo-WJkM5EuA_bdyTadJq
X-Proofpoint-GUID: UBGpgSu02sxTLo-WJkM5EuA_bdyTadJq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-23_05,2021-11-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=881 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111230080
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

On 11/10/21 2:38 PM, Joseph Reynolds wrote:
> On 11/10/21 2:35 PM, Joseph Reynolds wrote:
>> On 11/10/21 8:38 AM, Joseph Reynolds wrote:
>>
>> Agenda items discussed:
>>
>> 1 Next meeting Nov 24 “Thanksgiving eve”
>>
>> Votes: cancel, cancel, cancel.  Agreed.  Someone else schedule a 
>> meeting?
>>
>
> The next regularly scheduled Security Working Group meeting (Nov 24) 
> is cancelled.
> This would be a perfect time to for someone maybe in another time zone 
> outside the US to schedule a Security Working Group call.
> Any volunteers?
>

The regularly scheduled OpenBMC Security Working Group meeting for Nov 
24 is cancelled because of the US Thanksgiving holiday.

Joseph
