Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0762814EA72
	for <lists+openbmc@lfdr.de>; Fri, 31 Jan 2020 11:07:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 488CYw0LkwzDqgf
	for <lists+openbmc@lfdr.de>; Fri, 31 Jan 2020 21:07:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=piotr.matuszczak@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 488CYC64ZSzDqbh
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jan 2020 21:06:22 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 02:06:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,385,1574150400"; 
 d="md'?scan'208";a="223579087"
Received: from irsmsx151.ger.corp.intel.com ([163.33.192.59])
 by fmsmga007.fm.intel.com with ESMTP; 31 Jan 2020 02:06:17 -0800
Received: from irsmsx603.ger.corp.intel.com (163.33.146.9) by
 IRSMSX151.ger.corp.intel.com (163.33.192.59) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 31 Jan 2020 10:06:16 +0000
Received: from irsmsx606.ger.corp.intel.com (163.33.146.139) by
 irsmsx603.ger.corp.intel.com (163.33.146.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 31 Jan 2020 10:06:16 +0000
Received: from irsmsx606.ger.corp.intel.com ([163.33.146.139]) by
 IRSMSX606.ger.corp.intel.com ([163.33.146.139]) with mapi id 15.01.1713.004;
 Fri, 31 Jan 2020 10:06:16 +0000
From: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>
To: "gmills@linux.vnet.ibm.com" <gmills@linux.vnet.ibm.com>,
 "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>, Neeraj Ladkani
 <neladk@microsoft.com>
Subject: User-defined metrics - MetricDefinition Redfish schema change proposal
Thread-Topic: User-defined metrics - MetricDefinition Redfish schema change
 proposal
Thread-Index: AdXYHOwkd/2YXD5/S9iSlIZrl9FIHA==
Date: Fri, 31 Jan 2020 10:06:16 +0000
Message-ID: <0ed2056122a54c17ab997961796b0330@intel.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOWU3MGU1NTYtYjE3Mi00ODMxLThhODItMDA2NmExMTc4ZWQwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoic1BJNlorSFprVUU5SHkrOWM0d25QbW50TjQ5QUFudnVKblV2UzYweUJjMVJjTEZBTXdPMTlrTVhmdUpiRnBOQiJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-originating-ip: [163.33.253.164]
Content-Type: multipart/mixed;
 boundary="_002_0ed2056122a54c17ab997961796b0330intelcom_"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_002_0ed2056122a54c17ab997961796b0330intelcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

As a result of OpenBMC telemetry WG meetings, I would like to present Metri=
cDefinition schema change proposal to the DMTF. I would like to give you he=
ads-up. I attach the change proposal description.

Piotr Matuszczak
---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173, 80-298 Gdansk
KRS 101882
NIP 957-07-52-316


--_002_0ed2056122a54c17ab997961796b0330intelcom_
Content-Type: application/octet-stream;
	name="MetricDefinition_schema_change_proposal.md"
Content-Description: MetricDefinition_schema_change_proposal.md
Content-Disposition: attachment;
	filename="MetricDefinition_schema_change_proposal.md"; size=4929;
	creation-date="Fri, 17 Jan 2020 12:23:14 GMT";
	modification-date="Fri, 31 Jan 2020 09:47:44 GMT"
Content-Transfer-Encoding: base64

IyBNZXRyaWNEZWZpbml0aW9uIFJlZGZpc2ggc2NoZW1hIGNoYW5nZSBwcm9wb3NhbA0KDQojIyBC
YWNrZ3JvdW5kDQpUaGUgUmVkZmlzaCBUZWxlbWV0cnkgU2VydmljZSBpcyB0aGUgQVBJIGZvciBt
ZXRyaWMgbWFuYWdlbWVudC4gSXQgaGFzIHRoZQ0KY2FwYWJpbGl0eSBvZiBhZ2dyZWdhdGluZyBt
ZXRyaWMgcmVwb3J0cyB1c2luZyBleGlzdGluZyBSZWRmaXNoIHNlbnNvcnMgYW5kDQpzdXBwb3J0
cyBzaW1wbGUgb3BlcmF0aW9ucyBvbiBtZXRyaWNzLCBsaWtlIGF2ZXJhZ2UsIG1pbiwgbWF4IGFu
ZCBzdW0gb2YNCm1ldHJpY3Mgb2YgdGhlIHNhbWUgdHlwZS4gTW9zdCBvZiB0aGVzZSBzaW1wbGUg
b3BlcmF0aW9ucyBhcmUgc2luZ2xlLWFyZ3VtZW50LA0KZXhjZXB0IG9mIHN1bSwgYnV0IGl0IGlz
IGxpbWl0ZWQgdG8gdGhlIHJlYWRpbmdzIG9mIHRoZSBzYW1lIHR5cGUgc2Vuc29ycywNCmZvciBl
eGFtcGxlIHN1bSBvZiBQU1UgaW5wdXQgcG93ZXIgc2Vuc29ycyBvZiBhbGwgUFNVcyBwcmVzZW50
IG9uIHRoZSBwbGF0Zm9ybS4NCg0KVGhlcmUgYXJlIGFsc28gc3ludGhlc2l6ZWQgc2Vuc29ycywg
d2hpY2ggcmVhZGluZ3MgYXJlIGNhbGN1bGF0ZWQgb3V0IG9mDQptZXRyaWNzIGN1cnJlbnRseSBj
b2xsZWN0ZWQgYnkgdGhlIEJNQy4gVGhvc2Ugc2Vuc29ycyBhcmUgZXhwb3NlZCBvdmVyIHRoZQ0K
UmVkZmlzaCBhcyBuZXcgc2Vuc29ycyBhbmQgYXJlIHN1cHBvcnRlZCBhcyBhbnkgb3RoZXIgc2Vu
c29yLiBUaGUgbWFpbg0KZGlzYWR2YW50YWdlIG9mIHRoZXNlIHNlbnNvcnMgaXMgdGhhdCB0aGV5
IGNhbm5vdCBiZSBkZWZpbmVkIGluIHJ1bnRpbWUuIFRoZXkNCnJlcXVpcmUgdG8gYmUgaW1wbGVt
ZW50ZWQgaW4gdGhlIEJNQydzIGNvZGUgYW5kIGFueSBjaGFuZ2UgcmVxdWlyZXMgQk1DJ3MNCnVw
ZGF0ZS4gDQoNCiMjIE1vdGl2YXRpb24NCkluIG9yZGVyIHRvIG92ZXJjb21lIHRoZSBsaW1pdGF0
aW9uIG9mIGV4aXN0aW5nIHNlbnNvcnMgaW1wbGVtZW50YXRpb25zLA0KdXNlci1kZWZpbmVkIHNl
bnNvcnMgYXJlIGludHJvZHVjZWQuIFRoZSB1c2UgY2FzZSBpcyB0byBjcmVhdGUgbmV3IG1ldHJp
YyB1c2luZw0KZXhpc3Rpbmcgb25lcyBpbiBydW50aW1lLiBJbiBvcmRlciB0byBkbyB0aGlzLCBN
ZXRyaWNEZWZpbml0aW9uIFJlZGZpc2ggc2NoZW1hDQp3aWxsIGJlIHVzZWQsIGJ1dCBpdCByZXF1
aXJlcyBzb21lIG1vZGlmaWNhdGlvbnMgdG8gbWFrZSBwb3NzaWJsZSBjb25maWd1cmluZw0KbWF0
aCBmb3JtdWxhIGZvciByZWFkaW5ncyBjYWxjdWxhdGlvbi4NCg0KIyMgQ2hhbmdlIHByb3Bvc2Fs
DQpUaGUgaWRlYSBpcyB0byBhZGQgOCB1c2VyLWRlZmluZWQgc2Vuc29ycyB0byBSZWRmaXNoIHRy
ZWUuIEluIG9yZGVyIHRvIHByb2R1Y2UNCnJlYWRpbmdzLCB0aG9zZSBzZW5zb3JzIHJlcXVpcmUg
dG8gYmUgY29uZmlndXJlZCBieSB0aGUgdXNlci4gRXhhbXBsZSBVUkkgZm9yDQp0aGUgc2Vuc29y
IHJlc291cmNlIGlzIHNob3duIGJlbG93LiANCg0KYGBgDQovcmVkZmlzaC92MS9DaGFzc2lzLzEv
U2Vuc29ycy9Vc2VyRGVmaW5lZFNlbnNvck4gDQooTiA9IDAuLjcpDQpgYGANClRoZSBzZW5zb3Ig
Y29uZmlndXJhdGlvbiBzaGFsbCBiZSBwZXJmb3JtZWQgaW4gcnVudGltZSB1c2luZyBNZXRyaWNE
ZWZpbml0aW9uDQpzY2hlbWEuIEluIG9yZGVyIHRvIHBlcmZvcm0gcHJvcGVyIGNvbmZpZ3VyYXRp
b24sIHVzZXIgaGFzIHRvIGJlIGFibGUgdG8gZGVmaW5lDQpzb3VyY2UgbWV0cmljcyBhbmQgYWxz
byBjYWxjdWxhdGlvbiBmb3JtdWxhLiBUaGlzIHdpbGwgcmVxdWlyZSBNZXRyaWNEZWZpbml0aW9u
DQpzY2hlbWEgZXh0ZW5zaW9uLiBUaGUgZXhhbXBsZSBvZiB0aGUgZXh0ZW5kZWQgTWV0cmljRGVm
aW5pdGlvbiBpcyBzaG93biBiZWxvdy4NCg0KYGBganNvbg0Kew0KICAiQG9kYXRhLnR5cGUiOiAi
I01ldHJpY0RlZmluaXRpb24udjFfMF8zLk1ldHJpY0RlZmluaXRpb24iLA0KICAiSWQiOiAiVXNl
ckRlZmluZWRTZW5zb3IwICIsDQogICJOYW1lIjogIkRlZmluaXRpb24gb2YgVXNlci1kZWZpbmVk
IHNlbnNvciAwIiwNCiAgIk1ldHJpY1R5cGUiOiAiTnVtZXJpYyIsDQogICJJbXBsZW1lbnRhdGlv
biI6ICJTeW50aGVzaXplZCIsDQogICJQaHlzaWNhbENvbnRleHQiOiAiVG90YWwgUFNVIGVmZmlj
aWVuY3kiLA0KICAiVW5pdHMiOiAiJSIsDQogICJTeW50aGVzaXNGb3JtdWxhIjogIlBTVTBfT1VU
LFBTVTFfT1VULCssUFNVMF9JTixQU1UxX0lOLCssLywxMDAsKiIsDQogICJDYWxjdWxhdGlvblBh
cmFtZXRlcnMiOiBbDQogICAgICAgICAgew0KICAgICAgICAgICAgICAgICAgIkFsaWFzIjogIlBT
VTBfSU4iLA0KICAgICAgICAgICAgICAgICAgIlNvdXJjZU1ldHJpYyI6ICIvcmVkZmlzaC92MS9D
aGFzc2lzLzEvUG93ZXIjL1BTVS8wL0lucHV0UG93ZXIiDQogICAgICAgICAgfSwNCiAgICAgICAg
ICB7DQogICAgICAgICAgICAgICAgICAiQWxpYXMiOiAiUFNVMF9PVVQiLA0KICAgICAgICAgICAg
ICAgICAgIlNvdXJjZU1ldHJpYyI6ICIvcmVkZmlzaC92MS9DaGFzc2lzLzEvUG93ZXIjL1BTVS8w
L091dHB1dFBvd2VyIg0KICAgICAgICAgIH0sDQogICAgICAgICAgew0KICAgICAgICAgICAgICAg
ICAgIkFsaWFzIjogIlBTVTFfSU4iLA0KICAgICAgICAgICAgICAgICAgIlNvdXJjZU1ldHJpYyI6
ICIvcmVkZmlzaC92MS9DaGFzc2lzLzEvUG93ZXIjL1BTVS8xL0lucHV0UG93ZXIiDQogICAgICAg
ICAgfSwNCiAgICAgICAgICB7DQogICAgICAgICAgICAgICAgICAiQWxpYXMiOiAiUFNVMV9PVVQi
LA0KICAgICAgICAgICAgICAgICAgIlNvdXJjZU1ldHJpYyI6ICIvcmVkZmlzaC92MS9DaGFzc2lz
LzEvUG93ZXIjL1BTVS8xL091dHB1dFBvd2VyIg0KICAgICAgICAgIH0sDQogICAgICAgICAgew0K
ICAgICAgICAgICAgICAgICAgIkFsaWFzIjogIlBTVV9FRkYiLA0KICAgICAgICAgICAgICAgICAg
IlJlc3VsdE1ldHJpYyI6ICIvcmVkZmlzaC92MS9DaGFzc2lzLzEvU2Vuc29ycy9Vc2VyRGVmaW5l
ZFNlbnNvcjAiDQogICAgICAgICAgfQ0KICBdLA0KICAiQG9kYXRhLmlkIjogIi9yZWRmaXNoL3Yx
L1RlbGVtZXRyeVNlcnZpY2UvTWV0cmljRGVmaW5pdGlvbnMvVXNlckRlZmluZWRTZW5zb3IwICIN
Cn0NCmBgYA0KDQpUaGlzIGlzIGFuIGV4YW1wbGUgb2YgdG90YWwgUFNVIGVmZmljaWVuY3kgdXNl
ci1kZWZpbmVkIG1ldHJpYyBmb3IgZG91YmxlLVBTVQ0Kc3lzdGVtLiBUaGUgb3JpZ2luYWwgTWV0
cmljIERlZmluaXRpb24gc2NoZW1hIGlzIGV4dGVuZGVkIGJ5IHR3byBuZXcgYXR0cmlidXRlcywN
CnRoZSBTeW50aGVzaXNGb3JtdWxhIGFuZCBBbGlhcy4gDQoqIFN5bnRoZXNpc0Zvcm11bGEgY29u
dGFpbnMgbWF0aGVtYXRpY2FsIGZvcm11bGEgZm9yIG1ldHJpYyBjYWxjdWxhdGlvbiB3cml0dGVu
DQp1c2luZyBbcmV2ZXJzZSBwb2xpc2ggbm90YXRpb25dWzFdIChSUE4pLiBUaGUgUlBOIHdhcyBj
aG9zZW4gdG8gbWFrZSB0aGUgZm9ybXVsYQ0KZWFzaWVyIHRvIHBhcnNlIGFuZCBjYWxjdWxhdGUg
YnkgdGhlIEJNQy4gDQoqIEFsaWFzIGlzIGRlZmluZWQgZm9yIGVhY2ggc291cmNlIG9yIHJlc3Vs
dCBtZXRyaWMgdG8gZWFzZSB3cml0aW5nIHRoZQ0KU3ludGhlc2lzRm9ybXVsYSBieSBhdm9pZGlu
ZyB1c2luZyBzZW5zb3IncyBVUklzLiANCg0KQWZ0ZXIgUE9TVGluZyBjb25maWd1cmF0aW9uIHRv
IHRoZSBwcm9wZXIgTWV0cmljRGVmaW5pdGlvbiByZXNvdXJjZSBmb3IgZ2l2ZW4NCnVzZXItZGVm
aW5lZCBzZW5zb3IgaXQgd2lsbCBzdGFydCB0byBwcm9kdWNlIHJlYWRpbmdzIG9ubHkgd2hlbiBh
bGwgcmVxdWlyZWQNCnNvdXJjZSBtZXRyaWNzIGFyZSBnZW5lcmF0aW5nIHZhbGlkIHJlYWRpbmdz
Lg0KDQpUaGUgdGFibGUgYmVsb3cgc2hvd3MgdGhlIHN1cHBvcnRlZCBvcGVyYXRvcnMgZm9yIHRo
ZSBmb3JtdWxhLiBBbGwgbWF0aGVtYXRpY2FsDQpvcGVyYXRpb25zIHN1cHBvcnRzIGludGVnZXIg
YW5kIGZsb2F0aW5nIHBvaW50IG9wZXJhbmRzIGFuZCBlaXRoZXIgbWV0cmljcyBvcg0KY29uc3Rh
bnRzLiBJZiBhdCBsZWFzdCBvbmUgb3BlcmFuZCBpcyBmbG9hdGluZyBwb2ludCB0aGUgcmVzdWx0
IG1ldHJpYyBhbHNvDQp3aWxsIGJlIGZsb2F0aW5nIHBvaW50LiBMb2dpY2FsIG9wZXJhdGlvbnMg
c3VwcG9ydCBvbmx5IGludGVnZXIgbWV0cmljcy4NClRoZSBtYWluIHVzZS1jYXNlIGZvciB0aGVt
IGlzIGZvciBvcGVyYXRpb25zIG9uIGJpdG1hc2sgbWV0cmljcyAobGlrZSBQU1UNCnN0YXR1cyBi
aXRzZXQpLiBUaGUgZGVsdGEgb3BlcmF0b3Igc3VwcG9ydCBib3RoLCBpbnRlZ2VyIGFuZCBmbG9h
dGluZyBwb2ludA0KbWV0cmljcy4gSXQgY2FsY3VsYXRlcyB0aGUgZGVsdGEgYmV0d2VlbiB0d28g
c3Vic2VxdWVudCBtZXRyaWMgc2FtcGxlcy4NCg0KfE9wZXJhdG9yfE1lYW5pbmd8TnVtYmVyIG9m
IDxicj4gb3BlcmFuZHN8IFR5cGUgb2YgPGJyPiBvcGVyYXRpb24NCnw6LTp8Oi06fDotOnw6LTp8
DQp8ICsgfCBhZGRpdGlvbnwgMiB8IG1hdGhlbWF0aWNhbCB8DQp8IC0gfCBzdWJ0cmFjdGlvbiB8
IDIgfCBtYXRoZW1hdGljYWwgfA0KfCAqIHwgbXVsdGlwbGljYXRpb24gfCAyIHwgbWF0aGVtYXRp
Y2FsIHwNCnwgLyB8IGRpdmlzaW9uIHwgMiB8IG1hdGhlbWF0aWNhbCB8DQp8IDwgfCBzaGlmdCBs
ZWZ0IHwgMiB8IGxvZ2ljYWwgfA0KfCA+IHwgc2hpZnQgcmlnaHQgfCAyIHwgbG9naWNhbCB8DQp8
ICYgfCBiaXR3aXNlIEFORCB8IDIgfCBsb2dpY2FsIHwNCnwgXHwgfCBiaXR3aXNlIE9SIHwgMiB8
IGxvZ2ljYWwgfA0KfCB+IHwgYml0d2lzZSBOT1QgfCAxIHwgbG9naWNhbCB8DQp8ICQgfCBEZWx0
YSB8IDEgfCBtYXRoZW1hdGljYWwgfA0KDQpbMV06IGh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93
aWtpL1JldmVyc2VfUG9saXNoX25vdGF0aW9u

--_002_0ed2056122a54c17ab997961796b0330intelcom_--
