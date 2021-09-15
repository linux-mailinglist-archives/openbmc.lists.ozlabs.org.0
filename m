Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B951240CCFD
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 21:02:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8qNc4rb0z2yPw
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 05:02:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dAvmKOtn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dAvmKOtn; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8qN642Ncz2yHP
 for <openbmc@lists.ozlabs.org>; Thu, 16 Sep 2021 05:02:29 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18FIgMIu003306
 for <openbmc@lists.ozlabs.org>; Wed, 15 Sep 2021 15:02:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=A0xaC+hAVulnXGduS3nMXCTRfXHG9ek8FRsJhnfwdXA=;
 b=dAvmKOtnFNr5s1WgSnzGZRrHUcmFssvLUOUSiwKXTslLlLJXCQPwen986KPLH8xQqoU+
 JIM8LnIJG3B47aicOJhoEGN3Wmqz2b/LpmQ+VrnixPUy6U984s+S5Tb2+ePuF3nzlqns
 Zgt7+oXISI/2fElA1OP9GCRhnrfmU3lfQOUIY3eGju9fwwRd96PP/cVNTEd0ORZVl1nv
 ZNjtmMBqi0YlpwT4dNNIb05rnpRnX3Bu9nMKjSXajU/cUHgMNRReXrTXKQUR470chaxt
 zkNGin+/riQAhQ6xKRyXNH6iFXnCsVH383iod/zHJNhXKYbGJC1W5oeH9Hn7hG2aaLUB /g== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3b3p7ngffk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 15 Sep 2021 15:02:26 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18FIqTnu010949
 for <openbmc@lists.ozlabs.org>; Wed, 15 Sep 2021 19:02:25 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 3b0m3c6wc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 15 Sep 2021 19:02:25 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18FJ2Ohh53805452
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 15 Sep 2021 19:02:24 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ADAB6B2064
 for <openbmc@lists.ozlabs.org>; Wed, 15 Sep 2021 19:02:24 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8979AB2073
 for <openbmc@lists.ozlabs.org>; Wed, 15 Sep 2021 19:02:24 +0000 (GMT)
Received: from demeter.local (unknown [9.160.14.159])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 15 Sep 2021 19:02:24 +0000 (GMT)
Subject: Re: Security Working Group meeting - Wednesday September 15 - results
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <6bf4d910-f484-f5c9-6c3a-679d7c78ce1b@linux.ibm.com>
Message-ID: <af37831e-7056-a856-7b71-e187a11ab320@linux.ibm.com>
Date: Wed, 15 Sep 2021 14:02:23 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
In-Reply-To: <6bf4d910-f484-f5c9-6c3a-679d7c78ce1b@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: O53vCv_iM4_IvA3RvU6YdgGkVvn5dnqH
X-Proofpoint-ORIG-GUID: O53vCv_iM4_IvA3RvU6YdgGkVvn5dnqH
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 mlxscore=0 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109150107
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

On 9/14/21 1:48 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday September 15 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
> and anything else that comes up:

Meeting held 2021-09-15

Attended: Joseph Reynolds, Milton Miller (attended second: IPMI over 
DTLS topic), James Mihm, Vernon Mauery, Daniil Engranov, Dhananjay MSFT, 
Dick [Phoenix], John Wedig, John Broadbent, Nancy Yuen


1 (gerrit review) Encrypted eMMC design - 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/46573 
<https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/46573>

DISCUSSION:

John reviewed the design: eMMC exposed as Dbus object.

We briefly discussed the need for a device-provided cryptographically 
secure erase function, because the block-by-block algorithms don’t work 
in the presence of wear leveling.

How to provide encryption key/password.  Use cases and risk models:

  *

    Key is stored off of the BMC (by client, on eeprom, by host).

  *

    Intent of encryption is to protect against someone physically
    removing the emmc.

  *

    This design does not does not protect against an attacker who has
    BMC root access.


2 (email) Reminder that configuration matters. 
https://lore.kernel.org/openbmc/6593206c0bc90186f255c6ea86339576576f70dc.camel@codeconstruct.com.au/ 
<https://lore.kernel.org/openbmc/6593206c0bc90186f255c6ea86339576576f70dc.camel@codeconstruct.com.au/>Discusses 
AST2500 default register configuration (ESPICTRL[9] = 0) which allows 
the host to have full control over the GPIOs.

NO DISCUSSION.


3 (meeting process) Discuss the use of this document 
(https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI) 
as a record, and not intended as a living conversation.  Idea: Add a 
note to the top of this document to that effect.

DISCUSSION:

Agreement: This doc is only for minutes only, please move discussions 
elsewhere.  Add note.  DONE.


4 (gerrit review) 
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/46811 
<https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/46811>Change the 
dropbear SSH server “scp” protocol to use “sftp” internally (while still 
supporting scp connections).

DISCUSSION:

We discussed:

  *

    Why do we need sftp?

  *

    Sftp has a better user experience than scp.  The client has better
    controls.

  *

    We should explain how specific platforms or downstream
    configurations can disable sftp?  Should it be disabled by default? 
    Reference:
    https://github.com/openbmc/openbmc/wiki/Configuration-guide
    <https://github.com/openbmc/openbmc/wiki/Configuration-guide>

Agreed: Eventually disable scp by default?  Yes.

There was a general agreement with this proposal: Enable sftp now, have 
both scp and sftp enabled for one release (about a year), then disable 
scp by default.  (The overlap is intended to give time for testers and 
operational procedures to convert to sftp or reconfigure.)

Discussion will continue in the gerrit review.


BONUS TOPIC:

Added after the meeting started, and went about 8 minutes over time.


5 IPMI over DTLS (gerrit review) - 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/31548 
<https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/31548>

DISCUSSION:

This is a continuation from last time.

A new question is: Should password authentication be supported?

  *

    Use case: Large scale datacenters will use cert auth, but cert or
    2FA requires infrastructure which small scale users may not have.

  *

    Both cert-based 2FA auth require a synchronized clock:

  *

    The BMC TOD clock may reset to beginning of epoch 1970

  *

    2FA and cert solution needs steady clock: battery backup or NTP


Is it okay to use the same cert for both host and for IPMI?  If one 
service allows the private key to be disclosed or learned, that 
jeopardizes the other services which use that same key.

Disambiguation: User CA cert, host cert.

If we look ahead to process isolation (where each service has its own 
user), what solution will work?

Can we use trusted execution environments: (Op-tee, TPM, kernel support, 
ARM TrustZone), so we don’t expose the key (as much) when establishing a 
session?

We also discussed if IPMI has a service identifier vs a system 
identifier.  IPMI can get the server’s GUID, same as from Redfish.

Discussion will continue in the gerrit review.


> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

