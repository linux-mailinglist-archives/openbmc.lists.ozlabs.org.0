Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBC8113EFB
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2019 11:02:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TB8k4vtLzDqYt
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2019 21:02:14 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47TB7w1nN3zDqYt
 for <openbmc@lists.ozlabs.org>; Thu,  5 Dec 2019 21:01:31 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB59wGZu035911
 for <openbmc@lists.ozlabs.org>; Thu, 5 Dec 2019 05:01:28 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.66])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wpuqp9hrw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Dec 2019 05:01:28 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <gkeishin@in.ibm.com>;
 Thu, 5 Dec 2019 10:01:27 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 5 Dec 2019 10:01:25 -0000
Received: from us1a3-mail113.a3.dal06.isc4sb.com ([10.146.6.4])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2019120510012429-220336 ;
 Thu, 5 Dec 2019 10:01:24 +0000 
MIME-Version: 1.0
In-Reply-To: <DM6PR21MB1388C6C8108C54E31FE17527C85C0@DM6PR21MB1388.namprd21.prod.outlook.com>
To: Neeraj Ladkani <neladk@microsoft.com>
From: "George Keishing" <gkeishin@in.ibm.com>
Date: Thu, 5 Dec 2019 15:31:20 +0530
References: <DM6PR21MB1388C6C8108C54E31FE17527C85C0@DM6PR21MB1388.namprd21.prod.outlook.com>
X-KeepSent: 0655E19D:6A1C55A2-002584C7:00368E67;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 10.0.1 November 29, 2018
X-LLNOutbound: False
X-Disclaimed: 4775
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=8FBB0E54DFA508F78f9e8a93df938690918c8FBB0E54DFA508F7"
x-cbid: 19120510-4409-0000-0000-000001585FD9
X-IBM-SpamModules-Scores: BY=0.026386; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.410717; ST=0; TS=0; UL=0; ISC=; MB=0.000011
X-IBM-SpamModules-Versions: BY=3.00012199; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01299880; UDB=6.00690153; IPR=6.01082151; 
 MB=3.00029850; MTD=3.00000008; XFM=3.00000015; UTC=2019-12-05 10:01:27
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-12-05 09:57:17 - 6.00010731
x-cbparentid: 19120510-4410-0000-0000-00003D4AC813
Message-Id: <OF0655E19D.6A1C55A2-ON002584C7.00368E67-652584C7.00370E0C@notes.na.collabserv.com>
Subject: Re:  openbmc-test-automation
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-05_02:2019-12-04,2019-12-05 signatures=0
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0__=8FBB0E54DFA508F78f9e8a93df938690918c8FBB0E54DFA508F7
Content-type: multipart/alternative; 
	Boundary="1__=8FBB0E54DFA508F78f9e8a93df938690918c8FBB0E54DFA508F7"


--1__=8FBB0E54DFA508F78f9e8a93df938690918c8FBB0E54DFA508F7
Content-Transfer-Encoding: base64
Content-type: text/plain; charset=UTF-8

TmVlcmFqLA0KDQoJWW91IGNhbiBsb29rIGF0IHRob3NlIGZvciB0aGUgSVBNSQ0KDQpodHRwczov
L2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jLXRlc3QtYXV0b21hdGlvbi90cmVlL21hc3Rlci9p
cG1pDQoNCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMtdGVzdC1hdXRvbWF0aW9u
L3RyZWUvbWFzdGVyL3Rlc3RzL2lwbWkNCg0KICAgICAgICAgICAgICAgYW5kIGZvciByZWRmaXNo
IHRlc3QgaW4gZ2VuZXJhbA0KaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYy10ZXN0
LWF1dG9tYXRpb24vdHJlZS9tYXN0ZXIvcmVkZmlzaCAgYW5kDQoNCmh0dHBzOi8vZ2l0aHViLmNv
bS9vcGVuYm1jL29wZW5ibWMtdGVzdC1hdXRvbWF0aW9uL3RyZWUvbWFzdGVyL3JlZGZpc2gvZG10
Zl90b29scw0KIHdoaWNoIGFyZSB0b29scyBmcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9ETVRGLyBm
b3IgY29tcGxhaW5jZSB0ZXN0aW5nDQoNCg0KVGhhbmtzDQogICBHZW9yZ2UgS2Vpc2hpbmcNCg0K
DQoNCg0KRnJvbToJTmVlcmFqIExhZGthbmkgPG5lbGFka0BtaWNyb3NvZnQuY29tPg0KVG86CSJv
cGVuYm1jQGxpc3RzLm96bGFicy5vcmciIDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQpEYXRl
OgkwNS0xMi0yMDE5IDEyOjQyDQpTdWJqZWN0OglbRVhURVJOQUxdIG9wZW5ibWMtdGVzdC1hdXRv
bWF0aW9uDQpTZW50IGJ5Ogkib3BlbmJtYyIgPG9wZW5ibWMtYm91bmNlcw0KICAgICAgICAgICAg
K2drZWlzaGluPWluLmlibS5jb21AbGlzdHMub3psYWJzLm9yZz4NCg0KDQoNCklzIHRoZXJlIGFu
eSBJUE1JIGFuZCByZWRmaXNoIGNvbXBsaWFuY2UgdGVzdCBzdWl0cyBpbiB0aGUNCuKAnG9wZW5i
bWMtdGVzdC1hdXRvbWF0aW9u4oCdPyAgY2FuIGFueW9uZSBwb2ludCBtZSB0byB0aGUgc3VpdGU/
DQoNCk5lZXJhag0KDQoNCg==

--1__=8FBB0E54DFA508F78f9e8a93df938690918c8FBB0E54DFA508F7
Content-Transfer-Encoding: base64
Content-type: text/html; charset=UTF-8
Content-Disposition: inline

PGh0bWw+PGJvZHk+PHA+PGZvbnQgc2l6ZT0iMiI+TmVlcmFqLDwvZm9udD48YnI+PGJyPjxmb250
IHNpemU9IjIiPiAgICAgICAgWW91IGNhbiBsb29rIGF0IHRob3NlIGZvciB0aGUgSVBNSTwvZm9u
dD48YnI+PGZvbnQgc2l6ZT0iMiI+ICAgICAgICAgICAgICAgIDwvZm9udD48YSBocmVmPSJodHRw
czovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jLXRlc3QtYXV0b21hdGlvbi90cmVlL21hc3Rl
ci9pcG1pIj48Zm9udCBzaXplPSIyIj5odHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1j
LXRlc3QtYXV0b21hdGlvbi90cmVlL21hc3Rlci9pcG1pPC9mb250PjwvYT48Zm9udCBzaXplPSIy
Ij4gPC9mb250Pjxicj48Zm9udCBzaXplPSIyIj4gICAgICAgIDwvZm9udD48YSBocmVmPSJodHRw
czovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jLXRlc3QtYXV0b21hdGlvbi90cmVlL21hc3Rl
ci90ZXN0cy9pcG1pIj48Zm9udCBzaXplPSIyIj5odHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9v
cGVuYm1jLXRlc3QtYXV0b21hdGlvbi90cmVlL21hc3Rlci90ZXN0cy9pcG1pPC9mb250PjwvYT48
Zm9udCBzaXplPSIyIj4gPC9mb250Pjxicj48YnI+PGZvbnQgc2l6ZT0iMiI+ICAgICAgICAgICAg
ICAgYW5kIGZvciByZWRmaXNoIHRlc3QgaW4gZ2VuZXJhbCAgPC9mb250PjxhIGhyZWY9Imh0dHBz
Oi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMtdGVzdC1hdXRvbWF0aW9uL3RyZWUvbWFzdGVy
L3JlZGZpc2giPjxmb250IHNpemU9IjIiPmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5i
bWMtdGVzdC1hdXRvbWF0aW9uL3RyZWUvbWFzdGVyL3JlZGZpc2g8L2ZvbnQ+PC9hPjxmb250IHNp
emU9IjIiPiAgYW5kPC9mb250Pjxicj48Zm9udCBzaXplPSIyIj4gICAgICAgICAgICAgICA8L2Zv
bnQ+PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYy10ZXN0LWF1dG9t
YXRpb24vdHJlZS9tYXN0ZXIvcmVkZmlzaC9kbXRmX3Rvb2xzIj48Zm9udCBzaXplPSIyIj5odHRw
czovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jLXRlc3QtYXV0b21hdGlvbi90cmVlL21hc3Rl
ci9yZWRmaXNoL2RtdGZfdG9vbHM8L2ZvbnQ+PC9hPjxmb250IHNpemU9IjIiPiB3aGljaCBhcmUg
dG9vbHMgZnJvbSA8L2ZvbnQ+PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL0RNVEYvIj5odHRw
czovL2dpdGh1Yi5jb20vRE1URi88L2E+IGZvciBjb21wbGFpbmNlIHRlc3Rpbmc8YnI+PGJyPjxm
b250IHNpemU9IjIiPiAgICAgICAgPC9mb250Pjxicj48Yj48Zm9udCBzaXplPSIyIiBjb2xvcj0i
IzAwMDBGRiI+VGhhbmtzIDwvZm9udD48L2I+PGJyPjxmb250IHNpemU9IjIiIGNvbG9yPSIjMDAw
MEZGIj4gICBHZW9yZ2UgS2Vpc2hpbmc8L2ZvbnQ+PGJyPjxicj48YnI+PGltZyB3aWR0aD0iMTYi
IGhlaWdodD0iMTYiIHNyYz0iY2lkOjFfXz04RkJCMEU1NERGQTUwOEY3OGY5ZThhOTNkZjkzODY5
MDkxOGM4RkJAIiBib3JkZXI9IjAiIGFsdD0iSW5hY3RpdmUgaGlkZSBkZXRhaWxzIGZvciBOZWVy
YWogTGFka2FuaSAtLS0wNS0xMi0yMDE5IDEyOjQyOjIxLS0tSXMgdGhlcmUgYW55IElQTUkgYW5k
IHJlZGZpc2ggY29tcGxpYW5jZSB0ZXN0IHN1aXRzIGluIHRoZSAmcXVvdDtvIj48Zm9udCBzaXpl
PSIyIiBjb2xvcj0iIzQyNDI4MiI+TmVlcmFqIExhZGthbmkgLS0tMDUtMTItMjAxOSAxMjo0Mjoy
MS0tLUlzIHRoZXJlIGFueSBJUE1JIGFuZCByZWRmaXNoIGNvbXBsaWFuY2UgdGVzdCBzdWl0cyBp
biB0aGUgJnF1b3Q7b3BlbmJtYy10ZXN0LWF1dG9tYXRpb24mcXVvdDs/ICBjYW4gYW55b25lIHBv
PC9mb250Pjxicj48YnI+PGZvbnQgc2l6ZT0iMiIgY29sb3I9IiM1RjVGNUYiPkZyb206ICAgICAg
ICA8L2ZvbnQ+PGZvbnQgc2l6ZT0iMiI+TmVlcmFqIExhZGthbmkgJmx0O25lbGFka0BtaWNyb3Nv
ZnQuY29tJmd0OzwvZm9udD48YnI+PGZvbnQgc2l6ZT0iMiIgY29sb3I9IiM1RjVGNUYiPlRvOiAg
ICAgICAgPC9mb250Pjxmb250IHNpemU9IjIiPiZxdW90O29wZW5ibWNAbGlzdHMub3psYWJzLm9y
ZyZxdW90OyAmbHQ7b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnJmd0OzwvZm9udD48YnI+PGZvbnQg
c2l6ZT0iMiIgY29sb3I9IiM1RjVGNUYiPkRhdGU6ICAgICAgICA8L2ZvbnQ+PGZvbnQgc2l6ZT0i
MiI+MDUtMTItMjAxOSAxMjo0MjwvZm9udD48YnI+PGZvbnQgc2l6ZT0iMiIgY29sb3I9IiM1RjVG
NUYiPlN1YmplY3Q6ICAgICAgICA8L2ZvbnQ+PGZvbnQgc2l6ZT0iMiI+W0VYVEVSTkFMXSBvcGVu
Ym1jLXRlc3QtYXV0b21hdGlvbjwvZm9udD48YnI+PGZvbnQgc2l6ZT0iMiIgY29sb3I9IiM1RjVG
NUYiPlNlbnQgYnk6ICAgICAgICA8L2ZvbnQ+PGZvbnQgc2l6ZT0iMiI+JnF1b3Q7b3BlbmJtYyZx
dW90OyAmbHQ7b3BlbmJtYy1ib3VuY2VzK2drZWlzaGluPWluLmlibS5jb21AbGlzdHMub3psYWJz
Lm9yZyZndDs8L2ZvbnQ+PGJyPjxociB3aWR0aD0iMTAwJSIgc2l6ZT0iMiIgYWxpZ249ImxlZnQi
IG5vc2hhZGUgc3R5bGU9ImNvbG9yOiM4MDkxQTU7ICI+PGJyPjxicj48YnI+PGZvbnQgZmFjZT0i
Q2FsaWJyaSI+SXMgdGhlcmUgYW55IElQTUkgYW5kIHJlZGZpc2ggY29tcGxpYW5jZSB0ZXN0IHN1
aXRzIGluIHRoZSDigJxvcGVuYm1jLXRlc3QtYXV0b21hdGlvbuKAnT8gIGNhbiBhbnlvbmUgcG9p
bnQgbWUgdG8gdGhlIHN1aXRlPyA8L2ZvbnQ+PGJyPjxmb250IGZhY2U9IkNhbGlicmkiPiA8L2Zv
bnQ+PGJyPjxmb250IGZhY2U9IkNhbGlicmkiPk5lZXJhajwvZm9udD48YnI+PGZvbnQgZmFjZT0i
Q2FsaWJyaSI+IDwvZm9udD48YnI+PGJyPjxCUj4NCjwvYm9keT48L2h0bWw+DQo=

--1__=8FBB0E54DFA508F78f9e8a93df938690918c8FBB0E54DFA508F7--


--0__=8FBB0E54DFA508F78f9e8a93df938690918c8FBB0E54DFA508F7
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=8FBB0E54DFA508F78f9e8a93df938690918c8FB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=8FBB0E54DFA508F78f9e8a93df938690918c8FBB0E54DFA508F7--

