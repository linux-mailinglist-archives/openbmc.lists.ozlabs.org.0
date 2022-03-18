Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2884DE3F1
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 23:16:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKyyj32q3z30RH
	for <lists+openbmc@lfdr.de>; Sat, 19 Mar 2022 09:16:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A+eSxMC6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=A+eSxMC6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKyyC02W4z2yYc
 for <openbmc@lists.ozlabs.org>; Sat, 19 Mar 2022 09:15:46 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22IIW7SI005080; 
 Fri, 18 Mar 2022 22:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=mz7tylyehyv6hIatnvycTGzuDVhl3oxHswNOYSVHbiI=;
 b=A+eSxMC6ePEgoJZd0tw/V4TybylKGw4gZZd3uu+QxTePKy1K833dYuDE5H9rB+pvXeNY
 AG6BpQLzjxtI6+jzK+CYVPcMsktGcplV8WKPWB51EgrFu5g78GpkBNtRsMHRp2BxOGfl
 XaZ3bO1bGDTO7KB5wh8t7LE7EWOJ9drk0ScdvonJ3ATgADwndH6vJSrW3mfJIgd/GC8Q
 nngSnvJkhkqwAv7/GNceMiOle005NTxOhViHJMPCgbQUluiQA7M7BqGFeCqhLEkvIWh8
 xZ1wrMAOgF4dpeNiYioT6td7SQhGl5xIGR3TTLRm8rHbBWhRQZSQMxnRHsOjBCqyGhRg Jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3euy5x1f8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 22:15:40 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22IMAGUj022402;
 Fri, 18 Mar 2022 22:15:40 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3euy5x1f7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 22:15:40 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22IM7Z50013666;
 Fri, 18 Mar 2022 22:15:39 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 3erk5ag3rx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 22:15:39 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22IMFbr423855604
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 22:15:37 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4FF1124053;
 Fri, 18 Mar 2022 22:15:37 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0343312405B;
 Fri, 18 Mar 2022 22:15:37 +0000 (GMT)
Received: from [9.65.232.98] (unknown [9.65.232.98])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 18 Mar 2022 22:15:36 +0000 (GMT)
Message-ID: <b549c95f-7d1b-0147-9f2d-6c780cacd601@linux.ibm.com>
Date: Fri, 18 Mar 2022 17:15:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: Software Bill of Materials
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>, Richard Hughes <hughsient@gmail.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <CAD2FfiEKfS-=ER9qJ9mftjCsiAiseytrDCcbiCn+EcyKOLd9Mg@mail.gmail.com>
 <YjO0QqLKbNned7dk@heinlein>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <YjO0QqLKbNned7dk@heinlein>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jGYcRw2d-EQSajZ7yzZbgwMKIrUbF-k4
X-Proofpoint-ORIG-GUID: QVBxKUIwHdoO5uHUaW82_n7HiCdjq7tn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-18_14,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203180119
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
Cc: openBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 3/17/22 5:20 PM, Patrick Williams wrote:
> On Thu, Mar 17, 2022 at 04:26:08PM +0000, Richard Hughes wrote:
>> Hi all,
> Hello Richard,
>
> Thanks for pointing this topic out to us.  I'm not sure we've done a lot of
> thinking on it and there appears to be a good amount to digest.

...snip...

> I'm not really sure where to go from here.  It seems like, since we've built
> everything on top of Yocto, having someone go write a bbclass that creates
> whatever coSWID data you want from existing information the bitbake recipes
> already have would be the start.

I asked Yocto a while back.  They referred me to the license.bbclass.  
You can configure it to produce a list of recipes used, along with 
version and license.
I also use the archiver.bbclass to get the source code needed for 
license compliance and for source code scans.

-Joseph
