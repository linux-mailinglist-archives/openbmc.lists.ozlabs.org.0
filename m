Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E26E43E24C
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 15:32:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg61L29Jsz3c6k
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 00:32:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Hlrw1sXM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Hlrw1sXM; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg60r0w81z2xg3
 for <openbmc@lists.ozlabs.org>; Fri, 29 Oct 2021 00:31:55 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19SCltoY023743; 
 Thu, 28 Oct 2021 13:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=1JQkbFzUJmY7GodOxQC8UtAWd4NCZDaKpESwYvoNlk4=;
 b=Hlrw1sXMK8dE42ZgziC0qK8k1i3BD5GZW+9/2GprkfjocmeGgD7D9nvZqicjvs8fpuX0
 ehy07NOlFTCKgpbVyFlNF2gZczrO0j6GrcdUZ+n9M+cJGYeV/aKVQAaAVz75A/FRiJE2
 t82h4AuWBvPZHuv5/VWMq6o90yaLNnWFTUwDnRdJyxBnla78Qfv5WDLZk3mYm31vSpaw
 Z6JlWl/X/OIgLQeqEVPZLJw0GVEi92xUM1QNmYVBc1/0XRy+O72zX7v7MXRsr904+67L
 CezuKvtijp1RsBmJYVZIpJf32RJk/zLTW1jWjrgz0c98DwtdYLRbRapiQohumxhxfpqR fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3byv6drybq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 13:31:47 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19SDAJYH034997;
 Thu, 28 Oct 2021 13:31:46 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3byv6dry9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 13:31:46 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19SDC7Fs000392;
 Thu, 28 Oct 2021 13:31:40 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma05wdc.us.ibm.com with ESMTP id 3bx4emgdkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 13:31:40 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19SDVdEs43712988
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Oct 2021 13:31:39 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43372B2073;
 Thu, 28 Oct 2021 13:31:39 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8EBCAB2071;
 Thu, 28 Oct 2021 13:31:38 +0000 (GMT)
Received: from [9.77.132.135] (unknown [9.77.132.135])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 28 Oct 2021 13:31:38 +0000 (GMT)
Message-ID: <b738b432-8416-d26d-2a89-d61e4187db67@linux.ibm.com>
Date: Thu, 28 Oct 2021 08:31:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: Start using github security advisories
Content-Language: en-US
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "Mihm, James" <james.mihm@intel.com>,
 Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>,
 Andrew Geissler <geissonator@gmail.com>
References: <62b15edd-110a-3574-66c5-d11299bbd38c@linux.ibm.com>
 <67C8A5BA-9FD5-4804-B5CA-C2687FC17889@gmail.com>
 <20211018184958.zajwqmloxsyxmxv2@cheese>
 <cd2f6175-475f-0e5a-0b65-4f7a12959ab6@linux.vnet.ibm.com>
 <DM8PR11MB56387B6B7713360A95C7959090859@DM8PR11MB5638.namprd11.prod.outlook.com>
 <79311a65fd6e30f18b0fb038b1906fe5ec015466.camel@fuzziesquirrel.com>
 <f53a303274f21127c3214d9aabfb0793b5a499af.camel@fuzziesquirrel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <f53a303274f21127c3214d9aabfb0793b5a499af.camel@fuzziesquirrel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kf7gSw-tVSJ6SPxpmrI2BcjYE4Ws28vz
X-Proofpoint-ORIG-GUID: NqVnGKOMKZhGK_3a60Wno1rHq6cWXmmG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_01,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 clxscore=1011 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110280075
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/27/21 2:42 PM, Brad Bishop wrote:
> On Wed, 2021-10-27 at 15:29 -0400, Brad Bishop wrote:
>> On Wed, 2021-10-27 at 18:29 +0000, Mihm, James wrote:
>>> Brad or Andrew, Can we proceed with the creation of security
>>> repository so that we can run a couple of trials on security issues?
>> Hi James, thanks for the ping.
>>
>> The only reason I haven't already done this was this comment from
>> Bruce:
>>
>>>> I believe we want to make sure that none of security advisories
>>>> get sent to Discord, wouldn't want to accidentally be going to
>>>> something like #gh-issues.
>> This was a good point and I'm not sure what to do about it.
> Hi James
>
> I created the security-reponse github group and the security-response
> repo just now and made it private.  Please do some testing and make sure
> issues don't find their way into #gh-issues on Discord.
>
> thx - brad

Thanks Brad!

The plan is to write the first issues from real-live but low-severity  
problems which are also common knowledge within the openBMC community.  
Meaning: there will be minimal harm if the problem is disclosed.

- Joseph

