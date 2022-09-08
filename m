Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD4A5B2659
	for <lists+openbmc@lfdr.de>; Thu,  8 Sep 2022 20:58:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNpL05RG0z309Y
	for <lists+openbmc@lfdr.de>; Fri,  9 Sep 2022 04:58:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T+iN4A2y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=gheorghe@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T+iN4A2y;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNpKc0KJsz2yxF
	for <openbmc@lists.ozlabs.org>; Fri,  9 Sep 2022 04:57:55 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 288IKZHA023005
	for <openbmc@lists.ozlabs.org>; Thu, 8 Sep 2022 18:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : reply-to : to : from : subject : content-type :
 content-transfer-encoding; s=pp1;
 bh=SuyNPr2R0kB5WjSKK+/HHd6XrNJaEecLWPUXmMjJWtQ=;
 b=T+iN4A2yWouxAbmwcQQxBVNedtroK2bmLtiVSsImW1720APpzzoyGVZJSmRLn7O/Jxff
 QJNJWymBWBqpbKwTDcYuURFbBGpE/CfX8gyYPO+8jJddjbTZwbBLXm7UcZGlDRnOA06K
 bpYaEx+Pm8R7Gy07GKFyfWbmwe7ojDfEAIUebIeKnAIZv4A3b05uZ3souyHTDBTBNIxJ
 YLn3X5i2iAt6wWUwNErNSpil1BiL+QMjIRgZy5WsAgVSlACD48imvRSuG17Dk9yLrDHg
 8jf/QF+aqo68+IcQ/XmMnnXRRGg3uZEReZiB3KgB/5TfpZdxmf69rrsP8MZrjjHRTdgB sA== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jfnkc0wq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Thu, 08 Sep 2022 18:57:52 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 288IvbiY012055
	for <openbmc@lists.ozlabs.org>; Thu, 8 Sep 2022 18:57:52 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma04dal.us.ibm.com with ESMTP id 3jbxjaajum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Thu, 08 Sep 2022 18:57:52 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 288IvpT710683026
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openbmc@lists.ozlabs.org>; Thu, 8 Sep 2022 18:57:51 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3DEFC124055
	for <openbmc@lists.ozlabs.org>; Thu,  8 Sep 2022 18:57:51 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2ACE5124052
	for <openbmc@lists.ozlabs.org>; Thu,  8 Sep 2022 18:57:51 +0000 (GMT)
Received: from [9.31.99.5] (unknown [9.31.99.5])
	by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP
	for <openbmc@lists.ozlabs.org>; Thu,  8 Sep 2022 18:57:51 +0000 (GMT)
Message-ID: <b9bda737-8e4f-62d3-1000-c42b3326239e@linux.vnet.ibm.com>
Date: Thu, 8 Sep 2022 14:57:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Content-Language: en-US
To: openbmc@lists.ozlabs.org
From: George Almasi <gheorghe@linux.vnet.ibm.com>
Subject: Security Working Group meeting - Wednesday August 31 - results
Organization: IBM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IiNAoYVL67G0Yhcz8IFMZWeBQh_2BaiU
X-Proofpoint-ORIG-GUID: IiNAoYVL67G0Yhcz8IFMZWeBQh_2BaiU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-08_10,2022-09-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 clxscore=1011 malwarescore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209080065
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
Reply-To: gheorghe@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

First off, apologies if I am messing up the mailing list threading. I'm 
going to attempt to address
questions raised by Patrick about keylime and openbmc in the last few days.

> Is the suggestion that they rewrite it in C++ and contribute that?  If 
> it is, why would they invest in building a project and community from 
> scratch as opposed to using an existing one just because all the other 
> in-tree servers are hyper-cost optimized?

No. To repeat what Thore Somers mentioned: the Red Hat team has done
a good job of porting the keylime *agent* to Rust.

We will never attempt to cram Python into OpenBMC :)

The rust agent compiles and runs on the generic ARM version of OpenBMC;
we have tested this, and Angelo Ruocco is working on a recipe. We are
having difficulties with the AST2600 in particular, but that seems to
be more of a Rust/ARM compilation issue than anything else. We are having
zero troubles on a generic armv7 qemu emulator.

In reply to Michael Richardson -- the _entire_ keylime project is not being
rewritten in rust; only the agent is. The verifiers and registrars and whatnot
have no reason to exist on embedded systems, and there is no reason to make
small footprint versions of them.


> This is very concerning to me.  There is no authentication?

> Blindly advertising to the world which versions of firmware you are
> running so an attacker knows exactly which vulnerabilities you are
> likely to have doesn't sound appealing.


Valid concern. Agreed on not advertising firmware (or kernel) (or anything)
versions to anyone who has no business knowing these things. Fortunately
the keylime developers have considered these issues and over time have
come up with a fairly safe architecture for establishing mutual trust between
agents and other keylime components (like registrars and verifiers). The
security architecture _has_ been peer reviewed and tweaked.

I am not going to attempt to reproduce the entire process here,
but I'll mention salient points of it. First off, the keylime agent will
not blindly talk to just anyone. The agent has to be configured a-priori
with the IP address of a registrar, and it will not attempt to establish
communication with any other entity.

Of course IP addresses can be spoofed, so the keylime agent possesses a certificate
that will authenticate the registrar. The current implementation is an mTLS cert, but a server
side certificate would suffice for this, as the entity being authenticated is the registrar,
not the OpenBMC agent.

Next, of course, the agent has to authenticate itself to the registrar. The TPM device is a crypto engine
with a key pair built into it for the express purpose of identifying itself (the Endorsement Key).
The process of authenticating a TPM device to the registrar is fairly complex and involves a a roundtrip.
In this process other (secondary) keys are created that are henceforth used for regular communication.

I'm going to stop here before this becomes a lecture. From a practical standpoint, getting the keylime
agent into OpenBMC involves getting the agent built in the ecosystem, and inventing a way to
configure the system. Since attestation with keylime can be done at _any point_ in the lifecycle
of an OpenBMC deployment, it is sufficient for us to configure the keylime agent with redfish; and that is
our plan. Details to follow.

