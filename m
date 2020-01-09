Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 023DB135F3E
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 18:26:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ttLk6nMczDqZS
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 04:26:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ttL05b64zDqYp
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jan 2020 04:25:27 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 009H2UbN047624; Thu, 9 Jan 2020 12:25:24 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xdx6k6t3w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2020 12:25:24 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 009HIhnZ032628;
 Thu, 9 Jan 2020 17:25:30 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 2xajb6yfnf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jan 2020 17:25:30 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 009HPNRV16777648
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jan 2020 17:25:23 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46462AC059;
 Thu,  9 Jan 2020 17:25:23 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21104AC060;
 Thu,  9 Jan 2020 17:25:23 +0000 (GMT)
Received: from [9.10.99.47] (unknown [9.10.99.47])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  9 Jan 2020 17:25:23 +0000 (GMT)
Subject: Re: Using a struct[enum] as an sdbusplus D-Bus method arg?
To: Patrick Williams <patrick@stwcx.xyz>
References: <ad2ea491-9eb0-375b-1832-c2a50e63b3c7@linux.ibm.com>
 <20200109162238.GD1233@patrickw3-mbp.dhcp.thefacebook.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <0de28bd0-95a7-11f6-f2bd-9806508ec5cd@linux.ibm.com>
Date: Thu, 9 Jan 2020 11:25:24 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200109162238.GD1233@patrickw3-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-09_03:2020-01-09,
 2020-01-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=999 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-2001090142
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



On 1/9/2020 10:22 AM, Patrick Williams wrote:
> On Wed, Jan 08, 2020 at 01:32:49PM -0600, Matt Spinler wrote:
>
> Hi Matt,
>
>> I'm designing a phosphor-dbus-interfaces D-Bus method where I think the
>> ideal interface has YAML like:
>>
>> - name : CreateStuff
>>    parameters:
>>      - name: Data
>>        type: array[struct[enum[self.Types], uint32]]
>>
>> But that doesn't compile using an enum in the struct, and fails because
>> sdbus++ creates code like:
>>
>> server.cpp:
>>
>>      // Uses enum<self.Types>
>>      std::vector<std::tuple<enum<self.Types>, uint8_t>> data{};
>>      m.read(data);
>>      auto o = static_cast<Create*>(context);
>>      o->createStuff(data);
>>
>> What I'm trying to do is a valid D-Bus definition, correct? Or should I just
>> use a string instead
>> of an enum?
> Enums are not actually a DBus concept, but something we added to
> sdbusplus specifically.  What happens is that at the DBus level we send
> them between processes as fully-qualified strings[1].  In the sdbusplus
> generated code we know that this was defined in the YAML as an enum and
> so we look the string up in a map<string, enum> to get you the enum
> value (and throw an exception if an invalid enum was given).
>
> I wouldn't recommend using a string instead because you are just
> bypassing this enum-string checking code.
>
>> It doesn't seem very straightforward to fix, as the vector that gets passed
>> to o->createStuff()
>> is a std::vector<std::tuple<Types, uint32_t>>, but the vector passed to
>> m.read() is a
>> std::vector<std::tuple<std::string, uint32_t>>.
> This is a bug / missing feature in the header generator.  I'd have to
> look into the code but it seems like it is not re-cursing inside the
> tuple correctly.  We handle this case fine for raw enums.  The
> definition of data's type looks like a start of the problem
> (enum<self.Types> doesn't seem correct to me).  It's possible though
> that the m.read generated function is wrong in that it is missing the
> conversion from self.Types <-> std::string.

Since the vectors are of different types, I think the code generated 
code would have to
do the equivalent of?

     std::vector<std::tuple<std::string, uint8_t>> data{};
     m.read(data);

     std::vector<std::tuple<Types, uint8_t>> apiData{};

     for (const auto& [arg0, arg1]: data)
        apiData.emplace_back(convertStringToEnum(arg0), arg1))
   
     o->createStuff(apiData);
  
That's a pretty big change from what's there today.  Think that's possible
to do generically?


> [1] A fully-qualified string is something like
>      xyz.openbmc-project.InterfaceClass.EnumType.EnumValue.

