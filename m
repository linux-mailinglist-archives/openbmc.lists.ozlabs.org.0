Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8275B2B6EE1
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 20:42:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbGYb4RzyzDqRy
	for <lists+openbmc@lfdr.de>; Wed, 18 Nov 2020 06:42:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OLDD7Gqe; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbGHc6qRHzDqSV
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2020 06:30:20 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AHJ44rL041826; Tue, 17 Nov 2020 14:30:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=7pFrj/wQRJ36DHFcnInTReYXFOX/fRcO8NXkp1pSKGs=;
 b=OLDD7GqeorbQTM9ts+H4v35jgcfEV9tX4aeWMhU1EkDjYWgqtOGbGrgwrmr+jFZCsYgy
 fkpdxFuqqAlc5fQvpFaYWhV8KXBZ3CUsUUrEzK5WEvg2FQYbQFx6vhbVS+6ECfps/82K
 hJr9EzG8QDbg6u1+WzCUsdCYRwNvaNevo/R6a5QglIc4uX2UxKfO7zv1GZcs7NgAi7mh
 LbbYH2p/yfXFHGuKU9MHbvPq9lLRRpYqz+4tvk1YPtrt3JOo1tFUb7UqCfW39NataYKt
 KzQSEVjMFgHwXvc7ZRj7dze0InwxFcHlXyV2hasE2DWV1Z+X3BQegIes7OcSdVbPUk4F /g== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34veevdh90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 14:30:14 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AHJRCmJ030468;
 Tue, 17 Nov 2020 19:30:13 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma05wdc.us.ibm.com with ESMTP id 34t6v90v4x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 19:30:13 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AHJUD4i590512
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Nov 2020 19:30:13 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D00BAE05F;
 Tue, 17 Nov 2020 19:30:13 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFC1DAE066;
 Tue, 17 Nov 2020 19:30:12 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.139.110])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 17 Nov 2020 19:30:12 +0000 (GMT)
Subject: Re: STEPS FOR CHANGING THE DEFAULT SERIAL CONSOLE TO UART2
To: Patrick Williams <patrick@stwcx.xyz>
References: <CAFMA7evLWM5ER_KAms4may+PanjUeQPH6Wy2JoCjQkiXj84eSQ@mail.gmail.com>
 <7db605b2-2a22-7693-041d-7d85c60cadd3@linux.ibm.com>
 <66742cd3-7261-4839-b8fb-3da41f473758@www.fastmail.com>
 <ab856254-2636-1440-13df-7a351a501742@linux.ibm.com>
 <20201117164013.GF4495@heinlein>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <82072376-a75a-69f1-2755-b808be2c8b8c@linux.ibm.com>
Date: Tue, 17 Nov 2020 13:30:12 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201117164013.GF4495@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-17_07:2020-11-17,
 2020-11-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 malwarescore=0 impostorscore=0 mlxlogscore=965 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011170133
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Radhika Pradeep <radhika@qwaveinc.in>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/17/20 10:40 AM, Patrick Williams wrote:
> On Tue, Nov 17, 2020 at 08:31:35AM -0600, Joseph Reynolds wrote:
>> On 11/16/20 5:29 PM, Andrew Jeffery wrote:
>>> On Tue, 17 Nov 2020, at 08:12, Joseph Reynolds wrote:
>>>> On 11/16/20 2:30 PM, Radhika Pradeep wrote:
>> Thanks for clarifying.  In that case, see
>> https://github.com/openbmc/docs/blob/master/architecture/interface-overview.md#bmc-serial
>> which unfortunately does not yet have any details.  :-(
>>
>> Is the BMC's console configured in the machine config file using the
>> Yocyo/poky SERIAL_CONSOLE or SERIAL_CONSOLES bitbake variable?
>> For example, here
>> https://github.com/openbmc/openbmc/blob/master/meta-aspeed/conf/machine/evb-ast2500.conf
>>
> I think there are three places that the BMC UART needs to be updated:
>
> - Kernel command line
>      - This comes from U-boot since that is what launches the kernel and
>        passes along the command line to the kernel.
>      - In U-boot v2016.07-aspeed-openbmc this was in ast-common.h, but I
>        don't know where it went in v2019.04-aspeed-openbmc.
> - U-boot itself
>      - I think this is in the same ast-common.h under CONFIG_CONS_INDEX.
> - Userspace via SERIAL_CONSOLE.
>      - This is the config you pointed to above.

Patrick,

Thanks for the details.  I've massaged them into our nascent 
configuration guide:
https://github.com/openbmc/openbmc/wiki/Configuration-guide#bmc-console-shell-access

- Joseph

