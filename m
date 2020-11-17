Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F7E2B6775
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 15:33:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cb7jD1tM6zDqNv
	for <lists+openbmc@lfdr.de>; Wed, 18 Nov 2020 01:33:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nu7iix4Y; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cb7g704HkzDqS7
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2020 01:31:45 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AHEUaQC036677; Tue, 17 Nov 2020 09:31:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=a/VO7wMiCxJMISngeYWV0+ZlNs1Je4nYp2zNT0mlhcc=;
 b=nu7iix4YF3e9f2/Aa6EPe8mBAgvfOfAQWutdEcRgvGCGXkwbmJ0Mfiax743XsYAaBe1L
 N7DJciDkxmkEz0FCnF3p1GvET1qgfIKZI0sZJCz9mDAOSyF1s7tsVnqgIkQlB722VZ4z
 ZHd8E94rorQjTAhxZkXweOIuYzhdDyo7O6w0ZdzBnty0FWU/92OW3i+Iao37w8GlqdHu
 ThiMBvDvE2YZYl7YRkKib9O0ao/r0PXdbje6SqLOskByyDb87DC9HvaumqAxFBOBJ3fS
 blhMLUHghistjDrUs2wXSUXYPd93Qh1LxrFQAuWyYZRmgcK18EbfKfMFjHvJdKCMkWWI KA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34vd4py2bm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 09:31:39 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AHERqL4015439;
 Tue, 17 Nov 2020 14:31:38 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 34t6v8y6c4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 14:31:38 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AHEVSw746399942
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Nov 2020 14:31:28 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 961D713604F;
 Tue, 17 Nov 2020 14:31:37 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1BCEF13605E;
 Tue, 17 Nov 2020 14:31:37 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.139.110])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 17 Nov 2020 14:31:36 +0000 (GMT)
Subject: Re: STEPS FOR CHANGING THE DEFAULT SERIAL CONSOLE TO UART2
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Radhika Pradeep <radhika@qwaveinc.in>
References: <CAFMA7evLWM5ER_KAms4may+PanjUeQPH6Wy2JoCjQkiXj84eSQ@mail.gmail.com>
 <7db605b2-2a22-7693-041d-7d85c60cadd3@linux.ibm.com>
 <66742cd3-7261-4839-b8fb-3da41f473758@www.fastmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <ab856254-2636-1440-13df-7a351a501742@linux.ibm.com>
Date: Tue, 17 Nov 2020 08:31:35 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <66742cd3-7261-4839-b8fb-3da41f473758@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-17_03:2020-11-17,
 2020-11-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 clxscore=1011 phishscore=0 mlxlogscore=947 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011170104
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

On 11/16/20 5:29 PM, Andrew Jeffery wrote:
>
> On Tue, 17 Nov 2020, at 08:12, Joseph Reynolds wrote:
>> On 11/16/20 2:30 PM, Radhika Pradeep wrote:
>>> Hi , We have a BMC board based on the AST2520 with UART2 set as serial...
>>> This Message Is From an External Sender
>>> This message came from outside your organization.
>>>
>>> Hi ,
>>>
>>> We have a BMC board based on the AST2520 with UART2 set as serial
>>> console.We are using the openbmc codebase based on ast2500 with aspeed-g5.
>>>
>>> Since the default uart console is set to uart5 we are not able to get
>>> the serial console output.
>>>
>>> We just got a "mw" command used in uboot to change the register for
>>> UART5 TO IO2 routing which can only be done temporarily.
>>>
>>> Because we have the console connected to UART2 only. So we need to get
>>> the console output at UART2 each time the board boots up.
>>>
>>> Could you please provide us with the information on how to change
>>> routing permanently or the information about  the file which can be
>>> modified to change the register values permanently to get the uart2
>>> console output.?
>>>
>> Did you see UARTs described here?
>> https://github.com/openbmc/docs/blob/master/architecture/interface-overview.md
>> Which links to this?  https://github.com/openbmc/obmc-console
>>
> The query is about the BMC console, not the host console, so obmc-console and
> the related documentation is not relevant here.

Thanks for clarifying.  In that case, see 
https://github.com/openbmc/docs/blob/master/architecture/interface-overview.md#bmc-serial
which unfortunately does not yet have any details.  :-(

Is the BMC's console configured in the machine config file using the 
Yocyo/poky SERIAL_CONSOLE or SERIAL_CONSOLES bitbake variable?
For example, here 
https://github.com/openbmc/openbmc/blob/master/meta-aspeed/conf/machine/evb-ast2500.conf

- Joseph

>
> Andrew

