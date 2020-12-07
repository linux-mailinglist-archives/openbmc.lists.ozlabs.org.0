Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E10592D1800
	for <lists+openbmc@lfdr.de>; Mon,  7 Dec 2020 19:01:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqWMv0vPczDqVr
	for <lists+openbmc@lfdr.de>; Tue,  8 Dec 2020 05:01:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iuSrHM9o; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqWLs3YF3zDqSr
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2020 05:00:36 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B7Hlu0w093057
 for <openbmc@lists.ozlabs.org>; Mon, 7 Dec 2020 13:00:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : mime-version : references : content-transfer-encoding :
 content-type : message-id : subject; s=pp1;
 bh=e9uqbF8lVurHw3FRTjLg9iYbhTabHY1JRxqldIK8ISc=;
 b=iuSrHM9oNaGaxtefz/bbnVaNsTWQ+SDGbiKEIEMYB1yAj4HsyG04R52FKo3pEb6k/T43
 6GLg5RWFOtfFJwCa87yKHQAQ6zfj55If3sjIl42mAGDwWeT6xMYRVpUmPfV7YggZIvPu
 gjYXVCQU2xKtBqedptDS9ft6pjCZzoiFlhb+1PaSsp/azMkVzrUwWsG/VKQJwiBeNOL2
 fNknyi/B622rErba7xmleVgMofrS4iCum03GacoIi7kzg4a6Itco8T6S5MLKW+c3hlCX
 cgM/erZNb9yYK76vL/EMG6yc90uRJGFF++54tc9lZWJJO2KoBSAc+guD+B7klDrKHpcC mw== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.74])
 by mx0a-001b2d01.pphosted.com with ESMTP id 359s42gayv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 07 Dec 2020 13:00:33 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Mon, 7 Dec 2020 18:00:33 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 7 Dec 2020 18:00:30 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2020120718003047-670847 ;
 Mon, 7 Dec 2020 18:00:30 +0000 
In-Reply-To: <TY2PR04MB33115863009D710731C97980CACE0@TY2PR04MB3311.apcprd04.prod.outlook.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "P. Priyatharshan" <PriyatharshanP@hcl.com>
Date: Mon, 7 Dec 2020 18:00:30 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <TY2PR04MB33115863009D710731C97980CACE0@TY2PR04MB3311.apcprd04.prod.outlook.com>,
 <TY2PR04MB33113F1C94A2530E8033BEBFCACE0@TY2PR04MB3311.apcprd04.prod.outlook.com>,
 <OF8530AE61.94B90081-ON00258637.0054B61F-00258637.0054B627@notes.na.collabserv.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 32075
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20120718-3165-0000-0000-0000051480E8
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.410653
X-IBM-SpamModules-Versions: BY=3.00014329; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01474725; UDB=6.00794366; IPR=6.01257361; 
 MB=3.00035393; MTD=3.00000008; XFM=3.00000015; UTC=2020-12-07 18:00:31
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-12-07 15:27:28 - 6.00012120
x-cbparentid: 20120718-3166-0000-0000-0000C4ED82DA
Message-Id: <OFD51C5AAB.3E72A790-ON00258637.00610A58-00258637.0062EC42@notes.na.collabserv.com>
Subject: RE:  NC-SI Asynchronous Event Notification (AEN) Implementation
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-07_16:2020-12-04,
 2020-12-07 signatures=0
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Velumani
 T-ERS, HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Dec 7, 2020 around 11:36 in some timezone, P. Priyatharshan wrote:
> Hello Milton, >=20
> =20
> Thanks for the reply.=20
>=20
> I am also expecting the link state  to be reflected to userspace and>was =
planning to capture the same in journalctl logs.=20
>=20

The link state and network port changes are printed in the logs.

The reason the link state is not reflected to userspace is an=20
architectural one.  In order for the network stack to recieve or=20
send any packets including NCSI packets the interface has to be=20
marked fully link up with carrier. =20

Its possible for userspace to open a raw ethernet protocol=20
socket and listen in to the NCSI response traffic recieved in
response to  kernel stack but be aware that the AEN packets=20
alone will not relect the changes in connectivity to the=20
network as they are not always sent and also the kernel can=20
timeout and restart the NCSI stack at any point.

There are several abstractions in the kernel for various=20
virtural network topologies but not really match what NCSI
provides.  Most of the virtural interfaces follow the carrier=20
state of one or more underlying ports.  The closest might be=20
a virtual switch but NCSI just provides a common bus wire=20
that doesn't differentiate the source port on rx and requires=20
a single mac on tx.

I think the way forward is to expose each port as a virtural=20
interface but that will provide backwards compatibility issues=20
because that can not support the automatic interface fallover=20
that is coded today.  Again, this is pie in the sky planning with
no time alotted by me currently.

milton=20

> Thanks, > Priyatharshan P   =20
>=20
>>> Is NC-SI Asynchronous Event Notification (AEN) handler is already
> >>implemented in OpenBMC?.If yes kindly let me know which daemon is
> >>handling that.
> >
> >The NC-SI Asynchronous Event Notification is processed.
> >
> >The whole NCSI stack is inside the linux kernel.
> >The code is in the net/ncsi directory.
> >
> >What action are you expecting on an AEN notification?
> >
> >There current NC-SI stack tries to handle switching the network
> >to the host that is up, and there are netlink messages to control
> >which packages and ports are considered for traffic.
> >
> >Unfornately the current model does not allow link state to be
> >reflected to userspace.
> >
> >I have been studing the stack recently and am looking at making
> >changes,but have other work that leaves me little time to work on
> >this.
> >
> >milton


