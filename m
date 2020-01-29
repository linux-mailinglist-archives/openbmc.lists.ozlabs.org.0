Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9196B14CCFD
	for <lists+openbmc@lfdr.de>; Wed, 29 Jan 2020 16:09:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4876MY70x1zDqRN
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 02:09:13 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4876Ln4L16zDqPn
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jan 2020 02:08:32 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00TF7jK7004898; Wed, 29 Jan 2020 10:08:30 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xtpmt4k64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2020 10:08:29 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00TF5EkU032429;
 Wed, 29 Jan 2020 15:08:28 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02wdc.us.ibm.com with ESMTP id 2xrda6tuhk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2020 15:08:28 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00TF8S1B45613388
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2020 15:08:28 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02908B2068;
 Wed, 29 Jan 2020 15:08:28 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFF4DB205F;
 Wed, 29 Jan 2020 15:08:27 +0000 (GMT)
Received: from [9.10.99.47] (unknown [9.10.99.47])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 29 Jan 2020 15:08:27 +0000 (GMT)
Subject: Re: Using a struct[enum] as an sdbusplus D-Bus method arg?
To: Patrick Williams <patrick@stwcx.xyz>
References: <ad2ea491-9eb0-375b-1832-c2a50e63b3c7@linux.ibm.com>
 <20200109162238.GD1233@patrickw3-mbp.dhcp.thefacebook.com>
 <0de28bd0-95a7-11f6-f2bd-9806508ec5cd@linux.ibm.com>
 <20200109190343.GF1233@patrickw3-mbp.dhcp.thefacebook.com>
 <b018b37e-10e8-55bf-b48e-fd2c71c47160@linux.ibm.com>
 <20200114174117.GA3512@patrickw3-mbp.dhcp.thefacebook.com>
 <20200129030741.GB96533@patrickw3-mbp.dhcp.thefacebook.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <cdd36154-8ce9-1f40-d910-f05a5cc6dc4a@linux.ibm.com>
Date: Wed, 29 Jan 2020 09:08:28 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200129030741.GB96533@patrickw3-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-29_03:2020-01-28,
 2020-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 mlxlogscore=967
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001290126
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



On 1/28/2020 9:07 PM, Patrick Williams wrote:
> On Tue, Jan 14, 2020 at 11:41:17AM -0600, Patrick Williams wrote:
>> On Mon, Jan 13, 2020 at 12:59:26PM -0600, Matt Spinler wrote:
>> This needs a pretty simple refactoring to rename the
>> convert<enum>FromString function to a template function.
>>
>> -- 
>> Patrick Williams
> This probably wasn't as simple as I lead on with this previous email,
> but patches are up for sdbusplus ending with this change:
>      Ib142482de90572e1bda2f3658f6aeec201c043de
>
> https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/28859
>
> With this commit sequence you should be able to read / write any
> container with sdbusplus-enums in it with the message::read / append
> functions, which as a side-effect means the generated classes no
> longer need all the conversion hoops they use to jump through.
>

Thanks!
I tried to build a flash (wspoon) image, and in the server.hpp generated 
for my interface,
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/26544, 
it had:

#include <std/vector<std/message/tuple<FFDCFormat, uint8_t, uint8_t, 
sdbusplus.hpp>


