Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A26AF14C195
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 21:26:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486dS86BpVzDqMg
	for <lists+openbmc@lfdr.de>; Wed, 29 Jan 2020 07:26:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=piotr.matuszczak@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486dRL6nD2zDqK5
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jan 2020 07:25:44 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 12:25:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,375,1574150400"; d="scan'208";a="223635613"
Received: from irsmsx105.ger.corp.intel.com ([163.33.3.28])
 by fmsmga008.fm.intel.com with ESMTP; 28 Jan 2020 12:25:36 -0800
Received: from irsmsx603.ger.corp.intel.com (163.33.146.9) by
 irsmsx105.ger.corp.intel.com (163.33.3.28) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 28 Jan 2020 20:25:36 +0000
Received: from irsmsx606.ger.corp.intel.com (163.33.146.139) by
 irsmsx603.ger.corp.intel.com (163.33.146.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 28 Jan 2020 20:25:35 +0000
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139]) by
 IRSMSX606.ger.corp.intel.com ([163.33.146.139]) with mapi id 15.01.1713.004;
 Tue, 28 Jan 2020 20:25:35 +0000
From: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>
To: Neeraj Ladkani <neladk@microsoft.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "kunyi@google.com" <kunyi@google.com>,
 "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>
Subject: RE: OpenBMC Platform telemetry and health monitoring Work Group
Thread-Topic: OpenBMC Platform telemetry and health monitoring Work Group
Thread-Index: AdXKQcbfGBfhoAISS+WO4z/Ia3YwmQLyUmVAAANaf5A=
Date: Tue, 28 Jan 2020 20:25:35 +0000
Message-ID: <c3ae8b3db9f1468d97dd517d2e81baa0@intel.com>
References: <CH2PR21MB1510415F901CDB5B566834A4C8350@CH2PR21MB1510.namprd21.prod.outlook.com>
 <CH2PR21MB151058EC4BE0F0D7175F14CCC80A0@CH2PR21MB1510.namprd21.prod.outlook.com>
In-Reply-To: <CH2PR21MB151058EC4BE0F0D7175F14CCC80A0@CH2PR21MB1510.namprd21.prod.outlook.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTg3NTVhZTktYTFlZC00NjA1LTg2NjAtMjI1MzQyZTEyZTE0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiQmdTdEtKRVpJODEwUU95cFZhcXB3R1JMVWRpd1wvaU5FdGFOU25oTWx3cEw1UHU4QWVaTVFsNk52bG0wcllcL0pWIn0=
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: request-justification,no-action
x-ctpclassification: CTP_NT
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2020-01-28T18:46:31.7687604Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=c8e805fe-f1f0-455e-a826-3bf3fd9d769c;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
x-originating-ip: [163.33.253.164]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: "Ren, Zhikui" <zhikui.ren@intel.com>,
 Jeff Booher-Kaeding <Jeff.Booher-Kaeding@arm.com>,
 Brad Chou <bradc@hyvedesignsolutions.com>, Tom Sand <trsand@us.ibm.com>,
 Michael Lim <youhour@us.ibm.com>, Justin
 Thaler <thalerj@linux.vnet.ibm.com>, Reed B Frandsen <rfrandse@us.ibm.com>,
 Dong Wei <Dong.Wei@arm.com>, Camvan T Nguyen <ctnguyen@us.ibm.com>, Matt
 Chen/WYHQ/Wiwynn <Matt_Chen@wiwynn.com>,
 "Joshua_Giles@Dell.com" <Joshua_Giles@Dell.com>,
 Saqib Khan <khansa@us.ibm.com>, "rhanley@google.com" <rhanley@google.com>,
 Martin Haukali <martinh@graphcore.ai>,
 =?utf-8?B?QnVkZHkgSHVhbmcgKOm7g+Wkqem0uyk=?= <Buddy.Huang@quantatw.com>,
 Joe P Mulholland <jpmulhol@us.ibm.com>, Luke Chen <luke_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SSB3aWxsIGFkZCBsaXN0IG9mIHN1cHBvcnRlZCBvcGVyYXRvcnMsIGFsc28sIGluIG9yZGVyIHRv
IG1ha2UgdGhlIHNwZWMgY29tcGxldGUsIEkgd291bGQgbGlrZSB0byBhZGQgc29tZSBhcmNoaXRl
Y3R1cmUgb2YgdGhlIHNlbnNvci4gSSB3aWxsIHN1Ym1pdCBpdCB0byB0aGUgY29tbXVuaXR5IGFm
dGVyIHRvbW9ycm93IGRpc2N1c3Npb24gd2l0aCB0aGUgRE1URiBhYm91dCByZXF1aXJlZCBNZXRy
aWNEZWZpbml0aW9uIHNjaGVtYSBjaGFuZ2VzLg0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQpGcm9tOiBOZWVyYWogTGFka2FuaSA8bmVsYWRrQG1pY3Jvc29mdC5jb20+DQpTZW50OiBU
dWVzZGF5LCBKYW51YXJ5IDI4LCAyMDIwIDc6NDcgUE0NClRvOiBvcGVuYm1jQGxpc3RzLm96bGFi
cy5vcmc7IE1hdHVzemN6YWssIFBpb3RyIDxwaW90ci5tYXR1c3pjemFrQGludGVsLmNvbT47IGt1
bnlpQGdvb2dsZS5jb207IFBhdWwuVmFuY2lsQGRlbGwuY29tDQpDYzogTWFydGluIEhhdWthbGkg
PG1hcnRpbmhAZ3JhcGhjb3JlLmFpPjsgUmVuLCBaaGlrdWkgPHpoaWt1aS5yZW5AaW50ZWwuY29t
PjsgSm9lIFAgTXVsaG9sbGFuZCA8anBtdWxob2xAdXMuaWJtLmNvbT47IE1pY2hhZWwgTGltIDx5
b3Vob3VyQHVzLmlibS5jb20+OyByaGFubGV5QGdvb2dsZS5jb207IENhbXZhbiBUIE5ndXllbiA8
Y3RuZ3V5ZW5AdXMuaWJtLmNvbT47IENocmlzIEF1c3RlbiA8YXVzdGVuY0B1cy5pYm0uY29tPjsg
SnVzdGluIFRoYWxlciA8dGhhbGVyakBsaW51eC52bmV0LmlibS5jb20+OyBKZWZmIEJvb2hlci1L
YWVkaW5nIDxKZWZmLkJvb2hlci1LYWVkaW5nQGFybS5jb20+OyBKb3NodWFfR2lsZXNARGVsbC5j
b207IFJlZWQgQiBGcmFuZHNlbiA8cmZyYW5kc2VAdXMuaWJtLmNvbT47IE1hdHQgQ2hlbi9XWUhR
L1dpd3lubiA8TWF0dF9DaGVuQHdpd3lubi5jb20+OyBMdWtlIENoZW4gPGx1a2VfY2hlbkBhc3Bl
ZWR0ZWNoLmNvbT47IEJyYWQgQ2hvdSA8YnJhZGNAaHl2ZWRlc2lnbnNvbHV0aW9ucy5jb20+OyBE
b25nIFdlaSA8RG9uZy5XZWlAYXJtLmNvbT47IEJ1ZGR5IEh1YW5nICjpu4PlpKnptLspIDxCdWRk
eS5IdWFuZ0BxdWFudGF0dy5jb20+OyBUb20gU2FuZCA8dHJzYW5kQHVzLmlibS5jb20+OyBTYXFp
YiBLaGFuIDxraGFuc2FAdXMuaWJtLmNvbT4NClN1YmplY3Q6IFJFOiBPcGVuQk1DIFBsYXRmb3Jt
IHRlbGVtZXRyeSBhbmQgaGVhbHRoIG1vbml0b3JpbmcgV29yayBHcm91cA0KDQpJIGhhdmUgYSBj
b25mbGljdCB0b2RheSBhbmQgY2Fubm90IG1ha2UgdG8gbWVldGluZy4gUGxlYXNlIGZlZWwgZnJl
ZSB0byBtZWV0IGFuZCBoYXZlIHRoZSBkaXNjdXNzaW9uIGFsaXZlLg0KDQpQaW90ciwgSSBoYXZl
IHJldmlld2VkIHlvdXIgc3BlYyBhbmQgbG9va3MgZ29vZCB0byBtZSwgUGxlYXNlIHN1Ym1pdCBm
b3IgY29tbXVuaXR5IHJldmlldy4NCg0KDQpOZWVyYWoNCg0KDQotLS0tLU9yaWdpbmFsIEFwcG9p
bnRtZW50LS0tLS0NCkZyb206IE5lZXJhaiBMYWRrYW5pDQpTZW50OiBNb25kYXksIEphbnVhcnkg
MTMsIDIwMjAgMTA6NDkgQU0NClRvOiBOZWVyYWogTGFka2FuaTsgb3BlbmJtY0BsaXN0cy5vemxh
YnMub3JnOyBNYXR1c3pjemFrLCBQaW90cjsga3VueWlAZ29vZ2xlLmNvbTsgUGF1bC5WYW5jaWxA
ZGVsbC5jb20NCkNjOiBNYXJ0aW4gSGF1a2FsaTsgUmVuLCBaaGlrdWk7IEpvZSBQIE11bGhvbGxh
bmQ7IE1pY2hhZWwgTGltOyByaGFubGV5QGdvb2dsZS5jb207IENhbXZhbiBUIE5ndXllbjsgQ2hy
aXMgQXVzdGVuOyBKdXN0aW4gVGhhbGVyOyBKZWZmIEJvb2hlci1LYWVkaW5nOyBKb3NodWFfR2ls
ZXNARGVsbC5jb207IFJlZWQgQiBGcmFuZHNlbjsgTWF0dCBDaGVuL1dZSFEvV2l3eW5uOyBMdWtl
IENoZW47IEJyYWQgQ2hvdTsgRG9uZyBXZWk7IEJ1ZGR5IEh1YW5nICjpu4PlpKnptLspOyBUb20g
U2FuZDsgU2FxaWIgS2hhbg0KU3ViamVjdDogT3BlbkJNQyBQbGF0Zm9ybSB0ZWxlbWV0cnkgYW5k
IGhlYWx0aCBtb25pdG9yaW5nIFdvcmsgR3JvdXANCldoZW46IFR1ZXNkYXksIEphbnVhcnkgMjgs
IDIwMjAgMTI6MzAgUE0tMTowMCBQTSAoVVRDLTA4OjAwKSBQYWNpZmljIFRpbWUgKFVTICYgQ2Fu
YWRhKS4NCldoZXJlOiBNaWNyb3NvZnQgVGVhbXMgTWVldGluZw0KDQpOZXcgc2VyaWVzIGZvciAy
MDIwLg0KDQpXZSB3aWxsIGNvbnRpbnVlIHRhbGtpbmcgYWJvdXQgcHJvZ3Jlc3MgYW5kIGFkZGl0
aW9uIHRvIGN1cnJlbnQgdGVsZW1ldHJ5IGRlc2lnbi4NCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQpodHRwczovL3RlYW1zLm1pY3Jvc29mdC5jb20vbC9tZWV0dXAtam9pbi8xOSUzYW1lZXRpbmdf
TWpGalpURTVaak10TXpVeE55MDBabVE1TFdFMU1ESXRZV00yTVRSaFpURXlPRGhsJTQwdGhyZWFk
LnYyLzA/Y29udGV4dD0lN2IlMjJUaWQlMjIlM2ElMjI3MmY5ODhiZi04NmYxLTQxYWYtOTFhYi0y
ZDdjZDAxMWRiNDclMjIlMmMlMjJPaWQlMjIlM2ElMjIxYzI5YzJmNy1kMzg2LTRjNWEtYTNiYy0w
ZWUxM2I0OGJjNjUlMjIlN2QNCnRlbDorMSUyMDMyMy04NDktNDg3NCwsNzEwMDMxNDMzIyAgICBV
bml0ZWQgU3RhdGVzLCBMb3MgQW5nZWxlcyAoVG9sbCkgdGVsOig4NjYpJTIwNjc5LTk5OTUsLDcx
MDAzMTQzMyMgICAgKFRvbGwtZnJlZSkgQ29uZmVyZW5jZSBJRDogNzEwIDAzMSA0MzMjDQpodHRw
czovL2RpYWxpbi50ZWFtcy5taWNyb3NvZnQuY29tLzg1NTFmNGMxLWJlYTMtNDQxYS04NzM4LTY5
YWE1MTdhOTFjNT9pZD03MTAwMzE0MzMgfCBodHRwczovL215c2V0dGluZ3MubHluYy5jb20vcHN0
bmNvbmZlcmVuY2luZyB8IGh0dHBzOi8vYWthLm1zL0pvaW5UZWFtc01lZXRpbmcgfCBodHRwczov
L3RlYW1zLm1pY3Jvc29mdC5jb20vbWVldGluZ09wdGlvbnMvP29yZ2FuaXplcklkPTFjMjljMmY3
LWQzODYtNGM1YS1hM2JjLTBlZTEzYjQ4YmM2NSZ0ZW5hbnRJZD03MmY5ODhiZi04NmYxLTQxYWYt
OTFhYi0yZDdjZDAxMWRiNDcmdGhyZWFkSWQ9MTlfbWVldGluZ19NakZqWlRFNVpqTXRNelV4Tnkw
MFptUTVMV0UxTURJdFlXTTJNVFJoWlRFeU9EaGxAdGhyZWFkLnYyJm1lc3NhZ2VJZD0wJmxhbmd1
YWdlPWVuLVVTDQpKb2luIHdpdGggYSB2aWRlbyBjb25mZXJlbmNpbmcgZGV2aWNlDQptYWlsdG86
ODEzODc4ODk2QHQucGxjbS52YyBWVEMgQ29uZmVyZW5jZSBJRDogMDE0ODk2NDc1Nw0KaHR0cHM6
Ly9kaWFsaW4ucGxjbS52Yy90ZWFtcy8/a2V5PTgxMzg3ODg5NiZjb25mPTAxNDg5NjQ3NTcNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fDQoNCg==
