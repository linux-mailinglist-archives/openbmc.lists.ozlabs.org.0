Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E67CE1733A3
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 10:19:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TPBT6kcfzDrBy
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 20:19:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gkeishin@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TP9k5X0YzDqyc
 for <openbmc@lists.ozlabs.org>; Fri, 28 Feb 2020 20:19:06 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01S9FGex136119
 for <openbmc@lists.ozlabs.org>; Fri, 28 Feb 2020 04:18:24 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.81])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yepwtpuh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 28 Feb 2020 04:18:23 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <gkeishin@in.ibm.com>;
 Fri, 28 Feb 2020 09:18:23 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 28 Feb 2020 09:18:19 -0000
Received: from us1a3-mail113.a3.dal06.isc4sb.com ([10.146.6.4])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2020022809181881-246457 ;
 Fri, 28 Feb 2020 09:18:18 +0000 
MIME-Version: 1.0
In-Reply-To: <2042ec12.4c6e.1708abdbe56.Coremail.ouyangxuan10@163.com>
To: www <ouyangxuan10@163.com>
From: "George Keishing" <gkeishin@in.ibm.com>
Date: Fri, 28 Feb 2020 14:48:17 +0530
References: <2042ec12.4c6e.1708abdbe56.Coremail.ouyangxuan10@163.com>
X-KeepSent: 6BA9A096:359A28D2-0025851C:0031FE4E;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 10.0.1 November 29, 2018
X-LLNOutbound: False
X-Disclaimed: 48915
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=8FBB0F8FDFA278DE8f9e8a93df938690918c8FBB0F8FDFA278DE"
x-cbid: 20022809-3067-0000-0000-0000027913BF
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.410717; ST=0; TS=0; UL=0; ISC=; MB=0.193079
X-IBM-SpamModules-Versions: BY=3.00012656; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000293; SDB=6.01340390; UDB=6.00714343; IPR=6.01122753; 
 MB=3.00031006; MTD=3.00000008; XFM=3.00000015; UTC=2020-02-28 09:18:21
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-02-28 07:42:33 - 6.00011058
x-cbparentid: 20022809-3068-0000-0000-000068FE63BB
Message-Id: <OF6BA9A096.359A28D2-ON0025851C.0031FE4E-6525851C.00331D18@notes.na.collabserv.com>
Subject: Re: [OpenBMC]: How to get the update progress when flashing BMC
 firmware?
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-28_02:2020-02-26,
 2020-02-28 signatures=0
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

--0__=8FBB0F8FDFA278DE8f9e8a93df938690918c8FBB0F8FDFA278DE
Content-type: multipart/alternative; 
	Boundary="1__=8FBB0F8FDFA278DE8f9e8a93df938690918c8FBB0F8FDFA278DE"


--1__=8FBB0F8FDFA278DE8f9e8a93df938690918c8FBB0F8FDFA278DE
Content-Transfer-Encoding: base64
Content-type: text/plain; charset=GB2312

DQoNCg0KRnJvbToJd3d3IDxvdXlhbmd4dWFuMTBAMTYzLmNvbT4NClRvOglvcGVuYm1jQGxpc3Rz
Lm96bGFicy5vcmcNCkRhdGU6CTI4LTAyLTIwMjAgMTM6MjcNClN1YmplY3Q6CVtFWFRFUk5BTF0g
W09wZW5CTUNdOiBIb3cgdG8gZ2V0IHRoZSB1cGRhdGUgcHJvZ3Jlc3Mgd2hlbg0KICAgICAgICAg
ICAgZmxhc2hpbmcgQk1DIGZpcm13YXJlPw0KU2VudCBieToJIm9wZW5ibWMiIDxvcGVuYm1jLWJv
dW5jZXMNCiAgICAgICAgICAgICtna2Vpc2hpbj1pbi5pYm0uY29tQGxpc3RzLm96bGFicy5vcmc+
DQoNCg0KDQpoaaOsDQoNCkhvdyB0byBnZXQgdGhlIHVwZGF0ZSBwcm9ncmVzcyB3aGVuIEJNQyBp
cyBmbGFzaGluZy4gSXQgY2FuIGJlIGRpc3BsYXllZCBvbg0Kd2VidWkuDQoNCnRoYW5rcywNCkJ5
cm9uDQoNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCg0K
Qnlyb24sDQoNCkZyb20gd2ViVUkNCgl5b3Ugc2hvdWxkIHNlZSB0aGUgdXBkYXRlIHN0YXR1cw0K
aHR0cHM6Ly94eC54eC54eC54eC8jL2NvbmZpZ3VyYXRpb24vZmlybXdhcmUgcGFnZQ0KDQpGcm9t
IFJFU1QsDQoNCglEbyBSRVNUIEdFVCBvZiAvcmVkZmlzaC92MS9VcGRhdGVTZXJ2aWNlL0Zpcm13
YXJlSW52ZW50b3J5LzE0ZmQ0NDI3DQpzdGF0dXM6DQogIFtIZWFsdGhdOiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgT0sNCiAgW0hlYWx0aFJvbGx1cF06ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgT0sNCiAgW1N0YXRlXTogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgVXBkYXRpbmcNCg0KV2hlcmUgMTRmZDQ0MjdpcyB0aGUgaW1hZ2UgaWQgd2hp
Y2ggeW91IGFyZSBhY3RpdmF0aW5nLCB5b3UnbGwgY2FuIHVzZSB0aGUNCnN0YXRlIHByb2dyZXNz
IHdoaWNoIHdpbGwgdGVsbCBpZiB1cGRhdGUgaXMgaW4gcHJvZ3Jlc3MuDQoNCglvciBBbHRlcm5h
dGVseSwgZG8gUkVTVCBHRVQNCnJlcXVlc3QgL3h5ei9vcGVuYm1jX3Byb2plY3Qvc29mdHdhcmUv
MTRmZDQ0MjcNCg0KUmVzcG9uc2UgY29kZToyMDAsIENvbnRlbnQ6ew0KICAiZGF0YSI6IHsNCiAg
ICAiQWN0aXZhdGlvbiI6DQoieHl6Lm9wZW5ibWNfcHJvamVjdC5Tb2Z0d2FyZS5BY3RpdmF0aW9u
LkFjdGl2YXRpb25zLkFjdGl2YXRpbmciLA0KICAgICJBc3NvY2lhdGlvbnMiOiBbDQogICAgICBb
DQogICAgICAgICJpbnZlbnRvcnkiLA0KICAgICAgICAiYWN0aXZhdGlvbiIsDQogICAgICAgICIi
DQogICAgICBdDQogICAgXSwNCiAgICAiUGF0aCI6ICIvdG1wL2ltYWdlcy8xNGZkNDQyNyIsDQog
ICAgIlByb2dyZXNzIjogMzAsDQogICAgIlB1cnBvc2UiOiAieHl6Lm9wZW5ibWNfcHJvamVjdC5T
b2Z0d2FyZS5WZXJzaW9uLlZlcnNpb25QdXJwb3NlLkJNQyIsDQogICAgIlJlcXVlc3RlZEFjdGl2
YXRpb24iOg0KInh5ei5vcGVuYm1jX3Byb2plY3QuU29mdHdhcmUuQWN0aXZhdGlvbi5SZXF1ZXN0
ZWRBY3RpdmF0aW9ucy5BY3RpdmUiLA0KICAgICJWZXJzaW9uIjogIjIuOC4wLWRldi0xMjgzLWcz
MDk4OTc1OWMiDQogIH0sDQogICJtZXNzYWdlIjogIjIwMCBPSyIsDQogICJzdGF0dXMiOiAib2si
DQp9DQoNCg0KDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQogICBHZW9yZ2UgS2Vpc2hpbmcNCg0KDQoN
Cg0KDQoNCg0KDQoNCg==

--1__=8FBB0F8FDFA278DE8f9e8a93df938690918c8FBB0F8FDFA278DE
Content-Transfer-Encoding: base64
Content-type: text/html; charset=GB2312
Content-Disposition: inline

PGh0bWw+PGJvZHk+PHA+PGltZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHNyYz0iY2lkOjFfXz04
RkJCMEY4RkRGQTI3OERFOGY5ZThhOTNkZjkzODY5MDkxOGM4RkJAIiBib3JkZXI9IjAiIGFsdD0i
SW5hY3RpdmUgaGlkZSBkZXRhaWxzIGZvciB3d3cgLS0tMjgtMDItMjAyMCAxMzoyNzo0OC0tLWhp
o6wgSG93IHRvIGdldCB0aGUgdXBkYXRlIHByb2dyZXNzIHdoZW4gQk1DIGlzIGZsYXNoaW5nLiBJ
dCBjYW4gYmUgZGlzIj48Zm9udCBzaXplPSIyIiBjb2xvcj0iIzQyNDI4MiI+d3d3IC0tLTI4LTAy
LTIwMjAgMTM6Mjc6NDgtLS1oaaOsIEhvdyB0byBnZXQgdGhlIHVwZGF0ZSBwcm9ncmVzcyB3aGVu
IEJNQyBpcyBmbGFzaGluZy4gSXQgY2FuIGJlIGRpc3BsYXllZCBvbiB3ZWJ1aS48L2ZvbnQ+PGJy
Pjxicj48Zm9udCBzaXplPSIyIiBjb2xvcj0iIzVGNUY1RiI+RnJvbTogICAgICAgIDwvZm9udD48
Zm9udCBzaXplPSIyIj53d3cgJmx0O291eWFuZ3h1YW4xMEAxNjMuY29tJmd0OzwvZm9udD48YnI+
PGZvbnQgc2l6ZT0iMiIgY29sb3I9IiM1RjVGNUYiPlRvOiAgICAgICAgPC9mb250Pjxmb250IHNp
emU9IjIiPm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzwvZm9udD48YnI+PGZvbnQgc2l6ZT0iMiIg
Y29sb3I9IiM1RjVGNUYiPkRhdGU6ICAgICAgICA8L2ZvbnQ+PGZvbnQgc2l6ZT0iMiI+MjgtMDIt
MjAyMCAxMzoyNzwvZm9udD48YnI+PGZvbnQgc2l6ZT0iMiIgY29sb3I9IiM1RjVGNUYiPlN1Ympl
Y3Q6ICAgICAgICA8L2ZvbnQ+PGZvbnQgc2l6ZT0iMiI+W0VYVEVSTkFMXSBbT3BlbkJNQ106IEhv
dyB0byBnZXQgdGhlIHVwZGF0ZSBwcm9ncmVzcyB3aGVuIGZsYXNoaW5nIEJNQyBmaXJtd2FyZT88
L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiIGNvbG9yPSIjNUY1RjVGIj5TZW50IGJ5OiAgICAgICAg
PC9mb250Pjxmb250IHNpemU9IjIiPiZxdW90O29wZW5ibWMmcXVvdDsgJmx0O29wZW5ibWMtYm91
bmNlcytna2Vpc2hpbj1pbi5pYm0uY29tQGxpc3RzLm96bGFicy5vcmcmZ3Q7PC9mb250Pjxicj48
aHIgd2lkdGg9IjEwMCUiIHNpemU9IjIiIGFsaWduPSJsZWZ0IiBub3NoYWRlIHN0eWxlPSJjb2xv
cjojODA5MUE1OyAiPjxicj48YnI+PGJyPjxmb250IGZhY2U9IkFyaWFsIj5oaaOsPC9mb250Pjxi
cj48YnI+PGZvbnQgZmFjZT0iQXJpYWwiPkhvdyB0byBnZXQgdGhlIHVwZGF0ZSBwcm9ncmVzcyB3
aGVuIEJNQyBpcyBmbGFzaGluZy4gSXQgY2FuIGJlIGRpc3BsYXllZCBvbiB3ZWJ1aS48L2ZvbnQ+
PGJyPjxicj48Zm9udCBmYWNlPSJBcmlhbCI+dGhhbmtzLDwvZm9udD48YnI+PGZvbnQgZmFjZT0i
QXJpYWwiPkJ5cm9uPC9mb250Pjxicj48YnI+PGJyPi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLTxicj48YnI+PGJyPjxmb250IHNpemU9IjIiIGZhY2U9IkNlbnR1cnkg
R290aGljIj5CeXJvbiw8L2ZvbnQ+PGJyPjxicj48Yj48Zm9udCBzaXplPSIyIiBmYWNlPSJDZW50
dXJ5IEdvdGhpYyI+RnJvbSB3ZWJVSTwvZm9udD48L2I+PGJyPjxiPjxmb250IHNpemU9IjIiIGZh
Y2U9IkNlbnR1cnkgR290aGljIj4gICAgICAgIHlvdSBzaG91bGQgc2VlIHRoZSB1cGRhdGUgc3Rh
dHVzIDwvZm9udD48L2I+PGEgaHJlZj0iaHR0cHM6Ly94eC54eC54eC54eC8jL2NvbmZpZ3VyYXRp
b24vZmlybXdhcmUiPjxiPjxmb250IHNpemU9IjIiIGZhY2U9IkNlbnR1cnkgR290aGljIj5odHRw
czovL3h4Lnh4Lnh4Lnh4LyMvY29uZmlndXJhdGlvbi9maXJtd2FyZTwvZm9udD48L2I+PC9hPjxi
Pjxmb250IHNpemU9IjIiIGZhY2U9IkNlbnR1cnkgR290aGljIj4gcGFnZTwvZm9udD48L2I+PGJy
Pjxicj48Yj48Zm9udCBzaXplPSIyIiBmYWNlPSJDZW50dXJ5IEdvdGhpYyI+RnJvbSBSRVNULCA8
L2ZvbnQ+PC9iPjxicj48YnI+PGI+PGZvbnQgc2l6ZT0iMiIgZmFjZT0iQ2VudHVyeSBHb3RoaWMi
PiAgICAgICAgRG8gUkVTVCBHRVQgb2YgL3JlZGZpc2gvdjEvVXBkYXRlU2VydmljZS9GaXJtd2Fy
ZUludmVudG9yeS8xNGZkNDQyNzwvZm9udD48L2I+PGJyPjxpPjxmb250IHNpemU9IjIiIGZhY2U9
IkNlbnR1cnkgR290aGljIj5zdGF0dXM6PC9mb250PjwvaT48YnI+PGk+PGZvbnQgc2l6ZT0iMiIg
ZmFjZT0iQ2VudHVyeSBHb3RoaWMiPiAgW0hlYWx0aF06ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBPSzwvZm9udD48L2k+PGJyPjxpPjxmb250IHNpemU9IjIiIGZhY2U9IkNl
bnR1cnkgR290aGljIj4gIFtIZWFsdGhSb2xsdXBdOiAgICAgICAgICAgICAgICAgICAgICAgICAg
IE9LPC9mb250PjwvaT48YnI+PGk+PGZvbnQgc2l6ZT0iMiIgZmFjZT0iQ2VudHVyeSBHb3RoaWMi
PiAgW1N0YXRlXTogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVXBkYXRp
bmc8L2ZvbnQ+PC9pPjxicj48Zm9udCBzaXplPSIyIiBmYWNlPSJDZW50dXJ5IEdvdGhpYyI+ICA8
L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIiIGZhY2U9IkNlbnR1cnkgR290aGljIj5XaGVyZSA8L2Zv
bnQ+PGI+PGZvbnQgc2l6ZT0iMiIgZmFjZT0iQ2VudHVyeSBHb3RoaWMiPjE0ZmQ0NDI3PC9mb250
PjwvYj48Zm9udCBzaXplPSIyIiBmYWNlPSJDZW50dXJ5IEdvdGhpYyI+aXMgdGhlIGltYWdlIGlk
IHdoaWNoIHlvdSBhcmUgYWN0aXZhdGluZywgeW91J2xsIGNhbiB1c2UgdGhlIHN0YXRlIHByb2dy
ZXNzIHdoaWNoIHdpbGwgdGVsbCBpZiB1cGRhdGUgaXMgaW4gcHJvZ3Jlc3MuIDwvZm9udD48YnI+
PGJyPjxiPjxmb250IHNpemU9IjIiIGZhY2U9IkNlbnR1cnkgR290aGljIj4gICAgICAgIG9yIEFs
dGVybmF0ZWx5LCBkbyBSRVNUIEdFVCByZXF1ZXN0IC94eXovb3BlbmJtY19wcm9qZWN0L3NvZnR3
YXJlLzE0ZmQ0NDI3PC9mb250PjwvYj48YnI+PGJyPjxpPjxmb250IHNpemU9IjIiIGZhY2U9IkNl
bnR1cnkgR290aGljIj5SZXNwb25zZSBjb2RlOjIwMCwgQ29udGVudDp7PC9mb250PjwvaT48YnI+
PGk+PGZvbnQgc2l6ZT0iMiIgZmFjZT0iQ2VudHVyeSBHb3RoaWMiPiAgJnF1b3Q7ZGF0YSZxdW90
OzogezwvZm9udD48L2k+PGJyPjxpPjxmb250IHNpemU9IjIiIGZhY2U9IkNlbnR1cnkgR290aGlj
Ij4gICAgJnF1b3Q7QWN0aXZhdGlvbiZxdW90OzogJnF1b3Q7eHl6Lm9wZW5ibWNfcHJvamVjdC5T
b2Z0d2FyZS5BY3RpdmF0aW9uLkFjdGl2YXRpb25zLkFjdGl2YXRpbmcmcXVvdDssPC9mb250Pjwv
aT48YnI+PGk+PGZvbnQgc2l6ZT0iMiIgZmFjZT0iQ2VudHVyeSBHb3RoaWMiPiAgICAmcXVvdDtB
c3NvY2lhdGlvbnMmcXVvdDs6IFs8L2ZvbnQ+PC9pPjxicj48aT48Zm9udCBzaXplPSIyIiBmYWNl
PSJDZW50dXJ5IEdvdGhpYyI+ICAgICAgWzwvZm9udD48L2k+PGJyPjxpPjxmb250IHNpemU9IjIi
IGZhY2U9IkNlbnR1cnkgR290aGljIj4gICAgICAgICZxdW90O2ludmVudG9yeSZxdW90Oyw8L2Zv
bnQ+PC9pPjxicj48aT48Zm9udCBzaXplPSIyIiBmYWNlPSJDZW50dXJ5IEdvdGhpYyI+ICAgICAg
ICAmcXVvdDthY3RpdmF0aW9uJnF1b3Q7LDwvZm9udD48L2k+PGJyPjxpPjxmb250IHNpemU9IjIi
IGZhY2U9IkNlbnR1cnkgR290aGljIj4gICAgICAgICZxdW90OyZxdW90OzwvZm9udD48L2k+PGJy
PjxpPjxmb250IHNpemU9IjIiIGZhY2U9IkNlbnR1cnkgR290aGljIj4gICAgICBdPC9mb250Pjwv
aT48YnI+PGk+PGZvbnQgc2l6ZT0iMiIgZmFjZT0iQ2VudHVyeSBHb3RoaWMiPiAgICBdLDwvZm9u
dD48L2k+PGJyPjxpPjxmb250IHNpemU9IjIiIGZhY2U9IkNlbnR1cnkgR290aGljIj4gICAgJnF1
b3Q7UGF0aCZxdW90OzogJnF1b3Q7L3RtcC9pbWFnZXMvMTRmZDQ0MjcmcXVvdDssPC9mb250Pjwv
aT48YnI+PGk+PGZvbnQgc2l6ZT0iMiIgZmFjZT0iQ2VudHVyeSBHb3RoaWMiPiAgICAmcXVvdDtQ
cm9ncmVzcyZxdW90OzogMzAsPC9mb250PjwvaT48YnI+PGk+PGZvbnQgc2l6ZT0iMiIgZmFjZT0i
Q2VudHVyeSBHb3RoaWMiPiAgICAmcXVvdDtQdXJwb3NlJnF1b3Q7OiAmcXVvdDt4eXoub3BlbmJt
Y19wcm9qZWN0LlNvZnR3YXJlLlZlcnNpb24uVmVyc2lvblB1cnBvc2UuQk1DJnF1b3Q7LDwvZm9u
dD48L2k+PGJyPjxpPjxmb250IHNpemU9IjIiIGZhY2U9IkNlbnR1cnkgR290aGljIj4gICAgJnF1
b3Q7UmVxdWVzdGVkQWN0aXZhdGlvbiZxdW90OzogJnF1b3Q7eHl6Lm9wZW5ibWNfcHJvamVjdC5T
b2Z0d2FyZS5BY3RpdmF0aW9uLlJlcXVlc3RlZEFjdGl2YXRpb25zLkFjdGl2ZSZxdW90Oyw8L2Zv
bnQ+PC9pPjxicj48aT48Zm9udCBzaXplPSIyIiBmYWNlPSJDZW50dXJ5IEdvdGhpYyI+ICAgICZx
dW90O1ZlcnNpb24mcXVvdDs6ICZxdW90OzIuOC4wLWRldi0xMjgzLWczMDk4OTc1OWMmcXVvdDs8
L2ZvbnQ+PC9pPjxicj48aT48Zm9udCBzaXplPSIyIiBmYWNlPSJDZW50dXJ5IEdvdGhpYyI+ICB9
LDwvZm9udD48L2k+PGJyPjxpPjxmb250IHNpemU9IjIiIGZhY2U9IkNlbnR1cnkgR290aGljIj4g
ICZxdW90O21lc3NhZ2UmcXVvdDs6ICZxdW90OzIwMCBPSyZxdW90Oyw8L2ZvbnQ+PC9pPjxicj48
aT48Zm9udCBzaXplPSIyIiBmYWNlPSJDZW50dXJ5IEdvdGhpYyI+ICAmcXVvdDtzdGF0dXMmcXVv
dDs6ICZxdW90O29rJnF1b3Q7PC9mb250PjwvaT48YnI+PGk+PGZvbnQgc2l6ZT0iMiIgZmFjZT0i
Q2VudHVyeSBHb3RoaWMiPn08L2ZvbnQ+PC9pPjxicj48YnI+PGJyPjxicj48Yj48Zm9udCBzaXpl
PSIyIiBjb2xvcj0iIzAwMDBGRiI+VGhhbmtzIGFuZCBSZWdhcmRzLDwvZm9udD48L2I+PGJyPjxm
b250IHNpemU9IjIiIGNvbG9yPSIjMDAwMEZGIj4gICBHZW9yZ2UgS2Vpc2hpbmc8L2ZvbnQ+PGJy
Pg0KPHA+IA0KPHA+PHA+PEJSPg0KPC9ib2R5PjwvaHRtbD4NCg==

--1__=8FBB0F8FDFA278DE8f9e8a93df938690918c8FBB0F8FDFA278DE--


--0__=8FBB0F8FDFA278DE8f9e8a93df938690918c8FBB0F8FDFA278DE
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=8FBB0F8FDFA278DE8f9e8a93df938690918c8FB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=8FBB0F8FDFA278DE8f9e8a93df938690918c8FBB0F8FDFA278DE--

