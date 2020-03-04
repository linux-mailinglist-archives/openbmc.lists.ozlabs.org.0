Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3502B1798E5
	for <lists+openbmc@lfdr.de>; Wed,  4 Mar 2020 20:22:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XkK54SqGzDqfZ
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 06:22:01 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XkJR4RkjzDq5W
 for <openbmc@lists.ozlabs.org>; Thu,  5 Mar 2020 06:21:27 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 024JLDPD068374
 for <openbmc@lists.ozlabs.org>; Wed, 4 Mar 2020 14:21:24 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.111])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yhhy72sq2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 04 Mar 2020 14:21:24 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Wed, 4 Mar 2020 19:21:24 -0000
Received: from us1b3-smtp06.a3dr.sjc01.isc4sb.com (10.122.203.184)
 by smtp.notes.na.collabserv.com (10.122.47.52) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 4 Mar 2020 19:21:20 -0000
Received: from us1b3-mail158.a3dr.sjc03.isc4sb.com ([10.160.174.218])
 by us1b3-smtp06.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020030419211973-815860 ;
 Wed, 4 Mar 2020 19:21:19 +0000 
In-Reply-To: <OF85141839.E61946A0-ON00258521.0044A2A8-00258521.0044A2AE@notes.na.collabserv.com>
Subject: Re: OpenBMC GUI Design Workgroup - Today 10:00 AM CST
From: "Derick Montague" <Derick.Montague@ibm.com>
To: "Derick Montague" <Derick.Montague@ibm.com>
Date: Wed, 4 Mar 2020 19:21:20 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <OF85141839.E61946A0-ON00258521.0044A2A8-00258521.0044A2AE@notes.na.collabserv.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 16843
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20030419-3633-0000-0000-000001D1B487
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.437038; ST=0; TS=0; UL=0; ISC=; MB=0.262912
X-IBM-SpamModules-Versions: BY=3.00012687; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000293; SDB=6.01342931; UDB=6.00715848; IPR=6.01125319; 
 MB=3.00031080; MTD=3.00000008; XFM=3.00000015; UTC=2020-03-04 19:21:22
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-03-04 11:36:52 - 6.00011077
x-cbparentid: 20030419-3634-0000-0000-0000AD62CB67
Message-Id: <OF783D8D46.A2308282-ON00258521.0069ADA5-00258521.006A52C8@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-04_08:2020-03-04,
 2020-03-04 signatures=0
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

Thank you everyone for the active and productive session today. Below are t=
he notes:

> In today's GUI Design Workgroup, we will will be discussing:
>
>
>- Vue Roadmap progress
>- Web UI color palette
>- Documentation progress (alerts, buttons, toasts)
>- Reference Id table column name in Event Logs
>- Date and Time design updates
>- Local User management review

Road Map

- Reviewed IBM's WIP ZenHub board for their current sprint
    - Translation progress
    - Feature toggle to provide support for more upstream development to su=
pport different systems
    - Date and Time research and design
    - Local user management implementation progress
    - Reboot BMC implementation
    - Power server operations is WIP
    - Overview page using Redfish API to display data

Design story progress and feedback tracking

- Determined that we will continue the pattern for tracking design reviews =
in a Github story in the webui-vue branch
    - Github story will contain link to Invision prototype
    - Comments are best captured in Github, but can be created in Invision =
as well. Designer will add comments to Github story as needed
    - Design evolution and final design should be screen captured and added=
 to the Github story where it can be preserved
- IBM design team will begin this process which will be evaluated for impro=
vements in future workgroup meetings

Color Palette

- IBM has proposed a refined color palette based on the Bootstrap framework=
s Theming guidelines (https://gerrit.openbmc-project.xyz/c/openbmc/webui-vu=
e/+/29965)
- Reviewed the colors and an overview of how they can be easily updated dow=
nstream for branding purposes
- Slightly more extensive color palette to improve the theming of components
- Full documentation is partially completed explaining customization and th=
e theming process
- Workgroup was happy with the proposal

Event Logs and the Reference Code column

IBM needs a table column that contains a code the users and customer suppor=
t can use to troubleshoot issues. The column name was previously based on a=
n IBM proprietary naming. Through user testing the IBM OpenBMC design squad=
 has updated the column title to Reference Id.

- Will not be needed for Intel systems currently
- Intel systems need ID (currently can be toggled off in Intel GUI), status=
, and description
- Intel does not use the Systems Log page that is upstream.
- Phoenix expressed the need for a solution for improving the experience on=
 small screens and make it easier to view the most important information. A=
ll workgroup members agreed this was description.
- New Event Log design with filter menu had not been seen by the current Wo=
rkgroup members. IBM will create a Github story and send more requests for =
feedback to the community.
- Phoenix suggested not needed a redundant column displayed in the table du=
ring filtering, e.g. hide severity column if filter is based on a severity =
value
- Determined this may be a future enhancement following priority work in pr=
ocess
- Need to write the GUI to have a dynamic event log table that only display=
s a column if present in the JSON response
    - Another option might be some type of page flag that can be set either=
 globally or in a single file component

Language Translation

- Intel and Phoenix noted that languages should be displayed in the native =
language, e.g. Spanish should be Espa=C3=B1ol
- IBM asked for for feedback on or a use case for the user being able to ch=
ange the language after login since currently the user makes their language=
 preference on the login screen.
    - Pros for and against. IBM will conduct more research to determine if =
there is a need and the best pattern for enabling if needed.

Date and Time Design

- Phoenix discussed a "sync to ntp" use case there during setup the system =
is connected to the internet in order for the admin to connect to an NTP se=
rver to set the Host RTC and then disconnect from the internet
    - Intel noted that they ask admins to update the time in the BIOS to se=
t the Host RTC.
    - Possible future enhancement
- Design for Date and Time will allow flexibility for different functionali=
ty, e.g IBM systems allow for NTP or manual time entry, while Intel systems=
 offer NTP or RTC only.
- Need a toggle or flag to allow for both options to live upstream.

Action Items

- Start adding design review stories to Github
    - Update event logs prototype and send to community
    - Date and Time
    - Color palette with alert and toast components
- Update language menu options to display in native language


Review in the wiki: https://github.com/openbmc/openbmc/wiki/GUI-Design-work=
-group#030420
=20
=20
=20

