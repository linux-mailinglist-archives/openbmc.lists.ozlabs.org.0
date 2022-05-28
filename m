Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5998B537463
	for <lists+openbmc@lfdr.de>; Mon, 30 May 2022 08:33:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LBQb324hrz3bmw
	for <lists+openbmc@lfdr.de>; Mon, 30 May 2022 16:33:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ir2vkwjF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.181.13.82; helo=m1382.mail.163.com; envelope-from=junhengdi@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ir2vkwjF;
	dkim-atps=neutral
X-Greylist: delayed 914 seconds by postgrey-1.36 at boromir; Sat, 28 May 2022 18:14:10 AEST
Received: from m1382.mail.163.com (m1382.mail.163.com [220.181.13.82])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9DwL0xrnz3048
	for <openbmc@lists.ozlabs.org>; Sat, 28 May 2022 18:14:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=0pH1V
	0uZCWfoJOA/jSPCxQhJa9FTyYQEVPH6a0JweWE=; b=ir2vkwjFfCNF/kJJ5YMry
	Gd8TMFg2Qize5SfNBizz+gOqag9oAqbe58D+lx7SIPpnE5Y6Wazz87bsFFW0eru/
	oBoMRHGQgGWyi0WKMGLA9Pxpa8GgqDAOL1Dd+PDRZBrG6kdDGzdneECb37bsZMGx
	hGydD+0B/zoN8IQKIxwrV8=
Received: from junhengdi$163.com ( [202.96.123.226] ) by
 ajax-webmail-wmsvr82 (Coremail) ; Sat, 28 May 2022 15:58:38 +0800 (CST)
X-Originating-IP: [202.96.123.226]
Date: Sat, 28 May 2022 15:58:38 +0800 (CST)
From: =?GBK?B?srvT7w==?= <junhengdi@163.com>
To: openbmc@lists.ozlabs.org
Subject: How to access ESPICFG register on ast2500 ?
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 163com
X-CM-CTRLDATA: x++sPGZvb3Rlcl9odG09MjgxMjo1Ng==
Content-Type: multipart/alternative; 
	boundary="----=_Part_25302_584627772.1653724718980"
MIME-Version: 1.0
Message-ID: <5210e155.1acb.18109aca784.Coremail.junhengdi@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: UsGowACnYpwv1pFiNoIQAA--.55024W
X-CM-SenderInfo: xmxqxvpqjgxqqrwthudrp/xtbBLwIPf2Hmm4g5jwACs9
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Approved-At: Mon, 30 May 2022 16:31:43 +1000
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

------=_Part_25302_584627772.1653724718980
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

RGVhciBvcGVuYm1jZXIsCiAgICAgICAgICAgICAgICAgICAgICAgSSB3YW50IHRvIGFjY2VzcyBF
U1BJQ0ZHIHJlZ2lzdGVyIHN1Y2ggYXMgRVNQSUNGRzAwNCAsRVNQSUNGRzAwOCBvbiBhc3QyNTAw
IC4gQnV0IEkgZG8gbm90IGtub3cgdGhlIGJhc2UgYWRkcmVzcyBvZiBFU1BJQ0ZHIHJlZ2lzdGVy
LgogICAgICAgICAgICAgICAgICAgICAgIEluIGFzdDI1MDAgZGF0YXNoZWV0ICwgb25seSBFU1BJ
IGNvbnRyb2xsZXIgYmFzZSBhZGRyZXNzIDB4MWU2ZWUwMDAgLGJ1dCBpdCBvbmx5IGNhbiBhY2Nl
c3MgRVNQSSByZWdpc3RlciBzdWNoIGFzIEVTUEkwMDQsIEVTUEkwMDguCiAgICAgICAgICAgICAg
ICAgICAgICAgSSB3YW50IHRvIGtub3duIGhvdyB0byBhY2Nlc3MgdGhlIEVTUElDRkcgcmVnaXN0
ZXIgc3VjaCBhcyBFU1BJQ0ZHMDA0ICxFU1BJQ0ZHMDA4IG9uIGFzdDI1MDAuIAoKCgogQW55IGFk
dmljZSB3aWxsIGJlIGFwcHJlY2lhdGVkLgoKVGhhbmtzLAoKSnVuSGVuZw==
------=_Part_25302_584627772.1653724718980
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXYgc3R5bGU9Im1hcmdpbjowOyI+PHNwYW4gc3R5bGU9Imxp
bmUtaGVpZ2h0OiAyMy44cHg7Ij5EZWFyIG9wZW5ibWNlciw8L3NwYW4+PC9kaXY+PGRpdiBzdHls
ZT0ibWFyZ2luOjA7Ij48c3BhbiBzdHlsZT0ibGluZS1oZWlnaHQ6IDIzLjhweDsiPiZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7PC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDM2LCA0MSwg
NDcpOyBmb250LWZhbWlseTogLWFwcGxlLXN5c3RlbSwgQmxpbmtNYWNTeXN0ZW1Gb250LCAnU2Vn
b2UgVUknLCBIZWx2ZXRpY2EsIEFyaWFsLCBzYW5zLXNlcmlmLCAnQXBwbGUgQ29sb3IgRW1vamkn
LCAnU2Vnb2UgVUkgRW1vamknOyBsaW5lLWhlaWdodDogMjFweDsiPkkgd2FudCB0byBhY2Nlc3Mg
RVNQSUNGRyByZWdpc3RlciBzdWNoIGFzIEVTUElDRkcwMDQgLEVTUElDRkcwMDggb24gYXN0MjUw
MCAuIEJ1dCBJIGRvIG5vdCBrbm93IHRoZSBiYXNlIGFkZHJlc3Mgb2YgRVNQSUNGRyByZWdpc3Rl
ci48L3NwYW4+PC9kaXY+PGRpdiBzdHlsZT0ibWFyZ2luOjA7Ij48c3BhbiBzdHlsZT0iY29sb3I6
IHJnYigzNiwgNDEsIDQ3KTsgZm9udC1mYW1pbHk6IC1hcHBsZS1zeXN0ZW0sIEJsaW5rTWFjU3lz
dGVtRm9udCwgJ1NlZ29lIFVJJywgSGVsdmV0aWNhLCBBcmlhbCwgc2Fucy1zZXJpZiwgJ0FwcGxl
IENvbG9yIEVtb2ppJywgJ1NlZ29lIFVJIEVtb2ppJzsgbGluZS1oZWlnaHQ6IDIxcHg7Ij4mbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwO0luIGFzdDI1MDAgZGF0YXNoZWV0ICwgb25seSBFU1BJIGNv
bnRyb2xsZXIgYmFzZSBhZGRyZXNzIDB4MWU2ZWUwMDAgLGJ1dCBpdCBvbmx5IGNhbiBhY2Nlc3Mg
RVNQSSByZWdpc3RlciBzdWNoIGFzIEVTUEkwMDQsIEVTUEkwMDguPC9zcGFuPjwvZGl2PjxkaXYg
c3R5bGU9Im1hcmdpbjowOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMzYsIDQxLCA0Nyk7IGZv
bnQtZmFtaWx5OiAtYXBwbGUtc3lzdGVtLCBCbGlua01hY1N5c3RlbUZvbnQsICdTZWdvZSBVSScs
IEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWYsICdBcHBsZSBDb2xvciBFbW9qaScsICdTZWdv
ZSBVSSBFbW9qaSc7IGxpbmUtaGVpZ2h0OiAyMXB4OyI+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDtJIHdhbnQgdG8ga25vd24gaG93IHRvIGFjY2VzcyB0aGUgRVNQSUNGRyByZWdpc3RlciZuYnNw
Ozwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigzNiwgNDEsIDQ3KTsgZm9udC1mYW1pbHk6
IC1hcHBsZS1zeXN0ZW0sIEJsaW5rTWFjU3lzdGVtRm9udCwgJ1NlZ29lIFVJJywgSGVsdmV0aWNh
LCBBcmlhbCwgc2Fucy1zZXJpZiwgJ0FwcGxlIENvbG9yIEVtb2ppJywgJ1NlZ29lIFVJIEVtb2pp
JzsgbGluZS1oZWlnaHQ6IDIxcHg7Ij5zdWNoIGFzIEVTUElDRkcwMDQgLEVTUElDRkcwMDggb24g
YXN0MjUwMDwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigzNiwgNDEsIDQ3KTsgZm9udC1m
YW1pbHk6IC1hcHBsZS1zeXN0ZW0sIEJsaW5rTWFjU3lzdGVtRm9udCwgJ1NlZ29lIFVJJywgSGVs
dmV0aWNhLCBBcmlhbCwgc2Fucy1zZXJpZiwgJ0FwcGxlIENvbG9yIEVtb2ppJywgJ1NlZ29lIFVJ
IEVtb2ppJzsgbGluZS1oZWlnaHQ6IDIxcHg7Ij4uJm5ic3A7PC9zcGFuPjwvZGl2PjxkaXYgc3R5
bGU9Im1hcmdpbjowOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMzYsIDQxLCA0Nyk7IGZvbnQt
ZmFtaWx5OiAtYXBwbGUtc3lzdGVtLCBCbGlua01hY1N5c3RlbUZvbnQsICdTZWdvZSBVSScsIEhl
bHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWYsICdBcHBsZSBDb2xvciBFbW9qaScsICdTZWdvZSBV
SSBFbW9qaSc7IGxpbmUtaGVpZ2h0OiAyMXB4OyI+PGJyPjwvc3Bhbj48L2Rpdj48ZGl2IHN0eWxl
PSJtYXJnaW46MDsiPjxwIHN0eWxlPSJsaW5lLWhlaWdodDogMjMuOHB4OyBtYXJnaW46IDBweDsg
d29yZC1icmVhazogYnJlYWstd29yZCAhaW1wb3J0YW50OyI+Jm5ic3A7QW55IGFkdmljZSB3aWxs
IGJlIGFwcHJlY2lhdGVkLjwvcD48cCBzdHlsZT0ibGluZS1oZWlnaHQ6IDIzLjhweDsgbWFyZ2lu
OiAwcHg7IHdvcmQtYnJlYWs6IGJyZWFrLXdvcmQgIWltcG9ydGFudDsiPjxzcGFuIGNsYXNzPSJB
cHBsZS10YWItc3BhbiIgc3R5bGU9IndoaXRlLXNwYWNlOiBwcmU7IHdvcmQtYnJlYWs6IGJyZWFr
LXdvcmQgIWltcG9ydGFudDsiPjwvc3Bhbj48L3A+PHAgc3R5bGU9ImxpbmUtaGVpZ2h0OiAyMy44
cHg7IG1hcmdpbjogMHB4OyB3b3JkLWJyZWFrOiBicmVhay13b3JkICFpbXBvcnRhbnQ7Ij48c3Bh
biBjbGFzcz0iQXBwbGUtdGFiLXNwYW4iIHN0eWxlPSJ3aGl0ZS1zcGFjZTogcHJlOyB3b3JkLWJy
ZWFrOiBicmVhay13b3JkICFpbXBvcnRhbnQ7Ij48L3NwYW4+VGhhbmtzLDwvcD48cCBzdHlsZT0i
bGluZS1oZWlnaHQ6IDIzLjhweDsgbWFyZ2luOiAwcHg7IHdvcmQtYnJlYWs6IGJyZWFrLXdvcmQg
IWltcG9ydGFudDsiPjxzcGFuIGNsYXNzPSJBcHBsZS10YWItc3BhbiIgc3R5bGU9IndoaXRlLXNw
YWNlOiBwcmU7IHdvcmQtYnJlYWs6IGJyZWFrLXdvcmQgIWltcG9ydGFudDsiPjwvc3Bhbj5KdW5I
ZW5nPC9wPjwvZGl2PjwvZGl2Pjxicj48YnI+PHNwYW4gdGl0bGU9Im5ldGVhc2Vmb290ZXIiPjxw
PiZuYnNwOzwvcD48L3NwYW4+
------=_Part_25302_584627772.1653724718980--

