Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F691EAEDD
	for <lists+openbmc@lfdr.de>; Mon,  1 Jun 2020 20:57:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bPZ600SYzDqPg
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 04:57:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bPY26btszDqNR
 for <openbmc@lists.ozlabs.org>; Tue,  2 Jun 2020 04:56:54 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 051IalNE036745; Mon, 1 Jun 2020 14:56:51 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31bkjm7kks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jun 2020 14:56:51 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 051Iu5Ui025343;
 Mon, 1 Jun 2020 18:56:50 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02wdc.us.ibm.com with ESMTP id 31bf48e052-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jun 2020 18:56:50 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 051IuoDI45875662
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Jun 2020 18:56:50 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1A5628059;
 Mon,  1 Jun 2020 18:56:49 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8FCA2805A;
 Mon,  1 Jun 2020 18:56:49 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.206.176])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon,  1 Jun 2020 18:56:49 +0000 (GMT)
Subject: Re: Question of ipmi command "Set User Access" in phosphor-host-ipmid
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 =?UTF-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
References: <e46d19fbea37479ca10df26e35d474b2@quantatw.com>
 <e4c12ff6-3387-3dc6-eafa-42e5ac830079@linux.intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <6d65bb64-be44-0057-6759-a3946ae40ad6@linux.ibm.com>
Date: Mon, 1 Jun 2020 13:56:49 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e4c12ff6-3387-3dc6-eafa-42e5ac830079@linux.intel.com>
Content-Type: text/plain; charset=big5; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-01_12:2020-06-01,
 2020-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 cotscore=-2147483648 clxscore=1011 priorityscore=1501
 malwarescore=0 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006010138
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/25/20 11:28 AM, Thomaiyar, Richard Marian wrote:
> Hi Tony,
>
> Only IPMI offers channel based user level privilege as of now, Redfish 
> uses single privilege across all channels. OpenBMC user management is 
> designed to have single user level privilege. IPMI is designed to bind 
> one of the channel privilege user to the user management, and rest 
> maintain in it's own database. LAN 1 is used for that sync.
>
> Note: Discussion started in Redfish forum to have a channel based 
> restriction, but it's not yet materialized and requires more takers.

here: 
https://redfishforum.com/thread/279/channel-privilege-support-direction-redfish


>
> Regards,
>
> Richard
>
> On 5/25/2020 12:58 PM, Tony Lee (§õ¤å´I) wrote:
>> In the process of creating an user,
>> I used the ipmi command "ipmitool priv <user id> <privilege level> 
>> [<channel number>]".
>> The "UserPrivilege" of the user I created in dbus is empty. Because 
>> my LAN channel number is not 1.
>>
>> https://github.com/openbmc/phosphor-host-ipmid/blob/master/user_channel/user_mgmt.cpp#L878 
>>
>>
>> Why did it need to check the request channel number before setting 
>> the dbus?
>> I can't find the related restriction of it in "Set User Access 
>> Command" in IPMI SPEC.
>>
>> Thanks
>> Best Regards,
>> Tony

