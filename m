Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 644546DA49B
	for <lists+openbmc@lfdr.de>; Thu,  6 Apr 2023 23:23:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Psvc31k4xz3fV5
	for <lists+openbmc@lfdr.de>; Fri,  7 Apr 2023 07:22:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TLggTwM/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TLggTwM/;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsvbR69M4z3chd
	for <openbmc@lists.ozlabs.org>; Fri,  7 Apr 2023 07:22:27 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 336KSVT9003747;
	Thu, 6 Apr 2023 21:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=TL7VRZnBhKg7bsU3o3HYxCW6/BnCeo8YS7kWlgpEDdI=;
 b=TLggTwM/YcO/omHQQW4X8fPAdlMs8ZZHAwlJ60zTLxMSdojXHbMVrPZnWnA/b69HksKM
 r+W8VqM+tJ7EM/3pWnq/yRsw1f8y4IAyFt7kZx7FslEfmgLQG6nhsLvpgtX84r5FhVEE
 xf8JwhzQ4XPwnRmlcqZ9z7U9j/VLgNpLyWy88LRrAN3Du05U2Q0DRjAemIJwKIkJZj1s
 yGorPH4s7thspSi0gFw89S1hV1qZFp4sb+zZTcvn2v1xZiXJ79Sp/OuOBWrB+RjDm8bX
 /5hVaVf24TuPanl2qDJzJjFbMvz2BajnwmO3O87HESLC7UxDBaJ4GNB6SDR3TQckQknO iw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pt55b14ct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Apr 2023 21:22:23 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 336KoUvj012271;
	Thu, 6 Apr 2023 21:22:23 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pt55b14cp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Apr 2023 21:22:23 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 336Ijcp9024270;
	Thu, 6 Apr 2023 21:22:22 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([9.208.130.100])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3ppc88mpc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Apr 2023 21:22:22 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 336LMLd010945170
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Apr 2023 21:22:22 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B81FB58055;
	Thu,  6 Apr 2023 21:22:21 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 32C025804B;
	Thu,  6 Apr 2023 21:22:21 +0000 (GMT)
Received: from [9.160.174.160] (unknown [9.160.174.160])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  6 Apr 2023 21:22:21 +0000 (GMT)
Message-ID: <53fade52-2afc-f375-40b1-f6781bf5d117@linux.ibm.com>
Date: Thu, 6 Apr 2023 16:22:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: Design to isolate BMC service access
Content-Language: en-US
To: Michael Richardson <mcr@sandelman.ca>, openbmc
 <openbmc@lists.ozlabs.org>,
        Ed Tanous <edtanous@google.com>
References: <552186c1-50c4-198c-57bb-98ab3ac29d58@linux.ibm.com>
 <6411.1680807620@localhost>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <6411.1680807620@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7SrDI67aoo22ZtQ2McrNv-NpoIlcygBT
X-Proofpoint-ORIG-GUID: YtV8EbqDZP9o_IpnE9y4jGJU-K5ZJpKf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-06_12,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 clxscore=1011 suspectscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304060187
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

On 4/6/23 2:00 PM, Michael Richardson wrote:
> Joseph Reynolds <jrey@linux.ibm.com> wrote:
>      > A "service access token" is proposed.  Details are below but for now, a
>      > service access token:
>
>      >  * Is a small file (kilobytes), a digitally-signed request to access a
>      > specific BMC function on a specific BMC for a limited time window.
>      > This token may have additional information about its origin, etc.  * Is
>      > created by an authorized service agent.  Only service agents can
>      > digitally sign the tokens so they can be verified by the BMC.  * Is
>      > uploaded to the BMC by an admin user to perform a specific service
>      > function.  * Has nothing that is secret to the BMC admin user.  If the
>      > token encodes a password, it is stored in the form of a secure hash.
>
> So it's a bearer token (?) that is encrypted by the BMC to itself?
> Or it's created by an external entity?

Michael,  +cc: Ed Tanous
Thanks for your input!

This token is digitally signed by the service organization behind their 
firewall.  When it is uploaded to the BMC the signature is verified by 
the BMC.  I didn't describe the infrastructure needed for this, but it 
includes the following pieces:
1. The BMC functions described in this design sketch.
2. The service organization creates a key pair for the service access token:
2A. The private key is held by the service organization to digitally 
sign the token.
2B. The public keys gets built into the BMC firmware image to validate 
the token's signature.

The "steps" in the next paragraph of the original design sketch are 
intended to show when the token is signed and validated...
In step 2, the service agent creates the token and uses their privileged 
access (behind their organization's firewall) to the private key to sign 
the token.
In step 3, the BMC admin gets a copy of this signed token and uploads it 
to the BMC.
In step 4, the BMC validates the token's signature.

Note that step 1 describes the BMC optionally generating a "service 
request token" which might be signed by the BMC and validated by the 
service organization (the flow is the opposite direction from the 
"service access token").


> Very much exactly OAUTH2-like: JWT, CWT. In fact... I suggest not
> re-inventing the wheel here.

Thanks for that!  I think that would work.  The service organization 
would build an OAuth2 JSON Web Token (JWT) which is uploaded to the 
BMC.  I will study up and try to redo this design sketch in those terms.


>
> Do you intend to sometimes bind the token to the specific user (service team,
> I think).

Yes, the basic premise is: the token is (a) created by the service agent 
(person) to (b) do something specific on the BMC while using the BMC's 
service account.


>
>      > call.  The admin passes this data to the service agent along with their
>      > request for service.
>
> There are now some IETF protocols (TIGRESS WG) that enable this secure transfer.
>
>      > indicated within the service access token.  Design question: Should the
>      > function be activated when it is uploaded, or via a separate activate
>      > function?
>
> When it is uploaded.
> If you want it to take effect in the future, then the token should have a
> notBefore entry.
>
>      > 5. If the service function is to allow root login to the BMC
>      > command shell, the service user can now login to the BMC, using a
>      > unique password associated with the service access token, and known
>      > only them.
>
> No passwords.
> If you are going to use SSH, then use SSH keys here.

I agree that makes sense for SSH users, but our service organization has 
situations where they are not allowed to take any electronic materials 
into the customer site (and the customer will not carry it either), so 
our service techs sometimes still need an option for password access.  
Perhaps password access should not be the default option.


>
>      > 6. Other popular functions might be to recover the admin
>      > account, disable various security features, or perform a service dump.
>      > Example: Customers regularly call for service because they lost access
>      > to their admin account.  Recovery means, for example: recreate the
>      > admin account or set it to a usable state, and set its password to a
>      > known value, reset its password lockout, etc.
>
> That seems like a chicken and egg situation, but maybe I don't understand it.

You got it, "How can an admin give permission to a service agent to 
recover the admin account of their BMC, if the admin is locked out?" 
-->  One way to accomplish this is to have assert "physical presence" 
(such as invoking function 74 on the operator panel -- which can only be 
done by someone physically present at the system), and when this is done 
the BMC will omit the admin authorization required to upload the service 
token (but perform all other checks).  (Then the system owner has to 
keep authorized service agents away from their systems!)  I do not 
intend to try to standardize this approach.
Is there a better way to solve this problem?


>
>      > 1. Is this design sketch clear?  What improvements are needed?
>
> Relatively.
>
>      > 4. Should the "service access
>      > token" be an X.509 certificate?  Or is that inappropriate?
>
> No.  It's just gonna confuse people.
>
>      > should that be a separate step?  For example, a BMC admin might want
>      > to: (A) upload a token, (B) inspect the token (using the BMC function)
>      > to ensure it looks legitimate and perform the function they agreed to,
>      > and then finally (C) activate the token, for example, to disable secure
>      > boot.
>
> Maybe that's a reasonable work flow.
>
>      > 8. Does it make sense to have a common implementation for the
>      > functions as listed above (like to recover admin account access).
>
> I don't know.
>
>

