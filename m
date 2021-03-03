Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAF632BA61
	for <lists+openbmc@lfdr.de>; Wed,  3 Mar 2021 21:33:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrQg92Xflz3cTF
	for <lists+openbmc@lfdr.de>; Thu,  4 Mar 2021 07:33:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N9ReBAkz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=N9ReBAkz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrQfw1l3Kz3cLS
 for <openbmc@lists.ozlabs.org>; Thu,  4 Mar 2021 07:32:55 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 123K5HBP040188
 for <openbmc@lists.ozlabs.org>; Wed, 3 Mar 2021 15:32:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : cc : date : mime-version : references :
 content-transfer-encoding : content-type : message-id; s=pp1;
 bh=JmcFvCZh8bfgcvMO0kRSSFcK8TYMrcThcGOIrHZpHYE=;
 b=N9ReBAkzxu5a4yXahkcp5SnZ0/bPrK6slWiYNjt843EiL3ise2TzJKRn3rxcesKyJXSn
 yKv5Jn3GQwMsxGQmYorkf4vraiqnOafOAryWyNOzoqaarhK9HvtuWkW4oAgDWb6KJ4Gb
 8yT/uvL3J50say3DI/CaBL+cXbj1znX9i4IYNP6wla5Xch5aDFDArIov8/DdqKI+GM2k
 qLb/9/nx7sRrp+13ukAZJDJGctjyXsTDAy4fzFMgjjTjLvTRI2W+fRuYF5cDdePE6rmG
 hG8T2/Rk5mkEDD+xLISJiBkx7L/Rfp0JtsCIFuSaKJlHIqtHnp9qU+tBaXNwo5KyOOr2 8w== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.81])
 by mx0a-001b2d01.pphosted.com with ESMTP id 372gpc9jq2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 03 Mar 2021 15:32:52 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Wed, 3 Mar 2021 20:32:52 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 3 Mar 2021 20:32:50 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2021030320324924-785526 ;
 Wed, 3 Mar 2021 20:32:49 +0000 
In-Reply-To: <SG2PR02MB2796361C8678E95571189C2C85989@SG2PR02MB2796.apcprd02.prod.outlook.com>
Subject: Re: OpenBMC event logs in WebUI
From: "Derick Montague" <Derick.Montague@ibm.com>
To: udupa.ashwini@inventec.com
Date: Wed, 3 Mar 2021 20:32:49 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <SG2PR02MB2796361C8678E95571189C2C85989@SG2PR02MB2796.apcprd02.prod.outlook.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP130 January 13, 2021 at 14:04
X-LLNOutbound: False
X-Disclaimed: 13803
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 21030320-3067-0000-0000-0000053A9C74
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0;
 ST=0; TS=0; UL=0; ISC=; MB=0.018843
X-IBM-SpamModules-Versions: BY=3.00014826; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000296; SDB=6.01515836; UDB=6.00818898; IPR=6.01298352; 
 MB=3.00036306; MTD=3.00000008; XFM=3.00000015; UTC=2021-03-03 20:32:51
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-03-03 13:39:41 - 6.00012344
x-cbparentid: 21030320-3068-0000-0000-000002A29FDC
Message-Id: <OF9066D3A2.F093DA70-ON0025868D.007087C6-0025868D.0070DE83@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-03_06:2021-03-03,
 2021-03-03 signatures=0
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> Can you please let me know why there is System logs section in phosphor-w=
ebui and not in webui-vue?
  Also, what kind of events generate the System logs and event logs in phos=
phor-webui and event logs in webui-vue?

The system logs page was added by Intel, I believe. I believe there is a
setting when building the UI that determines which page is displayed for
logs. For webui-vue, we are simply getting the entries from the Event Log L=
og Services.

/redfish/v1/Systems/system/LogServices/EventLog/Entries
   =20
  =20

