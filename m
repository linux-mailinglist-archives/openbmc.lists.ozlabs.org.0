Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E52139993
	for <lists+openbmc@lfdr.de>; Mon, 13 Jan 2020 20:06:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xNNf0182zDqPm
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 06:06:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xNMg6ytXzDqLG
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 06:05:34 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00DJ2uum025493; Mon, 13 Jan 2020 14:05:32 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xfvsyr4p7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 14:05:32 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00DIt6L8029101;
 Mon, 13 Jan 2020 18:59:28 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03wdc.us.ibm.com with ESMTP id 2xf756vjux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 18:59:28 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00DIxRlr51511676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2020 18:59:27 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42582C605A;
 Mon, 13 Jan 2020 18:59:27 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1544CC6055;
 Mon, 13 Jan 2020 18:59:26 +0000 (GMT)
Received: from [9.10.99.47] (unknown [9.10.99.47])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 13 Jan 2020 18:59:26 +0000 (GMT)
From: Matt Spinler <mspinler@linux.ibm.com>
Subject: Re: Using a struct[enum] as an sdbusplus D-Bus method arg?
To: Patrick Williams <patrick@stwcx.xyz>
References: <ad2ea491-9eb0-375b-1832-c2a50e63b3c7@linux.ibm.com>
 <20200109162238.GD1233@patrickw3-mbp.dhcp.thefacebook.com>
 <0de28bd0-95a7-11f6-f2bd-9806508ec5cd@linux.ibm.com>
 <20200109190343.GF1233@patrickw3-mbp.dhcp.thefacebook.com>
Message-ID: <b018b37e-10e8-55bf-b48e-fd2c71c47160@linux.ibm.com>
Date: Mon, 13 Jan 2020 12:59:26 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200109190343.GF1233@patrickw3-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_06:2020-01-13,
 2020-01-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 phishscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001130154
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 1/9/2020 1:03 PM, Patrick Williams wrote:
> On Thu, Jan 09, 2020 at 11:25:24AM -0600, Matt Spinler wrote:
>> On 1/9/2020 10:22 AM, Patrick Williams wrote:
>>> On Wed, Jan 08, 2020 at 01:32:49PM -0600, Matt Spinler wrote:
>> Since the vectors are of different types, I think the code generated code
>> would have to
>> do the equivalent of?
>>
>>      std::vector<std::tuple<std::string, uint8_t>> data{};
>>      m.read(data);
>>
>>      std::vector<std::tuple<Types, uint8_t>> apiData{};
>>
>>      for (const auto& [arg0, arg1]: data)
>>         apiData.emplace_back(convertStringToEnum(arg0), arg1))
>>      o->createStuff(apiData);
>> That's a pretty big change from what's there today.  Think that's possible
>> to do generically?
>>
> It seems like that is something that should have been done in the
> `message::read` function.  First, since your initial data type is wrong
> (that funny enum<...>), I think we need to figure out why this function
> isn't working correctly:
>
> https://github.com/openbmc/sdbusplus/blob/master/tools/sdbusplus/property.py#L72
>
> It was suppose to have handled, through recursion, enums.  I would have
> expected data's type to be vector<tuple<Interface::Types, uint8_t>>.
> After that, I suspect you'll get compile errors that m.read doesn't know
> how to handle an Interface::Types enum type.  This would require some
> C++ template magic, but I think it could be handled there.  We need to
> teach m.read to be able to call convertToMessage and convertFromMessage
> if those exist.  I don't know why we originally did that lifting in the
> from the generated code, except maybe that enums were bolted on later
> and never fully complete?
>

To go from enums to strings, there is a convertForMessage() function, 
but to go from
strings back to the enums, which is what we need, the function has the 
enum name in it:
      convert<enum name>FromString(const std::string& s);

I don't think it's possible for message::read() to know that?



