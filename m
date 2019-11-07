Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D648FF290C
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 09:26:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477xMD1z11zF6BH
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 19:26:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.13.132; helo=m13-132.163.com;
 envelope-from=ouyangxuan10@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.b="jXEqNC7O"; 
 dkim-atps=neutral
Received: from m13-132.163.com (m13-132.163.com [220.181.13.132])
 by lists.ozlabs.org (Postfix) with ESMTP id 477wqV6qgPzF3VB
 for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2019 19:02:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=A0Ihs
 OxhT8zFarwaMJfvw1nwizal5SqG5Tok48pzNQg=; b=jXEqNC7OniudgMn1Vi43f
 7lZD+0UYJ/7Kd7ksxmxrX3PscnF6CqOrheDhJTdEtVTSLV6C4JpsNMHc6781K8UX
 MfZ98F5DnCyjcJHZogBd/iZOjA1t+0rLiwZn9KpRLeffpLqqMgqrDf1lWI8MJkoC
 ArJiDWeoDjFikENy3LMMlM=
Received: from ouyangxuan10$163.com ( [106.120.127.15] ) by
 ajax-webmail-wmsvr132 (Coremail) ; Thu, 7 Nov 2019 16:02:21 +0800 (CST)
X-Originating-IP: [106.120.127.15]
Date: Thu, 7 Nov 2019 16:02:21 +0800 (CST)
From: www <ouyangxuan10@163.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: why the object cannot list in rest api?
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2019 www.mailtech.cn 163com
X-CM-CTRLDATA: q+aOmGZvb3Rlcl9odG09MTIzOTo1Ng==
Content-Type: multipart/alternative; 
 boundary="----=_Part_106607_262377211.1573113741878"
MIME-Version: 1.0
Message-ID: <139bf9c3.6e26.16e44e2c237.Coremail.ouyangxuan10@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: hMGowACHr5CNz8Nd5YWTAQ--.8464W
X-CM-SenderInfo: prx1t0pj0xt0irq6il2tof0z/xtbBDg5m2lrbFYJo5QABsm
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

------=_Part_106607_262377211.1573113741878
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

RGVhciBhbGwsCgoKVGhlcmUgYXJlIHNvbWUgb2JqZWN0cyBvbiBEQlVTIHRoYXQgY2FuIGJlIGRp
c3BsYXllZCB3aXRoIGJ1c2N0bCBjb21tYW5kLCBidXQgY2FuJ3QgYmUgZGlzcGxheWVkIHdpdGgg
cmVzdCBBUEkuIElzIHRoZXJlIGFueSByZWFzb24gZm9yIHRoaXM/Cqm4qaQveHl6CiAgqbippC94
eXovb3BlbmJtY19wcm9qZWN0CiAgICCpuKmkL3h5ei9vcGVuYm1jX3Byb2plY3QvZHVtcAogICAg
ICCpwKmkL3h5ei9vcGVuYm1jX3Byb2plY3QvZHVtcC9lbnRyeQogICAgICCppiCpuKmkL3h5ei9v
cGVuYm1jX3Byb2plY3QvZHVtcC9lbnRyeS8xCiAgICAgIKm4qaQveHl6L29wZW5ibWNfcHJvamVj
dC9kdW1wL2ludGVybmFsCiAgICAgICAgqbippC94eXovb3BlbmJtY19wcm9qZWN0L2R1bXAvaW50
ZXJuYWwvbWFuYWdlcgoKCmN1cmwgLWsgLUggIlgtQXV0aC1Ub2tlbjogJHRva2VuIiBodHRwczov
LyR7Ym1jfS94eXovb3BlbmJtY19wcm9qZWN0L2R1bXAvbGlzdAp7CiAgImRhdGEiOiBbCiAgICAi
L3h5ei9vcGVuYm1jX3Byb2plY3QvZHVtcC9pbnRlcm5hbCIsCiAgICAiL3h5ei9vcGVuYm1jX3By
b2plY3QvZHVtcC9pbnRlcm5hbC9tYW5hZ2VyIgogIF0sCiAgIm1lc3NhZ2UiOiAiMjAwIE9LIiwK
ICAic3RhdHVzIjogIm9rIgp9CgoKdGhhbmtzo6wKQnlyb24KCg==
------=_Part_106607_262377211.1573113741878
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+RGVhciBhbGwsPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj5UaGVyZSBhcmUgc29tZSBvYmplY3RzIG9uIERCVVMgdGhhdCBjYW4gYmUgZGlzcGxheWVkIHdp
dGggYnVzY3RsIGNvbW1hbmQsIGJ1dCBjYW4ndCBiZSBkaXNwbGF5ZWQgd2l0aCByZXN0IEFQSS4g
SXMgdGhlcmUgYW55IHJlYXNvbiBmb3IgdGhpcz88L2Rpdj48ZGl2PjxkaXY+qbippC94eXo8L2Rp
dj48ZGl2PiZuYnNwOyCpuKmkL3h5ei9vcGVuYm1jX3Byb2plY3Q8L2Rpdj48ZGl2PiZuYnNwOyAm
bmJzcDsgqbippC94eXovb3BlbmJtY19wcm9qZWN0L2R1bXA8L2Rpdj48ZGl2PjxzcGFuIHN0eWxl
PSJiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyMDQsIDApOyI+Jm5ic3A7ICZuYnNwOyAmbmJz
cDsgqcCppC94eXovb3BlbmJtY19wcm9qZWN0L2R1bXAvZW50cnk8L3NwYW4+PC9kaXY+PGRpdj48
c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjogcmdiKDI1NSwgMjA0LCAwKTsiPiZuYnNwOyAm
bmJzcDsgJm5ic3A7IKmmIKm4qaQveHl6L29wZW5ibWNfcHJvamVjdC9kdW1wL2VudHJ5LzE8L3Nw
YW4+PC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7ICZuYnNwOyCpuKmkL3h5ei9vcGVuYm1jX3Byb2pl
Y3QvZHVtcC9pbnRlcm5hbDwvZGl2PjxkaXY+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IKm4
qaQveHl6L29wZW5ibWNfcHJvamVjdC9kdW1wL2ludGVybmFsL21hbmFnZXI8L2Rpdj48L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PjxkaXY+Y3VybCAtayAtSCAiWC1BdXRoLVRva2VuOiAkdG9rZW4i
IGh0dHBzOi8vJHtibWN9L3h5ei9vcGVuYm1jX3Byb2plY3QvZHVtcC9saXN0PC9kaXY+PGRpdj57
PC9kaXY+PGRpdj4mbmJzcDsgImRhdGEiOiBbPC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7ICIveHl6
L29wZW5ibWNfcHJvamVjdC9kdW1wL2ludGVybmFsIiw8L2Rpdj48ZGl2PiZuYnNwOyAmbmJzcDsg
Ii94eXovb3BlbmJtY19wcm9qZWN0L2R1bXAvaW50ZXJuYWwvbWFuYWdlciI8L2Rpdj48ZGl2PiZu
YnNwOyBdLDwvZGl2PjxkaXY+Jm5ic3A7ICJtZXNzYWdlIjogIjIwMCBPSyIsPC9kaXY+PGRpdj4m
bmJzcDsgInN0YXR1cyI6ICJvayI8L2Rpdj48ZGl2Pn08L2Rpdj48L2Rpdj48ZGl2Pjxicj48L2Rp
dj48ZGl2PnRoYW5rc6OsPC9kaXY+PGRpdj5CeXJvbjwvZGl2PjxkaXY+PGJyPjwvZGl2PjwvZGl2
Pjxicj48YnI+PHNwYW4gdGl0bGU9Im5ldGVhc2Vmb290ZXIiPjxwPiZuYnNwOzwvcD48L3NwYW4+

------=_Part_106607_262377211.1573113741878--

