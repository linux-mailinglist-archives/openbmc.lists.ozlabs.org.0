Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C4333D56E
	for <lists+openbmc@lfdr.de>; Tue, 16 Mar 2021 15:05:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0FRY6GF3z30K2
	for <lists+openbmc@lfdr.de>; Wed, 17 Mar 2021 01:05:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tSaq304n;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=msbarth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tSaq304n; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0FRG3X9dz2yjJ
 for <openbmc@lists.ozlabs.org>; Wed, 17 Mar 2021 01:04:57 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12GE4eZ4125626; Tue, 16 Mar 2021 10:04:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ffMKGf6ktCO6BQyFbWNqki8f7Rv8iCnzo+rWNevU7wA=;
 b=tSaq304nnEclRuM5oWAHCLzuW3o87P/7ASln5E/gDblMfk5Ij95zJ9BY6LsfDx/DUhlY
 H1FOSikjORGY2+bxRwaK7MGHiWjTcUP2XwMDuUI0BsqzRMvJ4Zb+KG5R+S6BJlS5S+M5
 +mGcbbgWwJg+5xTkJYoDBcQzDkhiR82NXFdmFtEapnIKucALiUZugl3MWGTt97tM+1Dh
 2LVdQrOTCQ3Z4ebvo4kS/tj139uVoLUr9r4k/PBoAxJ4k1tNgDc2+O9ZsqAwYosHjW3i
 HUk2aRJv7NZk0Km7O9af32xSri4fqSYC7l/89jcp5m4bu7FwPt2iHJCHjQRFUEQxnLpj jQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37arhwts8x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Mar 2021 10:04:49 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12GE4jU5125892;
 Tue, 16 Mar 2021 10:04:45 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37arhwtrn2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Mar 2021 10:04:45 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12GDvluD009427;
 Tue, 16 Mar 2021 14:03:47 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03dal.us.ibm.com with ESMTP id 378n195emm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Mar 2021 14:03:47 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12GE3kNO13304272
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Mar 2021 14:03:46 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A6F2B2065;
 Tue, 16 Mar 2021 14:03:46 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 891B2B2068;
 Tue, 16 Mar 2021 14:03:45 +0000 (GMT)
Received: from [9.211.128.222] (unknown [9.211.128.222])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 16 Mar 2021 14:03:45 +0000 (GMT)
Subject: Re: group for foxconn CI / fii oem repo
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>
References: <DM6PR08MB58838020F8543D03C6235064B2929@DM6PR08MB5883.namprd08.prod.outlook.com>
 <DM6PR08MB58834FC516032C1D11C9F9F9B26F9@DM6PR08MB5883.namprd08.prod.outlook.com>
 <20210315205148.z6mcrx32kxr56lm2@thinkpad.fuzziesquirrel.com>
 <20210316125616.qnu4bxjzh5ub2fzs@thinkpad.fuzziesquirrel.com>
From: Matthew Barth <msbarth@linux.ibm.com>
Message-ID: <9b74a31c-f2e2-c959-6661-e9d3400435b1@linux.ibm.com>
Date: Tue, 16 Mar 2021 09:03:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316125616.qnu4bxjzh5ub2fzs@thinkpad.fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-16_04:2021-03-16,
 2021-03-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=831 malwarescore=0
 lowpriorityscore=0 clxscore=1011 phishscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103160098
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "vveerach@google.com" <vveerach@google.com>,
 Lancelot Kao <lancelot.cy.kao@fii-na.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 3/16/21 7:56 AM, Brad Bishop wrote:
> On Mon, Mar 15, 2021 at 04:51:50PM -0400, Brad Bishop wrote:
>> On Fri, Mar 12, 2021 at 07:25:42PM +0000, Mohaimen Alsamarai wrote:
>>> Hi Brad,
>>>               How can we create Ci group on gerrit and add people to it
>>
>> Created fii/ci-authorized and fii/ci-authorized-owners.  Please add
>> people to fii/ci-authorized to automatically approve patch authors for
>> CI.
>
> Yesterday I learned there is an additional step to get automatic CI validation working.  There is a script here that needs updating with your fii/ci-authorized group:
>
> https://github.com/openbmc/openbmc-build-scripts/blob/master/jenkins/userid-validation#L42
>
> Can you please add a line similar to all the others but with fii/ci-authorized and then submit that for review to openbmc-build-scripts on our Gerrit instance?

To save yourself some rebasing, I'd suggest pulling down the following change and adding `fii/ci-authorized` to that as the 'userid-validation' script re-work is in flight.

https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/41301

>
> thanks - brad
