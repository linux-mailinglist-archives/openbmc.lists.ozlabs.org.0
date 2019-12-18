Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 783A9125662
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 23:17:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dTrX4YS9zDqkh
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2019 09:17:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=wrightj@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dTqq0TwrzDqhl
 for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2019 09:16:22 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBILvIme062276; Wed, 18 Dec 2019 17:16:19 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wyhcc8qkp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2019 17:16:19 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBIMEwN8021327;
 Wed, 18 Dec 2019 22:16:18 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma05wdc.us.ibm.com with ESMTP id 2wvqc6h2s0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2019 22:16:18 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBIMGIIQ57475532
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Dec 2019 22:16:18 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0ADA13606E;
 Wed, 18 Dec 2019 22:16:17 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C92A613607F;
 Wed, 18 Dec 2019 22:16:17 +0000 (GMT)
Received: from [9.10.101.151] (unknown [9.10.101.151])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 18 Dec 2019 22:16:17 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.4 v2 2/2] hwmon: Add support for UCD90320
 Power Sequencer
To: Guenter Roeck <linux@roeck-us.net>, openbmc@lists.ozlabs.org
References: <20191218212446.22676-1-wrightj@linux.vnet.ibm.com>
 <20191218212446.22676-3-wrightj@linux.vnet.ibm.com>
 <20191218220649.GA24848@roeck-us.net>
From: Jim Wright <wrightj@linux.vnet.ibm.com>
Message-ID: <d4574955-15a5-a44a-f835-15c9d3e82f74@linux.vnet.ibm.com>
Date: Wed, 18 Dec 2019 16:16:16 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191218220649.GA24848@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-18_07:2019-12-17,2019-12-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 adultscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912180168
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


On 12/18/2019 4:06 PM, Guenter Roeck wrote:
> On Wed, Dec 18, 2019 at 03:24:46PM -0600, Jim Wright wrote:
>> Add support for the UCD90320 chip and its expanded set of GPIO pins.
>>
>> Signed-off-by: Jim Wright <wrightj@linux.vnet.ibm.com>
>> Link: https://lore.kernel.org/r/20191205232411.21492-3-wrightj@linux.vnet.ibm.com
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
> Change log goes here. Also, the series wasn't sent to the hardware
> monitoring mailing list, and thus doesn't show up on
> https://patchwork.kernel.org/project/linux-hwmon/list/, which I use
> for tracking.
>
> Please resend to the proper mailing lists and include a change log.
>
> Guenter

Hi Guenter,

Sorry for the extra noise, I think git send-patch picked up your email 
address and I didn't suppress it.  Just looking to have the change 
already merged in hwmon-next merged into openbmc fork.

Thanks,

Jim Wright


