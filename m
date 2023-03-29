Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08ECB6CF509
	for <lists+openbmc@lfdr.de>; Wed, 29 Mar 2023 23:10:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pmzhl6Jvsz3fCp
	for <lists+openbmc@lfdr.de>; Thu, 30 Mar 2023 08:09:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sKk0Mw+z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sKk0Mw+z;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pmzh83dzCz3cBX
	for <openbmc@lists.ozlabs.org>; Thu, 30 Mar 2023 08:09:27 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32TIRvvx001633
	for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2023 21:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date : to :
 from : subject : content-type : content-transfer-encoding : mime-version;
 s=pp1; bh=PQa5St8wr6JyIQCia0uNZLd+kQLPMd6S4mBdjUIR/eg=;
 b=sKk0Mw+z+7bbA0aKeY01hPFinpSrYu6NvS+kJT7zqh/YQX63F1Rzc6cZrS7+abc9uJdx
 49/GWCd6c05i1uERxAbKalLDlNhic/C7ZTutoO0D4ZA2ZUDgKJ+virdReZX8dHEOQNgm
 3Co8Z9uX6jAD3L0ThVHiHurnb+dBT6TFsjUlzC/ifMVIB0rJ/NZ0jetKPht838kCRdel
 DyARhjUS7Kvgh68Kc4BX0vwnI3eyuCzm0mBMLqhoQhuRypzhRBjQ5+fXjDgSXgG5X6Mj
 tnrLmfvTiioUUIinQ3+BPIXZx5Ux9y9uwDX94w0f9SI7cK7nWA3ZysXSgZWEE8csAG5F mA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pmpr3b7fp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2023 21:09:24 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32TJ33qP029362
	for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2023 21:09:23 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3phrk7xge5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2023 21:09:23 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32TL9MR310879602
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2023 21:09:22 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A6EB58059
	for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2023 21:09:22 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C42955805F
	for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2023 21:09:21 +0000 (GMT)
Received: from [9.160.174.160] (unknown [9.160.174.160])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTPS
	for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2023 21:09:21 +0000 (GMT)
Message-ID: <d317e01c-fd41-e7aa-2a79-89166300001f@linux.ibm.com>
Date: Wed, 29 Mar 2023 16:09:20 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Content-Language: en-US
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Security Working Group meeting - Wednesday March 29 - results
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rS8BGTD4s1M88Q6tQWOeso2DaYJyjYYr
X-Proofpoint-ORIG-GUID: rS8BGTD4s1M88Q6tQWOeso2DaYJyjYYr
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_14,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 phishscore=0 adultscore=0 mlxlogscore=808 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303290160
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

An OpenBMC Security Working Group meeting was held on Wednesday March 29 
at 10:00am PDT.

MEETING ACCESS ON DISCORD VOICE
First, join Discord via https://discord.gg/69Km47zH98 
<https://discord.gg/69Km47zH98> and confirm via email.
Then, to join: navigate Discord > OpenBMC > Voice channels >  Security ~ 
https://discord.com/channels/775381525260664832/1002376534377635860 
<https://discord.com/channels/775381525260664832/1002376534377635860>

Access and notes about the Security Working Group are in the OpenBMC 
Security wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group 
<https://github.com/openbmc/openbmc/wiki/Security-working-group>

The meeting agenda and minutes are in 
<https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
items proposed on the Discord OpenBMC #security channel, and anything 
else that comes up:

Attended: Joseph Reynolds, dsp (Dhananjay), Daniil Engeranov, jejb, cacih

TOPICS:

1 Joseph: Is there a common use case to get “service” access to the 
BMC?  A “service user” means a person authorized by the system 
manufacturer or OEM who is trusted to access BMC internals as needed to 
diagnose or fix problems on the BMC; they are allowed to use interfaces 
which are not accessible to BMC admin user, for example REST APIs only 
allowed to “service” users, or to get root user access to the BMC 
command shell.


For context, assume the BMC admin user does not have access to the BMC 
command shell and can only access the BMC’s REST APIs and similar 
external interfaces; that is, the BMC admin has no access to BMC 
internals.  Also, assume the BMC admin has access to the BMC’s 
management network, and can share that access with a service user.


DISCUSSION (joseph and dsp):

Joseph discussed IBM’s custom Access Control File (ACF) solution, and 
Dhananjay discussed Microsoft's Secure Unlock.


IBM ACF: Joseph reviewed the steps for an IBM service agent to get 
service access to a customer BMC.  The steps are:

 1.

    The customer calls for service and gives the system serial number to
    the service rep.

 2.

    The service rep uses their access (access to the private key, which
    is stored behind their organization’s firewall) to create a token
    (an ACF file).  This ACF file contains a request to access to BMC,
    identifies a date range, and identifies the system serial number. 
    It is digitally signed by a private key held by the service
    organization, and the BMC can validate the signature via a public
    key which is built into the BMC firmware.

 3.

    The service rep gives the ACF file to the customer/admin.  (The ACF
    file has no secrets other than the secure hash of the service
    account’s password.)

 4.

    The BMC admin uploads the ACF to the BMC.  Doing so enables the
    service user password access.

 5.

    The service user can now login to the BMC, using the password stored
    in the ACF.

 6.

    If desired, the admin or service agent can delete the ACF, or allow
    it to expire.

WIP Design: https://gerrit.openbmc.org/c/openbmc/docs/+/45201 
<https://gerrit.openbmc.org/c/openbmc/docs/+/45201>  .  The 
implementation is in IBM’s public downstream (github.com/ibm-openbmc) 
version of bmcweb and phosphor-certificate-manager.

Note: the ACF is ASN.1-encoded (binary file) but is not an x.509 
certificate.


Microsoft Secure Unlock: Dhananjay reviewed Secure Unlock.  The 
approximate steps are:

 1.

    Retrieve info from BMC’s RoT.

 2.

    This info goes to the service organization (behind the firewall),
    which uses it to create a token needed to access the BMC.

 3.

    This access token is uploaded to BMC.

Touchpoint: a use case for this token is to disable secure boot


The common use case?

There is a common use case for REST APIs to:

  *

    Initiate a request for service access to the BMC.

  *

    Upload a service access token to the BMC.

With additional APIs desired for inspecting and deleting the access token.

[Although not discussed, I presume at most 1 access token at a time is 
allowed.]


A common use case:

In addition to the use case to get BMC root access…

Recover admin account access.  Customers regularly call for service 
because they lost access to their admin account.  Recovery means, for 
example: recreate the admin account or set it to a usable state, and set 
its password to a known value, reset its password lockout, etc.

It is desired to be able to create an access token which performs only 
this admin account recovery, and does not grant general access to BMC 
internals.


There are at least 2 shared use cases for the access token.  That is, 
the access token can be create for one of these purposes:

 1.

    Enable service user login.

 2.

    Recover access to the BMC’s admin account.

There are multiple other purposes; one mentioned is to disable secure boot.

In other words, the token encodes a specific action, such as listed above.

Each manufacturer would have a different set of purposes for the tokens, 
and we do not image these would be shared.


Anti-replay protection for these access tokens is assumed.  For example, 
an access token used to get access to a BMC command shell could not be 
used twice: the second attempt to upload it should result in permission 
denied with reason: anti-replay protection.  (In this example, login 
access is allowed multiple times until the ACF expires or is deleted.)


TODO for Joseph: We decided to start a design for this. Daniil asked: 
Create a new bitbake image feature to optionally build in the “service 
access” APIs.  When present a system integrator would have to hook up an 
appropriate implementation ~ 
https://github.com/openbmc/openbmc/wiki/Configuration-guide 
<https://github.com/openbmc/openbmc/wiki/Configuration-guide>.

When the service access APIs are built into the image, should there be 
an API to disable it?




- Joseph
