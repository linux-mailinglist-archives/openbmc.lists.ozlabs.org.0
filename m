Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 323A6BAD55
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 06:42:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cBWz4t8CzDqKS
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 14:42:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=thalerj@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Z4r00gFtzF3Kc
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 04:19:24 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8JIDBjj146876
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 14:19:22 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.81])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v4bjk8u0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 14:19:21 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <thalerj@us.ibm.com>;
 Thu, 19 Sep 2019 18:19:21 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 19 Sep 2019 18:19:11 -0000
Received: from us1a3-mail169.a3.dal06.isc4sb.com ([10.146.71.113])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2019091918191110-785554 ;
 Thu, 19 Sep 2019 18:19:11 +0000 
To: kunyi@google.com, vijaykhemka@fb.com, "OpenBMC Maillist"
 <openbmc@lists.ozlabs.org>, Paul.Vancil@dell.com,
 neladk@microsoft.com, gmills@linux.vnet.ibm.com, vishwa
 <vishwa@linux.vnet.ibm.com>
Subject: Telemetry Streaming from OpenBMC
From: "Justin Thaler" <thalerj@us.ibm.com>
Date: Thu, 19 Sep 2019 13:19:12 -0500
MIME-Version: 1.0
X-KeepSent: 55B322CE:9F04B4EE-0025847A:006361B7;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP7 Octobe4, 2013
X-LLNOutbound: False
X-Disclaimed: 35223
X-TNEFEvaluated: 1
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"
x-cbid: 19091918-3067-0000-0000-000000C3395A
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.406879; ST=0; TS=0; UL=0; ISC=; MB=0.014723
X-IBM-SpamModules-Versions: BY=3.00011803; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01263668; UDB=6.00668322; IPR=6.01045553; 
 MB=3.00028711; MTD=3.00000008; XFM=3.00000015; UTC=2019-09-19 18:19:18
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-09-19 16:40:48 - 6.00010426
x-cbparentid: 19091918-3068-0000-0000-000011E2652F
Message-Id: <OF55B322CE.9F04B4EE-ON0025847A.006361B7-8625847A.0064A24B@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-19_05:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Mon, 23 Sep 2019 14:40:35 +1000
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
Cc: Todd Rosedahl <rosedahl@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQWxsLA0KDQpJ4oCZbSBub3Qgc3VyZSBpZiB0aGlzIHNob3VsZCBiZSBhIHNlcGFyYXRlIG5v
dGUgb3Igbm90LiBJJ3ZlIGFsc28gbm90IGJlZW4gDQphYmxlIHRvIGpvaW4gdGhpcyB3b3JrZ3Jv
dXAsIGhvd2V2ZXIgYWxsIG9mIG15IGNvbmNlcm5zIGFwcGVhciB0byBoYXZlIA0KYmVlbiBkaXNj
dXNzZWQuIC4gSeKAmXZlIHN0YXJ0ZWQgcmV2aWV3aW5nIHNvbWUgb2YgdGhlIHRlbGVtZXRyeSAN
CmNvbnZlcnNhdGlvbiBmb3Igb3BlbmJtYywgYW5kIGhhdmUgdGFrZW4gc29tZSB0aW1lIHJldmll
dyB0aGUgd2lraSBhbmQgDQpoYXZlIGFsc28gcmV2aWV3ZWQgdGhlIGRvY3VtZW50IHByb3Bvc2Fs
LiBCYXNlZCBvbiBteSBleHBlcmllbmNlLCB0aGVyZeKAmXMgDQp0d28gY29yZSB1c2UgY2FzZXM6
IHRlbGVtZXRyeSBzdHJlYW1zLCBhbmQgdGVsZW1ldHJ5IHJlcG9ydHMuIFRoZSBSZXBvcnRzIA0K
YXJlIGEgY29sbGVjdCBhbmQgYW5hbHl6ZSBsYXRlciBtZXRob2QsIHR5cGljYWxseSB1c2VkIGZv
ciBzeXN0ZW0gDQpwcm9maWxpbmcsIGpvYiBwcm9maWxpbmcsIGFuZCBhbmFseXRpY3Mgb2YgZGF0
YSBjZW50ZXIgdXNhZ2Ugb3ZlciB0aW1lLiANCkZvciB0aGUgc3RyZWFtcywgdGhlc2UgYXJlIGJl
aW5nIHVzZWQgdG8gYWxsb3cgdGhlIGRhdGEgY2VudGVyIHRvIHJlYWN0IHRvIA0KY2hhbmdlcyBh
Y3Jvc3MgdGhlIG1hbmFnZWQgc3lzdGVtcywgbGlrZSBpbmNyZWFzaW5nIHdhdGVyIGZsb3csIGNv
b2xpbmcgDQpjYXBhY2l0eSwgb3IgcG93ZXIgdGhyb3R0bGluZyBzeXN0ZW1zIHRvIHByZXZlbnQg
b3ZlciBzdWJzY3JpcHRpb25zIG9uIHRoZSANCmRhdGEgY2VudGVy4oCZcyBwb3dlciBncmlkLg0K
DQpJ4oCZZCBsaWtlIHRvIGFzayBhYm91dCB0aGUgc3RyZWFtcyBzaW5jZSB0aGUgcmVwb3J0IHBv
cnRpb24gb2YgdGhpbmdzIHNlZW1zIA0KZXhjZXB0aW9uYWxseSB3ZWxsIGNvdmVyZWQuIFdpdGgg
cHJldmlvdXMgdmVyc2lvbnMgb2Ygb3BlbkJNQyBJIHdhcyBhYmxlIA0KdG8gbGV2ZXJhZ2Ugd2Vi
c29ja2V0cyB0byBnZXQgdXBkYXRlcyBvbiBzZW5zb3IgdmFsdWVzIG9uIGNoYW5nZS4gVGhpcyAN
CnR1cm5lZCBvdXQgdG8gYmUgcHJldHR5IG5ldHdvcmsgZWZmaWNpZW50IGFuZCBpcyBhYmxlIHRv
IGRyaXZlIDEvcyB1cGRhdGVzIA0Kb24gYWxsIHRoZSBzZW5zb3JzIGluIGEgc3lzdGVtLiBJdCBk
b2VzbuKAmXQgaGF2ZSBhbiBpbXBhY3Qgb24gb3RoZXIgDQptb25pdG9yaW5nIHNlcnZpY2VzIGVp
dGhlci4gVGhhdCBiZWluZyBzYWlkLCBJ4oCZdmUgYmVlbiByZWFkaW5nIHRocm91Z2ggdGhlIA0K
cmVkZmlzaCB0ZWxlbWV0cnkgYW5kIGV2ZW50aW5nIHNlcnZpY2VzIGFuZCB3YXMgbG9va2luZyBm
b3Igc29tZSBoZWxwIGFuZCANCm9yIGd1aWRhbmNlLiBGb3IgcmVmZXJlbmNlIEkgd2FzIGxvb2tp
bmcgYXQgdGhpcyBkb2N1bWVudCANCmh0dHBzOi8vd3d3LmRtdGYub3JnL3NpdGVzL2RlZmF1bHQv
ZmlsZXMvc3RhbmRhcmRzL2RvY3VtZW50cy9EU1AwMjY2XzEuNi4wLnBkZiANCi4NCg0KSWYgSSBk
byBzdWJzY3JpYmUgdXNpbmcgU1NFIGFuZCB0ZWxlbWV0cnkgcmVwb3J0cywgaXQgc2VlbXMgdG8g
YmUgc2V0dXAgdG8gDQpnZXQgYSBmdWxsIHNldCBvZiByZWFkaW5ncyBvdmVyIHRpbWUgYW5kIG9u
bHkgc2VuZCB3aGVuIHRoZSByZXBvcnQgaXMgDQpjb21wbGV0ZS4gQ2FuIEkgdXNlIHRoZXNlIHJl
cG9ydHMgdG8gZ2V0IHVwZGF0ZXMgZXZlcnkgc2Vjb25kPyBJZiBJIA0Kc3Vic2NyaWJlIHRvIGFu
IGVuZHBvaW50LCBJIGFsc28gc2VlbSB0byBnZXQgdGhlIGVudGlyZSBlbmRwb2ludCBhbmQgSeKA
mW0gDQpub3Qgc3VyZSBpZiB0aGlzIHdvdWxkIG1lZXQgYSBnb2FsIG9mIGdldHRpbmcgdGhlIGxh
cmdlIGNsdXN0ZXIgKDMwMCANCnN5c3RlbXMpIHdvcnRoIG9mIHVwZGF0ZXMgYXQgYSBkYXRhIHJh
dGUgb2YgbGVzcyB0aGFuIDIwIE1iL3MuIEkgd291bGQgDQphcHByZWNpYXRlIGFueSBhZHZpY2Ug
b24gbGV2ZXJhZ2luZyByZWRmaXNoIHN0YW5kYXJkcyB0byBzdHJlYW0gc2Vuc29yIA0KcmVhZGlu
Z3MgZm9yIGFuIE9wZW5CTUMgc3lzdGVtLiBJZiBJJ20gbm90IGFibGUgdG8gdXNlIHJlZGZpc2gs
IEknZCBiZSANCmhhcHB5IHRvIGVsYWJvcmF0ZSBtb3JlIG9uIHRoZSB3ZWJzb2NrZXQgbWV0aG9k
IEkgdXNlZCB3aXRoIHRoZSBwaG9zcGhvciANCndlYnNlcnZlciBhbmQgZGlzY3VzcyBvcHRpb25z
IGZvciB0aGUgY3VycmVudC9mdXR1cmUgQk1DIHZlcnNpb25zIA0KbGV2ZXJhZ2luZyBibWN3ZWIu
IA0KDQpUaGFua3MsDQpKdXN0aW4gVGhhbGVyDQpTZW5pb3IgUkFTIEVuZ2luZWVyDQoNCg==

