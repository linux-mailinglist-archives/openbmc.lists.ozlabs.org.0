Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADEA35E8C2
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 00:07:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKfpy2HKPz3bc8
	for <lists+openbmc@lfdr.de>; Wed, 14 Apr 2021 08:07:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AL18q5dt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AL18q5dt; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKfpj2MPPz2yhd
 for <openbmc@lists.ozlabs.org>; Wed, 14 Apr 2021 08:07:08 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DM4fiP166005
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 18:07:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=evxHHurw4JQ/L3hO/1XeQ7pFW8TyV9Jj+Jci88jPeEE=;
 b=AL18q5dtXVC70vEbvMIrdGxaIbVm5+/7JySrtL5ikwrnIaIrsa2O+IWTwY9ysar1c+DW
 rKV4eBo9GE1+5821Tnu45d15H+8432kBhFVYI0GH6wouJqqbNqHtvjfjrza1szz2TCLr
 IqFGCCUJQ4zDuEoDDp+DRzSuuu2pThNqNEQqhgTwUfdTvipOvChk77wWJODRlR+eksmM
 L9igUco8NKEDtwNskS7Z/kK7XP8nMIGV5KObHn6AmIWcEccjkg2VnEQYhmOjarrvdkF2
 KzDy4dJCQ3IozS6liXTqRmQqEgdrwn/bpiR7GoWV2n4pqqiuYDL8fYGuVmFIGh0/dGzd MA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37w87svcp4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 18:07:05 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13DM5YE2168451
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 18:07:05 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37w87svcnu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 18:07:05 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DLq94U022861;
 Tue, 13 Apr 2021 22:07:04 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 37u3n938vg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 22:07:04 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13DM737u29884778
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 22:07:03 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FB8A78070;
 Tue, 13 Apr 2021 22:07:03 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 710167806E;
 Tue, 13 Apr 2021 22:07:02 +0000 (GMT)
Received: from demeter.local (unknown [9.160.29.196])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 13 Apr 2021 22:07:02 +0000 (GMT)
Subject: Re: OpenBMC expired password feature
To: Mario Sanchez <wehurtsalami@gmail.com>, openbmc <openbmc@lists.ozlabs.org>
References: <7b094d0b-ce2a-38e9-70e0-a8d36356f870@linux.ibm.com>
 <CAK_FChHSGO0z5qGknmzBfuvD4A7bp4DTBmusDshZOHVZCU-4Gw@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <86d58ac9-a202-4cd6-32fe-13eec86adcf7@linux.ibm.com>
Date: Tue, 13 Apr 2021 17:07:00 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
In-Reply-To: <CAK_FChHSGO0z5qGknmzBfuvD4A7bp4DTBmusDshZOHVZCU-4Gw@mail.gmail.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DH912anvZ4mr2tp3FBncdtZuM9UnfMAf
X-Proofpoint-GUID: mFcZWUCGCqUskzFZKgGGJiKwWNpor8G0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_16:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104130142
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

On 4/13/21 12:11 PM, Mario Sanchez wrote:
> Joseph, Thank you very much for the info. By the way, are you aware of 
> any issues or concerns with enabling this feature via one method vs 
> the other (bitbake recipe vs systemd service) ? Any behavior 
> differences that may cause some problems ZjQcmQRYFpfptBannerStart
> This Message Is From an External Sender
> This message came from outside your organization.
> ZjQcmQRYFpfptBannerEnd
> Joseph,
>
> Thank you very much for the info.

You're welcome.

In future emails, please address them to both me and to the OpeBMC 
community email list.  See https://github.com/openbmc/openbmc#contact
This way, everyone benefits from our conversation and we can share our 
knowledge.

And when you reply to openbmc emails, please answer inline (like I have) 
and not at the top of the email.  It's the custome for open source 
projects.

>
> By the way, are you aware of any issues or concerns with enabling this 
> feature via one method vs the other (bitbake recipe vs systemd 
> service) ?  Any behavior differences that may cause some problems down 
> the road ?

No, not really.  The easiest and most obvious solution is the recipe 
change, which results in the readonly image having an expired password.  
There was some esoteric issue with the factory reset function which led 
to creating the service to expire the password. I don't remember exactly 
why.  The key is to test all of your scenarios.

Good luck,
Joseph

>
> Thanks,
> --Mario.
>
> On Tue, 13 Apr 2021 at 10:40, Joseph Reynolds <jrey@linux.ibm.com 
> <mailto:jrey@linux.ibm.com>> wrote:
>
>      > Hi Joseph,
>      >
>      > I am working on OpenBMC and would like to test the 'initial
>     expired
>     password' feature that you worked on.  I am not sure how to enable
>     this
>     in an OpenBMC image though.
>      >
>      > I couldn't find another document which described that process,
>     other
>     than the design documentation listed here:
>     https://github.com/openbmc/docs/blob/master/designs/expired-password.md
>     <https://github.com/openbmc/docs/blob/master/designs/expired-password.md>
>
>     <https://github.com/openbmc/docs/blob/master/designs/expired-password.md
>     <https://github.com/openbmc/docs/blob/master/designs/expired-password.md>>
>      >
>      > Is there another document which describes the enablement
>     process, or
>     can you provide some more information on this?
>
>     Mario,
>
>     The support to have initial expired passwords is not fully
>     available in
>     the OpenBMC project.  Here are the pieces you need:
>
>     (1)
>     The EXPIRED_PASSWORD image feature is not implemented.  There are two
>     alternate ways to expire the password:
>     1. Directly expire the root account password via a bitbake
>     recipe.  See
>     https://github.com/openembedded/openembedded-core/pull/63/commits/7ace37a67c56fb4b9e0e98f8eff4ed067eb89f1e
>     <https://github.com/openembedded/openembedded-core/pull/63/commits/7ace37a67c56fb4b9e0e98f8eff4ed067eb89f1e>
>     2. Add a BMC systemd service to expire the password on BMC first
>     boot.
>     See
>     https://github.com/ibm-openbmc/openbmc/blob/5434eaa5e4f53d9972c7bf3c4a90fd189f529547/meta-phosphor/recipes-phosphor/users/phosphor-user-manager_git.bb
>     <https://github.com/ibm-openbmc/openbmc/blob/5434eaa5e4f53d9972c7bf3c4a90fd189f529547/meta-phosphor/recipes-phosphor/users/phosphor-user-manager_git.bb>
>
>     The reason for the first-boot-expire-password.service has to do
>     with how
>     the factory reset function works.
>     Neither of these are merged into the OpenBMC project or OE core.
>
>     (2)
>     Both BMCWeb and the WebUI have the functions to handle expired
>     passwords.  Specifically:
>     - BMCWeb follows the Redfish "password change required handling" spec.
>     - The WebUI has a special dialog which allows a user to change
>     their own
>     expired password during login.
>
>     Note a proposed BMCWeb change breaks the "password change required
>     handling" function:
>     https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/39756
>     <https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/39756>
>     Work on that is pending.
>
>     (3)
>     The dropbear SSH server does not allow you to login or to change your
>     password when your password is expired.  My attempt to patch dropbear
>     has failed, and I carry a local patch here:
>     https://github.com/ibm-openbmc/openbmc/blob/86f9791c2a2d991c3509f5e785322b1011c71d26/meta-phosphor/recipes-core/dropbear/dropbear_%25.bbappend
>     <https://github.com/ibm-openbmc/openbmc/blob/86f9791c2a2d991c3509f5e785322b1011c71d26/meta-phosphor/recipes-core/dropbear/dropbear_%25.bbappend>
>
>     You can avoid this issue by using the OpenSSH server in place of
>     dropbear.
>
>
>     - Joseph
>
>      >
>      > Thanks,
>      > --Mario.
>

