Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F03DFAA82
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2019 07:57:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Cb644kbpzF7N6
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2019 17:57:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.13.45; helo=m13-45.163.com;
 envelope-from=xiaoqian1641@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.b="htEiAmqY"; 
 dkim-atps=neutral
X-Greylist: delayed 925 seconds by postgrey-1.36 at bilbo;
 Wed, 13 Nov 2019 17:57:04 AEDT
Received: from m13-45.163.com (m13-45.163.com [220.181.13.45])
 by lists.ozlabs.org (Postfix) with ESMTP id 47Cb5D58bnzF7Mw
 for <openbmc@lists.ozlabs.org>; Wed, 13 Nov 2019 17:56:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=QOJid
 O3Hx0sw0nkjpM4Jof6h1Qz4SyQ1TnwRRPRMmLI=; b=htEiAmqYtyeXPySqxC9oE
 m6ILmw/9IgstokWMds3YFNatWyblIv4ybyeXuITaktR9+6jioKn7oaeilSFKiBMC
 hi1tEXid6NbvUlMsVSNG1QrmImNI9V13QcmDQUqOEXtEqPFjwBBt5HLU4dWPdcLj
 +wvvP4kSV4msG7oZdoFWyk=
Received: from xiaoqian1641$163.com ( [106.120.127.15] ) by
 ajax-webmail-wmsvr45 (Coremail) ; Wed, 13 Nov 2019 14:41:29 +0800 (CST)
X-Originating-IP: [106.120.127.15]
Date: Wed, 13 Nov 2019 14:41:29 +0800 (CST)
From: =?GBK?B?s6PP/sP3?= <xiaoqian1641@163.com>
To: "OpenBMC Development" <openbmc@lists.ozlabs.org>
Subject: How to trigger BMC dumps
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2019 www.mailtech.cn 163com
In-Reply-To: <491fd747.c3f7.16d49308f66.Coremail.xiaoqian1641@163.com>
References: <2d7b6a6d.52d2.16d2372efd5.Coremail.xiaoqian1641@163.com>
 <CAPnigK=RCCa41ya98pgdmB+A1SK16o4XwbLBWa_g41vzgkm47g@mail.gmail.com>
 <491fd747.c3f7.16d49308f66.Coremail.xiaoqian1641@163.com>
X-CM-CTRLDATA: dNKyIGZvb3Rlcl9odG09MTk1MTo1Ng==
Content-Type: multipart/alternative; 
 boundary="----=_Part_108478_206861278.1573627289676"
MIME-Version: 1.0
Message-ID: <2599bd03.7067.16e637ee04c.Coremail.xiaoqian1641@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: LcGowADnbaGZpctdGCWAAQ--.26883W
X-CM-SenderInfo: 50ld01pldqiliur6il2tof0z/1tbiRRlsfFl9uiimWQAAsF
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

------=_Part_108478_206861278.1573627289676
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGksIEFsbCwKCgpJIGFtIHRyaW5nIHRvIHRyaWdnZXIgQk1DIGR1bXBzLCBmb2xsb3cgaHR0cHM6
Ly9naXRodWIuY29tL3hjYXQyL3hjYXQtY29yZS9pc3N1ZXMvNDIzNQoxLiBMb2dpbiBCTUMKICAg
ICAgICAgICBjdXJsIC1jIGNqYXIgLWIgY2phciAtayAtSCAiQ29udGVudC1UeXBlOiBhcHBsaWNh
dGlvbi9qc29uIiAtWCBQT1NUIGh0dHBzOi8vMTI3LjAuMC4xOjI0NDMvbG9naW4gLWQgIntcImRh
dGFcIjogWyBcInJvb3RcIiwgXCIwcGVuQm1jXCIgXSB9IgoyLiBMaXN0IGF2YWlsYWJsZSBkdW1w
cwogICAgICAgICBjdXJsIC1jIGNqYXIgLWIgY2phciAtayBodHRwczovLzEyNy4wLjAuMToyNDQz
L3h5ei9vcGVuYm1jX3Byb2plY3QvZHVtcC9saXN0CjMuIFdoZW4gTWFudWFsbHkgdHJpZ2dlciBh
IGdlbmVyYXRpb24gb2YgYSBkdW1wCiAgICAgICAgY3VybCAtYyBjamFyIC1iIGNqYXIgLWsgLUgg
IkNvbnRlbnQtVHlwZTogYXBwbGljYXRpb24vanNvbiIgLWQgIntcImRhdGFcIjogW119IiAtWCBQ
T1NUICBodHRwczovLzEyNy4wLjAuMToyNDQzL3h5ei9vcGVuYm1jX3Byb2plY3QvZHVtcC9hY3Rp
b24vQ3JlYXRlRHVtcAogICAgVGhlIGNvc29sZSBkaXNwbGF5IDogIFVuYXV0aG9yaXplZApEb2Vz
IGFueW9uZSBrbm93IHdoYXQgaGFwcGVuZWQ/CgoKVGhhbmtzCgoKSm9obnkKCg==
------=_Part_108478_206861278.1573627289676
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+SGksIEFsbCw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PkkgYW0gdHJpbmcgdG8gdHJpZ2dlciBCTUMgZHVtcHMsIGZvbGxvdyZuYnNwOzxhIGhyZWY9Imh0
dHBzOi8vZ2l0aHViLmNvbS94Y2F0Mi94Y2F0LWNvcmUvaXNzdWVzLzQyMzUiPmh0dHBzOi8vZ2l0
aHViLmNvbS94Y2F0Mi94Y2F0LWNvcmUvaXNzdWVzLzQyMzU8L2E+PC9kaXY+PGRpdj4xLiBMb2dp
biBCTUM8L2Rpdj48ZGl2PiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
Y3VybCAtYyBjamFyIC1iIGNqYXIgLWsgLUggIkNvbnRlbnQtVHlwZTogYXBwbGljYXRpb24vanNv
biIgLVggUE9TVCBodHRwczovLzEyNy4wLjAuMToyNDQzL2xvZ2luIC1kICJ7XCJkYXRhXCI6IFsg
XCJyb290XCIsIFwiMHBlbkJtY1wiIF0gfSI8L2Rpdj48ZGl2PjIuJm5ic3A7TGlzdCBhdmFpbGFi
bGUgZHVtcHM8L2Rpdj48ZGl2PiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDtjdXJs
IC1jIGNqYXIgLWIgY2phciAtayA8YSBocmVmPSJodHRwczovLzEyNy4wLjAuMToyNDQzL3h5ei9v
cGVuYm1jX3Byb2plY3QvZHVtcC9saXN0IiBfc3JjPSJodHRwczovLzEyNy4wLjAuMToyNDQzL3h5
ei9vcGVuYm1jX3Byb2plY3QvZHVtcC9saXN0Ij5odHRwczovLzEyNy4wLjAuMToyNDQzL3h5ei9v
cGVuYm1jX3Byb2plY3QvZHVtcC9saXN0PC9hPiA8L2Rpdj48ZGl2PjMuIFdoZW4mbmJzcDs8c3Bh
biBzdHlsZT0iY29sb3I6IHJnYigzNiwgNDEsIDQ2KTsgZm9udC1mYW1pbHk6IC1hcHBsZS1zeXN0
ZW0sIEJsaW5rTWFjU3lzdGVtRm9udCwgJnF1b3Q7U2Vnb2UgVUkmcXVvdDssIEhlbHZldGljYSwg
QXJpYWwsIHNhbnMtc2VyaWYsICZxdW90O0FwcGxlIENvbG9yIEVtb2ppJnF1b3Q7LCAmcXVvdDtT
ZWdvZSBVSSBFbW9qaSZxdW90OzsiPk1hbnVhbGx5IHRyaWdnZXIgYSBnZW5lcmF0aW9uIG9mIGEg
ZHVtcDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDM2LCA0MSwgNDYp
OyBmb250LWZhbWlseTogLWFwcGxlLXN5c3RlbSwgQmxpbmtNYWNTeXN0ZW1Gb250LCAmcXVvdDtT
ZWdvZSBVSSZxdW90OywgSGVsdmV0aWNhLCBBcmlhbCwgc2Fucy1zZXJpZiwgJnF1b3Q7QXBwbGUg
Q29sb3IgRW1vamkmcXVvdDssICZxdW90O1NlZ29lIFVJIEVtb2ppJnF1b3Q7OyI+Jm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7Jm5ic3A7PC9zcGFuPjxmb250IGNvbG9yPSIjMjQyOTJlIiBmYWNl
PSItYXBwbGUtc3lzdGVtLCBCbGlua01hY1N5c3RlbUZvbnQsIFNlZ29lIFVJLCBIZWx2ZXRpY2Es
IEFyaWFsLCBzYW5zLXNlcmlmLCBBcHBsZSBDb2xvciBFbW9qaSwgU2Vnb2UgVUkgRW1vamkiPmN1
cmwgLWMgY2phciAtYiBjamFyIC1rIC1IICJDb250ZW50LVR5cGU6IGFwcGxpY2F0aW9uL2pzb24i
IC1kICJ7XCJkYXRhXCI6IFtdfSIgLVggUE9TVCZuYnNwOyA8YSBocmVmPSJodHRwczovLzEyNy4w
LjAuMToyNDQzL3h5ei9vcGVuYm1jX3Byb2plY3QvZHVtcC9hY3Rpb24vQ3JlYXRlRHVtcCIgX3Ny
Yz0iaHR0cHM6Ly8xMjcuMC4wLjE6MjQ0My94eXovb3BlbmJtY19wcm9qZWN0L2R1bXAvYWN0aW9u
L0NyZWF0ZUR1bXAiPmh0dHBzOi8vMTI3LjAuMC4xOjI0NDMveHl6L29wZW5ibWNfcHJvamVjdC9k
dW1wL2FjdGlvbi9DcmVhdGVEdW1wPC9hPiA8L2ZvbnQ+PC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7
IFRoZSBjb3NvbGUgZGlzcGxheSA6Jm5ic3A7Jm5ic3A7PGI+VW5hdXRob3JpemVkPC9iPjwvZGl2
PjxkaXY+RG9lcyBhbnlvbmUga25vdyB3aGF0IGhhcHBlbmVkPzwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+VGhhbmtzPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5Kb2hueTwvZGl2PjxkaXY+PGJy
PjwvZGl2PjwvZGl2Pjxicj48YnI+PHNwYW4gdGl0bGU9Im5ldGVhc2Vmb290ZXIiPjxwPiZuYnNw
OzwvcD48L3NwYW4+
------=_Part_108478_206861278.1573627289676--

