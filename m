Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E7574139539
	for <lists+openbmc@lfdr.de>; Mon, 13 Jan 2020 16:51:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xJ3Z5VmwzDqDS
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 02:51:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=kathryn.elainex.pine@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xJ1t05xDzDqG6
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 02:49:51 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 07:49:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,429,1571727600"; 
 d="scan'208,217";a="225062621"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
 by orsmga006.jf.intel.com with ESMTP; 13 Jan 2020 07:49:47 -0800
Received: from orsmsx116.amr.corp.intel.com (10.22.240.14) by
 ORSMSX101.amr.corp.intel.com (10.22.225.128) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 13 Jan 2020 07:49:47 -0800
Received: from orsmsx113.amr.corp.intel.com ([169.254.9.100]) by
 ORSMSX116.amr.corp.intel.com ([169.254.7.30]) with mapi id 14.03.0439.000;
 Mon, 13 Jan 2020 07:49:47 -0800
From: "Pine, Kathryn ElaineX" <kathryn.elainex.pine@intel.com>
To: Ryan Arnell <ryanarnellibm@gmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: GUI design for profile page
Thread-Topic: GUI design for profile page
Thread-Index: AQHVxmNrP6/zewFjmkaVQ6XW6RcioqfoxN+A
Date: Mon, 13 Jan 2020 15:49:47 +0000
Message-ID: <FD0BD680739BFC41807C96BD23118BB1327E11@ORSMSX113.amr.corp.intel.com>
References: <CAH3qHnZfQA4X-n2_cWX-rTRo+YLYxktfQrCB16zpr=FOV8LoTw@mail.gmail.com>
In-Reply-To: <CAH3qHnZfQA4X-n2_cWX-rTRo+YLYxktfQrCB16zpr=FOV8LoTw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: request-justification,no-action
x-originating-ip: [10.22.254.140]
Content-Type: multipart/alternative;
 boundary="_000_FD0BD680739BFC41807C96BD23118BB1327E11ORSMSX113amrcorpi_"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_FD0BD680739BFC41807C96BD23118BB1327E11ORSMSX113amrcorpi_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUnlhbiwNCg0KVGhhbmtzIGZvciB5b3VyIHdvcmsgb24gdGhpcy4NCg0KSSBjYW7igJl0IHNl
ZW0gdG8gbG9naW4gdG8gSW52aXNpb24gZnJvbSB0aGlzIHBhZ2UgdG8gcG9zdCBjb21tZW50cyBv
biB0aGUgcGFnZSAoSSBoYXZlIGEgZnJlZSBJbnZpc2lvbiBhY2NvdW50IGJ1dCBpdCBkb2VzbuKA
mXQgc2VlbSB0byBnaXZlIG1lIGFjY2VzcyB0byB0aGlzIHBhZ2UpLCBzbyBJ4oCZbSBpbmNsdWRp
bmcgdGhlbSBoZXJlOg0KDQoxKSAgICAgICAgICAgIFdoYXQgd2FzIHRoZSByZWFzb25pbmcgZm9y
IG1ha2luZyB0aGlzIGEgc2VwYXJhdGUgcGFnZSBpbnN0ZWFkIG9mIHB1dHRpbmcgdGhpcyBvbiB0
aGUgZXhpc3RpbmcgbG9jYWwgdXNlcnMgcGFnZT8NCjIpICAgICAgICAgICAgSWYgaXQgaXMgYSBz
ZXBhcmF0ZSBwYWdlLCBJIGxpa2UgdGhhdCB0aGUgcGFnZSB3b3VsZCBiZSBsaW5rZWQgZnJvbSBh
IGhlYWRlciBpY29uLCBidXQgaXQgc2VlbXMgbGlrZSB0aGVyZSBzaG91bGQgYmUgYWNjZXNzIGZy
b20gdGhlIG1lbnUgc29tZWhvdyBhcyB3ZWxsLiBJIHdvbmRlciBpZiBpdCBjb3VsZCBiZSBhIGxp
bmsgb24gdGhlIGxvY2FsIHVzZXJzIHBhZ2UgZm9yIGVhY2ggdXNlci4gSSBjYW4gaW1hZ2luZSB0
aGF0IGlmIGNvbnRyb2wgZXhpc3RzIHRvIGNoYW5nZSBsYW5ndWFnZSBmb3IgYSB1c2VyLCB0aGVy
ZSBjb3VsZCBiZSBhIHNjZW5hcmlvIHdoZXJlIGFuIGFkbWluIHVzZXIgbWlnaHQgd2FudCB0byBj
aGFuZ2UgdGhlIGxhbmd1YWdlIGZvciB1c2VycyB3aGVuIHRoZXkgc2V0IHRoZSB1c2VyIHVwLCBu
b3QgcmVxdWlyaW5nIHRoYXQgdXNlciB0byBsb2cgaW4gaW4gRW5nbGlzaCAoZm9yIGV4YW1wbGUp
IGFuZCB0aGVuIGZpbmQgdGhpcyBwYWdlIGFuZCBjaGFuZ2UgdGhlIGxhbmd1YWdlIHRoZW1zZWx2
ZXMuDQphLiAgICAgICAgICAgIElmIGl0IGlzIGFjY2Vzc2VkIGZyb20gdGhlIGxvY2FsIHVzZXJz
IHBhZ2UsIGNvdWxkIGl0IGp1c3QgYmUgYSBtb2RhbCBvbiB0aGUgcGFnZSByYXRoZXIgdGhhbiBh
IHNlcGFyYXRlIHBhZ2U/DQoNClRoYW5rcywNCkthdGh5DQoNCkZyb206IG9wZW5ibWMgPG9wZW5i
bWMtYm91bmNlcytrYXRocnluLmVsYWluZXgucGluZT1pbnRlbC5jb21AbGlzdHMub3psYWJzLm9y
Zz4gT24gQmVoYWxmIE9mIFJ5YW4gQXJuZWxsDQpTZW50OiBXZWRuZXNkYXksIEphbnVhcnkgOCwg
MjAyMCAxMjozNiBQTQ0KVG86IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KU3ViamVjdDogR1VJ
IGRlc2lnbiBmb3IgcHJvZmlsZSBwYWdlDQoNCkhlbGxvIGV2ZXJ5b25lLA0KSGFwcHkgbmV3IHll
YXIhIFdlIGFyZSB0aGlua2luZyBhYm91dCBpbnRyb2R1Y2luZyBhIHByb2ZpbGUgcGFnZS4gVGhl
IGlkZWEgaXMgaGVyZSB1c2VycyBjYW4gcGVyZm9ybSB0YXNrcyBsaWtlIHVwZGF0aW5nIHRoZSBw
YXNzd29yZCBhbmQgb3RoZXIgdXNlciByZWxhdGVkIHRhc2tzLiBUaGlzIHBhZ2UgaXMgYWNjZXNz
aWJsZSB2aWEgYSBnZW5lcmljIHVzZXIgaWNvbiBmcm9tIGhlYWRlci4gUmlnaHQgbm93IHdlIG9u
bHkgaGF2ZSBwYXNzd29yZCByZXNldCBvcHRpb24uIERvd24gdGhlIHJvYWQgd2UgcGxhbiB0byBo
YXZlIGEgZGVmYXVsdCBsYW5ndWFnZSBzZWxlY3Rvci4gVGhlIGRlc2lnbiBzaG93IGJvdGggY29t
cG9uZW50cyBmb3Igbm93Lg0KDQpUaGUgaW52aXNpb24gcHJvdG90eXBlIGxpbmsgaXMNCmh0dHBz
Oi8vaWJtLmludmlzaW9uYXBwLmNvbS9zaGFyZS9RNk5aMTNNM0E1QiMvMzE5Mzc3NTc3XzAxLVBy
b2ZpbGUtU2V0dGluZ3MtMDINCg0KUGxlYXNlIGZlZWwgZnJlZSB0byBsZWF2ZSBjb21tZW50cyBp
biB0aGUgcHJvdG90eXBlLiBXZSBsb3ZlIHlvdXIgZmVlZGJhY2suDQoNClRoYW5rIHlvdQ0KUnlh
biBBcm5lbGwNClVYIEVuZ2luZWVyDQpJQk0sIEF1c3RpbiwgVFguDQoNCg0KDQoNCg==

--_000_FD0BD680739BFC41807C96BD23118BB1327E11ORSMSX113amrcorpi_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAy
IDQ7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWws
IGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBpbjsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJ
Zm9udC1zaXplOjExLjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQph
OmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xv
cjpibHVlOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KYTp2aXNpdGVkLCBzcGFuLk1z
b0h5cGVybGlua0ZvbGxvd2VkDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjpwdXJw
bGU7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpwLm1zb25vcm1hbDAsIGxpLm1zb25v
cm1hbDAsIGRpdi5tc29ub3JtYWwwDQoJe21zby1zdHlsZS1uYW1lOm1zb25vcm1hbDsNCgltc28t
bWFyZ2luLXRvcC1hbHQ6YXV0bzsNCgltYXJnaW4tcmlnaHQ6MGluOw0KCW1zby1tYXJnaW4tYm90
dG9tLWFsdDphdXRvOw0KCW1hcmdpbi1sZWZ0OjBpbjsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZv
bnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCnNwYW4uRW1haWxTdHlsZTE4DQoJe21z
by1zdHlsZS10eXBlOnBlcnNvbmFsOw0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlm
Ow0KCWNvbG9yOndpbmRvd3RleHQ7fQ0Kc3Bhbi5FbWFpbFN0eWxlMTkNCgl7bXNvLXN0eWxlLXR5
cGU6cGVyc29uYWwtY29tcG9zZTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsN
Cgljb2xvcjp3aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4
cG9ydC1vbmx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCkBwYWdlIFdv
cmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4gMS4waW4gMS4w
aW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQotLT48
L3N0eWxlPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVkZWZhdWx0cyB2OmV4dD0i
ZWRpdCIgc3BpZG1heD0iMTAyNiIgLz4NCjwveG1sPjwhW2VuZGlmXS0tPjwhLS1baWYgZ3RlIG1z
byA5XT48eG1sPg0KPG86c2hhcGVsYXlvdXQgdjpleHQ9ImVkaXQiPg0KPG86aWRtYXAgdjpleHQ9
ImVkaXQiIGRhdGE9IjEiIC8+DQo8L286c2hhcGVsYXlvdXQ+PC94bWw+PCFbZW5kaWZdLS0+DQo8
L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iYmx1ZSIgdmxpbms9InB1cnBsZSI+DQo8
ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+SGkgUnlhbiw8
bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+VGhhbmtzIGZvciB5b3VyIHdvcmsgb24gdGhpcy48bzpw
PjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+SSBjYW7igJl0IHNlZW0gdG8gbG9naW4gdG8gSW52aXNpb24g
ZnJvbSB0aGlzIHBhZ2UgdG8gcG9zdCBjb21tZW50cyBvbiB0aGUgcGFnZSAoSSBoYXZlIGEgZnJl
ZSBJbnZpc2lvbiBhY2NvdW50IGJ1dCBpdCBkb2VzbuKAmXQgc2VlbSB0byBnaXZlIG1lIGFjY2Vz
cyB0byB0aGlzIHBhZ2UpLCBzbyBJ4oCZbSBpbmNsdWRpbmcgdGhlbSBoZXJlOjxvOnA+PC9vOnA+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj4xKSZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBXaGF0IHdhcyB0aGUgcmVhc29uaW5nIGZvciBtYWtp
bmcgdGhpcyBhIHNlcGFyYXRlIHBhZ2UgaW5zdGVhZCBvZiBwdXR0aW5nIHRoaXMgb24gdGhlIGV4
aXN0aW5nIGxvY2FsIHVzZXJzIHBhZ2U/PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj4yKSZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyBJZiBpdCBpcyBhIHNlcGFyYXRlIHBhZ2UsIEkgbGlrZSB0aGF0IHRo
ZSBwYWdlIHdvdWxkIGJlIGxpbmtlZCBmcm9tIGEgaGVhZGVyIGljb24sIGJ1dCBpdCBzZWVtcyBs
aWtlIHRoZXJlIHNob3VsZCBiZSBhY2Nlc3MgZnJvbSB0aGUgbWVudSBzb21laG93IGFzIHdlbGwu
IEkgd29uZGVyIGlmIGl0IGNvdWxkIGJlIGEgbGluayBvbiB0aGUgbG9jYWwgdXNlcnMgcGFnZSBm
b3IgZWFjaCB1c2VyLg0KIEkgY2FuIGltYWdpbmUgdGhhdCBpZiBjb250cm9sIGV4aXN0cyB0byBj
aGFuZ2UgbGFuZ3VhZ2UgZm9yIGEgdXNlciwgdGhlcmUgY291bGQgYmUgYSBzY2VuYXJpbyB3aGVy
ZSBhbiBhZG1pbiB1c2VyIG1pZ2h0IHdhbnQgdG8gY2hhbmdlIHRoZSBsYW5ndWFnZSBmb3IgdXNl
cnMgd2hlbiB0aGV5IHNldCB0aGUgdXNlciB1cCwgbm90IHJlcXVpcmluZyB0aGF0IHVzZXIgdG8g
bG9nIGluIGluIEVuZ2xpc2ggKGZvciBleGFtcGxlKSBhbmQgdGhlbiBmaW5kDQogdGhpcyBwYWdl
IGFuZCBjaGFuZ2UgdGhlIGxhbmd1YWdlIHRoZW1zZWx2ZXMuPG86cD48L286cD48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj5hLiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBJZiBpdCBpcyBhY2Nlc3NlZCBmcm9tIHRoZSBs
b2NhbCB1c2VycyBwYWdlLCBjb3VsZCBpdCBqdXN0IGJlIGEgbW9kYWwgb24gdGhlIHBhZ2UgcmF0
aGVyIHRoYW4gYSBzZXBhcmF0ZSBwYWdlPzxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5UaGFua3Ms
PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5LYXRoeTxvOnA+PC9vOnA+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj48Yj5Gcm9tOjwvYj4gb3BlbmJtYyAmbHQ7b3BlbmJtYy1ib3VuY2VzJiM0Mztr
YXRocnluLmVsYWluZXgucGluZT1pbnRlbC5jb21AbGlzdHMub3psYWJzLm9yZyZndDsNCjxiPk9u
IEJlaGFsZiBPZiA8L2I+UnlhbiBBcm5lbGw8YnI+DQo8Yj5TZW50OjwvYj4gV2VkbmVzZGF5LCBK
YW51YXJ5IDgsIDIwMjAgMTI6MzYgUE08YnI+DQo8Yj5Ubzo8L2I+IG9wZW5ibWNAbGlzdHMub3ps
YWJzLm9yZzxicj4NCjxiPlN1YmplY3Q6PC9iPiBHVUkgZGVzaWduIGZvciBwcm9maWxlIHBhZ2U8
bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9w
Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkhlbGxvIGV2ZXJ5b25lLDxvOnA+PC9vOnA+
PC9wPg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkhhcHB5IG5ldyB5ZWFyISBXZSBhcmUg
dGhpbmtpbmcgYWJvdXQgaW50cm9kdWNpbmcgYSBwcm9maWxlIHBhZ2UuIFRoZSBpZGVhIGlzIGhl
cmUgdXNlcnMgY2FuIHBlcmZvcm0gdGFza3MgbGlrZSB1cGRhdGluZyB0aGUgcGFzc3dvcmQgYW5k
IG90aGVyIHVzZXIgcmVsYXRlZCB0YXNrcy4gVGhpcyBwYWdlIGlzIGFjY2Vzc2libGUgdmlhIGEg
Z2VuZXJpYyB1c2VyIGljb24gZnJvbSBoZWFkZXIuIFJpZ2h0IG5vdyB3ZQ0KIG9ubHkgaGF2ZSBw
YXNzd29yZCByZXNldCBvcHRpb24uIERvd24gdGhlIHJvYWQgd2UgcGxhbiB0byBoYXZlIGEgZGVm
YXVsdCBsYW5ndWFnZSBzZWxlY3Rvci4gVGhlIGRlc2lnbiZuYnNwO3Nob3cgYm90aCBjb21wb25l
bnRzIGZvciBub3cuJm5ic3A7PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPlRoZSBpbnZpc2lvbiBwcm90b3R5cGUmbmJzcDtsaW5rIGlzJm5ic3A7
PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48YSBo
cmVmPSJodHRwczovL2libS5pbnZpc2lvbmFwcC5jb20vc2hhcmUvUTZOWjEzTTNBNUIjLzMxOTM3
NzU3N18wMS1Qcm9maWxlLVNldHRpbmdzLTAyIj5odHRwczovL2libS5pbnZpc2lvbmFwcC5jb20v
c2hhcmUvUTZOWjEzTTNBNUIjLzMxOTM3NzU3N18wMS1Qcm9maWxlLVNldHRpbmdzLTAyPC9hPjxv
OnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4m
bmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5QbGVh
c2UgZmVlbCBmcmVlIHRvIGxlYXZlIGNvbW1lbnRzIGluIHRoZSBwcm90b3R5cGUuIFdlIGxvdmUg
eW91ciBmZWVkYmFjay4mbmJzcDs8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+VGhhbmsgeW91PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5SeWFuIEFybmVsbDxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+
DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+VVggRW5naW5lZXI8bzpwPjwvbzpwPjwvcD4N
CjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPklCTSwgQXVzdGluLCBUWC4mbmJz
cDs8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxv
OnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjxkaXY+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2Rpdj4N
CjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_FD0BD680739BFC41807C96BD23118BB1327E11ORSMSX113amrcorpi_--
