Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1250D243ACE
	for <lists+openbmc@lfdr.de>; Thu, 13 Aug 2020 15:31:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BS6st74sFzDqfK
	for <lists+openbmc@lfdr.de>; Thu, 13 Aug 2020 23:31:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WcSnnqEY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BS6rc6wRrzDqKj
 for <openbmc@lists.ozlabs.org>; Thu, 13 Aug 2020 23:30:24 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07DD56p8018393; Thu, 13 Aug 2020 09:30:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=7x33PJRYB/GzS0bEv5WR06NrhgbKJtAxeFZlOYAWi1E=;
 b=WcSnnqEYy3SbD+uL6PDo1vZOa2Q/wi2COu34eMFGdnOeJ830eWQDMUba+zda64Vz/i8q
 5OfeMpRLqsoajl7/c05i5Q/Mtp8ZgQ1Dbkl492ZnOWkb99ura8M+KHsWwoXuz835mBzf
 lstRQExZL+GNOimuVKsMoBmqryhlA181F/Zta7vcYv5h14oQoF8alu663iEwiMXLDrUR
 WJqOVTVVJ1AjIiwBv5MIowp11CtrvKcp6DWFU3wzR6LzD1HLHv2w8fZQmQ6raJLfdMFt
 z5aecbpjMpXV3bmgQK4A5RlMXaS/IhOdLPJY1Lhc9c3huMCZI6uS5md8tVymo/uzONyy Ig== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32w24h09jr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 09:30:17 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07DDQ08b030232;
 Thu, 13 Aug 2020 13:30:16 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02wdc.us.ibm.com with ESMTP id 32skp9j8a3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 13:30:16 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07DDUFKq42271000
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Aug 2020 13:30:15 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A5C4124066;
 Thu, 13 Aug 2020 13:30:15 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B41F124054;
 Thu, 13 Aug 2020 13:30:15 +0000 (GMT)
Received: from [9.211.137.105] (unknown [9.211.137.105])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 13 Aug 2020 13:30:15 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.7 v2 0/7] spi: Fix FSI-attached controller and
 AT25 drivers
To: Joel Stanley <joel@jms.id.au>
References: <20200730220330.16368-1-eajames@linux.ibm.com>
 <CACPK8XcvBTnW6syjHCVZADHfnFdR0qTj_znG-q0-ruqfLGb6FQ@mail.gmail.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <ed01e3ed-01e3-f241-88c5-c8ba0abc65f3@linux.ibm.com>
Date: Thu, 13 Aug 2020 08:30:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XcvBTnW6syjHCVZADHfnFdR0qTj_znG-q0-ruqfLGb6FQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_10:2020-08-13,
 2020-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008130098
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 8/12/20 10:50 PM, Joel Stanley wrote:
> On Thu, 30 Jul 2020 at 22:03, Eddie James <eajames@linux.ibm.com> wrote:
>> This series implements a number of fixes for the FSI-attached SPI controller
>> driver and the AT25 eeprom driver.
>>
>> Changes since v1:
>>   - Add patch 6 for checking the mux status before transfers
>>   - Minor fixes to at25 driver formatting and such.
> I've merged this series into dev-5.8. Please consider my review
> comments and send the series upstream.


Thanks! Will do.


Eddie


>
> Cheers,
>
> Joel
>
>> Brad Bishop (4):
>>    spi: fsi: Handle 9 to 15 byte transfers lengths
>>    spi: fsi: Fix clock running too fast
>>    spi: fsi: Fix use of the bneq+ sequencer instruction
>>    eeprom: at25: Split reads into chunks and cap write size
>>
>> Eddie James (3):
>>    dt-bindings: fsi: fsi2spi: Document new restricted property
>>    spi: fsi: Implement restricted size for certain controllers
>>    spi: fsi: Check mux status before transfers
>>
>>   .../devicetree/bindings/fsi/ibm,fsi2spi.yaml  |  10 ++
>>   drivers/misc/eeprom/at25.c                    |  94 +++++++-----
>>   drivers/spi/spi-fsi.c                         | 139 ++++++++++++++----
>>   3 files changed, 172 insertions(+), 71 deletions(-)
>>
>> --
>> 2.24.0
>>
