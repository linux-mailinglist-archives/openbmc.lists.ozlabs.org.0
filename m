Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E28B5139692
	for <lists+openbmc@lfdr.de>; Mon, 13 Jan 2020 17:43:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xKCC1ctqzDqJ7
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 03:43:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xKBT6dflzDqGX
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 03:42:25 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00DGgJQh136889
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jan 2020 11:42:22 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xfva1btsb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jan 2020 11:42:22 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Mon, 13 Jan 2020 16:42:21 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 13 Jan 2020 16:42:16 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2020011316421628-641975 ;
 Mon, 13 Jan 2020 16:42:16 +0000 
In-Reply-To: <FD0BD680739BFC41807C96BD23118BB1327E11@ORSMSX113.amr.corp.intel.com>
Subject: GUI design for profile page
From: "Derick Montague" <Derick.Montague@ibm.com>
To: kathryn.elainex.pine@intel.com
Date: Mon, 13 Jan 2020 16:42:15 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <FD0BD680739BFC41807C96BD23118BB1327E11@ORSMSX113.amr.corp.intel.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 53911
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20011316-1335-0000-0000-000002C5D392
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.415652; ST=0; TS=0; UL=0; ISC=; MB=0.274178
X-IBM-SpamModules-Versions: BY=3.00012378; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01318589; UDB=6.00701340; IPR=6.01100919; 
 MB=3.00030299; MTD=3.00000008; XFM=3.00000015; UTC=2020-01-13 16:42:20
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-01-13 13:17:07 - 6.00010881
x-cbparentid: 20011316-1336-0000-0000-00002302F130
Message-Id: <OF54B7FA9A.2E44CC83-ON002584EE.0059BF0A-002584EE.005BC27D@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_05:2020-01-13,
 2020-01-13 signatures=0
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
Cc: openbmc@lists.ozlabs.org, ryanarnellibm@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

=20
Thank you for your feedback, Kathy!

> 1. What was the reasoning for making this a separate page instead of putt=
ing this on the existing local users page?

A profile page is a common pattern that users are accustomed to. The local =
user management is a page that admin users of the BMC are accustomed to and=
 the admin user is the only user type with access to this page. Having diff=
erent information on the local user management page based on user type seem=
s less intuitive than providing a profile page. We will be user testing thi=
s.


> 2. If it is a separate page, I like that the page would be linked from a =
header icon, but it seems like there should be access from the menu somehow=
 as well. I wonder if it could be a link on the local users page for each u=
ser.=20

What problem are we solving with this proposal? I don't feel that admin sho=
uld have access to a user's profile page. Any information they want to upda=
te for the user, e.g. username, password, etc should be handled on the loca=
l user management page.=20

> I can imagine that if control exists to change language for a user, there=
 could be a scenario where an admin user might want to change the language =
for users when they set the user up, not requiring that user to log in in E=
nglish (for example) and then find this page and change the language themse=
lves.


The login page will be displayed using the language set in the users operat=
ing system unless that language is not supported, then it would display in =
English. Ed's use case that that the use would want to update their languag=
e from the what they have set in their OS to English. We are contemplating =
having a language option on the login page to allow the user to select at l=
ogin.

Even if an admin set the users language, the login page won't know who that=
 user is until they login, so we did not consider that as a use case. We ar=
e going to be testing different options with users.


> If it is accessed from the local users page, could it just be a modal on =
the page rather than a separate page?

If we wanted the admin to be able to set the users language we would just a=
dd this to the available settings they could change for that user. I person=
ally don't think it adds too much value, but it would also be simple to add=
 to form to update the user info.
=20

=20

=20

=20

=20

