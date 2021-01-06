Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D79E12EC305
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 19:13:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9yD13z7qzDqh2
	for <lists+openbmc@lfdr.de>; Thu,  7 Jan 2021 05:13:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZiGJ/t1L; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9yC84xPmzDqbx
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jan 2021 05:12:51 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 106I5kMH109928
 for <openbmc@lists.ozlabs.org>; Wed, 6 Jan 2021 13:12:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : references : content-type : message-id :
 content-transfer-encoding : mime-version : subject; s=pp1;
 bh=7ZGPOevcsjR3AE7JETHCa8dDlfD7mn4th5jEuwLkypk=;
 b=ZiGJ/t1LDxcOUKJsS9ihLTpAkw0D9gvsb0mk+1AFu1vtwWilTZSAoE1wxuIj3t6LsrAe
 Oq2oIxirof45xtKbm4YQErUK95T6h8rwtxGdQU5uZygZ+zcQzA+vMnbs/YFbfIpu+gxK
 XMWn+seE5R9iXGTZW4WONJuipXRNNTR4sXvgV2QBbCxtkTzE5fph69+oqeyVrYbAxpe9
 8NNpa28ID42ov9R0e5IqEC3yfR5kh0f5K1nP6BA3ANoVHLsiqVHKy6hwpXT5yI80N8AP
 Z1nJZWBmbJ21GgcUZqnPFsyToVG4DDizPLEg/VaN+iAc/6hsEe8bwH7v4bz9z2yg0RPH Iw== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.75])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35wj2g8ay7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 06 Jan 2021 13:12:48 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 6 Jan 2021 18:12:45 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.123) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 6 Jan 2021 18:12:43 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2021010618124235-523752 ;
 Wed, 6 Jan 2021 18:12:42 +0000 
In-Reply-To: <5181a536-a026-2f91-7335-f6a75b4694ab@gmail.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Sunitha Harish <sunithaharish04@gmail.com>
Date: Wed, 6 Jan 2021 18:12:42 +0000
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <5181a536-a026-2f91-7335-f6a75b4694ab@gmail.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 11319
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=UTF-8
x-cbid: 21010618-6875-0000-0000-000004385ECD
X-IBM-SpamModules-Scores: BY=0.288971; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.424974; ST=0; TS=0; UL=0; ISC=; MB=0.262300
X-IBM-SpamModules-Versions: BY=3.00014507; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01489107; UDB=6.00802930; IPR=6.01271678; 
 MB=3.00035753; MTD=3.00000008; XFM=3.00000015; UTC=2021-01-06 18:12:44
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-01-06 12:09:24 - 6.00012200
x-cbparentid: 21010618-6876-0000-0000-0000262871A3
Message-Id: <OF03EE7F69.B8367FEE-ON00258655.00640A4B-00258655.00640A53@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
Subject: Re:  pthreads at bmcweb
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-06_10:2021-01-06,
 2021-01-06 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
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
Cc: openbmc@lists.ozlabs.org, apparao.puli@linux.intel.com, edtanous@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Jan 6, 2021 Sunitha Harish wrote:
>     Hi team,
>     Reference commit
>https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/31735 :
>     In order to handle the multiple push-style event subscribers,
>bmc       needs to support the async resolution of the subscribers
>address.       The async_resolve() API crashes if there is no thread
>support in       the binary.=20
>     I created a bmcweb binary patch by pulling this commit and
>including the pthread. This works fine for the use-cases, but
>increased the bmcweb binary size by 220KB.=20
?
>     Ed's suggestion is not to use the pthreads, instead implement
> alternatives to do the same job, so that the binary size is kept
>minimum. He mentioned: "Considering that's a ~30% increase in binary
>size to support one line off code, and most systems are already at
>their binary size limit, no, that's not going to be acceptable. We
>can either patch boost to use this
>https://man7.org/linux/man-pages/man3/getaddrinfo_a.3.html or we
>could build our own resolver type that calls that underneath.  This
>was based on a quick lookthrough of solutions in Google.  I'm open to
>other ideas here".=20
>     I am looking for the community views about the increased bmcweb
>     binary size v/s having a custom implementation for asyc_resolve.
>      Please share your views & ideas to get to the best solution.

I agree with Ed that adding pthreads is a step that should be taken=20
with a lot of caution.   In addition to the binary size, a threaded=20
application also adds security audit concerns.

A quick search with the query of "dns lookup library embedded" found=20
a possible library with a probably compatible license (although last=20
update was 4 years ago), and the second link was a survey of other=20
client and server packages that could be investigated.

My personal opinion only.

milton

