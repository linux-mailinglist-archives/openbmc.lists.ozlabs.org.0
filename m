Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 232C73B0B9
	for <lists+openbmc@lfdr.de>; Mon, 10 Jun 2019 10:29:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45MmWd2zcGzDqFp
	for <lists+openbmc@lfdr.de>; Mon, 10 Jun 2019 18:29:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=yuan.li@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45MmW641w4zDqN3
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jun 2019 18:28:46 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jun 2019 01:28:42 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 10 Jun 2019 01:28:42 -0700
Received: from yli41-MOBL1 (yli41-mobl1.ccr.corp.intel.com [10.239.196.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 96A0958049E;
 Mon, 10 Jun 2019 01:28:41 -0700 (PDT)
Date: Mon, 10 Jun 2019 16:28:41 +0800
From: "yuan.li@linux.intel.com" <yuan.li@linux.intel.com>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: [Design] PSU firmware update
References: <mailman.2630.1559853029.4162.openbmc@lists.ozlabs.org>
X-Priority: 3
X-Has-Attach: no
X-Mailer: Foxmail 7.2.9.156[cn]
Mime-Version: 1.0
Message-ID: <2019061016283984388518@linux.intel.com>
Content-Type: multipart/alternative;
 boundary="----=_001_NextPart624106210581_=----"
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

This is a multi-part message in MIME format.

------=_001_NextPart624106210581_=----
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

Pk9uIDIwMTktMDYtMDUgMjI6MzEsIExlaSBZVSB3cm90ZToNCj4+IE9uIFdlZCwgSnVuIDUsIDIw
MTkgYXQgMTA6MjUgUE0gTWF0dCBTcGlubGVyIDxtc3BpbmxlckBsaW51eC5pYm0uY29tPiANCj4+
IHdyb3RlOg0KPj4+IA0KPj4+IA0KPj4+IE9uIDYvNS8yMDE5IDE6MTggQU0sIExlaSBZVSB3cm90
ZToNCj4+PiA+Pj4gVGhlIFBTVSBmaXJtd2FyZSBjb2RlIHVwZGF0ZSB3aWxsIHJlLXVzZSB0aGUg
Y3VycmVudCBpbnRlcmZhY2VzIHRvIHVwbG9hZCwNCj4+PiA+Pj4gdmVyaWZ5LCBhbmQgYWN0aXZh
dGUgdGhlIGltYWdlLg0KPj4+ID4+IFdlIHdvdWxkIGxpa2UgdGhlIG9wdGlvbiB0byBiZSBhYmxl
IHRvIHNoaXAgdGhlIFBTVSBmaXJtd2FyZSBhcyBwYXJ0IG9mDQo+Pj4gPj4gdGhlIEJNQyBpbWFn
ZSAoaW4gdGhlIHJvb3QgZmlsZXN5c3RlbSkuIFRoaXMgbWVhbnMgdGhhdCBpdCBpcyBhbHJlYWR5
DQo+Pj4gPj4gcHJlc2VudCBhbmQgYXV0aGVudGljYXRlZCB3aGVuIHRoZSBCTUMgYm9vdHMuIElu
IHRoaXMgd2F5LCB3ZSBrbm93IHRoYXQNCj4+PiA+PiB0aGUgY3VycmVudCBCTUMgZmlybXdhcmUg
cGxheXMgd2VsbCB3aXRoIHRoZSBQU1UgZmlybXdhcmUgYW5kIGhhdmUgZmV3ZXINCj4+PiA+PiB2
YXJpYWJsZXMgdG8gdGVzdCBmb3Igd2hlbiBtYWtpbmcgYSByZWxlYXNlLg0KPj4+ID4gQmVjYXVz
ZSB0aGUgUFNVIGZpcm13YXJlIGlzIHBhcnQgb2YgQk1DIGltYWdlLCB0aGlzIHNlZW1zIGEgY29t
cGxldGVseQ0KPj4+ID4gZGlmZmVyZW50IGFwcHJvYWNoLCBhbmQgbW9yZSBsaWtlIHBhcnQgb2Yg
Qk1DIGltYWdlIHVwZGF0ZSwgaXMgaXQ/DQo+Pj4gPiBJIHdvdWxkIGV4cGVjdCB0aGlzIHNob3Vs
ZCBub3QgYmUgcGFydCBvZiB0aGlzIGRlc2lnbiwgd2hhdCBkbyB5b3UgdGhpbms/DQo+Pj4gDQo+
Pj4gRllJLCBJIGFtIDk5JSBzdXJlIHRoaXMgaXMgaG93IElCTSBuZWVkcyBpdHMgc3lzdGVtcyB0
byB3b3JrIGFzIHdlbGwuDQo+Pj4gVGhhdCBiZWluZyB0aGUgY2FzZSwNCj4+PiANCj4+PiB3aWxs
IHlvdSBhbHNvIGJlIGhhbmRsaW5nIHRoaXMgZGVzaWduPw0KPj4gDQo+PiBHb29kIHRvIGtub3cu
DQo+PiANCj4+IFRoZW4gYSBxdWVzdGlvbiBjb21lcyB1cDoNCj4+IEluIHdoaWNoIGNhc2VzIFBT
VSBmaXJtd2FyZSB1cGRhdGUgc2hhbGwgYmUgZG9uZT8NCj4+IDEuIEl0IGlzIHVwZGF0ZWQgdG9n
ZXRoZXIgd2l0aCBCTUMgZmlybXdhcmUgdXBkYXRlIGFzIGRlc2NyaWJlZCBieSANCj4+IFZlcm5v
bg0KPj4gICAgTWF1ZXJ5Ow0KPj4gMi4gSXQgaXMgdXBkYXRlZCBpbmRlcGVuZGVudGx5IHdpdGgg
QVBJcywgYXMgZGVzY3JpYmVkIGluIHRoaXMgZGVzaWduIA0KPj4gZG9jLg0KPj4gDQo+PiBXaWxs
IDEgYW5kIDIgYm90aCBiZSB2YWxpZCwgb3Igb25seSAxIGlzIHRoZSByZWFsIGNhc2UgYW5kIHdl
IGRvIG5vdCANCj4+IG5lZWQgdG8NCj4+IHN1cHBvcnQgMj8NCj4+IA0KPiANCj4gSSBzZWUgaXQg
YXMgaGF2aW5nIGEgc2luZ2xlIHRhcmJhbGwgZmlsZSB0aGF0IGhhcyB0aGUgcmVxdWlyZWQgZmls
ZXMgdG8gDQo+IHVwZGF0ZSB0aGUNCj4gQk1DIGFuZCB0aGUgUFNVLiBXaGVuIHRoaXMgdGFyYmFs
bCBpcyB1cGxvYWRlZCwgdGhlbiBhIG5ldyBWZXJzaW9uIHdpdGggDQo+IGEgUHVycG9zZQ0KPiBv
ZiBTeXN0ZW0gb3Igc29tZSBvdGhlciBuYW1lIGlzIGNyZWF0ZWQuIFdoZW4gdGhpcyBWZXJzaW9u
IGlzIGFjdGl2YXRlZCwgDQo+IHRoaXMNCj4gdHJpZ2dlcnMgdGhlIEJNQyB1cGRhdGVyIChleGlz
dGluZykgYW5kIHRoZSBQU1UgdXBkYXRlciAobmV3KSB0byBjaGVjayANCj4gaWYgYWxsDQo+IHRo
ZSBuZWNlc3NhcnkgZmlsZXMgdG8gcGVyZm9ybSB0aGUgdXBkYXRlIG9mIHRoZWlyIGNvbXBvbmVu
dCBleGlzdC4gSWYgDQo+IHllcywgZWFjaA0KPiB1cGRhdGVyIHVwZGF0ZXMgdGhlaXIgcGllY2Ug
YW5kIGlmIGFueSBvbmUgZmFpbHMgaXQnZCBtYXJrIHRoZSBWZXJzaW9uIA0KPiBhcyBGYWlsZWQN
Cj4gKFRCRCBvbiBzeW5jaHJvbml6aW5nIHRoZSB1cGRhdGVycyB0byBtYXJrIHRoZSBWZXJzaW9u
IGFzIEFjdGl2ZSBvciANCj4gRmFpbGVkKS4NCj4gU28gdGhlIFBTVSB3b3VsZCBiZSB1cGRhdGVk
IGF0IHRoZSBzYW1lIHRpbWUgYXMgdGhlIEJNQywgYnV0IGRvbmUgYnkgaXRzIA0KPiBvd24NCj4g
dXBkYXRlciBhcHBsaWNhdGlvbi4NCj4gIA0KPiBUaG91Z2h0cz8NCj4NCg0KSSBoYXZlIGRpZmZl
cmVudCBvcGluaW9uIGFib3V0IHRoaXMuIEluIGN1cnJlbnQgcHJhY3RpY2UgaXQncyBub3QgYSB0
YXJiYWxsIHdoaWNoIA0KY291bGQgYmUgZGVjb21wcmVzc2VkIGVhc2lseS4gVGhlIGVtYmVkZGVk
IEJNQyB1cGRhdGUgaW1hZ2UgaXMgc2lnbmVkLiBQU1UNCmZpcm13YXJlIGlzIGEgcGFydCBvZiB0
aGUgcm9vdCBmaWxlc3lzdGVtIChhcyBhIGZpbGUpLiBJbiB0aGlzIGNhc2UgdGhlICB3aG9sZSB1
cGRhdGUgDQpmbG93IHdvdWxkIGxvb2sgbGlrZToNCjEuIFVwbG9hZCBhbmQgdXBkYXRlIHRoZSBC
TUMgZmlybXdhcmUgaXRzZWxmLg0KMi4gQm9vdCB0byBuZXcgdmVyc2lvbiBvZiBCTUMgZmlybXdh
cmUuDQozLiBCTUMgdG8gcmVhZCBQU1UgZmlybXdhcmUgdmVyc2lvbiBmcm9tIFBTVSwgYW5kIGNv
bXBhcmUgd2l0aCB0aGUgZmlsZSBzaGlwcGVkDQogICAgd2l0aCB0aGlzIEJNQyBmaXJtd2FyZS4N
CjQuIElmIHVwZGF0ZSBuZWVkZWQsIHVwZGF0ZSB0b29sIGNvdWxkIGJlIGxhdW5jaGVkLg0KDQpC
ZW5lZml0IGZvciB0aGlzIGlzIHRoYXQgUFNVIGZpcm13YXJlIHVwZGF0ZSBwcm9jZXNzIGlzIHRy
YW5zcGFyZW50IHRvIGVuZCB1c2VyLg0KDQpIb3cgZG8geW91IHRoaW5rPw0KDQpZdWFuIExpDQoN
Cj4+IFRoZSByZWFzb24gSSBhc2sgaXMgYmVjYXVzZSBpZiB3ZSBjb3VsZCBnZXQgY2xlYXIgcmVx
dWlyZW1lbnRzLCBpdCBpcyANCj4+IHBvc3NpYmxlDQo+PiB0byBzaW1wbGlmeSB0aGUgZGVzaWdu
Lg0KDQoNCg==

------=_001_NextPart624106210581_=----
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DISO-8859-1"><style>body { line-height: 1.5; }blockquote { margin-top: =
0px; margin-bottom: 0px; margin-left: 0.5em; }body { font-size: 10.5pt; fo=
nt-family: 'Segoe UI'; color: rgb(0, 0, 0); line-height: 1.5; }</style></h=
ead><body>=0A<div><span></span></div><blockquote style=3D"margin-Top: 0px;=
 margin-Bottom: 0px; margin-Left: 0.5em"><div><span style=3D"font-size: 10=
.5pt; line-height: 1.5; background-color: transparent;">&gt;On 2019-06-05 =
22:31, Lei YU wrote:</span></div>=0A<div>&gt;&gt; On Wed, Jun 5, 2019 at 1=
0:25 PM Matt Spinler &lt;mspinler@linux.ibm.com&gt; </div>=0A<div>&gt;&gt;=
 wrote:</div>=0A<div>&gt;&gt;&gt; </div>=0A<div>&gt;&gt;&gt; </div>=0A<div=
>&gt;&gt;&gt; On 6/5/2019 1:18 AM, Lei YU wrote:</div>=0A<div>&gt;&gt;&gt;=
 &gt;&gt;&gt; The PSU firmware code update will re-use the current interfa=
ces to upload,</div>=0A<div>&gt;&gt;&gt; &gt;&gt;&gt; verify, and activate=
 the image.</div>=0A<div>&gt;&gt;&gt; &gt;&gt; We would like the option to=
 be able to ship the PSU firmware as part of</div>=0A<div>&gt;&gt;&gt; &gt=
;&gt; the BMC image (in the root filesystem). This means that it is alread=
y</div>=0A<div>&gt;&gt;&gt; &gt;&gt; present and authenticated when the BM=
C boots. In this way, we know that</div>=0A<div>&gt;&gt;&gt; &gt;&gt; the =
current BMC firmware plays well with the PSU firmware and have fewer</div>=
=0A<div>&gt;&gt;&gt; &gt;&gt; variables to test for when making a release.=
</div>=0A<div>&gt;&gt;&gt; &gt; Because the PSU firmware is part of BMC im=
age, this seems a completely</div>=0A<div>&gt;&gt;&gt; &gt; different appr=
oach, and more like part of BMC image update, is it?</div>=0A<div>&gt;&gt;=
&gt; &gt; I would expect this should not be part of this design, what do y=
ou think?</div>=0A<div>&gt;&gt;&gt; </div>=0A<div>&gt;&gt;&gt; FYI, I am 9=
9% sure this is how IBM needs its systems to work as well.</div>=0A<div>&g=
t;&gt;&gt; That being the case,</div>=0A<div>&gt;&gt;&gt; </div>=0A<div>&g=
t;&gt;&gt; will you also be handling this design?</div>=0A<div>&gt;&gt; </=
div>=0A<div>&gt;&gt; Good to know.</div>=0A<div>&gt;&gt; </div>=0A<div>&gt=
;&gt; Then a question comes up:</div>=0A<div>&gt;&gt; In which cases PSU f=
irmware update shall be done?</div>=0A<div>&gt;&gt; 1. It is updated toget=
her with BMC firmware update as described by </div>=0A<div>&gt;&gt; Vernon=
</div>=0A<div>&gt;&gt;&nbsp;&nbsp;&nbsp; Mauery;</div>=0A<div>&gt;&gt; 2. =
It is updated independently with APIs, as described in this design </div>=
=0A<div>&gt;&gt; doc.</div>=0A<div>&gt;&gt; </div>=0A<div>&gt;&gt; Will 1 =
and 2 both be valid, or only 1 is the real case and we do not </div>=0A<di=
v>&gt;&gt; need to</div>=0A<div>&gt;&gt; support 2?</div>=0A<div>&gt;&gt; =
</div>=0A<div>&gt;&nbsp;</div>=0A<div>&gt; I see it as having a single tar=
ball file that has the required files to </div>=0A<div>&gt; update the</di=
v>=0A<div>&gt; BMC and the PSU. When this tarball is uploaded, then a new =
Version with </div>=0A<div>&gt; a Purpose</div>=0A<div>&gt; of System or s=
ome other name is created. When this Version is activated, </div>=0A<div>&=
gt; this</div>=0A<div>&gt; triggers the BMC updater (existing) and the PSU=
 updater (new) to check </div>=0A<div>&gt; if all</div>=0A<div>&gt; the ne=
cessary files to perform the update of their component exist. If </div>=0A=
<div>&gt; yes, each</div>=0A<div>&gt; updater updates their piece and if a=
ny one fails it'd mark the Version </div>=0A<div>&gt; as Failed</div>=0A<d=
iv>&gt; (TBD on synchronizing the updaters to mark the Version as Active o=
r </div>=0A<div>&gt; Failed).</div>=0A<div>&gt; So the PSU would be update=
d at the same time as the BMC, but done by its </div>=0A<div>&gt; own</div=
>=0A<div>&gt; updater application.</div>=0A<div>&gt; &nbsp;</div>=0A<div>&=
gt; Thoughts?</div>=0A<div>&gt;</div><div><br></div><div>I have different =
opinion about this. In current practice it's not a tarball which&nbsp;</di=
v><div>could be decompressed easily. The embedded BMC update image is sign=
ed. PSU</div><div>firmware is a part of the root filesystem (as a file). I=
n this case the &nbsp;whole update&nbsp;</div><div>flow would&nbsp;<span s=
tyle=3D"font-size: 10.5pt; line-height: 1.5; background-color: transparent=
;">look like:</span></div><div>1. Upload and update the BMC firmware itsel=
f.</div><div>2. Boot to new version of BMC firmware.</div><div>3. BMC to r=
ead PSU firmware version from PSU, and compare with the file shipped</div>=
<div>&nbsp; &nbsp; with this BMC firmware.</div><div>4. If update needed, =
update tool could be launched.</div><div><br></div><div>Benefit for this i=
s that PSU firmware update process is transparent to end user.</div><div><=
br></div><div>How do you think?</div><div><br></div><div>Yuan Li</div><div=
><br></div>=0A<div>&gt;&gt; The reason I ask is because if we could get cl=
ear requirements, it is </div>=0A<div>&gt;&gt; possible</div>=0A<div>&gt;&=
gt; to simplify the design.</div>=0A<div><br></div><div><br></div>=0A</blo=
ckquote>=0A</body></html>
------=_001_NextPart624106210581_=------

