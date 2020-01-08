Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 329CA134B85
	for <lists+openbmc@lfdr.de>; Wed,  8 Jan 2020 20:33:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tKDG4JqtzDqWK
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 06:33:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tKCV546rzDqRM
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jan 2020 06:32:54 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 008JRhhU020488
 for <openbmc@lists.ozlabs.org>; Wed, 8 Jan 2020 14:32:51 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xdd60j7sm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 08 Jan 2020 14:32:51 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 008JUgYU017371
 for <openbmc@lists.ozlabs.org>; Wed, 8 Jan 2020 19:32:50 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 2xajb710pb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 08 Jan 2020 19:32:50 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 008JWnut38404428
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 8 Jan 2020 19:32:49 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D3F7B2065
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jan 2020 19:32:49 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60169B2067
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jan 2020 19:32:49 +0000 (GMT)
Received: from [9.10.99.47] (unknown [9.10.99.47])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jan 2020 19:32:49 +0000 (GMT)
From: Matt Spinler <mspinler@linux.ibm.com>
Subject: Using a struct[enum] as an sdbusplus D-Bus method arg?
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Message-ID: <ad2ea491-9eb0-375b-1832-c2a50e63b3c7@linux.ibm.com>
Date: Wed, 8 Jan 2020 13:32:49 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-08_05:2020-01-08,
 2020-01-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0
 mlxlogscore=906 priorityscore=1501 suspectscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-2001080154
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

Hi,

I'm designing a phosphor-dbus-interfaces D-Bus method where I think the 
ideal interface has YAML like:

- name : CreateStuff
   parameters:
     - name: Data
       type: array[struct[enum[self.Types], uint32]]

But that doesn't compile using an enum in the struct, and fails because 
sdbus++ creates code like:

server.cpp:

     // Uses enum<self.Types>
     std::vector<std::tuple<enum<self.Types>, uint8_t>> data{};
     m.read(data);
     auto o = static_cast<Create*>(context);
     o->createStuff(data);



What I'm trying to do is a valid D-Bus definition, correct? Or should I 
just use a string instead
of an enum?

It doesn't seem very straightforward to fix, as the vector that gets 
passed to o->createStuff()
is a std::vector<std::tuple<Types, uint32_t>>, but the vector passed to 
m.read() is a
std::vector<std::tuple<std::string, uint32_t>>.

Any thoughts?

Thanks!



