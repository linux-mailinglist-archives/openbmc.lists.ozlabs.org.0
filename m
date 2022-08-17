Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9BE5975CE
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 20:36:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7Gtf3DGJz3c0g
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 04:36:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d3JLuX3a;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d3JLuX3a;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7Gt825Blz3bkC
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 04:35:43 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27HILXvL032577;
	Wed, 17 Aug 2022 18:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=NztbSDe65OKf2bE2KWVzdU6rWo+G/8/XKZ67CVKs8LI=;
 b=d3JLuX3a6m7/JxaojUGzr/5WN1HQjWqEa97McltZdMkQiTBzfZz6vPjWXTd5bRiGzNZM
 lVEdGB22YJLv5H4S/X0o50XJiJWApKovej1wNqryx91C5pK2N8yXmSXntQDusi8OC9El
 /kV9Q+r5dLgtjmlqm860aX0q7uzS9kNgmDIUAfs/pfXaF8Ar6jbArvp20f9q6RaZ3+nE
 yAb+VWq+SiCbVGWfHc9/O+/OGB1rXxajbSEt6H05ltz61uDnfZN0/Rts9Tb/h4qHrl0W
 8sV+x1nyi7MGdQeSiOuCucZFilHYTq2NWZs9Al5DLdC7U5yPzG2CF4EFVRFMRE1Q886v mA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j15ht0afs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 18:35:37 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27HINMSq014104;
	Wed, 17 Aug 2022 18:35:37 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j15ht0afd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 18:35:37 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27HIZWCt002478;
	Wed, 17 Aug 2022 18:35:36 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
	by ppma02dal.us.ibm.com with ESMTP id 3hx3ka8rwk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 18:35:36 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
	by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27HIZZq150725136
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Aug 2022 18:35:35 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D852124053;
	Wed, 17 Aug 2022 18:35:35 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E422D124052;
	Wed, 17 Aug 2022 18:35:34 +0000 (GMT)
Received: from [9.160.40.68] (unknown [9.160.40.68])
	by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
	Wed, 17 Aug 2022 18:35:34 +0000 (GMT)
Message-ID: <6bd8db4e-b076-eb0a-3f8d-2d59f2715bd9@linux.ibm.com>
Date: Wed, 17 Aug 2022 13:35:33 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: Security Working Group meeting - Wednesday August 17 - Move call
 to Discord Voice channel
Content-Language: en-US
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
        Nick Rivers <nicholas.rivers1984@gmail.com>,
        "Andrew.Jeffery"
 <andrew@aj.id.au>
References: <CAHzptbLV=Fzo+FSC-PWkemMNHcPWCF2Hd8FOzMTzPX5MdtYtvw@mail.gmail.com>
 <20220817174730.zd7jmbpjtlru5t4u@cheese>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <20220817174730.zd7jmbpjtlru5t4u@cheese>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0GVLZQ2dZ1pn4dqbQP2OHZn55IR5LLBc
X-Proofpoint-ORIG-GUID: Q2iczebnGf1o_HXvpTKpx-v4Tz3T82e3
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_13,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208170070
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
Cc: andrew@aj.id.au, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/17/22 12:47 PM, Brad Bishop wrote:
> On Wed, Aug 17, 2022 at 10:40:33AM -0700, Nick Rivers wrote:
>>> Injecting my opinions in case they are helpful...but probably not 🤣
>>>
>>> I likely sound cliché but someone will always be unhappy with every
>>> decision, including this one. As the WG host, have -you- been convinced
>>> that improved collalboration between the security working group and the
>>> developer community is worthwhile, and that moving to Discord will
>>> improve that? If so - go for it!
>>>
>>> People were (and still are) opposed to moving from IRC to Discord, but
>>> we now have 500 people on our server and levels of collaboration in the
>>> developer community never before seen in OpenBMC...
>>>
>> Thus not really supporting diverse and inclusive workplace thinking.And
>> encouraging fit "The Organization's Model" with little room for those 
>> who
>> do not fit "The Organization's Model".
>
> OK, I can understand why that might not be a good thing.  So what 
> would you suggest Joseph do then to improve synergy between the 
> security working group and the developer community?

Thanks for the discussion.  In today's call there were not objections 
and we agreed to move to the Security Working Group call to Discord

Discord > OpenBMC > Voice channels >  Security ~ 
https://discord.com/channels/775381525260664832/1002376534377635860 
<https://discord.com/channels/775381525260664832/1002376534377635860>

effective for the next meeting August 31, 2022.

I'll send an email.


Joseph

>
> Thanks,
> Brad

