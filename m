Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 227462FDBE5
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 22:34:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLf1d0p5wzDr27
	for <lists+openbmc@lfdr.de>; Thu, 21 Jan 2021 08:34:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CFJF9ocN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLf093RbjzDqm6
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2021 08:33:28 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10KLW1MQ092019
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 16:33:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : message-id : date : mime-version : in-reply-to : content-type
 : content-transfer-encoding; s=pp1;
 bh=d3JpTsgY9o3ZDKGd8ke2D0nmSIRlMVu61workwL+UsY=;
 b=CFJF9ocNl5RomIxie3epcRdGbbMBfOqbWEL2MT824lDDlJJIgIh4Epng5ZNS3iVhTy+8
 AswyPBAHb1TKjUDj31LnJ1Cx/y3C0n4z9BgejZgusMXiXS9ktHOzf/ixNgXCe9c0w0YB
 82c2RbIqSLjM5lMiyxcuuLZOl9HekaCKTdlwtAAghACRwYlUxZIBkGHcfemSLr05Wl4B
 WHqdcQ7K/wbD17qdP8Pwn29Q/HvZXRH7pT2foCwPx2ULQEKE8LKPG5hJIJuKAO/QaG3d
 2AeGNEp7O/XjYLe66CuBtWMy8/KsB+bv4rhcjH2c0kt/yyUhdIBe62LJx4iSVDbhYoCH kQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 366tx82pbc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 16:33:24 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10KLX9kV008686
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 21:33:24 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02wdc.us.ibm.com with ESMTP id 3668rv79a6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 21:33:24 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10KLXNbq31130070
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 21:33:23 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ADBFFB2065
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 21:33:23 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82242B205F
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 21:33:23 +0000 (GMT)
Received: from demeter.local (unknown [9.85.146.197])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 21:33:23 +0000 (GMT)
Subject: Re: Security Working Group - Wednesday January 20 - results
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <26909931-a316-f283-12a5-cf3892d15e06@linux.ibm.com>
Message-ID: <1dc01a00-4cac-c830-a4cb-aafa18760c54@linux.ibm.com>
Date: Wed, 20 Jan 2021 15:33:22 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <26909931-a316-f283-12a5-cf3892d15e06@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-20_10:2021-01-20,
 2021-01-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=813 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101200121
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



On 1/19/21 11:56 AM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday January 20 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
> and anything else that comes up:
>
> 1. (email) Call for OpenBMC 2.9.0 release.

Reviewed the security wiki item for this.


>
> 2. Yocto email: Dropped openssl support for deprecated algorithms,
>    including TLS 1.0 and TLS 1.1.  I (Joseph) believe we already have
>    dropped TLS below TLSv1.2, but let’s take a look to see if we want
>    any changes in this area.

dropped for HTTPS, not necessarily for SSH.  Related discussion:

Move away from dropbear SSH to OpenSSH?  Why?  See the new issue 
https://github.com/openbmc/openbmc/issues/3756 
<https://github.com/openbmc/openbmc/issues/3756>.  The group had general 
agreement to do this.


>
> 3. (gerrit review): Does anyone have a use case to allow customers to
>    disable HTTPS?
>    https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/39006
> <https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/39006>

Yes, we have use cases to disable the BMC’s HTTPS interface.  For 
example, a BMC controlled via the KCS interface (although these BMCs 
typically have their HTTPS interface removed entirely).

For the gerrit review: Allow HTTPS to be disabled, but don’t make it 
easy for the admin to remove their only access to the BMC (bricking).

The BMC’s service configuration manager 
(xyz.openbmc_project.Control.Service.Attributes at 
/xyz/openbmc_project/control/service/) shall issue an error message like 
“Cannot disable the %1{HTTPS,IPMI,etc} interface from a request via that 
same interface because that might brick the BMC.  Make the request from 
some other interface.”


An alternative to the above, we discussed having a behavior like “You 
cannot disable the last remaining interface”.


We discussed enhancing the BMC’s service configuration manager with a 
built-time option to disable the ability of the BMC admin from enabling 
and disabling the BMC’s interfaces.  For example, have a build-time 
block list (CANNOT_CHANGE_RUNNING_ATTRIBUTE_OF_THE_FOLLOWING_SERVICES) = 
“HTTPS” so any attempt to enable or disable HTTPS will be blocked and 
fail with a nice message like, “You cannot change the running state of 
the %1{HTTPS} service.”  In this way, the person who configures the BMC 
image can ensure that certain services are always running.


We discussed what happens to existing SSH sessions when SSH interface is 
disabled?

What happens to existing Redfish sessions when HTTPS interface is disabled?

What happens to existing IPMI LAN+ when IPMI/RMCP+ interface is 
disabled?  (RMCP.  No current use case to disable the KCS IPMI 
interface.  Compare with KCS restricted mode.)


>
> 4. (gerrit review): Linux-PAM dropped support for pam_cracklib and
>    pam_tally2.  These are being removed from OpenBMC usage because they
>    are no longer available from yocto, but the function is not yet
>    replaced.  See https://github.com/openbmc/openbmc/issues/3750
>    <https://github.com/openbmc/openbmc/issues/3750>.

This work is happening now.  Reviews appreciated. ADDED BONUS ITEMS:

5 The Intel security is planning to focus on penetration testing (an 
internal hackathon).


6 Update on Linux process isolation.

Still working on solutions for common cases.

Difficulties: file permissions, testing other people's code, wrong 
architecture need to be upgraded

Hard to take the first step because you’ll need dbus permissions working 
which is difficult.

Example: difficulties when the (downstream) nbd launches another process.

Idea: Have a new image feature to enable process isolation.  Grow over 
time to encompass additional BMC services.
>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>

