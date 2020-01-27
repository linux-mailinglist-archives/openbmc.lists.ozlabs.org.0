Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 117CA14A7BC
	for <lists+openbmc@lfdr.de>; Mon, 27 Jan 2020 17:04:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 485vgd4MPfzDqJm
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 03:03:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 485vfs5znPzDqDK
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2020 03:03:17 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00RFuCwV001405; Mon, 27 Jan 2020 11:03:12 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xrjr4e82f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jan 2020 11:03:12 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00RG1qrZ006560;
 Mon, 27 Jan 2020 16:03:11 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 2xrda6evfd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jan 2020 16:03:11 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00RG3ALj38994302
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jan 2020 16:03:10 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E46128059;
 Mon, 27 Jan 2020 16:03:10 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53EA328058;
 Mon, 27 Jan 2020 16:03:10 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.252])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 27 Jan 2020 16:03:10 +0000 (GMT)
Subject: Re: bmcweb and certificate chains [WAS: Security working group
 meeting 2020-01-22]
To: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>,
 openbmc@lists.ozlabs.org
References: <f62056a8-ddc9-71ae-620f-b9ac45f3c86a@linux.ibm.com>
 <94fa654c-bfa6-c834-6b18-8867aee49c8f@linux.intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <b6d4134e-702d-71ab-4a5d-7d3bd3e0eae3@linux.ibm.com>
Date: Mon, 27 Jan 2020 10:03:09 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <94fa654c-bfa6-c834-6b18-8867aee49c8f@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-27_05:2020-01-24,
 2020-01-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001270134
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

On 1/24/20 11:19 AM, Alexander Tereschenko wrote:
> On 22-Jan-20 22:23, Joseph Reynolds wrote:
>> Notes from the security working group meeting 2020-01-22:
>> Highlights below; details in 
>> https://github.com/openbmc/openbmc/wiki/Security-working-group
>>
>>
>> 1. Discuss BMCWeb’s site identity certificate handling, specifically 
>> intermediate certificates.  See 
>> https://github.com/openbmc/bmcweb/#configuration  
>>
>> Other web servers have directives to concatenate the intermediate 
>> certificates (excluding the root CA certificates) and send that. What 
>> does BMCWeb do? 
>>  - What is BMCWeb's default default?
>>  - Need better docs, for example: How can a BMC admin replace 
>> theBMCWeb site cert?  Is it okay to concatenate intermediate certs? 
>> Can we document this for BMCWeb?
>
> As discussed during the meeting, I've looked into that and looks like 
> bmcweb doesn't support sending the cert chain at all right now. When 
> loading it expects the server's cert file to have just a private key 
> and certificate in a single file [1], just as we've discussed during 
> the meeting, and server's init code only loads those [2]. There's an 
> API in Boost.Asio that could allow loading a chain [3], but it's not 
> used anywhere, so for bmcweb to support that, a patch must be created.

Thank you for finding that.  I think we want to add a function to BMCWeb 
to be able to handle certificate chains.  Would we need to enhance the 
REST APIs [4] to upload server certificates as part of this work?

[4]: 
https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/Certs

- Joseph

> HTH,
> Alexander
>
> [1] https://github.com/openbmc/bmcweb/blob/master/http/http_server.h#L159
> [2] https://github.com/openbmc/bmcweb/blob/master/http/app.h#L158-L159
> [3] 
> https://www.boost.org/doc/libs/1_71_0/doc/html/boost_asio/reference/ssl__context/use_certificate_chain_file.html
>

