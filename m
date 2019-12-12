Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C8711D6FA
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2019 20:22:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YkGD4L52zDr7m
	for <lists+openbmc@lfdr.de>; Fri, 13 Dec 2019 06:22:44 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YkFR6PSbzDqwB
 for <openbmc@lists.ozlabs.org>; Fri, 13 Dec 2019 06:22:03 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBCJHsD5099233
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 14:22:01 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.75])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wurcqyers-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 14:22:00 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Thu, 12 Dec 2019 19:22:00 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.123) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 12 Dec 2019 19:21:57 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2019121219215634-854973 ;
 Thu, 12 Dec 2019 19:21:56 +0000 
In-Reply-To: <FD0BD680739BFC41807C96BD23118BB13254BE@ORSMSX113.amr.corp.intel.com>
From: "Derick Montague" <Derick.Montague@ibm.com>
To: kathryn.elainex.pine@intel.com
Date: Thu, 12 Dec 2019 19:21:56 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: 
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 48559
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 19121219-6875-0000-0000-000001423A39
X-IBM-SpamModules-Scores: BY=0.035191; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.425523; ST=0; TS=0; UL=0; ISC=; MB=0.376744
X-IBM-SpamModules-Versions: BY=3.00012233; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01303397; UDB=6.00692258; IPR=6.01085681; 
 MB=3.00029937; MTD=3.00000008; XFM=3.00000015; UTC=2019-12-12 19:21:58
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-12-12 13:13:12 - 6.00010756
x-cbparentid: 19121219-6876-0000-0000-000001F96868
Message-Id: <OFB0FFEE29.EECAA539-ON002584CE.0069BE99-002584CE.006A60F5@notes.na.collabserv.com>
Subject: Re:  GUI Mockups
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-12_06:2019-12-12,2019-12-12 signatures=0
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> Per our evolving GUI conversation, Jandra and I have both been working on=
 mockups to discuss in an effort to find a collaborative agreement on the s=
tyle for phosphor-webui.
=20
That conversation is taking place today at 2:00 pm Central time. I believe =
our goal is to find a base design that does not look like IBM or Intel. Thi=
s will allow any company to use the design without change if desired. Boots=
trap out of the box will not be polished enough. To utilize custom theming =
in the existing GUI, we will need to overhaul most of the application to im=
plement Bootstrap correctly.
=20
Here are the mockups that Jandra created that will be discussed in today's =
meeting as well.=20
=20
Server LED: https://ibm.invisionapp.com/share/QANZHJKP74E#/319357713=5FServ=
erLED=20
Server Overview: https://ibm.invisionapp.com/share/QANZHJKP74E#/319357712=
=5FOverview=20
=20
=20
=20
----- Original message -----
From: "Pine, Kathryn ElaineX" <kathryn.elainex.pine@intel.com>
Sent by: "openbmc" <openbmc-bounces+derick.montague=3Dibm.com@lists.ozlabs.=
org>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc:
Subject: [EXTERNAL] GUI Mockups
Date: Thu, Dec 12, 2019 1:08 PM
=20


Per our evolving GUI conversation, Jandra and I have both been working on m=
ockups to discuss in an effort to find a collaborative agreement on the sty=
le for phosphor-webui.

=20

Below are links to mockups I=E2=80=99ve prepared.

=20

My intent with these has been to take the existing upstream UI, considering=
 the elements that IBM values that have not been in my past proposed design=
 concepts and those we are using at Intel, and combine them into a modular,=
 modern design that would allow for easy downstream theming for Intel, IBM =
and others, without looking too much like any one brand. Some of the modifi=
cations these concepts represent include the ability to use dark background=
s, carets in the menu, and options for the data refresh visibility in the h=
eader =E2=80=93 and the overall intent has been a blended style that we can=
 potentially work from to find agreement in style overall.

=20

The mockups propose the following:

=20

Modularity of Header & Nav: A modular header/nav style that makes it easy f=
or any color background

With both light text/icon & dark text/icon option, any background color can=
 be applied to either
5 variations show how a dark or light concept can be applied independently;=
 these show the same main design, just varying the dark/light background fo=
r header/nav/behind logo: intent is these could be options to switch out in=
 CSS easily:
A https://invis.io/EDV8VCJ3JX6
B https://invis.io/X3V8VFI54UC
C https://invis.io/9NV8VFWEQAJ
D https://invis.io/2GV8VG0ZKWD
E https://invis.io/57V8VG7EF6N

=20

Colors: Simplify theming

Intent is for the nav., header, and background colors to easily be specifie=
d to match a brand, and the either dark or light text would be used appropr=
iately
Intent would be that CSS would allow two main colors (or two main color the=
mes) that will be applied, with varying degrees of opacity, to all elements=
, so less colors and subjective need to define color palettes
(further clarification can follow this concept phase to document how this c=
ould work)

=20

Responsiveness: Varying states for browsers at different widths or magnific=
ations

Header and navigation have 3 states based on breakpoints and/or toggle
Nav: Full (large window and default) / Narrow (medium window) / Collapsed (=
small window); when in larger states, user can toggle navigation collapse f=
eature
Nav toggle proposed states outlined here: https://invis.io/QUV8VDFD72R
Header details: Option for toggle to open / Closed (suggested default) / Ho=
ver (to address extremely narrow width or as an option on closed state)
Top right proposed options outlined here: https://invis.io/49V8VDX5SCB

=20

-------------------

=20

Notes about mockup fonts/icons/spacing:

The health and power status icon are suggested in these mockups with specif=
ic icons, rather than previously used generic status icons. This would help=
 make the status clearer when in a narrow width (icons only); however, ther=
e are not icons in Carbon library that worked well for this concept so new =
icons are shown here; However, these could be switched out with existing ic=
ons or other new-to-be-identified icons in Carbon library or elsewhere.
Fonts & spacing can be specified when we get to detailed concept phase; the=
se mockups are meant for discussing a consensus on broad concepts first, th=
en details can be addressed as we narrow choices

=20

To be discussed:

=20

Variations to consider:

Whether top right status/links (health, status, refresh, logout): could be =
open/closed with collapse feature and/or use a hover over to show detail
Open: https://invis.io/52V8VU6PMHE  / Hover: https://invis.io/7QV8VVP5XBP
Do we like the order of health, status, refresh, logout?
Do we like page title in header or on page; what are pros and cons of each?
Page title in content space: https://invis.io/FDV8VVY8XJ5
Are IP & system name important to show in header/on all pages?

=20

Suggested as available options easily switch/override in CSS:

Colors for nav., header, page background
Content space =E2=80=93 boxes could be with a border or without
Showing content without borders: https://invis.io/YEV8VWDNXPJ
Behind logo space to match header or navigation: To allow for the navigatio=
n to collapse as proposed, the space behind the logo would need to be part =
of the navigation. However, as shown in   concepts A, B & E, this space can=
 look like part of the header by matching the header color; this proposes t=
he ability for the =E2=80=9Cbehind logo=E2=80=9D space to match either the =
nav. or header for custom theming.

=20

=20

=20

=20

