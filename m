Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5353314E1
	for <lists+openbmc@lfdr.de>; Mon,  8 Mar 2021 18:30:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvQN95ZXfz3cYV
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 04:30:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ON0ARoL/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ON0ARoL/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvQMx1xV3z3bPJ
 for <openbmc@lists.ozlabs.org>; Tue,  9 Mar 2021 04:30:20 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 128H3x0m098148; Mon, 8 Mar 2021 12:30:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=BhbKbK9FNZBJIuzfQd0WX4BxFXmmk+mp6H3ALQytV+A=;
 b=ON0ARoL/xQnFcdNQKOjoyfzR4I58QumD88yFFqDFm/pNtmuep8jgXq4DvEpTPK9Etq5S
 mdiiBy2wDUdty03rfqAXuU2IPav6l0YQcpuOhGJbc1SJlryOswQdc1L8FxaiK9cSeWVm
 0KBZFLPHLs5daAHMpJKcNt0Isaf9mTcmrh5F63KzECpspFUbDBvc5NmDyHgQ+lX/ynol
 rgJmwA1Vg+S34okumaxlC5kcFSFPvC1FJTnYNEBYEATFDKqYK6AIKovCDMoK+9VBxBj8
 HCmhI+0fQulSKiU+PeLufgG6RznjtJ1pxmiyOoh1yPOVF5E9nEGN1mx0vgurcwWO4Ktv 9g== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375q12aqy2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 12:30:17 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 128HSVmh007454;
 Mon, 8 Mar 2021 17:30:16 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02wdc.us.ibm.com with ESMTP id 3741c8ra9s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 17:30:16 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 128HUEs721168602
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Mar 2021 17:30:14 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DFFEB2075;
 Mon,  8 Mar 2021 17:30:14 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C512B2081;
 Mon,  8 Mar 2021 17:30:14 +0000 (GMT)
Received: from demeter.local (unknown [9.160.54.239])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon,  8 Mar 2021 17:30:14 +0000 (GMT)
Subject: Re: Request new repo for IBM-specific code
To: Ed Tanous <ed@tanous.net>
References: <b8af3438-f85a-cb82-c88c-9c4e120399e9@linux.ibm.com>
 <CACWQX8048sDqehYaRAS9-T8G8ffWgLo-1fOVsozAC=4TtJdFqw@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <da7d4224-845e-f51d-4430-a34799137698@linux.ibm.com>
Date: Mon, 8 Mar 2021 11:30:13 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CACWQX8048sDqehYaRAS9-T8G8ffWgLo-1fOVsozAC=4TtJdFqw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-08_14:2021-03-08,
 2021-03-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103080091
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 3/8/21 10:03 AM, Ed Tanous wrote:
> On Thu, Mar 4, 2021 at 7:15 PM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>> What is the right repository for a new Linux-PAM module to implement an
>> IBM-specific ACF authentication?
>>
>> The access control file (ACF) design was introduced to the OpenBMC
>> security working group and is described in [IBM issue 1737][] and
>> further explained in [IBM issue 2562][].
> Could you describe it in a design doc?

It would be an IBM-specific design, specific to IBM Enterprise systems.  
We're still working out the design.  I think I can share big parts of it 
with OpenBMC.

> Implementing ACL seems like
> something that's going to affect a lot of the system (at a minimum
> every outward facing client).  Unless you really think that you can do
> this with no changes to the client repos or phosphor-user-manager, it
> seems like it's worth discussion.

I anticipate the implementation would affect OpenBMC in three places:
1. New REST APIs to upload the ACF certificate, under URI /ibm/v1.
2. New Linux-PAM modules to validate the service login, along with 
enhanced /etc/pam.d/ config files for IBM Enterprise systems.
3. New Redfish role Oem.IBM.ServiceAgent (see comment below).

> For what it's worth, I really don't
> want to branch the authorization code in bmcweb depending on what
> company compiled the code.  They were hard enough to get right in the
> general case, and matter a lot for security.  The likelihood we get
> them right for every flavor of auth that a company might want to do
> seems unlikely.  If we as a project need an "ultra user" that seems
> like it shouldn't be specific to IBM, or should be a generic
> configuration that IBM systems apply on top, using common routines.

The BMCWeb pieces are:
1. A new Redfish role: Oem.IBM.ServiceAgent.
2. A new Redfish privilege: Oem.IBM.ProvideService.  For example, allows 
you to PATCH EEPROM data.
3. Implement the Redfish (new in Redfish 2020.4) RestrictedRoles and 
Restricted privileges.

> I've already detailed a path toward this in a previous email on this
> topic.

Thanks, I believe we have agreed on a path forward.

>
>> Note the [pam-ipmi modules][] are scoped to the OpenBMC project because
>> the IPMI implementation is shared by all of OpenBMC.  By comparison, the
>> proposed ibm-pam-acf module is intended only for IBM Enterprise
>> systems.  The intended implementation is based on standard cryptography
>> techniques and could be developed into a general authentication
>> solution, but the ACF is specific to IBM in terms of its exact format
>> and content, and I expect it will only be used by IBM and its partners.
> Have you released the specifications for this file format with an
> appropriate license?  That seems like a good first step to figuring
> out if these could find a home in OpenBMC.  If you've already done
> that, could you link them?
>
>> Can we create a new OpenBMC repo for this?  Perhaps ibm-pam-acf?  Or
>> should this go into some other repo?
> Could you please post the code you're planning on putting there
> somewhere that we can see it in gerrit?  I suspect that would help
> review whether or not a new repo is warranted, and probably give hints
> as to what design you're planning on implementing.

[Addressing both comment blocs above:]  I am investigating open sourcing 
the entire set of tools: ACF create/display/validate.
I plan to push the Linux-PAM module for early review as soon as 
possible, and it will reveal the content of the ACF.

Thanks!

> - Joseph
>
> [IBM issue 1737]: https://github.com/ibm-openbmc/dev/issues/1737
> [IBM issue 2562]: https://github.com/ibm-openbmc/dev/issues/2562
> [pam-ipmi modules]: https://github.com/openbmc/pam-ipmi

