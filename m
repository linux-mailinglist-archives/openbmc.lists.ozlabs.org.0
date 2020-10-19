Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2AF292919
	for <lists+openbmc@lfdr.de>; Mon, 19 Oct 2020 16:16:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFJjM0fbqzDqcm
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 01:16:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=l+No4hW/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFJhT1V0BzDqPw
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2020 01:16:05 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09JE7HwK116217
 for <openbmc@lists.ozlabs.org>; Mon, 19 Oct 2020 10:16:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=CW5MU18tXNHeHA7/lhUGxPZ7TRLUHvHG6KVFGkz2R7s=;
 b=l+No4hW/gjmLPZU9fBpTB8JJYvc5hDLSa4lX9THSOtb1QEJShghb2vBo+XLXKb8dtSGH
 +sch9ad8a9pFiZMYoepNY5cxVLG9ydbPTOWltyFZbUFues+vEs1bKRbwj0v8VfJlrhZM
 JJ5VxGhyKXra41uqXgWMBsZV/L7CjbsCLgVGkI5xquwLw8wjKzJGlmAy/jVsLuktOuEQ
 rBFdoE3EkDBQNL4nfM9WYBZ8Cto0NshjE3pvR1ABICJ0nvXIv7LM0aAn6Gg3GhXN2vP4
 /n7hAhBrzBLGt2bGOJILBlvku3pMCdvNKj9GhflyH/eMIbVZEKHMlnncxcKMGb+6v4aL kA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 349c9d8brt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 19 Oct 2020 10:16:02 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09JE82EQ122111
 for <openbmc@lists.ozlabs.org>; Mon, 19 Oct 2020 10:16:01 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 349c9d8bre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Oct 2020 10:16:01 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09JEBsnM016957;
 Mon, 19 Oct 2020 14:16:01 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 347r88v99g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Oct 2020 14:16:00 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09JEFsip55574800
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Oct 2020 14:15:54 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A2EF6A05A;
 Mon, 19 Oct 2020 14:15:59 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16CA86A058;
 Mon, 19 Oct 2020 14:15:58 +0000 (GMT)
Received: from [9.160.22.41] (unknown [9.160.22.41])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 19 Oct 2020 14:15:58 +0000 (GMT)
Subject: Re: Enable/Disable some sensors when Host On/Off
To: Thu Ba Nguyen <tbnguyen1985@gmail.com>, openbmc@lists.ozlabs.org
References: <CALioo35zJdqL7uAhvxAuqa7c16wAdtfc+JVSz6Tg5UG5Yp8L3w@mail.gmail.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <4ff7b0cc-8e61-7fa7-19be-8427f281a0fc@linux.ibm.com>
Date: Mon, 19 Oct 2020 09:16:03 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CALioo35zJdqL7uAhvxAuqa7c16wAdtfc+JVSz6Tg5UG5Yp8L3w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-19_06:2020-10-16,
 2020-10-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 clxscore=1011 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010190094
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



On 10/18/2020 8:58 AM, Thu Ba Nguyen wrote:
> Dear, I'm supporting the host sensors for Ampere Computing LLC 
> platform. We are...
> This Message Is From an External Sender
> This message came from outside your organization.
>
> Dear,
>
> I'm supporting the host sensors for Ampere Computing LLC platform.
> We are using phosphor-hwmon to update values of sensors and monitoring 
> sensors warning/errors base on threshold setting.
>
> There are some sensors which are turned off when host Off. It can be 
> the sensors reported by host or voltage/temperature/power sensors 
>  which use the same power source with host.
>
> I researched in openBmc sensor-architecture documents but can't find 
> any option to enable/disable sensors base on one status or GPIO pins. 
> I can't use REMOVERCS.
>
> Research in phosphor-hwmon code, I don't see the answer too.
>
> Do we have any options/solution to Enable/Disable some sensors when 
> Host On/Off?

Hi,
The phosphor-hwmon code doesn't support that yet.  It has been discussed 
before but nobody
has implemented it.

>
> Thanks.
> Thu Nguyen.

