Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC88512E15D
	for <lists+openbmc@lfdr.de>; Thu,  2 Jan 2020 01:41:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47p8NZ61CRzDq72
	for <lists+openbmc@lfdr.de>; Thu,  2 Jan 2020 11:41:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=micwalsh@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ffDg3vPKzDq7j
 for <openbmc@lists.ozlabs.org>; Sat, 21 Dec 2019 06:38:21 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBKJbwFZ109424
 for <openbmc@lists.ozlabs.org>; Fri, 20 Dec 2019 14:38:16 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.91])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2x0xccmwkp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 20 Dec 2019 14:38:16 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <micwalsh@us.ibm.com>;
 Fri, 20 Dec 2019 19:38:15 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 20 Dec 2019 19:38:12 -0000
Received: from us1a3-mail105.a3.dal06.isc4sb.com ([10.146.21.201])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2019122019381213-888735 ;
 Fri, 20 Dec 2019 19:38:12 +0000 
In-Reply-To: <891637d68b4d48459658e139921a5b25@quantatw.com>
To: "=?Big5?B?VG9ueSBMZWUgKKf1pOW0SSk=?=" <Tony.Lee@quantatw.com>
From: "Michael Walsh" <micwalsh@us.ibm.com>
Date: Fri, 20 Dec 2019 13:38:05 -0600
References: <891637d68b4d48459658e139921a5b25@quantatw.com>
MIME-Version: 1.0
X-KeepSent: 1495226C:AC844C2F-002584D6:006B4FB7;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP10 SHF68 March 06, 2018
X-LLNOutbound: False
X-Disclaimed: 55767
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 006BD4E0862584D6_="
x-cbid: 19122019-2475-0000-0000-000001CD206F
X-IBM-SpamModules-Scores: BY=0.262103; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.429909; ST=0; TS=0; UL=0; ISC=; MB=0.002317
X-IBM-SpamModules-Versions: BY=3.00012272; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01307214; UDB=6.00694537; IPR=6.01089508; 
 MB=3.00030019; MTD=3.00000008; XFM=3.00000015; UTC=2019-12-20 19:38:14
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-12-20 13:57:18 - 6.00010786
x-cbparentid: 19122019-2476-0000-0000-00005127446F
Message-Id: <OF1495226C.AC844C2F-ON002584D6.006B4FB7-862584D6.006BD520@notes.na.collabserv.com>
Subject: Re:  JSON file boot_table in openbmc-test-automation
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-20_05:2019-12-17,2019-12-20 signatures=0
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Thu, 02 Jan 2020 11:32:08 +1100
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
 George Keishing <gkeishin@in.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--=_alternative 006BD4E0862584D6_=
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="Big5"

VGhlcmUgYXJlIHNldmVyYWwgJ1Bvd2VyIG9uJyBib290IHR5cGVzIHJlcHJlc2VudGVkIGluIA0K
ZGF0YS9ib290X3RhYmxlLmpzb24uICBMZXQncyB0YWtlIHRoZSAnUkVTVCBQb3dlciBPbicgYXMg
YW4gZXhhbXBsZToNCg0KICAgICJSRVNUIFBvd2VyIE9uIjogew0KICAgICAgICAic3RhcnQiOiB7
DQogICAgICAgICAgICAicmVzdCI6ICJeMSQiLA0KICAgICAgICAgICAgImNoYXNzaXMiOiAiXk9m
ZiQiLA0KICAgICAgICAgICAgImJvb3RfcHJvZ3Jlc3MiOiAiXk9mZnxVbnNwZWNpZmllZCQiLA0K
ICAgICAgICAgICAgIm9wZXJhdGluZ19zeXN0ZW0iOiAiXkluYWN0aXZlJCIsDQogICAgICAgICAg
ICAiaG9zdCI6ICJeT2ZmJCINCiAgICAgICAgfSwNCiAgICAgICAgImVuZCI6IHsNCiAgICAgICAg
ICAgICJyZXN0IjogIl4xJCIsDQogICAgICAgICAgICAiY2hhc3NpcyI6ICJeT24kIiwNCiAgICAg
ICAgICAgICJib290X3Byb2dyZXNzIjogIl5GVyBQcm9ncmVzcywgU3RhcnRpbmcgT1N8T1NTdGFy
dCQiLA0KICAgICAgICAgICAgIm9wZXJhdGluZ19zeXN0ZW0iOiAiXkJvb3RDb21wbGV0ZSQiLA0K
ICAgICAgICAgICAgImhvc3QiOiAiXlJ1bm5pbmckIiwNCiAgICAgICAgICAgICJvc19waW5nIjog
Il4xJCIsDQogICAgICAgICAgICAib3NfbG9naW4iOiAiXjEkIiwNCiAgICAgICAgICAgICJvc19y
dW5fY21kIjogIl4xJCINCiAgICAgICAgfSwNCiAgICAgICAgImJtY19yZWJvb3QiOiAwLA0KICAg
ICAgICAibWV0aG9kX3R5cGUiOiAia2V5d29yZCIsDQogICAgICAgICJtZXRob2QiOiAiSW5pdGlh
dGUgSG9zdCBCb290ICB3YWl0PSR7MH0iLA0KICAgICAgICAibGliX2ZpbGVfcGF0aCI6ICJzdGF0
ZV9tYW5hZ2VyLnJvYm90Ig0KICAgIH0sDQoNClRoZSBlbmQgcmVxdWlyZW1lbnRzIGluZGljYXRl
IHRoYXQgdGhlIG9wZXJhdGluZ19zeXN0ZW0gdmFsdWUgbXVzdCBiZSANCkJvb3RDb21wbGV0ZS4g
IEkndmUgbmV2ZXIgc2VlbiB0aGlzIGZhaWwgYmVjYXVzZSB0aGUgb3BlcmF0aW5nX3N5c3RlbSAN
CnN0YXRlIHdhcyAiU3RhbmRieSIuICBVbmxlc3MgeW91IGZvcmVzZWUgYSBjaGFuZ2UgY29taW5n
IHRoYXQgbmVjZXNzaXRhdGUgDQp0aGlzLCBJJ2QgYmUgaW5jbGluZWQgdG8gbGVhdmUgaXQgYXMg
aXMuICBBcyB0aGUgc2F5aW5nIGdvZXMgIklmIGl0IGFpbid0IA0KYnJva2UsIGRvbid0IGZpeCBp
dCIuDQoNCg0KTWljaGFlbCBXYWxzaA0KSUJNIERlcHQgM0FMDQpSb2NoZXN0ZXIsIE1ODQptaWN3
YWxzaEB1cy5pYm0uY29tDQoNCg0KDQoNCkZyb206ICAgIlRvbnkgTGVlICin9aTltEkpIiA8VG9u
eS5MZWVAcXVhbnRhdHcuY29tPg0KVG86ICAgICAibWljd2Fsc2hAdXMuaWJtLmNvbSIgPG1pY3dh
bHNoQHVzLmlibS5jb20+DQpDYzogICAgICJvcGVuYm1jQGxpc3RzLm96bGFicy5vcmciIDxvcGVu
Ym1jQGxpc3RzLm96bGFicy5vcmc+DQpEYXRlOiAgIDEyLzE5LzIwMTkgMDk6MjQgUE0NClN1Ympl
Y3Q6ICAgICAgICBbRVhURVJOQUxdIEpTT04gZmlsZSBib290X3RhYmxlIGluIG9wZW5ibWMtdGVz
dC1hdXRvbWF0aW9uDQoNCg0KDQpIaSBNaWNoYWVsLA0KDQpSZWZlciB0byB0aGUgbWV0aG9kIHJl
YWRIb3N0U3RhdGUoKSBpbiByZXBvIHBob3NwaG9yLWxvZ2dpbmcuIFRoZSANCmRlc2NyaXB0aW9u
IA0KIkZvciBob3N0IG9uLCBsb29rcyBmb3IgdGhlIHZhbHVlcyBvZiAnQm9vdENvbXBsZXRlJyBv
ciAnU3RhbmRieScNCmluIHRoZSBPcGVyYXRpbmdTeXN0ZW1TdGF0ZSBwcm9wZXJ0eSAuLi4iDQpT
bywgSSdtIHdvbmRlciB0aGF0IGlmIHRoZSB2YWx1ZSBvZiB0aGUga2V5ICJvcGVyYXRpbmdfc3lz
dGVtIiBjYW4gYmUNCiJeQm9vdENvbXBsZXRlfFN0YW5kYnkkIiBmb3IgYWN0aW9uICJQb3dlciBP
biIgaW4gdGhlIGJvb3RfdGFibGUuanNvbj8NCg0KVGhhbmtzDQpCZXN0IFJlZ2FyZHMsDQpUb255
DQoNCg0KDQoNCg0K

--=_alternative 006BD4E0862584D6_=
Content-Transfer-Encoding: base64
Content-Type: text/html; charset="Big5"

PHNwYW4gc3R5bGU9IiBmb250LXNpemU6MTFwdDtmb250LWZhbWlseTpUaW1lcyBOZXcgUm9tYW4i
PlRoZXJlIGFyZSBzZXZlcmFsDQonUG93ZXIgb24nIGJvb3QgdHlwZXMgcmVwcmVzZW50ZWQgaW4g
ZGF0YS9ib290X3RhYmxlLmpzb24uICZuYnNwO0xldCdzDQp0YWtlIHRoZSAnUkVTVCBQb3dlciBP
bicgYXMgYW4gZXhhbXBsZTo8L3NwYW4+PGJyPjxicj48c3BhbiBzdHlsZT0iIGZvbnQtc2l6ZTox
MXB0O2ZvbnQtZmFtaWx5OkNvdXJpZXIgTmV3Ij4mbmJzcDsgJm5ic3A7DQomcXVvdDtSRVNUIFBv
d2VyIE9uJnF1b3Q7OiB7PC9zcGFuPjxicj48c3BhbiBzdHlsZT0iIGZvbnQtc2l6ZToxMXB0O2Zv
bnQtZmFtaWx5OkNvdXJpZXIgTmV3Ij4mbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7ICZxdW90
O3N0YXJ0JnF1b3Q7OiB7PC9zcGFuPjxicj48c3BhbiBzdHlsZT0iIGZvbnQtc2l6ZToxMXB0O2Zv
bnQtZmFtaWx5OkNvdXJpZXIgTmV3Ij4mbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJnF1b3Q7cmVzdCZxdW90OzogJnF1b3Q7XjEkJnF1b3Q7LDwvc3Bhbj48YnI+PHNw
YW4gc3R5bGU9IiBmb250LXNpemU6MTFwdDtmb250LWZhbWlseTpDb3VyaWVyIE5ldyI+Jm5ic3A7
ICZuYnNwOw0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZxdW90O2NoYXNzaXMmcXVvdDs6
ICZxdW90O15PZmYkJnF1b3Q7LDwvc3Bhbj48YnI+PHNwYW4gc3R5bGU9IiBmb250LXNpemU6MTFw
dDtmb250LWZhbWlseTpDb3VyaWVyIE5ldyI+Jm5ic3A7ICZuYnNwOw0KJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZxdW90O2Jvb3RfcHJvZ3Jlc3MmcXVvdDs6ICZxdW90O15PZmZ8VW5zcGVj
aWZpZWQkJnF1b3Q7LDwvc3Bhbj48YnI+PHNwYW4gc3R5bGU9IiBmb250LXNpemU6MTFwdDtmb250
LWZhbWlseTpDb3VyaWVyIE5ldyI+Jm5ic3A7ICZuYnNwOw0KJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZxdW90O29wZXJhdGluZ19zeXN0ZW0mcXVvdDs6ICZxdW90O15JbmFjdGl2ZSQmcXVv
dDssPC9zcGFuPjxicj48c3BhbiBzdHlsZT0iIGZvbnQtc2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNv
dXJpZXIgTmV3Ij4mbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJnF1
b3Q7aG9zdCZxdW90OzogJnF1b3Q7Xk9mZiQmcXVvdDs8L3NwYW4+PGJyPjxzcGFuIHN0eWxlPSIg
Zm9udC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6Q291cmllciBOZXciPiZuYnNwOyAmbmJzcDsNCiZu
YnNwOyAmbmJzcDsgfSw8L3NwYW4+PGJyPjxzcGFuIHN0eWxlPSIgZm9udC1zaXplOjExcHQ7Zm9u
dC1mYW1pbHk6Q291cmllciBOZXciPiZuYnNwOyAmbmJzcDsNCiZuYnNwOyAmbmJzcDsgJnF1b3Q7
ZW5kJnF1b3Q7OiB7PC9zcGFuPjxicj48c3BhbiBzdHlsZT0iIGZvbnQtc2l6ZToxMXB0O2ZvbnQt
ZmFtaWx5OkNvdXJpZXIgTmV3Ij4mbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJnF1b3Q7cmVzdCZxdW90OzogJnF1b3Q7XjEkJnF1b3Q7LDwvc3Bhbj48YnI+PHNwYW4g
c3R5bGU9IiBmb250LXNpemU6MTFwdDtmb250LWZhbWlseTpDb3VyaWVyIE5ldyI+Jm5ic3A7ICZu
YnNwOw0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZxdW90O2NoYXNzaXMmcXVvdDs6ICZx
dW90O15PbiQmcXVvdDssPC9zcGFuPjxicj48c3BhbiBzdHlsZT0iIGZvbnQtc2l6ZToxMXB0O2Zv
bnQtZmFtaWx5OkNvdXJpZXIgTmV3Ij4mbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJnF1b3Q7Ym9vdF9wcm9ncmVzcyZxdW90OzogJnF1b3Q7XkZXIFByb2dyZXNzLA0K
U3RhcnRpbmcgT1N8T1NTdGFydCQmcXVvdDssPC9zcGFuPjxicj48c3BhbiBzdHlsZT0iIGZvbnQt
c2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNvdXJpZXIgTmV3Ij4mbmJzcDsgJm5ic3A7DQombmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgPC9zcGFuPjxzcGFuIHN0eWxlPSIgZm9udC1zaXplOjExcHQ7
Y29sb3I6Ymx1ZTtmb250LWZhbWlseTpDb3VyaWVyIE5ldyI+PGI+JnF1b3Q7b3BlcmF0aW5nX3N5
c3RlbSZxdW90OzoNCiZxdW90O15Cb290Q29tcGxldGUkJnF1b3Q7LDwvYj48L3NwYW4+PGJyPjxz
cGFuIHN0eWxlPSIgZm9udC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6Q291cmllciBOZXciPiZuYnNw
OyAmbmJzcDsNCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmcXVvdDtob3N0JnF1b3Q7OiAm
cXVvdDteUnVubmluZyQmcXVvdDssPC9zcGFuPjxicj48c3BhbiBzdHlsZT0iIGZvbnQtc2l6ZTox
MXB0O2ZvbnQtZmFtaWx5OkNvdXJpZXIgTmV3Ij4mbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJnF1b3Q7b3NfcGluZyZxdW90OzogJnF1b3Q7XjEkJnF1b3Q7LDwvc3Bh
bj48YnI+PHNwYW4gc3R5bGU9IiBmb250LXNpemU6MTFwdDtmb250LWZhbWlseTpDb3VyaWVyIE5l
dyI+Jm5ic3A7ICZuYnNwOw0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZxdW90O29zX2xv
Z2luJnF1b3Q7OiAmcXVvdDteMSQmcXVvdDssPC9zcGFuPjxicj48c3BhbiBzdHlsZT0iIGZvbnQt
c2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNvdXJpZXIgTmV3Ij4mbmJzcDsgJm5ic3A7DQombmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJnF1b3Q7b3NfcnVuX2NtZCZxdW90OzogJnF1b3Q7XjEkJnF1
b3Q7PC9zcGFuPjxicj48c3BhbiBzdHlsZT0iIGZvbnQtc2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNv
dXJpZXIgTmV3Ij4mbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7IH0sPC9zcGFuPjxicj48c3Bh
biBzdHlsZT0iIGZvbnQtc2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNvdXJpZXIgTmV3Ij4mbmJzcDsg
Jm5ic3A7DQombmJzcDsgJm5ic3A7ICZxdW90O2JtY19yZWJvb3QmcXVvdDs6IDAsPC9zcGFuPjxi
cj48c3BhbiBzdHlsZT0iIGZvbnQtc2l6ZToxMXB0O2ZvbnQtZmFtaWx5OkNvdXJpZXIgTmV3Ij4m
bmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7ICZxdW90O21ldGhvZF90eXBlJnF1b3Q7OiAmcXVv
dDtrZXl3b3JkJnF1b3Q7LDwvc3Bhbj48YnI+PHNwYW4gc3R5bGU9IiBmb250LXNpemU6MTFwdDtm
b250LWZhbWlseTpDb3VyaWVyIE5ldyI+Jm5ic3A7ICZuYnNwOw0KJm5ic3A7ICZuYnNwOyAmcXVv
dDttZXRob2QmcXVvdDs6ICZxdW90O0luaXRpYXRlIEhvc3QgQm9vdCAmbmJzcDt3YWl0PSR7MH0m
cXVvdDssPC9zcGFuPjxicj48c3BhbiBzdHlsZT0iIGZvbnQtc2l6ZToxMXB0O2ZvbnQtZmFtaWx5
OkNvdXJpZXIgTmV3Ij4mbmJzcDsgJm5ic3A7DQombmJzcDsgJm5ic3A7ICZxdW90O2xpYl9maWxl
X3BhdGgmcXVvdDs6ICZxdW90O3N0YXRlX21hbmFnZXIucm9ib3QmcXVvdDs8L3NwYW4+PGJyPjxz
cGFuIHN0eWxlPSIgZm9udC1zaXplOjExcHQ7Zm9udC1mYW1pbHk6Q291cmllciBOZXciPiZuYnNw
OyAmbmJzcDsNCn0sPC9zcGFuPjxicj48YnI+PHNwYW4gc3R5bGU9IiBmb250LXNpemU6MTFwdDtm
b250LWZhbWlseTpUaW1lcyBOZXcgUm9tYW4iPlRoZSBlbmQgcmVxdWlyZW1lbnRzDQppbmRpY2F0
ZSB0aGF0IHRoZSBvcGVyYXRpbmdfc3lzdGVtIHZhbHVlIG11c3QgYmUgQm9vdENvbXBsZXRlLiAm
bmJzcDtJJ3ZlDQpuZXZlciBzZWVuIHRoaXMgZmFpbCBiZWNhdXNlIHRoZSBvcGVyYXRpbmdfc3lz
dGVtIHN0YXRlIHdhcyAmcXVvdDtTdGFuZGJ5JnF1b3Q7Lg0KJm5ic3A7VW5sZXNzIHlvdSBmb3Jl
c2VlIGEgY2hhbmdlIGNvbWluZyB0aGF0IG5lY2Vzc2l0YXRlIHRoaXMsIEknZCBiZQ0KaW5jbGlu
ZWQgdG8gbGVhdmUgaXQgYXMgaXMuICZuYnNwO0FzIHRoZSBzYXlpbmcgZ29lcyAmcXVvdDtJZiBp
dCBhaW4ndA0KYnJva2UsIGRvbid0IGZpeCBpdCZxdW90Oy48L3NwYW4+PGJyPjxzcGFuIHN0eWxl
PSIgZm9udC1zaXplOjEwcHQ7Zm9udC1mYW1pbHk6c2Fucy1zZXJpZiI+PGJyPjxicj5NaWNoYWVs
IFdhbHNoPGJyPklCTSBEZXB0IDNBTDxicj5Sb2NoZXN0ZXIsIE1OPGJyPm1pY3dhbHNoQHVzLmli
bS5jb208YnI+PC9zcGFuPjxicj48YnI+PGJyPjxicj48c3BhbiBzdHlsZT0iIGZvbnQtc2l6ZTo5
cHQ7Y29sb3I6IzVmNWY1Zjtmb250LWZhbWlseTpzYW5zLXNlcmlmIj5Gcm9tOg0KJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7PC9zcGFuPjxzcGFuIHN0eWxlPSIgZm9udC1zaXplOjlwdDtmb250
LWZhbWlseTpzYW5zLXNlcmlmIj4mcXVvdDtUb255DQpMZWUgKKf1pOW0SSkmcXVvdDsgJmx0O1Rv
bnkuTGVlQHF1YW50YXR3LmNvbSZndDs8L3NwYW4+PGJyPjxzcGFuIHN0eWxlPSIgZm9udC1zaXpl
OjlwdDtjb2xvcjojNWY1ZjVmO2ZvbnQtZmFtaWx5OnNhbnMtc2VyaWYiPlRvOg0KJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7PC9zcGFuPjxzcGFuIHN0eWxlPSIgZm9udC1zaXplOjlwdDtmb250
LWZhbWlseTpzYW5zLXNlcmlmIj4mcXVvdDttaWN3YWxzaEB1cy5pYm0uY29tJnF1b3Q7DQombHQ7
bWljd2Fsc2hAdXMuaWJtLmNvbSZndDs8L3NwYW4+PGJyPjxzcGFuIHN0eWxlPSIgZm9udC1zaXpl
OjlwdDtjb2xvcjojNWY1ZjVmO2ZvbnQtZmFtaWx5OnNhbnMtc2VyaWYiPkNjOg0KJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7PC9zcGFuPjxzcGFuIHN0eWxlPSIgZm9udC1zaXplOjlwdDtmb250
LWZhbWlseTpzYW5zLXNlcmlmIj4mcXVvdDtvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcmcXVvdDsN
CiZsdDtvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcmZ3Q7PC9zcGFuPjxicj48c3BhbiBzdHlsZT0i
IGZvbnQtc2l6ZTo5cHQ7Y29sb3I6IzVmNWY1Zjtmb250LWZhbWlseTpzYW5zLXNlcmlmIj5EYXRl
Og0KJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7PC9zcGFuPjxzcGFuIHN0eWxlPSIgZm9udC1z
aXplOjlwdDtmb250LWZhbWlseTpzYW5zLXNlcmlmIj4xMi8xOS8yMDE5DQowOToyNCBQTTwvc3Bh
bj48YnI+PHNwYW4gc3R5bGU9IiBmb250LXNpemU6OXB0O2NvbG9yOiM1ZjVmNWY7Zm9udC1mYW1p
bHk6c2Fucy1zZXJpZiI+U3ViamVjdDoNCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOzwvc3Bh
bj48c3BhbiBzdHlsZT0iIGZvbnQtc2l6ZTo5cHQ7Zm9udC1mYW1pbHk6c2Fucy1zZXJpZiI+W0VY
VEVSTkFMXQ0KSlNPTiBmaWxlIGJvb3RfdGFibGUgaW4gb3BlbmJtYy10ZXN0LWF1dG9tYXRpb248
L3NwYW4+PGJyPjxociBub3NoYWRlPjxicj48YnI+PGJyPjx0dD48c3BhbiBzdHlsZT0iIGZvbnQt
c2l6ZToxMHB0Ij5IaSBNaWNoYWVsLDxicj48YnI+UmVmZXIgdG8gdGhlIG1ldGhvZCByZWFkSG9z
dFN0YXRlKCkgaW4gcmVwbyBwaG9zcGhvci1sb2dnaW5nLiBUaGUgZGVzY3JpcHRpb24NCjxicj4m
cXVvdDtGb3IgaG9zdCBvbiwgbG9va3MgZm9yIHRoZSB2YWx1ZXMgb2YgJ0Jvb3RDb21wbGV0ZScg
b3IgJ1N0YW5kYnknPGJyPmluIHRoZSBPcGVyYXRpbmdTeXN0ZW1TdGF0ZSBwcm9wZXJ0eSAuLi4m
cXVvdDs8YnI+U28sIEknbSB3b25kZXIgdGhhdCBpZiB0aGUgdmFsdWUgb2YgdGhlIGtleSAmcXVv
dDtvcGVyYXRpbmdfc3lzdGVtJnF1b3Q7DQpjYW4gYmU8YnI+JnF1b3Q7XkJvb3RDb21wbGV0ZXxT
dGFuZGJ5JCZxdW90OyBmb3IgYWN0aW9uICZxdW90O1Bvd2VyIE9uJnF1b3Q7IGluIHRoZQ0KYm9v
dF90YWJsZS5qc29uPzxicj48YnI+VGhhbmtzPGJyPkJlc3QgUmVnYXJkcyw8YnI+VG9ueTxicj48
YnI+PC9zcGFuPjwvdHQ+PGJyPjxicj48QlI+DQo=
--=_alternative 006BD4E0862584D6_=--

