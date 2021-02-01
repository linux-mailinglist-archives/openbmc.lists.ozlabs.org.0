Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 281A630A976
	for <lists+openbmc@lfdr.de>; Mon,  1 Feb 2021 15:16:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTqkn34zpzDrT5
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 01:16:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=msbarth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nfmlB91b; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTqhF0zQdzDr2k
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2021 01:14:35 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 111EDve8132660; Mon, 1 Feb 2021 09:14:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=MTxw2qNYW6nF6SegGDg0Y/FLrEj+X8B9QFheTvn4ge0=;
 b=nfmlB91bkeEDlnNoolbUUANr7aBH9Eks92tiqnHH3XJ3m4P9gk5DoKs882w07l2YgosT
 kwLF7MLIAP3XzdfO1M8gWtspi1xHe3onh5gxnB2eJdtv69e4x9MfFpMHGLMqvHHi1wn3
 eiIGy2SbGJhL+JOO3D3eeLjJeCOPwSXAbO0613I6OqxMsEZC7zvMLEQ+Tp9enluKg3+S
 BRVwz1AT7FYIBT9hX2e1MzpeShED1C5cycmKSRh8cWa1r7MUgYuLC4fZ7sIoLJvKnMr7
 VeT8PqZNHvv//eOKo6u6nUDviX7WAO7EV4IxZC56v7G3F/uooSj42QbNXudz7r40sLTE BA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36ek7p00j7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Feb 2021 09:14:29 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 111EC1lS009873;
 Mon, 1 Feb 2021 14:14:28 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01dal.us.ibm.com with ESMTP id 36cy392m98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Feb 2021 14:14:28 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 111EERmB25887180
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Feb 2021 14:14:27 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14EE313605E;
 Mon,  1 Feb 2021 14:14:27 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C42A9136051;
 Mon,  1 Feb 2021 14:14:26 +0000 (GMT)
Received: from [9.163.45.205] (unknown [9.163.45.205])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  1 Feb 2021 14:14:26 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.8] pmbus:max31785: Support revision "B"
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Joel Stanley <joel@jms.id.au>
References: <20210129175435.2241080-1-msbarth@linux.ibm.com>
 <93d77064-b5e9-4142-8dce-f6484d4541df@www.fastmail.com>
From: Matthew Barth <msbarth@linux.ibm.com>
Message-ID: <6e579a63-ddbd-66c3-5ce2-9369d1a5cd62@linux.ibm.com>
Date: Mon, 1 Feb 2021 08:14:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <93d77064-b5e9-4142-8dce-f6484d4541df@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-01_05:2021-01-29,
 2021-02-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102010068
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


On 1/31/21 4:46 PM, Andrew Jeffery wrote:
>
> On Sat, 30 Jan 2021, at 04:24, Matthew Barth wrote:
>> There was an issue in how the tach feedbacks of dual rotor fans were
>> reported during any change in fan speeds with revision "A" of the
>> MAX31785. When the fan speeds would transition to a new target speed,
>> the rotor not wired to the TACH input when TACHSEL = 0 would report a
>> speed of 0 until the new target was reached. This has been fixed,
>> resulting in a revision "B" update where the MFR_REVISION of "B" is
>> 0x3061.
>>
>> Signed-off-by: Matthew Barth <msbarth@linux.ibm.com>
> Can you please send this upstream?

Will do. Didn't realize this driver had got accepted upstream.


Matt

>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
