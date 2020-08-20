Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC5C24C671
	for <lists+openbmc@lfdr.de>; Thu, 20 Aug 2020 21:57:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXb5S45yczDr1F
	for <lists+openbmc@lfdr.de>; Fri, 21 Aug 2020 05:57:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OAFQZGIx; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXb4X5S7czDr1G
 for <openbmc@lists.ozlabs.org>; Fri, 21 Aug 2020 05:56:11 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07KJrxIe140339
 for <openbmc@lists.ozlabs.org>; Thu, 20 Aug 2020 15:56:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : cc : date : references : content-type : message-id :
 content-transfer-encoding : mime-version; s=pp1;
 bh=NgxC/GqG6RAMP0QbhuX9hR+YW0I94O093BZFgUhIS7g=;
 b=OAFQZGIxehzvgIRSSJRViTsCOfgKdfuxYPBbA3ux/6JkeN4OQC/imYYNLxgxrKV9G5JK
 fk2Msf3JZ+Eyg+W4kTTdIJEqrbXcW1yDrMfzTpUlCtmnq8s2R7BxEpBrqojPrY2yCLj0
 R4AzsZMpNlDE3ekPQJ6WeloPsOGx7oLO50/k655nqRDpf+Xxp7Dza4okoq3aPN62uwnd
 205d2Yi98TqdlWv8MxWpC7chRvX7eRNNuF1i8bXjDGGrh1LVoiP9226dbprlx1ySA9z9
 MG4rFi1d5UnuWU41NV8DW0lkwIVHw42uQmWhOrLdupWiJPnI5BcX0zHLLgvhR0Lq5Ibu Iw== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.73])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3304rvm3gc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 20 Aug 2020 15:56:08 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Thu, 20 Aug 2020 19:56:07 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 20 Aug 2020 19:56:06 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2020082019560521-733885 ;
 Thu, 20 Aug 2020 19:56:05 +0000 
In-Reply-To: <3f858d5d.2facc1.174096bc131.Coremail.rxsun@zd-tech.com.cn>
Subject: Re: Network Settings GUI
From: "Derick Montague" <Derick.Montague@ibm.com>
To: rxsun@zd-tech.com.cn
Date: Thu, 20 Aug 2020 19:56:05 +0000
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <3f858d5d.2facc1.174096bc131.Coremail.rxsun@zd-tech.com.cn>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 42755
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=UTF-8
x-cbid: 20082019-8877-0000-0000-000004389221
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.000736
X-IBM-SpamModules-Versions: BY=3.00013686; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01422952; UDB=6.00763592; IPR=6.01205639; 
 MB=3.00033625; MTD=3.00000008; XFM=3.00000015; UTC=2020-08-20 19:56:06
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-08-20 18:23:22 - 6.00011745
x-cbparentid: 20082019-8878-0000-0000-0000B41C9742
Message-Id: <OFD0BEE5BF.E6AD69B2-ON002585CA.0066D508-002585CA.006D817F@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-20_03:2020-08-19,
 2020-08-20 signatures=0
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
Cc: openbmc@lists.ozlabs.org, derick.montague@gmail.com, xzcheng@zd-tech.com.cn,
 ratagupt@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> I'd like to work on IPV6  functionality of phosphor-webui and start to im=
pliment it  on the phosphor-webui.
> would you please show me  the design that was originally completed for th=
e previous layout?=20=20
>=20
> And ,how to proposal my code to webui project =EF=BC=8Cwould you like to =
tell me detail?=20=20

Hi ruixia,sun,=20=20
=20=20=20
We use Gerrit for code reviews. To contribute, you will need to be added to=
 either an individual or corporate CLA.=20=20
https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#submitting-chan=
ges-via-gerrit-server-to-openbmc=20=20
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
For submitting changes, you can look to these guidelines:=20=20
https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#planning-change=
s=20=20
=20=20=20
Developer documentation=20=20
https://github.com/openbmc/docs/blob/master/development/README.md=20=20
=20=20=20
Design for phosphor-webui=20=20
=20=20=20
The design will be similar to IPv4. You can model your layout after the IPv=
4 layout. It has been quite some time since=20=20
we looked at this and we will be revisiting this in the future for the new =
layout. We found several issues with the network=20=20
settings design which have not been addressed in the existing phosphor-webu=
i layout. We will be addressing those with=20=20
the webui-vue UI that is using the Redfish API.
=20=20=20
=20=20=20=20
=20=20=20=20
=20=20=20=20
=20=20=20=20=20=20=20=20
=20=20=20=20=20=20=20
=20=20=20

