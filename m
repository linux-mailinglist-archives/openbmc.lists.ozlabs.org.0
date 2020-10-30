Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEC12A0FFE
	for <lists+openbmc@lfdr.de>; Fri, 30 Oct 2020 22:08:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CNFK827vLzDqx6
	for <lists+openbmc@lfdr.de>; Sat, 31 Oct 2020 08:08:28 +1100 (AEDT)
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
 header.s=pp1 header.b=cop5xWZ7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CNFJ52rjXzDqx9
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2020 08:07:32 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09UL1YAH052508; Fri, 30 Oct 2020 17:07:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=k7+9bMJmbwb9m6ipsJHtQ8dRKaRkUq3ySMetNTFyxhY=;
 b=cop5xWZ7E8SopEpL3DH8m8x9NZt9fRMQF3+UUk+IF0K4gDIFrvGsCBFAmn3JuF/VPujy
 d6pPGUbAoTyTfQVHxluhdMrp1K392LilGu6juvZVh0UjXLsktq77/D9KEKN6XKf9PULw
 uS4NXYJ6LetcR61t+fdAD8as+MTjGe79pejUk4NgPP+2nwEp0dKRlAsg44G+lbQrQjUk
 QW4OfzXYde1Kaswkp70T+/vlqH5uBZlpxfNYqrDU+vByVMV96DCZiD2OvWKL+vOmYC5E
 ggLMAF2157HtjnzBjj9kGvSbA+yU5oUlL1c+hFpdiw/VNye7o6ecVOOohJgJLOTSYjFE ww== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34gnqqrhy0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Oct 2020 17:07:28 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09UL26KR054481;
 Fri, 30 Oct 2020 17:07:27 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34gnqqrhxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Oct 2020 17:07:27 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09UL7GJW006441;
 Fri, 30 Oct 2020 21:07:27 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 34e1gpn9sw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Oct 2020 21:07:27 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09UL7KQp48955882
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Oct 2020 21:07:20 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A660C6E056;
 Fri, 30 Oct 2020 21:07:25 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4C8F6E058;
 Fri, 30 Oct 2020 21:07:24 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.156.122])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 30 Oct 2020 21:07:24 +0000 (GMT)
Subject: Re: SELinux support question
To: Artem Senichev <artemsen@gmail.com>, Ivan Li11 <rli11@lenovo.com>
References: <HK2PR03MB45804A1D770024303FC50FCAD3140@HK2PR03MB4580.apcprd03.prod.outlook.com>
 <CAHsrh9KO6jxKY1Oi6=8Gk74gF+Rrhz+9HN3UgRpO16st0RmjRQ@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <4c13b632-c1ac-2908-4154-325f7c90a201@linux.ibm.com>
Date: Fri, 30 Oct 2020 16:07:23 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CAHsrh9KO6jxKY1Oi6=8Gk74gF+Rrhz+9HN3UgRpO16st0RmjRQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-30_10:2020-10-30,
 2020-10-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1011 priorityscore=1501
 mlxlogscore=742 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010300152
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Manojkiran Eda <manojeda@in.ibm.com>, Anton Kachalov <rnouse@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/30/20 12:55 AM, Artem Senichev wrote:
> Hi Ivan,
>
> Yocto has a layer for SELinux
> (http://git.yoctoproject.org/cgit/cgit.cgi/meta-selinux), you can try
> it.
> But the layer depends on Python for management tools, which does not
> exist in the OpenBMC image anymore.
> The problem is that Python significantly increases image size, it will
> be more than 32MiB, which causes some troubles with qemu emulation.
>
> --
> Best regards,
> Artem Senichev
>
> On Thu, Oct 29, 2020 at 7:48 PM Ivan Li11 <rli11@lenovo.com> wrote:
>> Hi Team,
>>
>>
>>
>> I would like to ask about SELinux support. It’s seems that there’s no SELinux related package in current OpenBMC.
>>
>> Therefore, is it not supported for now ?
>>
>> Please help to advise.

SELinux and alternatives such as AppArmor and KRSI (Kernel Runtime 
Security Instrumentation) were discussed in various OpenBMC security 
working group meetings including 2020-05-13, 2020-04-01, and earlier.  
See the meeting minutes:
https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI

I don't have any additional insight.

- Joseph

>>
>>
>>
>> Thanks.

