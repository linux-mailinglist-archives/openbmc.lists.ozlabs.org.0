Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7A66318B4
	for <lists+openbmc@lfdr.de>; Mon, 21 Nov 2022 03:47:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NFsHJ4Z97z3cKv
	for <lists+openbmc@lfdr.de>; Mon, 21 Nov 2022 13:47:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N5YiIeLA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=jejb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N5YiIeLA;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDH2T53l7z3cH6
	for <openbmc@lists.ozlabs.org>; Sat, 19 Nov 2022 00:00:33 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AICegI2015784
	for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2022 13:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=s73CZ8UoG3h8l9aRCf6Zb8BJ8Wul3mpHBgFYT+BMbBo=;
 b=N5YiIeLAGCCkaQ5ESqUbvJvZREk/qLJN25eUqnsU9MiLic9GvHFvaT+PYqYXJQ+uE3Ew
 y3/hdCB7Zw6VO2f3qg2sAXTVKZuPjwwAam2P2EfAn4kp84WUG+5w2rKaT6XtiPngRIyJ
 c6ECKBMOxqxOZ+kJOfbU1TbtX1GEh+80KouQ53NN8Eeq7bwvw76VBywZBxn8/eCalBrG
 ddEbB+ji53oQmtfMaTDqQWXoMfyjzoL8MxTypGM0Kgf5xntIcTM8FLHmYmA+s/gctc6s
 F26ryoAZ+QxuLIy8PkreaNSntnQEbDLFX01z+RFlwrk0mS49DwI3ewodriz8gZN/FVdO 9A== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kx9jjsm8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2022 13:00:30 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AICooFM003592
	for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2022 13:00:29 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
	by ppma04wdc.us.ibm.com with ESMTP id 3kt34a7m0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2022 13:00:28 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AID0PDP49807634
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Nov 2022 13:00:25 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 338267805E;
	Fri, 18 Nov 2022 14:00:35 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F9F97805C;
	Fri, 18 Nov 2022 14:00:34 +0000 (GMT)
Received: from [IPv6:2601:5c4:4302:c21::a774] (unknown [9.211.83.197])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
	Fri, 18 Nov 2022 14:00:34 +0000 (GMT)
Message-ID: <ed082ceea79c3b3ce2d814195f1c90a79ae166b3.camel@linux.ibm.com>
Subject: Re: Security Working Group meeting - Wednesday October 12
From: James Bottomley <jejb@linux.ibm.com>
To: jrey@linux.ibm.com
Date: Fri, 18 Nov 2022 08:00:25 -0500
In-Reply-To: <74f2b64b-9f53-d5a4-b616-510bd75664d5@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: A29J7sSM7uusVqbExgYmEkOgabrbb2-V
X-Proofpoint-GUID: A29J7sSM7uusVqbExgYmEkOgabrbb2-V
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_02,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 clxscore=1011 mlxlogscore=714 bulkscore=0
 suspectscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211180075
X-Mailman-Approved-At: Mon, 21 Nov 2022 13:46:40 +1100
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
Reply-To: jejb@linux.ibm.com
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> === MEETING ACCESS ON DISCORD VOICE  ===
> First, join Discord via https://discord.gg/69Km47zH98 
> <https://discord.gg/69Km47zH98> and confirm via email.
> Then, to join: navigate Discord > OpenBMC > Voice channels > 
> Security ~ 
> https://discord.com/channels/775381525260664832/1002376534377635860 
> <https://discord.com/channels/775381525260664832/1002376534377635860>

I thought I should note here that I can't join this meeting because I
can't get a discord account.  I'm not sure it's a huge loss because I'm
only advising on the TPM pieces of the current IBM Research OpenBMC
effort, but I mention it just in case this problem is excluding anyone
else from the meetings and because it is a discriminatory decision of a
proprietary platform which is impeding collaboration.

When I try to sign up for a discord account it insists on a phone
number verification (OK, annoying, but lots of other proprietary silos
do this as well, so not unusual).  My problem is it won't accept any of
the phone numbers I possess because they're all VOIP ones (I switched
to using VOIP for my phones [both mobile and land line] decades ago
because I've got family in several countries around the world and have
moved around as well so keeping all my numbers and in-country local
ones for family was a trick only VOIP could do in the early days). 
There appears to be no basis for discord's discrimination against VOIP
other than the company running the silo also provides VOIP services and
presumably doesn't like the competition.  Now I could go out and buy a
non-VOIP SIM chip for my mobile just for this, but these are hoops I
shouldn't have to be forced to jump through to participate in an open
source project.

Regards,

James Bottomley

