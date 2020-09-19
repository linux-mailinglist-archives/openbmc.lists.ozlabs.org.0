Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B40C270AFA
	for <lists+openbmc@lfdr.de>; Sat, 19 Sep 2020 07:43:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Btfkh2w9wzDqvW
	for <lists+openbmc@lfdr.de>; Sat, 19 Sep 2020 15:43:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ratagupt@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jmb8PnL8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtfhC5vwpzDqf9
 for <openbmc@lists.ozlabs.org>; Sat, 19 Sep 2020 15:41:15 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08J5WFNX066318
 for <openbmc@lists.ozlabs.org>; Sat, 19 Sep 2020 01:41:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=CdTfc3Bi7reWW+PU1xFUI5+E/Q+EGT592ER1a6T06GQ=;
 b=jmb8PnL8wN6fKU2AgyFD9xeJnDa90FOgOBe6uNrQDD1w7d0HG5U7KRc+886Q4SUQTDWu
 nyrBJwr/7pnpBLFPTzZe1kQKOnU+mebXfRKqA/nj5OWxpYT+fWqv5HgJ9W8BDn7nVMBD
 YhqiaybqpSmuawB9+zyC42WT7DZGH19Y5eiyIAvvhmd8ClK+03FslQdHfo9b/XmOTf5Z
 OedLKoytDseci1KU+hCCZSlWCjILwnr7zS/RWoSzKtjkLwc9otRs+bvAbmRLsLSrepCJ
 UX2b06lTXrvrECOFNsrlBx6gebHf2zeKp9kcZ3G2lCY8xOvdtwIkQMl1oEmIvvlENGAC Ag== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33nav216f0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 19 Sep 2020 01:41:11 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08J5blrt002202
 for <openbmc@lists.ozlabs.org>; Sat, 19 Sep 2020 05:41:09 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 33n9m8034c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 19 Sep 2020 05:41:08 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08J5f6wo27787666
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Sat, 19 Sep 2020 05:41:06 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4A2211C04A
 for <openbmc@lists.ozlabs.org>; Sat, 19 Sep 2020 05:41:06 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6DC2211C054
 for <openbmc@lists.ozlabs.org>; Sat, 19 Sep 2020 05:41:06 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.62.137])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Sat, 19 Sep 2020 05:41:06 +0000 (GMT)
Subject: Re: Using bios-settings-mgr for setting hypervisor network attributes
To: openbmc@lists.ozlabs.org
References: <C9C88F03-4715-444E-9B1A-3834995458EA@getmailspring.com>
 <20200916172045.GD6152@heinlein>
 <CACWQX80BYYwPTN1PsbLfjFN5fQyjNGC1SxM9iyBKvxNiLh=WLQ@mail.gmail.com>
 <a5f0245d-703d-e0ba-0344-442c49a60cdf@linux.vnet.ibm.com>
 <20200917153601.GH6152@heinlein>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Message-ID: <c007630e-54e2-df13-e6da-0af0b2998279@linux.vnet.ibm.com>
Date: Sat, 19 Sep 2020 11:11:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200917153601.GH6152@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-19_02:2020-09-16,
 2020-09-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=1 mlxlogscore=999 clxscore=1015 adultscore=0 impostorscore=0
 malwarescore=0 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009190041
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


On 9/17/20 9:06 PM, Patrick Williams wrote:
> On Thu, Sep 17, 2020 at 01:10:06PM +0530, Ratan Gupta wrote:
>> We need to address the below two concerns with the existing settings infra.
> Both of these seem like missing features based on our now greater
> understanding of the problem domain from where we were 3-4 years ago
> when phosphor-settings-manager was originally written, right?  That
> doesn't seem like a good reason to entirely throw out the approach.
>
>>    * Pending v/s configured value: Currently settings have single Dbus
>>      Object, Some properties which is for host firmware we need to have
>>      two placeholders one for Pending values and one for Configured
>>      values. Bios settings have this concept.
>>        o Should we add two Dbus objects in settings infra?
> This was going to be my suggestion, yes.  You could have two sets of the
> objects: current and pending.  'current' objects may not be written by
> dbus-clients.  These are the same terms used by the BIOSConfig proposal.
Thanks Patrick, seems reasonable to have two D-bus objects.
>
> What I am not seeing in BIOSConfig and is equally applicable here is
> _when_ pending is applied to current.  You will need some interface that
> IPMI / PLDM can call to apply those settings?  Or, do you monitor host
> state signals automatically?
>
>>    * Dynamic Dbus objects: Currently settings infrastructure is only for
>>      static objects, Objects which gets added on runtime, settings infra
>>      doesn't support that.
>>        o Eg: IP address on ethernet interface is dynamic in nature, An
>>          ethernet interface can have multiple IP address on it.
>>          considering if SLAAC is enabled(ipV6).
>>        o Seems this problem is common for both(settings v/s bios-settings)
> I assume these would be requested for creation by IPMI / PLDM?  We could
> use a similar model to xyz.openbmc_project.Inventory.Manager where
> objects are requested for creation dynamically through a method.
We don't have this requirement now but in near future it is going to
be there, we can improve the settings infra to support this.
>
