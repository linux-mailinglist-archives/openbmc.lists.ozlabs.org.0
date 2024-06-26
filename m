Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AD09176F0
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2024 05:50:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=MrLYWI8b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W87540cl1z30Wq
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2024 13:50:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=MrLYWI8b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=117.135.210.8; helo=m16.mail.126.com; envelope-from=guilin1985@126.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 912 seconds by postgrey-1.37 at boromir; Wed, 26 Jun 2024 13:49:43 AEST
Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.8])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W874R3sqXz30V7
	for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 13:49:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:Subject:Mime-Version:Message-ID:
	Content-Type; bh=Byv4TCJCBgddajIVTa8UTAh7Q1L3t+JVaASYEcu5DSU=;
	b=MrLYWI8bp6G33E54KF9IuxfRl3RGl+5ccXdaMAOXIA+oGLKLtFtGcOYz61tlTc
	9x9bpnYaUEENrUykEFaN+fxi582o3yjkOyVD/IF2a+F1aA55IDKY+qgTYrnHlHJo
	Gj3+6Ybfh6chJ3hv4HdjPjWqBoLvUqyZGH93QJsofzd0M=
Received: from DESKTOP-ABEL (unknown [171.223.209.246])
	by gzga-smtp-mta-g1-1 (Coremail) with SMTP id _____wD3X_0HjHtmdGtnAA--.42949S2;
	Wed, 26 Jun 2024 11:33:27 +0800 (CST)
Date: Wed, 26 Jun 2024 11:33:27 +0800
From: "guilin1985@126.com" <guilin1985@126.com>
To: "Bala Subramaniyan" <Bala.Subramaniyan@Ltts.com>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: Help with IPMB (IPMI over I2C).
References: <MA1PR01MB4308AF26A122B17FCC91768C80C82@MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM>
X-Priority: 3
X-GUID: 911AB157-A44D-4509-9136-77CA020F95EE
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.259[cn]
Mime-Version: 1.0
Message-ID: <2024062611332746222218@126.com>
Content-Type: multipart/related;
	boundary="----=_001_NextPart584358813550_=----"
X-CM-TRANSID: _____wD3X_0HjHtmdGtnAA--.42949S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxury8Xw1DJr4UZr4UCw1UAwb_yoW5Zw18pr
	Z8Crs5Jr4Iqwn7Kws3ZF4UCrWFqas5tFZ5tr4xJrZ8AFs5CFWI9a48tw1Y9aykA3yxAa13
	JrWq9r4UW3Z2gFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piSAL_UUUUU=
X-Originating-IP: [171.223.209.246]
X-CM-SenderInfo: xjxlzxrqrzmka6rslhhfrp/1tbiyAgKh2WWgdjh4wAAsl
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
Cc: Thangaraj S <Thangaraj.S@Ltts.com>, Lalit Kumar <Lalit.Kumar2@ltts.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.

------=_001_NextPart584358813550_=----
Content-Type: multipart/alternative;
	boundary="----=_002_NextPart326682101664_=----"


------=_002_NextPart326682101664_=----
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SWYgeW91IHVzZSBJUE1C77yMdHdvIGJtYyBuZWVkIHRvIHNldCAgZGlmZmVyZW50IElQTUIgaTJj
IHNsYXZlIGFkZHJlc3MuIA0KDQpUaGlzIGlzIG5vdCBlYXN5IHRvIGRvIGZvciB0d28gQk1DcyB1
c2luZyB0aGUgc2FtZSBpbWFnZQ0KDQogTWF5YmUgeW91IGNhbiB1c2UgdWFydCBpbnN0ZWFkLiAg
VGhlIGRpZmZpY3VsdHkgaXMgdGhhdCB5b3UgbmVlZCB0byB3cml0ZSB5b3VyIG93biBjb2RlIHRv
IGltcGxlbWVudCBpcG1pIHNlcmlhbGJyaWRnZS4NCg0KSXBtaXRvb2wgdXNlIExpa2UgdGhpc++8
mg0KDQoNCnJvb3RAYm1jOi8jIGlwbWl0b29sIC1JIHNlcmlhbC10ZXJtaW5hbCAtRCAvZGV2L3R0
eVMzOjExNTIwMCBsYW4gcHJpbnQgMQ0KU2V0IGluIFByb2dyZXNzICAgICAgICAgICAgICAgICA6
IFNldCBDb21wbGV0ZQ0KQXV0aCBUeXBlIFN1cHBvcnQgICAgICAgICAgIDogDQpBdXRoIFR5cGUg
RW5hYmxlICAgICAgICAgICAgIDogQ2FsbGJhY2sgOiANCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgOiBVc2VyICAgICA6IA0KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA6IE9wZXJhdG9yIDogDQogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDogQWRtaW4gICAgOiANCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgOiBPRU0gICAgICA6IA0KSVAgQWRkcmVzcyBTb3VyY2UgICAgICAgICAg
ICA6IFN0YXRpYyBBZGRyZXNzDQpJUCBBZGRyZXNzICAgICAgICAgICAgICAgICAgICAgICAgOiAx
MC4wLjAuMjM1DQpTdWJuZXQgTWFzayAgICAgICAgICAgICAgICAgICAgOiAyNTUuMjU1LjAuMA0K
TUFDIEFkZHJlc3MgICAgICAgICAgICAgICAgICAgOiBhMDoxOTpiMjo5NDowYzowMw0KRGVmYXVs
dCBHYXRld2F5IElQICAgICAgICAgIDogMTAuMC4wLjENCkRlZmF1bHQgR2F0ZXdheSBNQUMgICAg
IDogMDA6MDA6MDA6MDA6MDA6MDANCjgwMi4xcSBWTEFOIElEICAgICAgICAgICAgICAgOiBEaXNh
YmxlZA0KUk1DUCsgQ2lwaGVyIFN1aXRlcyAgICAgIDogMywxNw0KQ2lwaGVyIFN1aXRlIFByaXYg
TWF4ICAgICAgOiBhYWFhYWFhYWFhYWFhYWENCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgOiAgICAgWD1DaXBoZXIgU3VpdGUgVW51c2VkDQogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDogICAgIGM9Q0FMTEJBQ0sNCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgOiAgICAgdT1VU0VSDQogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDogICAgIG89T1BFUkFUT1INCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgOiAgICAgYT1BRE1JTg0KICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICA6ICAgICBPPU9FTQ0KQmFkIFBhc3N3b3JkIFRocmVz
aG9sZCAgOiBOb3QgQXZhaWxhYmxlDQpyb290QGJtYzovIyANCnJvb3RAYm1jOi8jIGlwbWl0b29s
IC1JIHNlcmlhbC10ZXJtaW5hbCAtRCAvZGV2L3R0eVMzOjExNTIwMCBzZHIgZWxpc3QNCmJvYXJk
IGN1cnIgICAgICAgICAgICB8IDAwaCB8IG9rICB8IDIzLjEgfCAxLjAwIEFtcHMNCnBzdTIgY3Vy
ciBpbiAgICAgICAgIHwgMDFoIHwgb2sgIHwgMTQuMiB8IDAgQW1wcw0KcHN1MiBjdXJyIG91dCAg
ICAgICB8IDAyaCB8IG9rICB8IDE0LjIgfCAxIEFtcHMNClB3bSAxICAgICAgICAgICAgICAgICAg
fCAwM2ggfCBvayAgfCAyOS4xIHwgNzkuOTcgcGVyY2VudA0KUHdtIDIgICAgICAgICAgICAgICAg
ICB8IDA0aCB8IG9rICB8IDI5LjIgfCA3OS45NyBwZXJjZW50DQpQd20gMyAgICAgICAgICAgICAg
ICAgIHwgMDVoIHwgb2sgIHwgMjkuMyB8IDc5Ljk3IHBlcmNlbnQNClB3bSBwc3UyIEZhbiAxICAg
fCAwNmggfCBvayAgfCAxNC4yIHwgMzAuMTggcGVyY2VudA0KZmFuMSAgICAgICAgICAgICAgICAg
ICAgICB8IDA3aCB8IG5zICB8IDI5LjEgfCBObyBSZWFkaW5nDQpmYW4yICAgICAgICAgICAgICAg
ICAgICAgIHwgMDhoIHwgbnMgIHwgMjkuMiB8IE5vIFJlYWRpbmcNCmZhbjMgICAgICAgICAgICAg
ICAgICAgICAgfCAwOWggfCBucyAgfCAyOS4zIHwgTm8gUmVhZGluZw0KcHN1MiBmYW4gICAgICAg
ICAgICAgICB8IDBBaCB8IG9rICB8IDE0LjIgfCAzMjc2IFJQTQ0KYm9hcmQgcG93ZXIgICAgICAg
IHwgMEJoIHwgb2sgIHwgMjMuMSB8IDE5Mi4wOCBXYXR0cw0KcHN1MiBwb3dlciBpbiAgICAgIHwg
MENoIHwgb2sgIHwgMTQuMiB8IDE4LjkwIFdhdHRzDQpwc3UyIHBvd2VyIG91dCAgIHwgMERoIHwg
b2sgIHwgMTQuMiB8IDEyLjYwIFdhdHRzDQp0b3RhbCBwb3dlciAgICAgICAgICB8IDBFaCB8IG9r
ICB8IDIzLjEgfCAxOTUuMzAgV2F0dHMNCmNwdSAwICAgICAgICAgICAgICAgICAgICB8IDBGaCB8
IG5zICB8IDIzLjMgfCBObyBSZWFkaW5nDQpwY2ggdGVtcCAgICAgICAgICAgICB8IDEwaCB8IG5z
ICB8IDIzLjIgfCBObyBSZWFkaW5nDQpwc3UyIHRlbXAgICAgICAgICAgIHwgMTFoIHwgb2sgIHwg
MTQuMiB8IDMzIGRlZ3JlZXMgQw0KYmF0dGVyeSAgICAgICAgICAgICAgICAgfCAxMmggfCBvayAg
fCA0MC4xIHwgMy4wMCBWb2x0cw0KYm9hcmQgdm9sICAgICAgICAgICAgIHwgMTNoIHwgb2sgIHwg
MjMuMSB8IDExLjk4IFZvbHRzDQpwc3UyIHZvbCBpbiAgICAgICAgICAgfCAxNGggfCBvayAgfCAx
NC4yIHwgMjE4LjU0IFZvbHRzDQpwc3UyIHZvbCBvdXQgICAgICAgIHwgMTVoIHwgb2sgIHwgMTQu
MiB8IDExLjk4IFZvbHRzDQogDQpGcm9tOiBCYWxhIFN1YnJhbWFuaXlhbg0KRGF0ZTogMjAyNC0w
Ni0yMCAxODo0Mw0KVG86IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KQ0M6IFRoYW5nYXJhaiBT
OyBMYWxpdCBLdW1hcg0KU3ViamVjdDogSGVscCB3aXRoIElQTUIgKElQTUkgb3ZlciBJMkMpLg0K
DQpIaSBBbGwsDQoNCkZvciBvbmUgb2Ygb3VyIHJlcXVpcmVtZW50IChCTUMgdG8gQk1DLCBJUE1J
IG92ZXIgSTJDKSwgV2UncmUgZXhwbG9yaW5nIHdpdGggSVBNSVRPT0wuDQoNCkRldmVsb3BtZW50
IEJvYXJkOiBBU1BFRUQgQVNUMjYwMCBFVkINCg0KQ291bGQgeW91IHBsZWFzZSBzdWdnZXN0IHVz
IGhvdyB0byBwcm9jZWVkIGZ1cnRoZXIgd2l0aCBvdXIgYmVsb3cgcmVxdWlyZW1lbnQuDQpCTUMg
dG8gQk1DIChJUE1JIG92ZXIgSTJDKSwgT25lIEJNQyBhcyBNYXN0ZXIgYW5kIG90aGVyIGFzIHNs
YXZlLg0KU2VuZC9SZWNlaXZlIElQTUkgY29tbWFuZHMgdGhyb3VnaCBJUE1JVE9PTCBmcm9tIG9u
ZSBCTUMgdG8gb3RoZXIuDQpTZW5kL1JlY2VpdmUgU0RSLCBTRUwgbG9ncyBiZXR3ZWVuIHR3byBC
TUMncy4NCkFueSBoZWxwIHdvdWxkIGJlIGhpZ2hseSBhcHByZWNpYXRlZC4NCg0KDQoNClRoYW5r
cywgYW5kIHJlZ2FyZHMsDQpCYWxhIFN1YnJhbWFuaXlhbiBNLA0KDQoNClMxIEJ1aWxkaW5nLCBM
JlQgVGVjaCBQYXJrLCBCZWxsYXJ5IFJvYWQsIA0KTmV4dCB0byBSYWludHJlZSBCb3VsZXZhcmQs
IFBhcmsgVmlldyBMYXlvdXQsIA0KQnlhdGFyYXlhbmFwdXJhLCBCZW5nYWx1cnUtNTYwMDkyDQpN
b2JpbGU6ICs5MSA5Njc3MDM1NDY3DQpFTkdJTkVFUklORyBUSEUgQ0hBTkdFIHwgd3d3LkxUVFMu
Y29tDQoNCg0KTCZUIFRlY2hub2xvZ3kgU2VydmljZXMgTHRkDQp3d3cuTFRUUy5jb20NCkwmVCBU
ZWNobm9sb2d5IFNlcnZpY2VzIExpbWl0ZWQgKExUVFMpIGlzIGNvbW1pdHRlZCB0byBzYWZlZ3Vh
cmQgeW91ciBwcml2YWN5LiBSZWFkIHRoZSBhcHByb3ByaWF0ZSBwcml2YWN5IG5vdGljZSBhcHBs
aWNhYmxlIHRvIHlvdSB0byBrbm93IG1vcmUgYWJvdXQgaG93IExUVFMgY29sbGVjdHMsIHVzZXMg
YW5kIHN0b3JlcyB5b3VyIHBlcnNvbmFsIGRhdGEuIFBsZWFzZSB2aXNpdCBvdXIgcHJpdmFjeSBw
b2xpY3kgYXZhaWxhYmxlIG9uIG91ciB3ZWJzaXRlIHd3dy5MdHRzLmNvbSBmb3IgbW9yZSBpbmZv
cm1hdGlvbiBhYm91dCBvdXIgY29tbWl0bWVudCB0b3dhcmRzIGRhdGEgcHJpdmFjeSB1bmRlciBh
cHBsaWNhYmxlIGRhdGEgcHJvdGVjdGlvbiBsYXdzLiBUaGlzIGVtYWlsIG1heSBjb250YWluIGNv
bmZpZGVudGlhbCBvciBwcml2aWxlZ2VkIGluZm9ybWF0aW9uIGZvciB0aGUgaW50ZW5kZWQgcmVj
aXBpZW50KHMpLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2Ug
ZG8gbm90IHVzZSBvciBkaXNzZW1pbmF0ZSB0aGUgaW5mb3JtYXRpb24sIG5vdGlmeSB0aGUgc2Vu
ZGVyIGFuZCBkZWxldGUgaXQgZnJvbSB5b3VyIHN5c3RlbS4NCg==

------=_002_NextPart326682101664_=----
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3Dutf-8"><style>body { line-height: 1.5; }blockquote { margin-top: 0px; =
margin-bottom: 0px; margin-left: 0.5em; }ol, ul { margin-top: 0px; margin-=
bottom: 0px; list-style-position: inside; }p { margin-top: 0px; margin-bot=
tom: 0px; }div.FoxDiv20240626105006385810 { }body { font-size: 14px; font-=
family: "Microsoft YaHei UI"; color: rgb(0, 0, 0); line-height: 1.5; }</st=
yle></head><body>=0A<div><span></span>If&nbsp;you&nbsp;use IPMB=EF=BC=8Ctw=
o&nbsp;bmc&nbsp;need&nbsp;to&nbsp;set&nbsp; different IPMB i2c&nbsp;slave&=
nbsp;address.&nbsp;</div><div><br></div><div>This is not easy to do for tw=
o BMCs using the same image</div><div><br></div><div>&nbsp;Maybe&nbsp;you&=
nbsp;can&nbsp;use&nbsp;uart&nbsp;instead.&nbsp; The difficulty&nbsp;is tha=
t you need to write your own code to implement ipmi serialbridge.</div><di=
v><br></div><div>Ipmitool&nbsp;use Like&nbsp;this=EF=BC=9A</div><div><br><=
/div><div><br></div><div><div>root@bmc:/# ipmitool -I serial-terminal -D /=
dev/ttyS3:115200 lan print 1</div><div>Set in Progress&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: Set Complete</div><div>Auth Ty=
pe Support&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;:&nbsp;</div><div>Auth =
Type Enable&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: Callback :&nb=
sp;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;: User&nbsp; &nbsp; &nbsp;:&nbsp;</div><div>&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: Operator :&nbsp;</=
div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;: Admin&nbsp; &nbsp; :&nbsp;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: OEM&nbsp; &nbsp; &nbsp; :&nb=
sp;</div><div>IP Address Source&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; :=
 Static Address</div><div>IP Address&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : 10.0.0.235</div><div>Subne=
t Mask&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; : 255.255.0.0</div><div>MAC Address&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;: a0:19:b2:94:0c:03</div><div>Default Gate=
way IP&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : 10.0.0.1</div><div>Default Gate=
way MAC&nbsp; &nbsp; &nbsp;: 00:00:00:00:00:00</div><div>802.1q VLAN ID&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: Disabled</div><div>R=
MCP+ Cipher Suites&nbsp; &nbsp; &nbsp; : 3,17</div><div>Cipher Suite Priv =
Max&nbsp; &nbsp; &nbsp; : aaaaaaaaaaaaaaa</div><div>&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;:&nbsp; &nbsp; &nbsp;X=
=3DCipher Suite Unused</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;:&nbsp; &nbsp; &nbsp;c=3DCALLBACK</div><div=
>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;:=
&nbsp; &nbsp; &nbsp;u=3DUSER</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;:&nbsp; &nbsp; &nbsp;o=3DOPERATOR</di=
v><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;:&nbsp; &nbsp; &nbsp;a=3DADMIN</div><div>&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;:&nbsp; &nbsp; &nbsp;O=3DOEM</=
div><div>Bad Password Threshold&nbsp; : Not Available</div><div>root@bmc:/=
#&nbsp;</div><div>root@bmc:/# ipmitool -I serial-terminal -D /dev/ttyS3:11=
5200 sdr elist</div><div>board curr&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; | 00h | ok&nbsp; | 23.1 | 1.00 Amps</div><div>psu2 curr in&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;| 01h | ok&nbsp; | 14.2 | 0 Amps</div><div>psu2 curr =
out&nbsp; &nbsp; &nbsp; &nbsp;| 02h | ok&nbsp; | 14.2 | 1 Amps</div><div>P=
wm 1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 03h |=
 ok&nbsp; | 29.1 | 79.97 percent</div><div>Pwm 2&nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 04h | ok&nbsp; | 29.2 | 79.97 perce=
nt</div><div>Pwm 3&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | 05h | ok&nbsp; | 29.3 | 79.97 percent</div><div>Pwm psu2 Fan 1&nb=
sp; &nbsp;| 06h | ok&nbsp; | 14.2 | 30.18 percent</div><div>fan1&nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 07h |=
 ns&nbsp; | 29.1 | No Reading</div><div>fan2&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 08h | ns&nbsp; | 29.2 | N=
o Reading</div><div>fan3&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; | 09h | ns&nbsp; | 29.3 | No Reading</div><div>=
psu2 fan&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 0Ah | ok&=
nbsp; | 14.2 | 3276 RPM</div><div>board power&nbsp; &nbsp; &nbsp; &nbsp; |=
 0Bh | ok&nbsp; | 23.1 | 192.08 Watts</div><div>psu2 power in&nbsp; &nbsp;=
 &nbsp; | 0Ch | ok&nbsp; | 14.2 | 18.90 Watts</div><div>psu2 power out&nbs=
p; &nbsp;| 0Dh | ok&nbsp; | 14.2 | 12.60 Watts</div><div>total power&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; | 0Eh | ok&nbsp; | 23.1 | 195.30 Watts</div><=
div>cpu 0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; | 0Fh | ns&nbsp; | 23.3 | No Reading</div><div>pch temp&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 10h | ns&nbsp; | 23.2 | No Reading</di=
v><div>psu2 temp&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 11h | ok&nbsp; =
| 14.2 | 33 degrees C</div><div>battery&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;| 12h | ok&nbsp; | 40.1 | 3.00 Volts</div><div>=
board vol&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 13h | ok&nbsp; =
| 23.1 | 11.98 Volts</div><div>psu2 vol in&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;| 14h | ok&nbsp; | 14.2 | 218.54 Volts</div><div>psu2 vol out&nbs=
p; &nbsp; &nbsp; &nbsp; | 15h | ok&nbsp; | 14.2 | 11.98 Volts</div></div>=
=0A<blockquote style=3D"margin-Top: 0px; margin-Bottom: 0px; margin-Left: =
0.5em; margin-Right: inherit"><div>&nbsp;</div><div style=3D"border:none;b=
order-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm 0cm 0cm"><div style=3D"PAD=
DING-RIGHT: 8px; PADDING-LEFT: 8px; FONT-SIZE: 12px;FONT-FAMILY:tahoma;COL=
OR:#000000; BACKGROUND: #efefef; PADDING-BOTTOM: 8px; PADDING-TOP: 8px"><d=
iv><b>From:</b>&nbsp;<a href=3D"mailto:Bala.Subramaniyan@Ltts.com">Bala Su=
bramaniyan</a></div><div><b>Date:</b>&nbsp;2024-06-20&nbsp;18:43</div><div=
><b>To:</b>&nbsp;<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists=
.ozlabs.org</a></div><div><b>CC:</b>&nbsp;<a href=3D"mailto:Thangaraj.S@Lt=
ts.com">Thangaraj S</a>; <a href=3D"mailto:Lalit.Kumar2@ltts.com">Lalit Ku=
mar</a></div><div><b>Subject:</b>&nbsp;Help with IPMB (IPMI over I2C).</di=
v></div></div><div><div class=3D"FoxDiv20240626105006385810">=0A<div class=
=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">=0A<br>=0A</div>=0A<div class=3D"elem=
entToProof" style=3D"font-family: Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">=0AHi All,</div>=0A<div class=3D"elementToPro=
of" style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">=0A<br>=0A</div>=0A<div class=3D"elementToProof" styl=
e=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; color: rg=
b(0, 0, 0);">=0AFor one of our requirement (BMC to BMC, IPMI over I2C), We=
're exploring with <a href=3D"https://github.com/openbmc/ipmitool" id=3D"L=
Plnk386168" title=3D"https://github.com/openbmc/ipmitool">=0AIPMITOOL</a>.=
</div>=0A<div class=3D"elementToProof" style=3D"font-family: Arial, Helvet=
ica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">=0A<br>=0A</div>=
=0A<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0);">=0ADevelopment Board: AS=
PEED AST2600 EVB</div>=0A<div class=3D"elementToProof" style=3D"font-famil=
y: Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">=
=0A<br>=0A</div>=0A<div class=3D"elementToProof" style=3D"font-family: Ari=
al, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">=0ACould=
 you please suggest us how to proceed further with our below requirement.<=
/div>=0A<div id=3D"Signature">=0A<ol start=3D"1" data-listchain=3D"__List_=
Chain_25" style=3D"margin-top: 0px;">=0A<li style=3D"font-family: Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">=0A<div style=
=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">=0ABMC to BMC (IPMI over I2C), One BMC as Master and other as =
slave.</div>=0A</li><li style=3D"font-family: Arial, Helvetica, sans-serif=
; font-size: 12pt; color: rgb(0, 0, 0);">=0A<div style=3D"margin: 0px; fon=
t-family: Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, =
0);">=0ASend/Receive IPMI commands through <a href=3D"https://github.com/o=
penbmc/ipmitool" id=3D"LPlnk482442" title=3D"https://github.com/openbmc/ip=
mitool">=0AIPMITOOL</a>&nbsp;from one BMC to other.</div>=0A</li><li style=
=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);">=0A<div style=3D"margin: 0px; font-family: Arial, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0);">=0ASend/Receive SDR, SEL=
 logs between two BMC's.</div>=0A</li></ol>=0A<div style=3D"font-family: A=
rial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">=0AAny=
 help would be highly appreciated.</div>=0A<div style=3D"margin: 0px; font=
-family: Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0=
);">=0A<br>=0A</div>=0A<div style=3D"margin: 0px; font-family: Arial, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">=0A<br>=0A</div>=
=0A<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0);">=0A<br>=0A</div>=0A<div style=3D"font-family: Ari=
al, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">=0A<b>Th=
anks, and regards,</b></div>=0A<div style=3D"font-family: Arial, Helvetica=
, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">=0A<b>Bala Subramaniy=
an M,</b></div>=0A<div style=3D"font-family: Arial, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">=0A<span><img id=3D"Picture_x0020_=
12" width=3D"330" height=3D"2" style=3D"width: 330px; height: 2px; max-wid=
th: 728px; margin-top: 0px; margin-bottom: 0px;" data-outlook-trace=3D"F:1=
|T:1" src=3D"cid:_Foxmail.1@45605f7d-fb2e-963f-f695-b452d6cee948"></span><=
/div>=0A<p style=3D"margin-top: 0px; margin-bottom: 0px;"><span style=3D"f=
ont-family: Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0=
, 0);"><br>=0A</span></p>=0A<p style=3D"margin-top: 0px; margin-bottom: 0p=
x;"><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);"><a href=3D"https://www.ltts.com/" id=3D"OWA6c6e=
5238-9b2b-5191-e8ca-693313afccbe" class=3D"OWAAutoLink" style=3D"color: rg=
b(0, 0, 0); margin-top: 0px; margin-bottom: 0px;"><img id=3D"Graphic_x0020=
_2" width=3D"249" height=3D"38" style=3D"width: 249px; height: 38px; max-w=
idth: 728px; margin-top: 0px; margin-bottom: 0px;" data-outlook-trace=3D"F=
:1|T:1" src=3D"cid:_Foxmail.1@e9f6edb0-db5a-6816-9808-6f4ba75024d1"></a></=
span></p>=0A<p style=3D"line-height: 115%; margin-top: 0px; margin-bottom:=
 0px;"><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); line-height: 115%;"><br>=0A</span></p>=0A<p s=
tyle=3D"line-height: 115%; margin-top: 0px; margin-bottom: 0px;"><span sty=
le=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; color: r=
gb(0, 0, 0); line-height: 115%;">S1 Building, L&amp;T Tech Park, Bellary R=
oad,=0A</span></p>=0A<p style=3D"line-height: 115%; margin-top: 0px; margi=
n-bottom: 0px;"><span style=3D"font-family: Arial, Helvetica, sans-serif; =
font-size: 12pt; color: rgb(0, 0, 0); line-height: 115%;">Next to Raintree=
 Boulevard, Park View Layout,=0A</span></p>=0A<p style=3D"line-height: 115=
%; margin-top: 0px; margin-bottom: 0px;"><span style=3D"font-family: Arial=
, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); line-height=
: 115%;">Byatarayanapura, Bengaluru-560092</span></p>=0A<p style=3D"line-h=
eight: 115%; margin-top: 0px; margin-bottom: 0px;"><span style=3D"font-fam=
ily: Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); l=
ine-height: 115%;">Mobile: +91 9677035467</span></p>=0A<p style=3D"line-he=
ight: 150%; margin-top: 0px; margin-bottom: 0px;"><span style=3D"font-fami=
ly: Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(13, 13, 13);=
 line-height: 150%;">ENGINEERING<b> THE CHANGE</b></span><span style=3D"fo=
nt-family: Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0,=
 0); line-height: 150%;">=0A | </span><span style=3D"font-family: Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(13, 13, 13); line-height=
: 150%;"><a href=3D"https://www.ltts.com/" id=3D"OWAb524bd29-c4d5-0ee2-a2b=
7-db76f98ee7d9" class=3D"OWAAutoLink" style=3D"color: rgb(13, 13, 13); mar=
gin-top: 0px; margin-bottom: 0px;">www.LTTS.com</a></span></p>=0A<p style=
=3D"line-height: 150%; margin-top: 0px; margin-bottom: 0px;"><span style=
=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb=
(0, 0, 0);"><img id=3D"Picture_x0020_12" width=3D"330" height=3D"2" style=
=3D"width: 330px; height: 2px; max-width: 728px; margin-top: 0px; margin-b=
ottom: 0px;" data-outlook-trace=3D"F:1|T:1" src=3D"cid:_Foxmail.1@c9af4744=
-4d18-49c5-6e50-947f314fe35d"></span></p>=0A</div>=0A<br>=0A<img alt=3D"Lt=
ts.com" src=3D"https://lttswallpaper.blob.core.windows.net/lttswp/GPTW-ema=
il-sign-2.jpg"><br>=0A<p style=3D"margin-top: 0px; margin-bottom: 0px;"><s=
trong>L&amp;T Technology Services Ltd</strong></p>=0A<p style=3D"margin-to=
p: 0px; margin-bottom: 0px;"><a href=3D"" http:=3D"" www.ltts.com=3D"" ??=
=3D"" target=3D"" _blank??=3D"">www.LTTS.com</a></p>=0A<p style=3D"margin-=
top: 0px; margin-bottom: 0px;">L&amp;T Technology Services Limited (LTTS) =
is committed to safeguard your privacy. Read the appropriate=0A<a href=3D"=
https://www.ltts.com/privacy-policies-notices" target=3D"_blank">privacy n=
otice</a> applicable to you to know more about how LTTS collects, uses and=
 stores your personal data. Please visit our=0A<a href=3D"https://www.ltts=
.com/data-privacy-policy" target=3D"_blank">privacy policy</a> available o=
n our website www.Ltts.com for more information about our commitment towar=
ds data privacy under applicable data protection laws. This email may cont=
ain confidential=0A or privileged information for the intended recipient(s=
). If you are not the intended recipient, please do not use or disseminate=
 the information, notify the sender and delete it from your system.</p>=0A=
</div></div></blockquote>=0A</body></html>
------=_002_NextPart326682101664_=------

------=_001_NextPart584358813550_=----
Content-Type: image/png;
	name="Outlook-ksfw50nf(06-26-10-50-06).png"
Content-Transfer-Encoding: base64
Content-ID: <_Foxmail.1@45605f7d-fb2e-963f-f695-b452d6cee948>

iVBORw0KGgoAAAANSUhEUgAAAUoAAAACCAYAAAA+VZWwAAAAKklEQVRIS+3QAQEAAAQAIPY55jUL
WFATysCAAQMG3oGM6nFkwIABA/fAAnjMAdUWFbQgAAAAAElFTkSuQmCC

------=_001_NextPart584358813550_=----
Content-Type: image/png;
	name="Outlook-i2prdv3q(06-26-10-50-06).png"
Content-Transfer-Encoding: base64
Content-ID: <_Foxmail.1@e9f6edb0-db5a-6816-9808-6f4ba75024d1>

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
AABJRU5ErkJggg==

------=_001_NextPart584358813550_=----
Content-Type: image/png;
	name="Outlook-eb25bini(06-26-10-50-06).png"
Content-Transfer-Encoding: base64
Content-ID: <_Foxmail.1@c9af4744-4d18-49c5-6e50-947f314fe35d>

iVBORw0KGgoAAAANSUhEUgAAAUoAAAACCAYAAAA+VZWwAAAAKklEQVRIS+3QAQEAAAQAIPY55jUL
WFATysCAAQMG3oGM6nFkwIABA/fAAnjMAdUWFbQgAAAAAElFTkSuQmCC

------=_001_NextPart584358813550_=------

