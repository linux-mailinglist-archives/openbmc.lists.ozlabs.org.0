Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D398F9E4780
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2024 23:08:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3Wpt68wxz3vwf
	for <lists+openbmc@lfdr.de>; Thu,  5 Dec 2024 09:07:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.28.115
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733306325;
	cv=none; b=ExDmnKfVjdKJkSwkIliG4D20454rE097XYB+YI7aZ+Wo8AHGR1nTIoB4RNnltI9+QBygTjigHop+OUe2x+s3O1CZLJ27pIPCgnjaugznfZy3r4KvhJj1fzpd5ppr+3fetkI7d2Gn+MuzB8NFC9WncpuUG6GKVFJHuxuodFNpBgNv7UgjdErnGCDpLl3nr5bemb0gzGeTJEKKJFuCZpNXo+qf5r7Wjxqk4/cpRy3VoKe+HWdtmHyFF0K3OWjjX6VOHoqLMYgAcVL277hcAxy6Jxpefq4dn6DYePxmUIv+OyHLY9PmcsprUYIIkHwaZzCDaJq3f9j7w5rE37O/snYPuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733306325; c=relaxed/relaxed;
	bh=pqEdB7gKhjgcVShZdelT/wcXkpddeQkVbpSREiSY1JI=;
	h=Date:From:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=GZfUstm8RKo90WLkd9ADrE5qqy0ue24ILIHs1nafPYzsPx9PUfPxJ/WPa93ZaMMGwqZsgSCUGe0JJugoNMzvnV5OhPHrctp0eeCFATSNZN0Luybf3hiBkbWlH+JZm/ZHN8BmuN87bMwXwuhoUIPZyRMMggfsCuylawpuUU5sFeJAjw27YmZqvQGcNG601VBy0BjFjVnXcyYEOwHxSnLd1zIdg2B88JKyW9/3WkCKfCt5jXI1uLHmITsT5sITMbjpccbIaGhBltwPp2TjJjJpLHOi4Idy8nfoiUXSwQuDX+Yxkug4yC7BZuVfJb95RjBBhv6kX3tc3D+CnkVHaW4A7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=vicglobalintelligence.com; spf=pass (client-ip=115.124.28.115; helo=out28-115.mail.aliyun.com; envelope-from=lucia@vicglobalintelligence.com; receiver=lists.ozlabs.org) smtp.mailfrom=vicglobalintelligence.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=vicglobalintelligence.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=vicglobalintelligence.com (client-ip=115.124.28.115; helo=out28-115.mail.aliyun.com; envelope-from=lucia@vicglobalintelligence.com; receiver=lists.ozlabs.org)
Received: from out28-115.mail.aliyun.com (out28-115.mail.aliyun.com [115.124.28.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3Cdv42QFz30Vj
	for <openbmc@lists.ozlabs.org>; Wed,  4 Dec 2024 20:58:40 +1100 (AEDT)
X-Alimail-AntiSpam: AC=AD;BC=0.8159655|0.1188611;BR=01201311R201b1;CH=blue;DM=|AD|false|;DS=AD|ad_normal|0.479778-0.42128-0.0989418;FP=3950699010800133040|2|1|0|0|-1|-1|-1;HT=maildocker-contentspam033045044146;MF=lucia@vicglobalintelligence.com;NM=1;PH=DW;RN=0;RT=0;SR=0;TI=W4_0.2.3_v5ForWebDing_21461AA4_1733306298114_o7001c635;
Received: from WS-web (lucia@vicglobalintelligence.com[W4_0.2.3_v5ForWebDing_21461AA4_1733306298114_o7001c635] cluster:ay29) at Wed, 04 Dec 2024 17:58:21 +0800
Date: Wed, 04 Dec 2024 17:58:21 +0800
From: "Lucia" <lucia@vicglobalintelligence.com>
Message-ID: <a9afb8d7-fac2-47b5-b4c0-4db9fcab5cda.lucia@vicglobalintelligence.com>
Subject: =?UTF-8?B?U21hcnQgVG9pbGV0IENvbnRyb2xsZXI=?=
X-Mailer: [Alimail-Mailagent revision 88][W4_0.2.3][v5ForWebDing][Chrome]
MIME-Version: 1.0
x-aliyun-im-through: {"version":"v1.0"}
x-aliyun-mail-creator: W4_0.2.3_v5ForWebDing_SFRTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEzMS4wLjAuMCBTYWZhcmkvNTM3LjM2IEVkZy8xMzEuMC4wLjA=Ch
Content-Type: multipart/alternative;
  boundary="----=ALIBOUNDARY_2691_7ff83eb3f700_675027bd_676ed4"
X-Spam-Status: No, score=1.2 required=5.0 tests=HTML_MESSAGE,MISSING_HEADERS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 05 Dec 2024 09:07:01 +1100
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
Reply-To: Lucia <lucia@vicglobalintelligence.com>
Cc: 13076682282 <13076682282@163.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

------=ALIBOUNDARY_2691_7ff83eb3f700_675027bd_676ed4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGksCldlIHB1Ymxpc2hlZCBBIFN1cnZleSBvbiBTbWFydCBUb2lsZXQgQ29udHJvbGxlci4gT3Vy
IHN1cnZleSB3aWxsIGdpdmUgeW91IHVwZGF0ZWQgdmlldyBvZiB0aGUgdG90YWwgbWFya2V0IHNp
emUgYW5kIG1hcmtldCBjb21wZXRpdGlvbiBlbnZpcm9ubWVudCwgbWFya2V0IHRyZW5kIGFuZCBt
YXJrZXQgc2hhcmUsIGV0Yy4sIHRvIGhlbHAgeW91IGdlbmVyYXRlIHN0cmF0ZWdpYyBpZGVhcyBv
ZiB5b3VyIGJ1c2luZXNzLgpUaGUgZm9sbG93aW5nIG1hbnVmYWN0dXJlcnMgYXJlIGNvdmVyZWQ6
Ck5YUApMWCBTZW1pY29uClNUTWljcm9lbGVjdHJvbmljcwpJbmZpbmVvbgpUZXhhcyBJbnN0cnVt
ZW50cwpTaWxpY29uIExhYnMKTnV2b3RvbgpIb2x0ZWsKR2lnYURldmljZQpTaGVuWmhlbiBUb3Bi
YW5kCkppYW5neGkgTGlhbmNodWFuZyBPcHRvLUVsZWN0cm9uaWMgU2NpZW5jZSBhbmQgVGVjaG5v
bG9neQpXdWhhbiBYaW55dWFuIFNlbWljb25kdWN0b3IKWGlhbWVuIEh1YWxpYW4gRWxlY3Ryb25p
Y3MKU1pSREkgVEVDSApGb3NoYW4gU3RlcG9uIFRlY2hub2xvZ3kK4oCm4oCmCihNb3JlIGNvbXBh
bmllcyB0aGF0IG5vdCBsaXN0ZWQgaGVyZSBhcmUgYWxzbyBhdmFpbGFibGUuKQpTZWdtZW50IGJ5
IFR5cGUKUmVtb3RlIENvbnRyb2wgQ29udHJvbGxlcgpUb3VjaCBTY3JlZW4gQ29udHJvbGxlcgpJ
bmR1Y3RpdmUgQ29udHJvbGxlcgpPdGhlcnMKU2VnbWVudCBieSBBcHBsaWNhdGlvbgpIb3VzZWhv
bGQgVG9pbGV0CkNvbW1lcmNpYWwgVG9pbGV0CklmIHlvdSBhcmUgaW50ZXJlc3RlZCBpbiBvdXIg
cmVwb3J0LCBwbGVhc2UgY29udGFjdCB2aWN0b3JpYUB2aWNtYXJrZXRyZXNlYXJjaC5jb20uIFdl
IHdvdWxkIGJlIGhhcHB5IHRvIHNoYXJlIHRoZSBzYW1wbGUgZm9yIHlvdXIgcmVmZXJlbmNlLgpX
ZSBhdCBWTVIgYXBwcmVjaWF0ZSB5b3VyIHN1cHBvcnQgYW5kIGxvb2sgZm9yd2FyZCB0byBuZXcg
b3Bwb3J0dW5pdGllcyB0byBjb21lLgo=
------=ALIBOUNDARY_2691_7ff83eb3f700_675027bd_676ed4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBjbGFzcz0iX19hbGl5dW5fZW1haWxfYm9keV9ibG9jayI+PGRpdiAgc3R5bGU9ImZvbnQt
ZmFtaWx5OiBUYWhvbWEsIEFyaWFsLCBTVEhlaXRpU0MtTGlnaHQsIFNpbVN1biI+PGRpdiAgc3R5
bGU9ImNsZWFyOiBib3RoOyBmb250LWZhbWlseTogVGFob21hLCBBcmlhbCwgU1RIZWl0aVNDLUxp
Z2h0LCBTaW1TdW47Ij48c3BhbiA+PHNwYW4gPkhpLDxiciA+PC9zcGFuPjwvc3Bhbj48ZGl2ICBz
dHlsZT0iY2xlYXI6IGJvdGg7Ij48YnIgPjwvZGl2PjxkaXYgIHN0eWxlPSJjbGVhcjogYm90aDsi
PldlIHB1Ymxpc2hlZCBBIFN1cnZleSBvbiBTbWFydCBUb2lsZXQgQ29udHJvbGxlci4gT3VyIHN1
cnZleSB3aWxsIGdpdmUgeW91IHVwZGF0ZWQgdmlldyBvZiB0aGUgdG90YWwgbWFya2V0IHNpemUg
YW5kIG1hcmtldCBjb21wZXRpdGlvbiBlbnZpcm9ubWVudCwgbWFya2V0IHRyZW5kIGFuZCBtYXJr
ZXQgc2hhcmUsIGV0Yy4sIHRvIGhlbHAgeW91IGdlbmVyYXRlIHN0cmF0ZWdpYyBpZGVhcyBvZiB5
b3VyIGJ1c2luZXNzLjxiciA+PC9kaXY+PGRpdiAgc3R5bGU9ImNsZWFyOiBib3RoOyI+VGhlIGZv
bGxvd2luZyBtYW51ZmFjdHVyZXJzIGFyZSBjb3ZlcmVkOjxiciA+PC9kaXY+PGRpdiAgc3R5bGU9
ImNsZWFyOiBib3RoOyI+TlhQPGJyID48L2Rpdj48ZGl2ICBzdHlsZT0iY2xlYXI6IGJvdGg7Ij5M
WCBTZW1pY29uPGJyID48L2Rpdj48ZGl2ICBzdHlsZT0iY2xlYXI6IGJvdGg7Ij5TVE1pY3JvZWxl
Y3Ryb25pY3M8YnIgPjwvZGl2PjxkaXYgIHN0eWxlPSJjbGVhcjogYm90aDsiPkluZmluZW9uPGJy
ID48L2Rpdj48ZGl2ICBzdHlsZT0iY2xlYXI6IGJvdGg7Ij5UZXhhcyBJbnN0cnVtZW50czxiciA+
PC9kaXY+PGRpdiAgc3R5bGU9ImNsZWFyOiBib3RoOyI+U2lsaWNvbiBMYWJzPGJyID48L2Rpdj48
ZGl2ICBzdHlsZT0iY2xlYXI6IGJvdGg7Ij5OdXZvdG9uPGJyID48L2Rpdj48ZGl2ICBzdHlsZT0i
Y2xlYXI6IGJvdGg7Ij5Ib2x0ZWs8YnIgPjwvZGl2PjxkaXYgIHN0eWxlPSJjbGVhcjogYm90aDsi
PkdpZ2FEZXZpY2U8YnIgPjwvZGl2PjxkaXYgIHN0eWxlPSJjbGVhcjogYm90aDsiPlNoZW5aaGVu
IFRvcGJhbmQ8YnIgPjwvZGl2PjxkaXYgIHN0eWxlPSJjbGVhcjogYm90aDsiPkppYW5neGkgTGlh
bmNodWFuZyBPcHRvLUVsZWN0cm9uaWMgU2NpZW5jZSBhbmQgVGVjaG5vbG9neTxiciA+PC9kaXY+
PGRpdiAgc3R5bGU9ImNsZWFyOiBib3RoOyI+V3VoYW4gWGlueXVhbiBTZW1pY29uZHVjdG9yPGJy
ID48L2Rpdj48ZGl2ICBzdHlsZT0iY2xlYXI6IGJvdGg7Ij5YaWFtZW4gSHVhbGlhbiBFbGVjdHJv
bmljczxiciA+PC9kaXY+PGRpdiAgc3R5bGU9ImNsZWFyOiBib3RoOyI+U1pSREkgVEVDSDxiciA+
PC9kaXY+PGRpdiAgc3R5bGU9ImNsZWFyOiBib3RoOyI+Rm9zaGFuIFN0ZXBvbiBUZWNobm9sb2d5
PGJyID48L2Rpdj48ZGl2ICBzdHlsZT0iY2xlYXI6IGJvdGg7Ij7igKbigKY8YnIgPjwvZGl2Pjxk
aXYgIHN0eWxlPSJjbGVhcjogYm90aDsiPjxiciA+PC9kaXY+PGRpdiAgc3R5bGU9ImNsZWFyOiBi
b3RoOyI+KE1vcmUgY29tcGFuaWVzIHRoYXQgbm90IGxpc3RlZCBoZXJlIGFyZSBhbHNvIGF2YWls
YWJsZS4pPGJyID48L2Rpdj48ZGl2ICBzdHlsZT0iY2xlYXI6IGJvdGg7Ij48YnIgPjwvZGl2Pjxk
aXYgIHN0eWxlPSJjbGVhcjogYm90aDsiPlNlZ21lbnQgYnkgVHlwZTxiciA+PC9kaXY+PGRpdiAg
c3R5bGU9ImNsZWFyOiBib3RoOyI+UmVtb3RlIENvbnRyb2wgQ29udHJvbGxlcjxiciA+PC9kaXY+
PGRpdiAgc3R5bGU9ImNsZWFyOiBib3RoOyI+VG91Y2ggU2NyZWVuIENvbnRyb2xsZXI8YnIgPjwv
ZGl2PjxkaXYgIHN0eWxlPSJjbGVhcjogYm90aDsiPkluZHVjdGl2ZSBDb250cm9sbGVyPGJyID48
L2Rpdj48ZGl2ICBzdHlsZT0iY2xlYXI6IGJvdGg7Ij5PdGhlcnM8YnIgPjwvZGl2PjxkaXYgIHN0
eWxlPSJjbGVhcjogYm90aDsiPjxiciA+PC9kaXY+PGRpdiAgc3R5bGU9ImNsZWFyOiBib3RoOyI+
U2VnbWVudCBieSBBcHBsaWNhdGlvbjxiciA+PC9kaXY+PGRpdiAgc3R5bGU9ImNsZWFyOiBib3Ro
OyI+SG91c2Vob2xkIFRvaWxldDxiciA+PC9kaXY+PGRpdiAgc3R5bGU9ImNsZWFyOiBib3RoOyI+
Q29tbWVyY2lhbCBUb2lsZXQ8YnIgPjwvZGl2PjxkaXYgIHN0eWxlPSJjbGVhcjogYm90aDsiPjxi
ciA+PC9kaXY+PGRpdiAgc3R5bGU9ImNsZWFyOiBib3RoOyI+PGJyID48L2Rpdj48ZGl2ICBzdHls
ZT0iY2xlYXI6IGJvdGg7Ij5JZiB5b3UgYXJlIGludGVyZXN0ZWQgaW4gb3VyIHJlcG9ydCwgcGxl
YXNlIGNvbnRhY3QgdmljdG9yaWFAdmljbWFya2V0cmVzZWFyY2guY29tLiBXZSB3b3VsZCBiZSBo
YXBweSB0byBzaGFyZSB0aGUgc2FtcGxlIGZvciB5b3VyIHJlZmVyZW5jZS48YnIgPjwvZGl2Pjxk
aXYgIHN0eWxlPSJjbGVhcjogYm90aDsiPjxiciA+PC9kaXY+PGRpdiA+PHNwYW4gPldlIGF0IFZN
UiBhcHByZWNpYXRlIHlvdXIgc3VwcG9ydCBhbmQgbG9vayBmb3J3YXJkIHRvIG5ldyBvcHBvcnR1
bml0aWVzIHRvIGNvbWUuPGJyID48L3NwYW4+PC9kaXY+PHNwYW4gPjxiciA+PC9zcGFuPjwvZGl2
PjwvZGl2PjwvZGl2Pg==
------=ALIBOUNDARY_2691_7ff83eb3f700_675027bd_676ed4--

