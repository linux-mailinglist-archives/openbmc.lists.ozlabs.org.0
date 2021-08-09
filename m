Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 810703E4891
	for <lists+openbmc@lfdr.de>; Mon,  9 Aug 2021 17:19:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gk09z38ctz2yZd
	for <lists+openbmc@lfdr.de>; Tue, 10 Aug 2021 01:19:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TXeZYUB3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TXeZYUB3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gk09X4sZzz2xtp
 for <openbmc@lists.ozlabs.org>; Tue, 10 Aug 2021 01:19:12 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179F4ObQ126526
 for <openbmc@lists.ozlabs.org>; Mon, 9 Aug 2021 11:19:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : subject : to :
 message-id : date : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=oNmoViGHbYAgL+CFFqwpZvsr9lg8cGNRaM61Wccl6bw=;
 b=TXeZYUB3qU5udV0Lc07NSHdI4YYC1382HeOuqIJWNGc1cDX5/rzlmcN1Z/G+dR7q6l9x
 8UmmTH+Mk43I3V/nFbj4y01NGn+DoCXlUacruA5W6+W+nU/7thVJSnqVy0psyqp8FjEP
 Sl2UXBPAFex1z4ZpNeCAFjUIOFsY4GDqcgE84dOulXF40UBq/K1K/lmlbDVpZbl04nfK
 jm9Y3CfoiJy8IAyuUWKBDftyAg3EQG6m4IebUvZyqWDcMKrRaa1Ga8YmSBpG8AlFsONS
 VPZgYVF/0UeYRgaXqD4wdrcrdz447n1GyBsvqr1J2Mh14CRd3AFciCBz4ExeqZypcrsh Dg== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aa7pvkwwf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 09 Aug 2021 11:19:09 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 179FBXHJ024601
 for <openbmc@lists.ozlabs.org>; Mon, 9 Aug 2021 15:19:08 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03wdc.us.ibm.com with ESMTP id 3a9htavams-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 09 Aug 2021 15:19:08 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 179FJ8BB33423740
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 9 Aug 2021 15:19:08 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12EF411263A
 for <openbmc@lists.ozlabs.org>; Mon,  9 Aug 2021 15:02:02 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAFD1112633
 for <openbmc@lists.ozlabs.org>; Mon,  9 Aug 2021 15:02:01 +0000 (GMT)
Received: from demeter.local (unknown [9.65.206.251])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Mon,  9 Aug 2021 15:02:01 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Add SSH session idle timeouts
To: openbmc <openbmc@lists.ozlabs.org>
Message-ID: <a08ced6c-9213-c05d-a5af-105ffa5f3b26@linux.ibm.com>
Date: Mon, 9 Aug 2021 10:02:00 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pZb3g0c6TovhBoVLs4fXBuYWyJR8Zgpa
X-Proofpoint-GUID: pZb3g0c6TovhBoVLs4fXBuYWyJR8Zgpa
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-09_05:2021-08-06,
 2021-08-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108090111
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

OpenBMC community,

This is a proposal to add idle timeouts to SSH command shell sessions 
and host console sessions (ssh port 2200).  BMCWeb has login session 
idle timeouts per Redfish SessionService property SessionTimeout 
(hard-coded at 60 minutes), and I want similar timeouts for SSH sessions.

In this email, I am looking for discussion toward which interfaces 
should have a timeout, and a technical direction how to implement that 
timeout.  Details are below.

Joseph

_______________

Details


Which interfaces are affected?

As far as I know, the BMC currently has session idle timeouts for:
- HTTPS interface to the BMC's Web server - created via port 443
     Redfish SessionService at /redfish/v1/SessionService property 
"SessionTimeout"
- IPMI SOL interface to the BMC's host console - created via IPMI "sol 
activate" command

I want default timeouts for:
- Serial interface to the BMC's console - physical port
- SSH connections to the BMC's command shell - created via ssh port 22
- SSH connections to the BMC's host console - created via ssh port 2200

Help wanted with the following connections (should these have idle 
timeouts?):
- KVM-IP connections - created via REST API invocation
- USB-IP connections - created via REST API invocation
- Virtual Media - created via REST API invocation

I believe the following connections are sessionless or are covered by 
their own protocol:
- Session-less HTTPS invocations.
- Most IPMI commands, which are session-less.
- TFTP connections, which are covered by their own protocol.
- Subscriptions such as SNMP, which do not expire.
- mDNS, which is session-less.
- SLP, which is session-less.

The interfaces above were scraped from the [OpenBMC interface-overview][]
[OpenBMC interface-overview]: 
https://github.com/openbmc/docs/blob/master/architecture/interface-overview.md

Note the Yocto project declined to set a default for SSH session idle 
timeout, and instead intends to document security configuration items 
(including session idle timeouts).  See [Yocto email archive][].
[Yocto email archive]: 
https://lists.yoctoproject.org/g/yocto-security/message/383


Motivation:

I want the BMC to be able to comply with NIST requirements and OWASP 
recommendations:

[NIST SP800-63B][] requires a timeout of 30 minutes for "assurance level 
2" (high confidence that the authentication is still valid), or 15 
minutes for "assurance level 2" (very high confidence). [NIST 
SP800-63B]: https://pages.nist.gov/800-63-3/sp800-63b.html 
<https://pages.nist.gov/800-63-3/sp800-63b.html>
[OWASP session expiration][] suggests idle timeouts of 15-30 minutes. 
[OWASP session expiration]: 
https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html#session-expiration 
<https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html#session-expiration>
The OpenBMC security working group generally agreed to establish these 
timeouts.  See the 2021-08-04 meeting of the OpenBMC Security Working Group.
Minutes: 
https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI


Which layer should implement the timeout?

Idle session timeouts can technically be implemented one one of three 
places:
1. In the communication layer, for example, the SSH client session can 
timeout.
2. In the application.  For example, the Bash shell TMOUT variable.
3. In a layer between the interface and the application.  For example, 
the "screen" application can provide a timeout function.

For example, suppose you want your host console sessions (ssh -p 2200) 
to time out and close the session.  OpenSSH does not offer an session 
idle timeout, and [obmc-console][] does not offer a timeout, so how can 
we provide this function?  One idea is to have the SSH server for port 
2200 connect to an application like "screen", set its TMOUT variable, 
and connect that to the console socket.  Or can we add timeout support 
directly to obmc-console?
[obmc console]: https://github.com/openbmc/obmc-console


TLDR:

This proposal is specifically for "session idle timeouts"; it does not 
include other kinds of timeouts such as timeouts in protocols to 
establish new connections.

NIST SP800-63B has additional guidelines such as periodic 
re-authentication (for example, re-enter password every 12 hours). I am 
not pursuing these at this time.

The Redfish spec has an API to configure Redfish session timeouts, but 
no property to configure other kinds of sessions.  I asked if this can 
be added in the public Redfish forum.
Here: 
https://redfishforum.com/thread/518/api-set-ssh-managerconsole-timeouts

