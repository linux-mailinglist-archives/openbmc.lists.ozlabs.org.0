Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E07AA543FDB
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 01:27:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJNgD4xjJz3brS
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 09:27:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SM4nlJJU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=wrightj@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SM4nlJJU;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJJr56MVJz2xTc
	for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2022 06:35:01 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 258Ig5wI032709;
	Wed, 8 Jun 2022 20:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : from : to : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=J0aVri+cNbjQ0E9ixx2jgKJngPTCK7IYxBcL3VFucWM=;
 b=SM4nlJJUcami5mGVksZqw4jwiA+bzgFthfowmkI8mq6gQQN/nHlWBZ1xAzx2J7GlZT0o
 2MyYqbIJZ1syhL3IcOTYMW29kSdOdyQYZEqeXTTXt0TEg9WkGtI4IzOGvUdKg0lgygG7
 iRBzi5VmVYSxXuJ0iU5OtFNoSH18waBAeQ6FGfxDvB/25ziuqtKfesGMtJMswT3iyK+D
 9YMsS+33oObGB8CMhECfEQoHtkj9QgGcEASVqZbiGK9HEPt4ZY9/nUZZ0zmHkITS3B2X
 BhjGKrb+BuDTfeQSyM3PgA1k5+rd6SZIcZk1QgfwxjcvvPuoivRJEdv4KiyiF6o198oV gQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gk198a30w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jun 2022 20:34:57 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 258K5Evc017742;
	Wed, 8 Jun 2022 20:34:56 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
	by ppma04dal.us.ibm.com with ESMTP id 3gfy1ad092-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jun 2022 20:34:56 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
	by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 258KYtC732965076
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jun 2022 20:34:55 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C841B112062;
	Wed,  8 Jun 2022 20:34:55 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3959B112061;
	Wed,  8 Jun 2022 20:34:55 +0000 (GMT)
Received: from [9.211.120.23] (unknown [9.211.120.23])
	by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
	Wed,  8 Jun 2022 20:34:55 +0000 (GMT)
Message-ID: <b175efd2-e985-c35b-3baf-c2a217979f4c@linux.ibm.com>
Date: Wed, 8 Jun 2022 15:34:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] hwmon: (ucd9000) Add voltage monitor types
Content-Language: en-US
From: Jim Wright <wrightj@linux.ibm.com>
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        joel@jms.id.au, openbmc@lists.ozlabs.org
References: <20220607205306.145636-1-wrightj@linux.ibm.com>
 <cf1a2ff9-59b3-fb2d-62fd-bdeac57bb9c0@roeck-us.net>
 <d50e6018-7b1b-6369-1ed2-1548841f7524@linux.ibm.com>
In-Reply-To: <d50e6018-7b1b-6369-1ed2-1548841f7524@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DfYtctDHPYXKjCqIGvHiHt16amVkGQ-s
X-Proofpoint-ORIG-GUID: DfYtctDHPYXKjCqIGvHiHt16amVkGQ-s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-08_05,2022-06-07_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206080078
X-Mailman-Approved-At: Thu, 09 Jun 2022 09:26:36 +1000
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

On 6/7/2022 8:26 PM, Jim Wright wrote:
> On 6/7/2022 8:13 PM, Guenter Roeck wrote:
>>
>> I don't think it makes sense to claim VOUT support if the chip is
>> configured to monitor input voltages. This should probably be something
>> like
>>
>> ...
>>  > +        case UCD9000_MON_VOLTAGE_AVS:
>>  >               info->func[page] |= PMBUS_HAVE_VOUT
>>  >                 | PMBUS_HAVE_STATUS_VOUT;
>>  >               break;
>>          case UCD9000_MON_INPUT_VOLTAGE:
>>          case UCD9000_MON_INPUT_VOLTAGE_AVS:
>>              info->func[page] |= PMBUS_HAVE_VIN;
>>               break;
>>
>> with appropriate mapping code to map the READ_VIN command for the
>> affected pages to READ_VOUT. Question is if the limit registers on
>> those pages are also reporting the limits using the vout limit
>> commands; if so, those should be mapped as well.
>>
>> Guenter
> 
> Hi Guenter,
> 
> Thank you for the review. I'll drop adding the input voltage types and 
> resend the patch.
> 
> Jim Wright
After a second look, it's the input voltage type that I need. Will 
revise as suggested and resubmit.

Thanks,
Jim Wright
