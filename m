Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D824D229
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 17:29:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45V5Ms3Jj2zDrJF
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 01:29:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45V5M63jWyzDrFF
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jun 2019 01:28:49 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5KFSOGh069358
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 11:28:45 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t8cmtghfp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 11:28:45 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.ibm.com>;
 Thu, 20 Jun 2019 16:28:44 +0100
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 20 Jun 2019 16:28:41 +0100
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5KFSe2S15794478
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jun 2019 15:28:40 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2211C28058;
 Thu, 20 Jun 2019 15:28:40 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0B5D28059;
 Thu, 20 Jun 2019 15:28:39 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 20 Jun 2019 15:28:39 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Thu, 20 Jun 2019 10:30:18 -0500
From: Joseph Reynolds <jrey@linux.ibm.com>
To: =?UTF-8?Q?Carter_Su=28=E8=8B=8F=E5=AD=9D=29?= <suxiao@inspur.com>
Subject: Re: Move away from default password
In-Reply-To: <ca82e6a6ab5440e3b9f9754a66d5452c@inspur.com>
References: <ca82e6a6ab5440e3b9f9754a66d5452c@inspur.com>
X-Sender: jrey@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19062015-0072-0000-0000-0000043EDC62
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011297; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01220753; UDB=6.00642205; IPR=6.01001891; 
 MB=3.00027394; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-20 15:28:42
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062015-0073-0000-0000-00004CAEEB90
Message-Id: <c9bc3a35013c4a6ad380091c98b09f54@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-20_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906200113
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
Cc: openbmc@lists.ozlabs.org,
 openbmc <openbmc-bounces+jrey=linux.ibm.com@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2019-06-20 02:55, Carter Su wrote:
> Having a default password is a security risk, but if per BMC has an
> unique password, it may not very convenient for customer to use.
> Customers will change the default password when they install new
> machinery, or they may creat new account and password for BMC to use.

Thank you.  I understand that concern.  How do we balance ease of use 
-versus- security?
Having a well-known default password is easy to use, but too many 
installations fail to change the password, which gives attackers an easy 
way to take over the system.  Because of that, new laws are going into 
effect, for example [CA Law SB-327][], which require the system to not 
have a default password.

[CA Law SB-327]: 
https://leginfo.legislature.ca.gov/faces/billTextClient.xhtml?bill_id=201720180SB327

I am looking at three options:

1. Leave the default OpenBMC configuration with the default password.  
That is, if you build an OpenBMC image from source, it will have the 
default password.
I wouldn't change that unless until there is a better alternative.  (See 
2 and 3 below.)

2. Same as option 1, but have a way to set an unique password for each 
system.  Specifically, the firmware image would be identical for 
multiple systems, but the password would be different for each.  You 
could use randomly generated passwords, or a scheme that generates 
password based on the system serial number or some other unique 
identifier (such as a MAC address), with weaker or stronger security 
considerations for each.  Whoever build the BMC image and loads it onto 
the BMC could change the password before giving the BMC to its end user. 
  As you point out, this may be very inconvenient.

3. Create a new feature: a new security mode to restrict the BMC's 
operation to setting up a new account.  Specifically, when this feature 
is engaged, the BMC requires you to create a userid and password before 
its full function can be accessed.

- Joseph

> 
> 
> Carter Su
> 
> 
> ---------- Forwarded message ---------
> From: Stewart Smith <stewart@linux.ibm.com>
> Date: Tue, Jun 18, 2019 at 6:59 AM
> Subject: Re: Move away from default password
> To: Adriana Kobylak <anoo@linux.ibm.com>, Joseph Reynolds 
> <jrey@linux.ibm.com>
> Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
> Openbmc <openbmc@lists.ozlabs.org>, Thomaiyar, Richard Marian
> <richard.marian.thomaiyar@linux.intel.com>
> 
> 
> Adriana Kobylak <anoo@linux.ibm.com> writes:
>>>> 1. Unique password per BMC.
>>>> In this approach, there is a way to change the factory default
>>>> password.  Example flow: assemble the BMC, test it, factory reset,
>>>> generate unique password (such as `pwgen`), then use a new function
>>>> “save factory default settings” which would save the current 
>>>> setting
>>>> into a new “factory settings” flash partition. After that, a 
>>>> factory
>>>> reset would reset to the factory installed password, not to the
>>>> setting in the source code.
>> 
>> How would this new "factory settings" flash partition be protected
>> against being modified by an unauthorized or malicious user?
> 
> My guess would be it'd be protected the same way that the default
> password is today: not at all. If an attacker can write to flash, the
> only way to reset the box is to dediprog the BMC flash chip.
> 
> --
> Stewart Smith
> OPAL Architect, IBM.

