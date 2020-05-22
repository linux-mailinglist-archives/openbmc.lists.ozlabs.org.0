Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E881B1DE097
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 09:08:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SyHl3JdKzDqw4
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 17:08:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gkeishin@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SyGr2SCMzDqXl
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 17:07:09 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04M73bKQ076215
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 03:07:06 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.75])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3160mgws3w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 03:07:06 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <gkeishin@in.ibm.com>;
 Fri, 22 May 2020 07:07:05 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.123) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 22 May 2020 07:07:02 -0000
Received: from us1a3-mail113.a3.dal06.isc4sb.com ([10.146.6.4])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2020052207070195-126835 ;
 Fri, 22 May 2020 07:07:01 +0000 
MIME-Version: 1.0
In-Reply-To: <87d0d525b6bc4599b9f85ac0e28fbd0e@quantatw.com>
To: "=?Big5?B?VG9ueSBMZWUgKKf1pOW0SSk=?=" <Tony.Lee@quantatw.com>
From: "George Keishing" <gkeishin@in.ibm.com>
Date: Fri, 22 May 2020 12:36:56 +0530
References: <87d0d525b6bc4599b9f85ac0e28fbd0e@quantatw.com>
X-KeepSent: 37C9532D:ECA445ED-00258570:00265905;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 10.0.1 November 29, 2018
X-LLNOutbound: False
X-Disclaimed: 37751
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=8FBB0FE3DFB5DF958f9e8a93df938690918c8FBB0FE3DFB5DF95"
x-cbid: 20052207-6875-0000-0000-0000029D782B
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.410717; ST=0; TS=0; UL=0; ISC=; MB=0.121654
X-IBM-SpamModules-Versions: BY=3.00013139; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01380324; UDB=6.00738040; IPR=6.01162674; 
 MB=3.00032270; MTD=3.00000008; XFM=3.00000015; UTC=2020-05-22 07:07:03
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-05-22 02:17:56 - 6.00011391
x-cbparentid: 20052207-6876-0000-0000-0000233B93ED
Message-Id: <OF37C9532D.ECA445ED-ON00258570.00265905-65258570.0027169F@notes.na.collabserv.com>
Subject: Re:  Test suite 'test_event_logging' in openbmc-test-automation
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-22_02:2020-05-21,
 2020-05-22 signatures=0
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 openbmc <openbmc-bounces+gkeishin=in.ibm.com@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0__=8FBB0FE3DFB5DF958f9e8a93df938690918c8FBB0FE3DFB5DF95
Content-type: multipart/alternative; 
	Boundary="1__=8FBB0FE3DFB5DF958f9e8a93df938690918c8FBB0FE3DFB5DF95"


--1__=8FBB0FE3DFB5DF958f9e8a93df938690918c8FBB0FE3DFB5DF95
Content-Transfer-Encoding: base64
Content-type: text/plain; charset=Big5

DQoNCg0KRnJvbToJIlRvbnkgTGVlICin9aTltEkpIiA8VG9ueS5MZWVAcXVhbnRhdHcuY29tPg0K
VG86CSJzaXZhcy5zcnJAaW4uaWJtLmNvbSIgPHNpdmFzLnNyckBpbi5pYm0uY29tPg0KQ2M6CSJv
cGVuYm1jQGxpc3RzLm96bGFicy5vcmciIDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQpEYXRl
OgkyMi0wNS0yMDIwIDEyOjA0DQpTdWJqZWN0OglbRVhURVJOQUxdIFRlc3Qgc3VpdGUgJ3Rlc3Rf
ZXZlbnRfbG9nZ2luZycgaW4NCiAgICAgICAgICAgIG9wZW5ibWMtdGVzdC1hdXRvbWF0aW9uDQpT
ZW50IGJ5Ogkib3BlbmJtYyIgPG9wZW5ibWMtYm91bmNlcw0KICAgICAgICAgICAgK2drZWlzaGlu
PWluLmlibS5jb21AbGlzdHMub3psYWJzLm9yZz4NCg0KDQoNCkhpIFNpdmFzLA0KDQpUaGUga2V5
d29yZCAnQ3JlYXRlIFRlc3QgRXJyb3IgTG9nJyBpcyB1c2VkIGluIHRoaXMgdGVzdCBzdWl0ZSBh
bmQgdXNlIGENCmJpbmFyeSAnbG9nZ2luZy10ZXN0JyB0byBjcmVhdGUgdGhlIGVycm9yIGxvZy4N
Cg0KTXkgcXVlc3Rpb24gaXQgdGhhdCBob3cgZG9lcyB0aGUgJ2xvZ2dpbmctdGVzdCcgd29yayB0
byBjcmVhdGUgdGhlIGVycm9yDQpsb2c/DQpEb2VzIGl0IGFsc28gdXNlIHJlZGZpc2ggb3IgbWF5
YmUgY2FsbCBkYnVzIGluIEJNQz8NCg0KVGhhbmtzDQpCZXN0IFJlZ2FyZHMsDQpUb255DQotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KDQpIaSBUb255LA0KDQoJbG9nZ2luZy10ZXN0IGJpbmFyeSBjb21lcyBmcm9tIGJ1aWxkIHRh
cmJhbGwgZXhhbXBsZToNCm9ibWMtcGhvc3Bob3ItZGVidWctdGFyYmFsbC13aXRoZXJzcG9vbi50
YXIueHogZnJvbSB0aGUNCmh0dHBzOi8vb3BlbnBvd2VyLnh5ei8vam9iL29wZW5ibWMtYnVpbGQv
ICAgcGFnZQ0KICAgICAgVGhlIGxvZ2dpbmcgdGVzdCB1c2VzIHRoZSBkYnVzIGNhbGwgdG8gZ2Vu
ZXJhdGUgdGhvc2UgZXJyb3IgbG9nIGZvcg0KdGVzdGluZw0KaHR0cHM6Ly9naXRodWIuY29tL29w
ZW5ibWMvcGhvc3Bob3ItbG9nZ2luZy90cmVlL21hc3Rlci9waG9zcGhvci1sb2dnaW5nDQoJUmVm
ZXI6DQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1sb2dnaW5nL2Jsb2IvMzAw
NDdiZjk2NDcyMTU5NTFiYTVkZmUyMWNlYjNlNThhMWI0MDVhNC9sb2dnaW5nX3Rlc3QuY3BwDQoN
Cg0KVGhhbmtzDQpHZW9yZ2UNCg==

--1__=8FBB0FE3DFB5DF958f9e8a93df938690918c8FBB0FE3DFB5DF95
Content-Transfer-Encoding: base64
Content-type: text/html; charset=Big5
Content-Disposition: inline

PGh0bWw+PGJvZHk+PHA+PGltZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHNyYz0iY2lkOjFfXz04
RkJCMEZFM0RGQjVERjk1OGY5ZThhOTNkZjkzODY5MDkxOGM4RkJAIiBib3JkZXI9IjAiIGFsdD0i
SW5hY3RpdmUgaGlkZSBkZXRhaWxzIGZvciAmcXVvdDtUb255IExlZSAop/Wk5bRJKSZxdW90OyAt
LS0yMi0wNS0yMDIwIDEyOjA0OjMyLS0tSGkgU2l2YXMsIFRoZSBrZXl3b3JkICdDcmVhdGUgVGVz
dCBFcnJvciBMb2cnIGlzIHVzZWQiPjxmb250IHNpemU9IjIiIGNvbG9yPSIjNDI0MjgyIj4mcXVv
dDtUb255IExlZSAop/Wk5bRJKSZxdW90OyAtLS0yMi0wNS0yMDIwIDEyOjA0OjMyLS0tSGkgU2l2
YXMsIFRoZSBrZXl3b3JkICdDcmVhdGUgVGVzdCBFcnJvciBMb2cnIGlzIHVzZWQgaW4gdGhpcyB0
ZXN0IHN1aXRlIGFuZCB1c2UgYSBiaW5hcnkgJ2xvZ2dpbmctdDwvZm9udD48YnI+PGJyPjxmb250
IHNpemU9IjIiIGNvbG9yPSIjNUY1RjVGIj5Gcm9tOiAgICAgICAgPC9mb250Pjxmb250IHNpemU9
IjIiPiZxdW90O1RvbnkgTGVlICin9aTltEkpJnF1b3Q7ICZsdDtUb255LkxlZUBxdWFudGF0dy5j
b20mZ3Q7PC9mb250Pjxicj48Zm9udCBzaXplPSIyIiBjb2xvcj0iIzVGNUY1RiI+VG86ICAgICAg
ICA8L2ZvbnQ+PGZvbnQgc2l6ZT0iMiI+JnF1b3Q7c2l2YXMuc3JyQGluLmlibS5jb20mcXVvdDsg
Jmx0O3NpdmFzLnNyckBpbi5pYm0uY29tJmd0OzwvZm9udD48YnI+PGZvbnQgc2l6ZT0iMiIgY29s
b3I9IiM1RjVGNUYiPkNjOiAgICAgICAgPC9mb250Pjxmb250IHNpemU9IjIiPiZxdW90O29wZW5i
bWNAbGlzdHMub3psYWJzLm9yZyZxdW90OyAmbHQ7b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnJmd0
OzwvZm9udD48YnI+PGZvbnQgc2l6ZT0iMiIgY29sb3I9IiM1RjVGNUYiPkRhdGU6ICAgICAgICA8
L2ZvbnQ+PGZvbnQgc2l6ZT0iMiI+MjItMDUtMjAyMCAxMjowNDwvZm9udD48YnI+PGZvbnQgc2l6
ZT0iMiIgY29sb3I9IiM1RjVGNUYiPlN1YmplY3Q6ICAgICAgICA8L2ZvbnQ+PGZvbnQgc2l6ZT0i
MiI+W0VYVEVSTkFMXSBUZXN0IHN1aXRlICd0ZXN0X2V2ZW50X2xvZ2dpbmcnIGluIG9wZW5ibWMt
dGVzdC1hdXRvbWF0aW9uPC9mb250Pjxicj48Zm9udCBzaXplPSIyIiBjb2xvcj0iIzVGNUY1RiI+
U2VudCBieTogICAgICAgIDwvZm9udD48Zm9udCBzaXplPSIyIj4mcXVvdDtvcGVuYm1jJnF1b3Q7
ICZsdDtvcGVuYm1jLWJvdW5jZXMrZ2tlaXNoaW49aW4uaWJtLmNvbUBsaXN0cy5vemxhYnMub3Jn
Jmd0OzwvZm9udD48YnI+PGhyIHdpZHRoPSIxMDAlIiBzaXplPSIyIiBhbGlnbj0ibGVmdCIgbm9z
aGFkZSBzdHlsZT0iY29sb3I6IzgwOTFBNTsgIj48YnI+PGJyPjxicj48dHQ+PGZvbnQgc2l6ZT0i
MiI+SGkgU2l2YXMsPGJyPjxicj5UaGUga2V5d29yZCAnQ3JlYXRlIFRlc3QgRXJyb3IgTG9nJyBp
cyB1c2VkIGluIHRoaXMgdGVzdCBzdWl0ZSBhbmQgdXNlIGEgYmluYXJ5ICdsb2dnaW5nLXRlc3Qn
IHRvIGNyZWF0ZSB0aGUgZXJyb3IgbG9nLjxicj48YnI+TXkgcXVlc3Rpb24gaXQgdGhhdCBob3cg
ZG9lcyB0aGUgJ2xvZ2dpbmctdGVzdCcgd29yayB0byBjcmVhdGUgdGhlIGVycm9yIGxvZz88YnI+
RG9lcyBpdCBhbHNvIHVzZSByZWRmaXNoIG9yIG1heWJlIGNhbGwgZGJ1cyBpbiBCTUM/PGJyPjxi
cj5UaGFua3M8YnI+QmVzdCBSZWdhcmRzLDxicj5Ub255PGJyPi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tPC9mb250PjwvdHQ+PGJy
Pjxicj48dHQ+PGZvbnQgc2l6ZT0iMiI+SGkgVG9ueSw8L2ZvbnQ+PC90dD48YnI+PGJyPjx0dD48
Zm9udCBzaXplPSIyIj4gICAgICAgIGxvZ2dpbmctdGVzdCBiaW5hcnkgY29tZXMgZnJvbSBidWls
ZCB0YXJiYWxsIGV4YW1wbGU6IDwvZm9udD48L3R0Pm9ibWMtcGhvc3Bob3ItZGVidWctdGFyYmFs
bC13aXRoZXJzcG9vbi50YXIueHo8dHQ+PGZvbnQgc2l6ZT0iMiI+Jm5ic3A7ZnJvbSB0aGUgPC9m
b250PjwvdHQ+PGEgaHJlZj0iaHR0cHM6Ly9vcGVucG93ZXIueHl6Ly9qb2Ivb3BlbmJtYy1idWls
ZC8iPjx1Pjxmb250IGNvbG9yPSIjMDAwMEZGIj5odHRwczovL29wZW5wb3dlci54eXovL2pvYi9v
cGVuYm1jLWJ1aWxkLzwvZm9udD48L3U+PC9hPiA8dHQ+PGZvbnQgc2l6ZT0iMiI+Jm5ic3A7IHBh
Z2U8L2ZvbnQ+PC90dD48YnI+PHR0Pjxmb250IHNpemU9IjIiPiZuYnNwOyAmbmJzcDsgJm5ic3A7
IFRoZSBsb2dnaW5nIHRlc3QgdXNlcyB0aGUgZGJ1cyBjYWxsIHRvIGdlbmVyYXRlIHRob3NlIGVy
cm9yIGxvZyBmb3IgdGVzdGluZyA8L2ZvbnQ+PC90dD48YSBocmVmPSJodHRwczovL2dpdGh1Yi5j
b20vb3BlbmJtYy9waG9zcGhvci1sb2dnaW5nL3RyZWUvbWFzdGVyL3Bob3NwaG9yLWxvZ2dpbmci
Pjx1Pjxmb250IGNvbG9yPSIjMDAwMEZGIj5odHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9z
cGhvci1sb2dnaW5nL3RyZWUvbWFzdGVyL3Bob3NwaG9yLWxvZ2dpbmc8L2ZvbnQ+PC91PjwvYT4g
PHR0Pjxmb250IHNpemU9IjIiPjxicj4gICAgICAgIDwvZm9udD48L3R0Pjx0dD48Zm9udCBzaXpl
PSIyIj5SZWZlcjogPC9mb250PjwvdHQ+PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL29wZW5i
bWMvcGhvc3Bob3ItbG9nZ2luZy9ibG9iLzMwMDQ3YmY5NjQ3MjE1OTUxYmE1ZGZlMjFjZWIzZTU4
YTFiNDA1YTQvbG9nZ2luZ190ZXN0LmNwcCI+PHU+PGZvbnQgY29sb3I9IiMwMDAwRkYiPmh0dHBz
Oi8vZ2l0aHViLmNvbS9vcGVuYm1jL3Bob3NwaG9yLWxvZ2dpbmcvYmxvYi8zMDA0N2JmOTY0NzIx
NTk1MWJhNWRmZTIxY2ViM2U1OGExYjQwNWE0L2xvZ2dpbmdfdGVzdC5jcHA8L2ZvbnQ+PC91Pjwv
YT4gPGJyPjxicj48Zm9udCBzaXplPSIyIj5UaGFua3M8L2ZvbnQ+PGJyPjxmb250IHNpemU9IjIi
Pkdlb3JnZTwvZm9udD48QlI+DQo8L2JvZHk+PC9odG1sPg0K

--1__=8FBB0FE3DFB5DF958f9e8a93df938690918c8FBB0FE3DFB5DF95--


--0__=8FBB0FE3DFB5DF958f9e8a93df938690918c8FBB0FE3DFB5DF95
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=8FBB0FE3DFB5DF958f9e8a93df938690918c8FB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=8FBB0FE3DFB5DF958f9e8a93df938690918c8FBB0FE3DFB5DF95--

