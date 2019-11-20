Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 430A4103E00
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 16:08:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47J5g30jrVzDqsw
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 02:08:31 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47J5dy4rMbzDqST
 for <openbmc@lists.ozlabs.org>; Thu, 21 Nov 2019 02:07:34 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAKF2uMo106754
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 10:07:31 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.93])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wd5gc64ff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 10:07:30 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Wed, 20 Nov 2019 15:07:29 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 20 Nov 2019 15:07:27 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2019112015072744-574899 ;
 Wed, 20 Nov 2019 15:07:27 +0000 
In-Reply-To: <FD0BD680739BFC41807C96BD23118BB130CB87@ORSMSX113.amr.corp.intel.com>
From: "Derick Montague" <Derick.Montague@ibm.com>
To: kathryn.elainex.pine@intel.com
Date: Wed, 20 Nov 2019 15:07:26 +0000
Sensitivity: 
References: 
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 47751
X-TNEFEvaluated: 1
Content-Type: text/html; charset=UTF-8
x-cbid: 19112015-8889-0000-0000-000001258503
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.247702
X-IBM-SpamModules-Versions: BY=3.00012139; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01292869; UDB=6.00685952; IPR=6.01075091; 
 MB=3.00029627; MTD=3.00000008; XFM=3.00000015; UTC=2019-11-20 15:07:29
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-11-20 13:10:03 - 6.00010670
x-cbparentid: 19112015-8890-0000-0000-000001A794DE
Message-Id: <OF3CAC5942.D638ED9B-ON002584B7.006D75AF-002584B8.0053145A@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 4 URL's were un-rewritten
MIME-Version: 1.0
Subject: Re:  GUI: New navigation and design
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_04:2019-11-15,2019-11-20 signatures=0
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

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Lucida S=
ans Unicode, Lucida Grande, sans-serif;font-size:10pt" ><div dir=3D"ltr" st=
yle=3D"font-family:Lucida Sans Unicode, Lucida Grande, sans-serif;font-size=
:10pt" ><div dir=3D"ltr" ><div data-node-type=3D"line" id=3D"magicdomid307"=
 ><div data-node-type=3D"line" id=3D"magicdomid307" >Thank you for sharing!=
 We have been collaborating behind the scenes,&nbsp;so I want to bring</div>
<div data-node-type=3D"line" >the conversation back into the community thre=
ad. I have provided some feedback below,</div>
<div data-node-type=3D"line" >but overall it would be helpful to understand=
 the qualitative data&nbsp;that was used to determine</div>
<div data-node-type=3D"line" >the value of the color palette change. It is =
difficult to frame&nbsp;a conversation around these</div>
<div data-node-type=3D"line" >changes otherwise. It would be&nbsp;more prod=
uctive to understand&nbsp;what problems we are solving,</div>
<div data-node-type=3D"line" >how we are solving them using common heuristi=
cs,&nbsp;and&nbsp;how the overall experiences were</div>
<div data-node-type=3D"line" >improved with the design change proposal.</di=
v>
<div data-node-type=3D"line" id=3D"magicdomid716" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid1940" >Regarding color, we use=
d color theory to determine the color palette. Color theory indicates</div>
<div data-node-type=3D"line" >that dark blues and light blues have differen=
t impact in the way a UI is perceived. Light blues</div>
<div data-node-type=3D"line" >are friendly and energizing, while dark blues=
 are stable and reliable. It is important to IBM that</div>
<div data-node-type=3D"line" >the OpenBMC UI embody the same values that cu=
stomers expect from our servers, reliability,</div>
<div data-node-type=3D"line" >strength, and excellence. Additionally, the p=
roposed color choice is harder to switch to a dark</div>
<div data-node-type=3D"line" >UI for users who might have visual limitation=
s and need to convert to dark UIs using browser</div>
<div data-node-type=3D"line" >plugins and some of the background/foreground=
 combinations do not meet the Web Content</div>
<div data-node-type=3D"line" >Accessibility Guidelines (WCAG) 2.0 AA Access=
ible Colors guideline.</div>
<div data-node-type=3D"line" id=3D"magicdomid1110" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid1132" >Color Theory reference:=
</div>
<div data-node-type=3D"line" id=3D"magicdomid1133" ><a data-attrib-id=3D"MT=
U3NDI1NzE0NDIzNy1odHRwczovL3d3dy5zbWFzaGluZ21hZ2F6aW5lLmNvbS8yMDEwLzAxL2Nvb=
G9yLXRoZW9yeS1mb3ItZGVzaWduZXJzLXBhcnQtMS10aGUtbWVhbmluZy1vZi1jb2xvci8=3D" =
href=3D"https://www.smashingmagazine.com/2010/01/color-theory-for-designers=
-part-1-the-meaning-of-color/" rel=3D"noreferrer nofollow" target=3D"_blank=
">https://www.smashingmagazine.com/2010/01/color-theory-for-designers-part-=
1-the-meaning-of-color/</a></div>
<div data-node-type=3D"line" id=3D"magicdomid1134" >&nbsp;</div>
<div data-node-type=3D"line" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid1141" >&gt; <a data-attrib-id=
=3D"MTU3NDIwMDg1ODc3NS1odHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJ=
sP3U9aHR0cHMtM0FfX2kucG9zdGltZy5jY19xTXZDaDZYcl9Mb2dpbi5qcGcmZD1Ed01GQWcmYz=
1qZl9pYVNIdkpPYlRieC1zaUExWk9nJnI9RGxNNlB5RWxncXFLVGQ2ZXhYMGo0QnM0Z0xuU1k3L=
VgwQzFQbVoxYWVBMCZtPUF0emZQbkMwX01TNFMwdmZhM1E1b25zMGlSSjJZYU5iVlQ5OXBuWGRm=
c1kmcz1jMllsRTdDWk5GdklCV3o0T0EyUEFsMlE3a1JSSzVZb2NVRnh5MnhQM0JvJmU9" href=
=3D"https://i.postimg.cc/qMvCh6Xr/Login.jpg" rel=3D"noreferrer nofollow" ta=
rget=3D"_blank">https://i.postimg.cc/qMvCh6Xr/Login.jpg</a></div>
<div data-node-type=3D"line" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid203" >The aesthetic of the log=
in page looks good. I think it would be helpful to show more</div>
<div data-node-type=3D"line" id=3D"magicdomid204" >then just the small scre=
en view.&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid205" >&nbsp;</div>
<div data-node-type=3D"line" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid206" >&gt; <a data-attrib-id=
=3D"MTU3NDIwMDg1ODc4NS1odHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJ=
sP3U9aHR0cHMtM0FfX2kucG9zdGltZy5jY190VFRnTWRIeV9FdmVudExvZy5qcGcmZD1Ed01GQW=
cmYz1qZl9pYVNIdkpPYlRieC1zaUExWk9nJnI9RGxNNlB5RWxncXFLVGQ2ZXhYMGo0QnM0Z0xuU=
1k3LVgwQzFQbVoxYWVBMCZtPUF0emZQbkMwX01TNFMwdmZhM1E1b25zMGlSSjJZYU5iVlQ5OXBu=
WGRmc1kmcz1NUWZkQjdxYTJjQ0NhbGpuSmVTb0l5RE05a3E0X29KUXdCRXRBa2cwYm40JmU9" h=
ref=3D"https://i.postimg.cc/tTTgMdHy/EventLog.jpg" rel=3D"noreferrer nofoll=
ow" target=3D"_blank">https://i.postimg.cc/tTTgMdHy/EventLog.jpg</a></div>
<div data-node-type=3D"line" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid207" >I am struggling with thi=
s proposal for a couple of reasons:</div>
<div data-node-type=3D"line" id=3D"magicdomid208" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid209" >1. The visual hierarchy =
of the&nbsp;screen makes it difficult to</div>
<div data-node-type=3D"line" ><span style=3D"font-size: 10pt;" >easily scan=
 the content of the page. There are many areas</span></div>
<div data-node-type=3D"line" ><span style=3D"font-size: 10pt;" >that draw t=
he user's focus.&nbsp;</span></div>
<div data-node-type=3D"line" id=3D"magicdomid211" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid212" >2. The Filter sections o=
ccupy a great deal of the screen real estate. This</div>
<div data-node-type=3D"line" id=3D"magicdomid213" >was one of Intel's goals=
 to resolve.&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid214" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid215" >3. Doesn't take into acc=
ount the need for adding a remote logging server</div>
<div data-node-type=3D"line" >&nbsp;</div>
<div data-node-type=3D"line" >4. Unclear what problem showing and hiding th=
e Event IDs column solves</div>
<div data-node-type=3D"line" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid218" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid219" >We have an alternative d=
esign that:</div>
<div data-node-type=3D"line" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid596" >1. Has been tested with =
over 10 IBM customers and several internal stakeholders</div>
<div data-node-type=3D"line" id=3D"magicdomid221" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid1952" >2. Complies with the AA=
 WCAG 2.0 AA Accessible colors guideline</div>
<div data-node-type=3D"line" id=3D"magicdomid224" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid2054" >3. Maximizes the screen=
 real estate by using a filter menu pattern</div>
<div data-node-type=3D"line" id=3D"magicdomid226" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid227" >4. Associates the the se=
arch logs input field with the table itself through the use of proximity</d=
iv>
<div data-node-type=3D"line" id=3D"magicdomid228" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid2055" >Link to IBM Event Logs =
prototype:&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid2056" ><a data-attrib-id=3D"MT=
U3NDIwMDg1ODc5OC1odHRwczovL2libS5pbnZpc2lvbmFwcC5jb20vc2hhcmUvOEVOWVJWWEFQR=
kQjL3NjcmVlbnMvMzE5MTQxNzY1XzAxLUV2ZW50LUxvZ3M=3D" href=3D"https://ibm.invi=
sionapp.com/share/8ENYRVXAPFD#/screens/319141765_01-Event-Logs" rel=3D"nore=
ferrer nofollow" target=3D"_blank">https://ibm.invisionapp.com/share/8ENYRV=
XAPFD#/screens/319141765_01-Event-Logs</a></div>
<div data-node-type=3D"line" id=3D"magicdomid230" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid231" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid232" >&gt; <a data-attrib-id=
=3D"MTU3NDIwMDg1ODgwMy1odHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJ=
sP3U9aHR0cHMtM0FfX2kucG9zdGltZy5jY19YcUJZVlZKel9IYXJkd2FyZS0yRFN0YXR1cy0yRF=
BhZ2UuanBnJmQ9RHdNRkFnJmM9amZfaWFTSHZKT2JUYngtc2lBMVpPZyZyPURsTTZQeUVsZ3FxS=
1RkNmV4WDBqNEJzNGdMblNZNy1YMEMxUG1aMWFlQTAmbT1BdHpmUG5DMF9NUzRTMHZmYTNRNW9u=
czBpUkoyWWFOYlZUOTlwblhkZnNZJnM9WUF4eVZDWnJVakpJaXhvckY4aWxhRXY5NXRnZmQ3dUZ=
WRDdabXVfU3M1SSZlPQ=3D=3D" href=3D"https://i.postimg.cc/XqBYVVJz/Hardware-S=
tatus-Page.jpg" rel=3D"noreferrer nofollow" target=3D"_blank">https://i.pos=
timg.cc/XqBYVVJz/Hardware-Status-Page.jpg</a></div>
<div data-node-type=3D"line" id=3D"magicdomid233" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid234" >These seem like improvem=
ents we should move forward with:</div>
<div data-node-type=3D"line" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid2071" >1. The layout and organ=
ization of this page better utilizes the available screen real estate.</div>
<div data-node-type=3D"line" id=3D"magicdomid236" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid2165" >2. The added functional=
ity of expand and collapse all sections could be a useful feature.</div>
<div data-node-type=3D"line" id=3D"magicdomid2247" >We are happy to user te=
at that before putting in the development effort.</div>
<div data-node-type=3D"line" id=3D"magicdomid238" >&nbsp;</div>
<div data-node-type=3D"line" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid1143" >These are concerns we s=
hould discuss:</div>
<div data-node-type=3D"line" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid240" >1. The Page heading and =
the navigation are mismatched. Why is the navigation titled</div>
<div data-node-type=3D"line" id=3D"magicdomid241" >Hardware status and the =
page titled Inventory?</div>
<div data-node-type=3D"line" id=3D"magicdomid242" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid243" >2. There seem to be othe=
r FRU types that are not listed in the quick filters.</div>
<div data-node-type=3D"line" id=3D"magicdomid244" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid2249" >3. Is this scalable? On=
e system I'm looking at has 15 DIMMs and the proposed design only</div>
<div data-node-type=3D"line" id=3D"magicdomid246" >shows 1.</div>
<div data-node-type=3D"line" id=3D"magicdomid247" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid248" >4. It's not clear how a =
user can expand just one section. There is a checkbox for showing all detai=
ls</div>
<div data-node-type=3D"line" id=3D"magicdomid249" >but no visual indicator =
that the user can expand/collapse the details of individual sections</div>
<div data-node-type=3D"line" id=3D"magicdomid250" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid251" >5. Export functionality =
is missing</div>
<div data-node-type=3D"line" id=3D"magicdomid252" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid253" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid254" >&gt; <a data-attrib-id=
=3D"MTU3NDIwMDg1ODgwOC1odHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJ=
sP3U9aHR0cHMtM0FfX2kucG9zdGltZy5jY19CNlZ2OThxRl9TZW5zb3JzLTJEUGFnZS5qcGcmZD=
1Ed01GQWcmYz1qZl9pYVNIdkpPYlRieC1zaUExWk9nJnI9RGxNNlB5RWxncXFLVGQ2ZXhYMGo0Q=
nM0Z0xuU1k3LVgwQzFQbVoxYWVBMCZtPUF0emZQbkMwX01TNFMwdmZhM1E1b25zMGlSSjJZYU5i=
VlQ5OXBuWGRmc1kmcz05T203eFhTZFFsR054NUF6Yi05MjN6Q2lWekZYMW1CMjFRel8wUXo3OTl=
FJmU9" href=3D"https://i.postimg.cc/B6Vv98qF/Sensors-Page.jpg" rel=3D"noref=
errer nofollow" target=3D"_blank">https://i.postimg.cc/B6Vv98qF/Sensors-Pag=
e.jpg</a></div>
<div data-node-type=3D"line" id=3D"magicdomid255" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid256" >These seem like improvem=
ents we should move forward with:</div>
<div data-node-type=3D"line" id=3D"magicdomid257" >1. Use of icons to show =
status is easier to scan</div>
<div data-node-type=3D"line" id=3D"magicdomid258" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid2283" >2. Removing the relianc=
e on color for status</div>
<div data-node-type=3D"line" id=3D"magicdomid260" >&nbsp;</div>
<div data-node-type=3D"line" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid1145" >These are concerns we s=
hould discuss:</div>
<div data-node-type=3D"line" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid262" >1. Same concern as with =
the event logs proposal. We would want to save some screen</div>
<div data-node-type=3D"line" id=3D"magicdomid263" >real estate by using the=
 same filter and search pattern as in our proposed and tested</div>
<div data-node-type=3D"line" id=3D"magicdomid264" >event logs page. Why is =
the search filter width so small?</div>
<div data-node-type=3D"line" id=3D"magicdomid265" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid2290" >2. What is the differen=
ce between the Filter by Severity all and the all components dropdown?</div>
<div data-node-type=3D"line" id=3D"magicdomid267" >How many items are in th=
at dropdown?</div>
<div data-node-type=3D"line" id=3D"magicdomid268" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid2293" >3. Can the status icon =
be located in the status column rather than relying on text? Can we</div>
<div data-node-type=3D"line" id=3D"magicdomid2295" >use visually hidden tex=
t to maintain accessibility compliance and sorting functionality?</div>
<div data-node-type=3D"line" id=3D"magicdomid271" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid272" >4. What problem does hid=
ing the thresholds solve? Was it tested with any users?</div>
<div data-node-type=3D"line" id=3D"magicdomid273" >&nbsp;</div>
<div data-node-type=3D"line" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid1653" >&gt; This new UI introd=
uces:</div>
<div data-node-type=3D"line" id=3D"magicdomid276" >&gt; - Accordion-style n=
avigation</div>
<div data-node-type=3D"line" id=3D"magicdomid1354" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid1350" >The change of the navig=
ation pattern to an accordion style is a great change and one that</div>
<div data-node-type=3D"line" id=3D"magicdomid1351" >we have been discussing=
. That is also the pattern used by the Carbon Design System, which</div>
<div data-node-type=3D"line" id=3D"magicdomid1352" >is an open source libra=
ry backed by a team of IBM Designers, Developers, and a GitHub</div>
<div data-node-type=3D"line" id=3D"magicdomid1353" >community.</div>
<div data-node-type=3D"line" id=3D"magicdomid1355" >&nbsp;</div>
<div data-node-type=3D"line" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid277" >&gt; - Collapsible navig=
ation</div>
<div data-node-type=3D"line" id=3D"magicdomid1357" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid1359" >The collapsable primary=
 navigation panel is a great feature!</div>
<div data-node-type=3D"line" id=3D"magicdomid1360" >&nbsp;</div>
<div data-node-type=3D"line" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid278" >&gt; - Slim header to re=
duce vertical space</div>
<div data-node-type=3D"line" id=3D"magicdomid1362" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid1364" >The slim header is a gr=
eat improvement also. Previously, we&nbsp;discussed the need for the time s=
tamp&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid1365" >for the last data refre=
sh based on our testing with users. I believe we have already discussed the=
</div>
<div data-node-type=3D"line" id=3D"magicdomid1366" >accessibility issues wi=
th a hover only approach to access that information as well.</div>
<div data-node-type=3D"line" id=3D"magicdomid1367" >&nbsp;</div>
<div data-node-type=3D"line" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid279" >&gt; - Updated styling t=
o table and form elements &amp; page layout to improve user experience</div>
<div data-node-type=3D"line" id=3D"magicdomid1369" >&nbsp;</div>
<div data-node-type=3D"line" id=3D"magicdomid1370" >It is not clear what us=
er experience we are improving with the color palette update. The conversat=
ion</div>
<div data-node-type=3D"line" id=3D"magicdomid1371" >about this change has b=
een defined as making the design more modern. This is a subjective change</=
div>
<div data-node-type=3D"line" id=3D"magicdomid1407" >that we should base on =
qualitative data.&nbsp;From my perspective, the best path forward will be t=
o agree</div>
<div data-node-type=3D"line" >on a component library. I have added this top=
ic to the GUI Design Workgroup meeting this week. I</div>
<div data-node-type=3D"line" >would advocate for using the Carbon Design Sy=
stem and rely on theming to accommodate&nbsp;any differences</div>
<div data-node-type=3D"line" >in opinion over aesthetics that we aren't abl=
e to resolve.</div></div></div></div></div><BR>

