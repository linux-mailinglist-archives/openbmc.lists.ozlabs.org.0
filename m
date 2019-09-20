Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C33B95D6
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 18:38:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZfXT0HMRzF3bh
	for <lists+openbmc@lfdr.de>; Sat, 21 Sep 2019 02:38:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=miltonm@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Zf883H5qzDqkR
 for <openbmc@lists.ozlabs.org>; Sat, 21 Sep 2019 02:20:23 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8KGBvlq096145
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 12:20:21 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.119])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v51p59cea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 12:20:21 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Fri, 20 Sep 2019 16:20:19 -0000
Received: from us1b3-smtp05.a3dr.sjc01.isc4sb.com (10.122.203.183)
 by smtp.notes.na.collabserv.com (10.122.182.123) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 20 Sep 2019 16:20:15 -0000
Received: from us1b3-mail228.a3dr.sjc03.isc4sb.com ([10.168.214.55])
 by us1b3-smtp05.a3dr.sjc01.isc4sb.com
 with ESMTP id 2019092016201502-646270 ;
 Fri, 20 Sep 2019 16:20:15 +0000 
In-Reply-To: <4ae96d16-addd-2ee9-0f96-867116fba5c6@linux.intel.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: James Feist <james.feist@linux.intel.com>
Date: Fri, 20 Sep 2019 16:20:14 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <4ae96d16-addd-2ee9-0f96-867116fba5c6@linux.intel.com>,
 <c558c87c-7929-b9d2-8970-531f39979f38@linux.intel.com>
 <1bbdbc81-69a5-484e-9ee8-ba62a710e8fe@www.fastmail.com>
X-Mailer: IBM iNotes ($HaikuForm 1054) | IBM Domino Build
 SCN1812108_20180501T0841_FP57 August 05, 2019 at 12:42
X-LLNOutbound: False
X-Disclaimed: 10651
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 19092016-3975-0000-0000-000000637D70
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.076070
X-IBM-SpamModules-Versions: BY=3.00011809; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01264098; UDB=6.00668586; IPR=6.01045994; 
 MB=3.00028728; MTD=3.00000008; XFM=3.00000015; UTC=2019-09-20 16:20:18
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-09-20 15:49:17 - 6.00010430
x-cbparentid: 19092016-3976-0000-0000-000011B1926C
Message-Id: <OFB4439398.C2024144-ON0025847B.0059AC2A-0025847B.0059BE4A@notes.na.collabserv.com>
Subject: RE: phosphor-isolation
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-20_05:, , signatures=0
X-Proofpoint-Spam-Reason: safe
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On September 20, 2019, around 10:56AM in some timezone, James Feist wrote:
>On 9/19/19 8:47 PM, Andrew Jeffery wrote:
>> On Fri, 20 Sep 2019, at 03:03, James Feist wrote:
>>> I enabled phosphor-isolation on my system and noticed that kcs no
>>>longer
>>> worked afterwards. Commenting out this section:
>>>
>>>

>>>
>>> +	/* iLPC2AHB */
>>> +	val =3D readl(AST=5FSCU=5FBASE + AST=5FSCU=5FHW=5FSTRAP1);
>>> +	val |=3D SCU=5FHW=5FSTRAP=5FLPC=5FDEC=5FSUPER=5FIO;
>>> +	writel(val, AST=5FSCU=5FBASE + AST=5FSCU=5FHW=5FSTRAP1);
>>>
>>>
>>> Seems to make KCS work again.

That configuration is disabling superio decoding, which means the host
will no longer be able to configure the superio hardware on the LPC bus.

>>=20
>> That is an unexpected result. Have you asked ASPEED about it? I've
>> added
>> Ryan to Cc. I must admit I didn't test the patch with systems that
>> use KCS
>> because OpenPOWER exclusively uses BT for IPMI (though we're
>> starting
>> to exploit the KCS interfaces for an LPC MCTP binding).
>>=20
>> Having said that, the systems that we're testing our LPC MCTP
>> binding on
>> would have this patch applied, so presumably we're not seeing the
>> same
>> effect there. They're 2500-based systems, is that what you're
>> testing with?
>
>Yes I am.
>

As an outside observer without hardware, can you check:

(1) Did you check from the OS or just from a BIOS inventory?

(2) Is there code to enable the KCS peripheral from the bmc

(3) Will the host try to use the KCS even though it can
    not find the superio to choose the port and interrupt?





>>>=20
>>> Do we need this part set? If so, should we
>>> create a phosphor-isolation-kcs and phosphor-isolation-bt?
>>=20
>> I hope not, given that leaving the SuperIO decoding enable allows
>the
>> host to (slowly) scrape BMC memory (or if iLPC2AHB writes are
>> allowed,
>> open faster backdoors). We should root-cause the issue before
>> exploring this path.
>>=20
>> Andrew

