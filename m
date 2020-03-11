Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC41181706
	for <lists+openbmc@lfdr.de>; Wed, 11 Mar 2020 12:44:34 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cqqz2qcpzDqP2
	for <lists+openbmc@lfdr.de>; Wed, 11 Mar 2020 22:44:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cqqB6NhHzDqLT
 for <openbmc@lists.ozlabs.org>; Wed, 11 Mar 2020 22:43:49 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02BBg2Jm125113
 for <openbmc@lists.ozlabs.org>; Wed, 11 Mar 2020 07:43:40 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.67])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ypy4hrwwg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 11 Mar 2020 07:43:40 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Wed, 11 Mar 2020 11:43:40 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 11 Mar 2020 11:42:20 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2020031111421978-336255 ;
 Wed, 11 Mar 2020 11:42:19 +0000 
In-Reply-To: <46248870.1c8dc3.170a87ecdc0.Coremail.rxsun@zd-tech.com.cn>
Subject: Re: Network Settings GUI
From: "Derick Montague" <Derick.Montague@ibm.com>
To: rxsun@zd-tech.com.cn
Date: Wed, 11 Mar 2020 11:42:19 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <46248870.1c8dc3.170a87ecdc0.Coremail.rxsun@zd-tech.com.cn>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 29731
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20031111-7279-0000-0000-00000231396A
X-IBM-SpamModules-Scores: BY=0.001112; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.388783; ST=0; TS=0; UL=0; ISC=; MB=0.093417
X-IBM-SpamModules-Versions: BY=3.00012727; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000293; SDB=6.01346094; UDB=6.00717736; IPR=6.01128504; 
 MB=3.00031175; MTD=3.00000008; XFM=3.00000015; UTC=2020-03-11 11:43:37
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-03-11 07:27:47 - 6.00011105
x-cbparentid: 20031111-7280-0000-0000-00004EF93A6E
Message-Id: <OF66F85A09.1A6A1395-ON00258528.003FC677-00258528.00404CA3@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-11_05:2020-03-11,
 2020-03-11 signatures=0
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
Cc: openbmc@lists.ozlabs.org, derick.montague@gmail.com,
 ratagupt@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ruxia,

> Sorry for late reply. I had read  https://gerrit.openbmc-project.xyz/c/op=
enbmc/phosphor-webui/+/24317  ,  I saw the calling of redfish  in api-ulti.=
js . I wonder if the ipv6 has been done in this BMC system.  Would you like=
 to tell me the ipv6 support schedule of  bmc OS?


=20
Jandra is no longer working on this project and the IBM design team is work=
ing on a new version of the GUI written in Vue.js. We are just starting to =
talk about IPv6 again and I do think it may be ready. I see that Ratan is o=
n this mail thread and he should be able to specify for sure if the backend=
 supporting IPv6 is ready.

Thanks,
Derick

=20


=20
=20
=20

