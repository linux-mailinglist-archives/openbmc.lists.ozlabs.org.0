Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 334A312AACA
	for <lists+openbmc@lfdr.de>; Thu, 26 Dec 2019 08:18:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47k1WT4TWczDqJW
	for <lists+openbmc@lfdr.de>; Thu, 26 Dec 2019 18:17:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.13.146; helo=m13-146.163.com;
 envelope-from=zhang_cy1989@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.b="nllpO/Q8"; 
 dkim-atps=neutral
Received: from m13-146.163.com (m13-146.163.com [220.181.13.146])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47k1Vg0NsMzDqJT
 for <openbmc@lists.ozlabs.org>; Thu, 26 Dec 2019 18:17:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=1CM4L
 mQ6xKk+fruTUL4Je6+SwOK66ZN66btzECXahFc=; b=nllpO/Q8KF3cfwA0D+Ss0
 Buec5cNirM0sbD47KWWE3g2ohmXg8n8MvmRG5j5gFh2sMkXQJNacWov+L1EHZB5G
 KtGWbc5YvvwSC8Ck7uKD6vnqFJyi+BUr68r2UrLYdfikYyXWx2uNEnayfYBCRij1
 +4r0IqxOSlCl+uNPWDxv1w=
Received: from zhang_cy1989$163.com ( [106.121.66.194] ) by
 ajax-webmail-wmsvr146 (Coremail) ; Thu, 26 Dec 2019 15:17:02 +0800 (CST)
X-Originating-IP: [106.121.66.194]
Date: Thu, 26 Dec 2019 15:17:02 +0800 (CST)
From: zhang_cy1989 <zhang_cy1989@163.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: How to change the soft link in target.requires or target.wants
 directory
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2019 www.mailtech.cn 163com
X-CM-CTRLDATA: csfx32Zvb3Rlcl9odG09MjE2Njo1Ng==
Content-Type: multipart/alternative; 
 boundary="----=_Part_152782_2098148101.1577344622660"
MIME-Version: 1.0
Message-ID: <13ed3524.9c60.16f4110e044.Coremail.zhang_cy1989@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ksGowAB3fo5vXgRec8S+Ag--.55051W
X-CM-SenderInfo: x2kd0w5bf1imiyz6il2tof0z/xtbBFQ6XT1XljWQhAQABs7
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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

------=_Part_152782_2098148101.1577344622660
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

RGVhciBBbGwKICAgVGhlIHRhcmdldC5yZXF1aXJlcyBvciB0YXJnZXQud2FudHMgY29udGFpbnMg
c29tZSBzb2Z0IGxpbmsuCiAgIEV4OgogICAgICAgIC9saWIvc3lzdGVtZC9zeXN0ZW0vb2JtYy1o
b3N0LXN0YXJ0bWluQDAudGFyZ2V0LnJlcXVpcmVzCgogICAgICAgICAgICAgICAgICAgbHJ3eHJ3
eHJ3eCAgICAxIHJvb3QgICAgIHJvb3QgICAgICAgICAgICAzMSBOb3YgMjkgIDIwMTkgb2JtYy1j
aGFzc2lzLXBvd2Vyb25AMC50YXJnZXQgLT4gLi4vb2JtYy1jaGFzc2lzLXBvd2Vyb25ALnRhcmdl
dAogICAgICAgICAgICAgICAgICAgbHJ3eHJ3eHJ3eCAgICAxIHJvb3QgICAgIHJvb3QgICAgICAg
ICAgICAyNSBOb3YgMjggMDk6NTEgb3Atb2NjLWVuYWJsZUAwLnNlcnZpY2UgLT4gLi4vb3Atb2Nj
LWVuYWJsZUAuc2VydmljZQogICAgICAgICAgICAgICAgICAgbHJ3eHJ3eHJ3eCAgICAxIHJvb3Qg
ICAgIHJvb3QgICAgICAgICAgICAyMiBOb3YgMjggMDk6NTcgc3RhcnRfaG9zdEAwLnNlcnZpY2Ug
LT4gLi4vc3RhcnRfaG9zdEAuc2VydmljZQoKICAgIAoKICAgIE5vdywgSSB3YW50IHRvIGFkZCBv
ciBkZWxldGUgc29mdCBsaW5rOm9wLW9jYy1lbmFibGVAMC5zZXJ2aWNlCgogICAgSSBjYW4gdXNl
ICJybSAtcmYgLi9vcC1vY2MtZW5hYmxlQDAuc2VydmljZSIgdG8gYWNoaWV2ZSB0aGUgZ29hbC4K
ICAgIEJ1dCxJJ20gbm90IGV4YWN0bHkgc3VyZSB0aGlzIGlzIGZvcm1hbCBvcGVyYXRpb24uIEFu
ZCBJJ20gYWZyYWlkIHRoaXMgd2lsbCBiZSBzaWRlIGVmZmVjdC4KCiAgCgogICAgQXJlIHRoZXJl
IG90aGVyIHRvb2xzIG9yIGZvcm1hbCBtZXRob2RzIHRvIGRvIHRoaXM/CgoKQmVzdCByZWdhcmRz
CkZlbGl4Cg==
------=_Part_152782_2098148101.1577344622660
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+RGVhciBBbGw8L2Rpdj48ZGl2PiZuYnNwOyZuYnNwOyBU
aGUgdGFyZ2V0LnJlcXVpcmVzIG9yIHRhcmdldC53YW50cyBjb250YWlucyBzb21lIHNvZnQgbGlu
ay48L2Rpdj48ZGl2PiZuYnNwOyZuYnNwOyBFeDo8L2Rpdj48ZGl2PiZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAvbGliL3N5c3RlbWQvc3lzdGVtLzxhIGhyZWY9Im1h
aWx0bzpvYm1jLWhvc3Qtc3RhcnRtaW5AMC50YXJnZXQucmVxdWlyZXMiIF9zcmM9Im1haWx0bzpv
Ym1jLWhvc3Qtc3RhcnRtaW5AMC50YXJnZXQucmVxdWlyZXMiPm9ibWMtaG9zdC1zdGFydG1pbkAw
LnRhcmdldC5yZXF1aXJlczwvYT48YnI+PC9kaXY+PGRpdj4gPGEgaHJlZj0ibWFpbHRvOm9ibWMt
aG9zdC1zdGFydEAwLnRhcmdldC5yZXF1aXJlcyIgX3NyYz0ibWFpbHRvOm9ibWMtaG9zdC1zdGFy
dEAwLnRhcmdldC5yZXF1aXJlcyI+PC9hPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyBscnd4cnd4cnd4Jm5ic3A7Jm5ic3A7Jm5ic3A7IDEgcm9vdCZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyByb290Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IDMxIE5vdiAyOSZuYnNwOyAyMDE5
IG9ibWMtY2hhc3Npcy1wb3dlcm9uQDAudGFyZ2V0IC0mZ3Q7IC4uL29ibWMtY2hhc3Npcy1wb3dl
cm9uQC50YXJnZXQ8YnI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7IGxyd3hyd3hyd3gmbmJzcDsmbmJzcDsmbmJzcDsgMSByb290Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7IHJvb3QmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgMjUgTm92IDI4IDA5OjUxIG9wLW9jYy1lbmFibGVA
MC5zZXJ2aWNlIC0mZ3Q7IC4uL29wLW9jYy1lbmFibGVALnNlcnZpY2U8YnI+Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IGxyd3hyd3hyd3gmbmJzcDsm
bmJzcDsmbmJzcDsgMSByb290Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHJvb3QmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsg
MjIgTm92IDI4IDA5OjU3IHN0YXJ0X2hvc3RAMC5zZXJ2aWNlIC0mZ3Q7IC4uL3N0YXJ0X2hvc3RA
LnNlcnZpY2U8YnI+PC9kaXY+PGRpdj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgPGJyPjwvZGl2
PjxkaXY+Jm5ic3A7Jm5ic3A7Jm5ic3A7IE5vdywgSSB3YW50IHRvIGFkZCBvciBkZWxldGUgc29m
dCBsaW5rOjxhIGhyZWY9Im1haWx0bzpvcC1vY2MtZW5hYmxlQDAuc2VydmljZSIgX3NyYz0ibWFp
bHRvOm9wLW9jYy1lbmFibGVAMC5zZXJ2aWNlIj5vcC1vY2MtZW5hYmxlQDAuc2VydmljZTwvYT48
YnI+PC9kaXY+PGRpdj4mbmJzcDsmbmJzcDsmbmJzcDsgSSBjYW4gdXNlICJybSAtcmYgLi9vcC1v
Y2MtZW5hYmxlQDAuc2VydmljZSIgdG8gYWNoaWV2ZSB0aGUgZ29hbC48L2Rpdj48ZGl2PiZuYnNw
OyZuYnNwOyZuYnNwOyBCdXQsSSdtIG5vdCBleGFjdGx5IHN1cmUgdGhpcyBpcyBmb3JtYWwgb3Bl
cmF0aW9uLiBBbmQgSSdtIGFmcmFpZCB0aGlzIHdpbGwgYmUgc2lkZSBlZmZlY3QuPGJyPjwvZGl2
PjxkaXY+Jm5ic3A7Jm5ic3A7IDxicj48L2Rpdj48ZGl2PiZuYnNwOyZuYnNwOyZuYnNwOyA8c3Bh
biBzdHlsZT0iY29sb3I6IHJnYigyMjEsIDY0LCA1MCk7Ij48Yj5BcmUgdGhlcmUgb3RoZXIgdG9v
bHMgb3IgZm9ybWFsIG1ldGhvZHMgdG8gZG8gdGhpcz88L2I+PC9zcGFuPjwvZGl2PjxkaXY+PGJy
PjwvZGl2PjxkaXY+QmVzdCByZWdhcmRzPC9kaXY+PGRpdj5GZWxpeDxicj4gPC9kaXY+PC9kaXY+
PGJyPjxicj48c3BhbiB0aXRsZT0ibmV0ZWFzZWZvb3RlciI+PHA+Jm5ic3A7PC9wPjwvc3Bhbj4=

------=_Part_152782_2098148101.1577344622660--

