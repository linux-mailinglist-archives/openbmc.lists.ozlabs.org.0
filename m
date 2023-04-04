Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8840C6D7011
	for <lists+openbmc@lfdr.de>; Wed,  5 Apr 2023 00:23:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Prj2X2Zysz3chx
	for <lists+openbmc@lfdr.de>; Wed,  5 Apr 2023 08:23:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UzyHQoxW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UzyHQoxW;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Prj1w6H0mz3chj
	for <openbmc@lists.ozlabs.org>; Wed,  5 Apr 2023 08:22:44 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 334M2NDs010498
	for <openbmc@lists.ozlabs.org>; Tue, 4 Apr 2023 22:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date : from
 : subject : to : content-type : content-transfer-encoding : mime-version;
 s=pp1; bh=Dkky4XKv5IgZFId2aBB04DkQTAjTYdPxFGoGwG+4tgY=;
 b=UzyHQoxWMxd0WjCw2JYr+VPSfNfQTc1b/5GhxiCDAi8plTejy8IzZbUeris74Q7S0GZ+
 pW43wGz1b07DMdTVA1Ed89JeETe+052FV2i3KnZDMFMCPpCLw96moObAzwnlfR4Z8Lna
 OB0ydvjjrbsBbmlyuuJgO0y9FCbJjLnsXOVYEvCEmYYmEWbC5gIOv7XToTwL1RiyfJsC
 j3E0wUjB2VUb1bhGHijjIqaBxFpiNcg1DTcvSkDRZAnZkUt3fsLUZpMZxwVFdBokanBN
 gzaCf74nPFzvVf9NXl4aJKwnz6iIFxliHIT5Src+kZe5lMbG8DyK7r9QtQ49MPM35lk/ oA== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3prvbb8hm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Tue, 04 Apr 2023 22:22:41 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 334L0bo6028919
	for <openbmc@lists.ozlabs.org>; Tue, 4 Apr 2023 22:22:40 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
	by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3ppc8885ea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Tue, 04 Apr 2023 22:22:40 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 334MMcOL30147272
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openbmc@lists.ozlabs.org>; Tue, 4 Apr 2023 22:22:39 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF75958060
	for <openbmc@lists.ozlabs.org>; Tue,  4 Apr 2023 22:22:38 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7BACF58056
	for <openbmc@lists.ozlabs.org>; Tue,  4 Apr 2023 22:22:38 +0000 (GMT)
Received: from [9.160.174.160] (unknown [9.160.174.160])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTPS
	for <openbmc@lists.ozlabs.org>; Tue,  4 Apr 2023 22:22:38 +0000 (GMT)
Message-ID: <552186c1-50c4-198c-57bb-98ab3ac29d58@linux.ibm.com>
Date: Tue, 4 Apr 2023 17:22:37 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Design to isolate BMC service access
To: openbmc <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -XIPCdEszRQwu6z-qwN5z_ZF6PeEVR85
X-Proofpoint-GUID: -XIPCdEszRQwu6z-qwN5z_ZF6PeEVR85
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_12,2023-04-04_05,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=934 impostorscore=0 clxscore=1015 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304040201
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

This is to gather information needed to write a design(1) for a BMC 
function to upload a "service access token" which gives access to BMC 
internals to a service agent.

BMCWeb uses the DMTF Redfish standard(2)(3), and I will pursue a Redfish 
spec change for this (or a reading that we should create a custom OEM 
solution which I would pursue at the OpenBMC community level).  I 
believe we can and should (at least partially) standardize some REST 
APIs in this area.

This topic was introduced and briefly discussed in the OpenBMC Security 
Working Group meeting(4) on 2023-03-29 where I agreed to write a design 
for this.  I intend to move forward with this email and a proper design.

If this interests you, please read and reply with changes needed to fit 
your scheme.  Study questions are at the bottom of the design sketch.

- Joseph

References:

 1. https://github.com/openbmc/docs/blob/master/designs/design-template.md
 2. https://redfish.dmtf.org/
 3. https://github.com/openbmc/bmcweb/blob/master/Redfish.md
 4. https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI


------------------------------------------------------------------------

*Problem description*

The BMC has:

 1. External interfaces such as REST APIs.  These provide full
    operational control over the BMC.
 2. Internal interfaces within the BMC such as D-Bus, Systemd, and the
    sysfs file system.  These provide full access to the BMC's raw
    capabilities, are needed to provide the BMC's external function, and
    are needed to diagnose and fix problems.  Direct access to these
    internal interfaces is typically via SSH to the BMC's command shell.
 3. A default root user who has full administrator access to the BMC's
    external interfaces and access to the BMC's internal interfaces.


In some use cases, it is desirable to isolate the internal interfaces 
away from administrator users.  For example, when the BMC part of a 
system which has sensitive data, you want to isolate the BMC user from 
what little access the BMC has to that data.  When this use case is 
desired, a typical deployment involves three organizations:

 1. Development.  The development team creates the BMC's firmware, is
    responsible for the function of all internal and external
    interfaces, and may be needed to debug complex problems on
    operational systems.
 2. Operations.  The operations team installs the BMC, and the BMC
    administrator operates the BMC *only* via its intended external
    interface, and does not allow access to BMC internals.
 3. Service.  The service team diagnoses and debugs problems on
    operational BMCs, and sometimes needs to use the BMC's internal
    interfaces.


The trust relationships from an operational point of view:

 1. BMC administrators are trained only to operate the BMC's external
    interfaces.  When they find a problem, they call for authorized
    service agents.  To be extra careful, they may remove any sensitive
    workloads from the system before allowing service technicians to
    access the BMC.
 2. BMC service technicians are trained to use the BMC's internal
    interfaces.  They may not be fully trusted by the operations team
    who may carefully watch them or may operate the BMC's internal
    controls for them.
 3. BMC developers may be called to diagnose problems, and sometimes
    need access to the failing BMC's internal interfaces.


In addition, the development team may not trust the operations team to 
have access to BMC internals.  For example, operations' access to BMC 
internals can cause problems for which development may be blamed.  
Developers want to lock out everyone except (trained and trusted) 
authorized service agents from the BMC's internal interfaces.

To be clear, the problem is:

 1. The administrator users have access to the BMC's internal interfaces
    which they do not need, and that access can be used to harm the
    system.  Also developers may want to lock out access to the BMC's
    internal interfaces.
 2. If this access it taken away then this limits the capability to
    service the BMC.  We must retain the ability to access the BMC's
    internal interfaces so we can debug the BMC.
 3. Both the BMC administrator and service must agree before access to
    BMC internals is granted.



*The solution*

A way to solve this access problem has three pieces (all needed for a 
complete solution):

 1. Make BMC firmware so administrators are only allowed to access to
    the BMC's intended operational interfaces (and are not allowed to
    access BMC internal interfaces).  For example, move away from root
    account logins, and create a new "admin" account which can access
    only the BMC's external interfaces.
 2. Add function to the BMC so it can be accessed by a service user,
    where access is disabled by default, and where access can be to
    varying levels of BMC internal functions (for example, using
    "service" APIs to perform common functions, or root access to the
    BMC command shell for the deepest or most permissive level of access).
 3. Provide a way for a BMC admin user to request service access to
    their BMC, with 2 requirements:
     1. Only the BMC admin should be allowed to enable this access,
        meaning a service user should not be allowed to self-enable
        their own access (presuming they don't also have admin access).
     2. When service access is enabled, the admin user should not have
        service access.  For example, the service user should have to
        authenticate to the BMC using credentials not known to the admin.


Note: This design does not give the solution to create an "admin" 
account as in solution point 1 above.  That part of the solution is 
necessary, but it can be provided elsewhere.  This design addresses 
points 2 and 3.

A "service access token" is proposed.  Details are below but for now, a 
service access token:

  * Is a small file (kilobytes), a digitally-signed request to access a
    specific BMC function on a specific BMC for a limited time window. 
    This token may have additional information about its origin, etc.
  * Is created by an authorized service agent.  Only service agents can
    digitally sign the tokens so they can be verified by the BMC.
  * Is uploaded to the BMC by an admin user to perform a specific
    service function.
  * Has nothing that is secret to the BMC admin user.  If the token
    encodes a password, it is stored in the form of a secure hash.


Here is a sketch of the steps a BMC admin and their service agent would 
use to make a service call to gain access to BMC internals:

 1. The administrator gathers information about their BMC.  They may get
    the system model and serial number, or use the system to generate a
    token (via the system's root of trust) needed to make the service
    call.  The admin passes this data to the service agent along with
    their request for service.
 2. The service agent receives the data and (using their privileged
    position behind their organization’s firewall) creates a "service
    access token" needed to gain service access to the BMC.
 3. The service rep gives (via shared storage, or email, etc) the
    service access token to the BMC admin.
 4. The BMC admin uploads the service access token to the BMC. Doing so
    enables the service function indicated within the service access
    token.  Design question: Should the function be activated when it is
    uploaded, or via a separate activate function?
 5. If the service function is to allow root login to the BMC command
    shell, the service user can now login to the BMC, using a unique
    password associated with the service access token, and known only them.
 6. Other popular functions might be to recover the admin account,
    disable various security features, or perform a service dump.
    Example: Customers regularly call for service because they lost
    access to their admin account.  Recovery means, for example:
    recreate the admin account or set it to a usable state, and set its
    password to a known value, reset its password lockout, etc.
 7. The service agent then deletes or deactivates the service access
    token or allows it to expire.


To simplify the design and implementation, at most one service access 
token is allowed on the BMC at any given time.  Design question: Is this 
okay with the service planner?

Anti-replay protection for these access tokens is assumed.  For example, 
an access token used to get access to a BMC command shell could not be 
used twice: the second attempt to upload it should result in permission 
denied with reason: anti-replay protection. (In this example, login 
access is allowed multiple times until the ACF expires or is deleted.)


New BMC functions

This new "service access" function is optionally built into the firmware 
image, controlled by an image feature, and defaults to disabled (which 
means the REST APIs and underlying function is not present).  Enabling 
this feature includes the new REST APIs and its implementation on the BMC.

The new BMC REST API functions (used by an admin user) for this are:

 1. Generate request for service.  The BMC returns a small file to the
    admin (which contains the BMC model and serial number, or a signed
    request, etc).
 2. Upload (POST) the service access token.  The BMC admin uses this
    upload the service access token to the BMC.
 3. Inspect (GET) information about the service access token.
 4. Activate the service access token.  This causes the service access
    token to do its thing (take a service dump, activate  the "service"
    account login, etc.)
 5. Delete the service access token.


The backend function which runs on the BMC would be a new D-Bus service 
to handle the "service access token", possibly with 2 popular functions: 
(1) enable service account access to the BMC command shell, and (2) 
recover admin account access.  The implementor would have freedom to 
customize these functions and to provide their own custom functions.  
Each manufacturer would have a different set of purposes for the access 
tokens, and the use cases would not be shared.

This function could be used to begin to standardize various existing 
custom schemes such as IBM's Access Control File (ACF), Microsoft's 
Secure Unlock, and others.


*Questions*

 1. Is this design sketch clear?  What improvements are needed?
 2. Who in the OpenBMC community can use this?  IBM and Microsoft have
    discussed this.
 3. Is this the right set of BMC functions to support all the use
    cases?  What else is needed?
 4. Should the "service access token" be an X.509 certificate?  Or is
    that inappropriate?
 5. Is Redfish interested in putting this into the spec (or is this
    already spec'd)?  Versus OpenBMC OEM solution.
 6. Does threading this through BMCWeb, D-Bus, and a new Systemd D-Bus
    service seem right?
 7. Should uploading the service access token also activate it
    immediately, or should that be a separate step?  For example, a BMC
    admin might want to: (A) upload a token, (B) inspect the token
    (using the BMC function) to ensure it looks legitimate and perform
    the function they agreed to, and then finally (C) activate the
    token, for example, to disable secure boot.
 8. Does it make sense to have a common implementation for the functions
    as listed above (like to recover admin account access).


