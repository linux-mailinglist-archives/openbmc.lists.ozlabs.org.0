Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E66291D05B6
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 05:58:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MLW619LBzDqLy
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 13:58:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.13.53; helo=m13-53.163.com; envelope-from=slm_8269@163.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=GhO8d7G+; dkim-atps=neutral
Received: from m13-53.163.com (m13-53.163.com [220.181.13.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ML7G0Z3KzDqd1
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 13:41:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=FBfSz
 bUbwK1iSp4nTS1yyIePgWPAmbFieUOtA0nirMs=; b=GhO8d7G+JfyTHepZKVi/J
 Nuc5qvZbpyIeb75HyarbtzOJ1Ev4UPsu+A+WDtyvsmjJuUkuWDKMclCH0TRhf9VD
 XGThz8nvqKxNCJi/3NDMeJvQ/Miw8Noqhmi2oSpuprXesvR9cPjbDpyX/IXDT92C
 dgHQWKiPqfGkOlTkPl51Ws=
Received: from slm_8269$163.com ( [116.246.26.28] ) by ajax-webmail-wmsvr53
 (Coremail) ; Wed, 13 May 2020 11:41:01 +0800 (CST)
X-Originating-IP: [116.246.26.28]
Date: Wed, 13 May 2020 11:41:01 +0800 (CST)
From: shi  <slm_8269@163.com>
To: openbmc@lists.ozlabs.org
Subject: how to use obmc-phosphor-image-evb-ast2500.tar.gz  on evb board
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2020 www.mailtech.cn 163com
In-Reply-To: <2f5d0a6f.2376.171c8fc7a59.Coremail.slm_8269@163.com>
References: <2f5d0a6f.2376.171c8fc7a59.Coremail.slm_8269@163.com>
X-CM-CTRLDATA: WPuuyWZvb3Rlcl9odG09ODU0OjU2
Content-Type: multipart/alternative; 
 boundary="----=_Part_30420_137526944.1589341261802"
MIME-Version: 1.0
Message-ID: <64db91ba.20da.1720c1f0fea.Coremail.slm_8269@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: NcGowAB3dOZNbLtew44iAA--.41289W
X-CM-SenderInfo: pvopsmqswzqiywtou0bp/1tbiJRAiIVUMXpj+MwACsm
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Approved-At: Wed, 13 May 2020 13:57:51 +1000
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

------=_Part_30420_137526944.1589341261802
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

RGVhciBvcGVuYm1jLAoKCm5vdyBJIHVzZSB0aGUgb3BlbmJtYyBwdWJsaWMgaW1hZ2UgdG8gdGVz
dCBvbiBteSBldmIgYm9hcmQuIHRoZSBmaXRJbWFnIHJvb3RmcyB1c2VkIGFzcGVlZC1pbWFnZS1p
bml0cmFtZnMtZXZiLWFzdDI1MDAuY3Bpby54ei4KCgpidXQgZm9yIG9ibWMtcGhvc3Bob3ItaW1h
Z2UtZXZiLWFzdDI1MDAtMjAyMDA1MTEwODMzMDkucm9vdGZzLnRhci5neiBub3QgdXNlZCEgSSB1
bnppcCB0aGUgb2JtYy1waG9zcGhvci1pbWFnZS1ldmItYXN0MjUwMC0yMDIwMDUxMTA4MzMwOS5y
b290ZnMudGFyLmd6IGFuZCBmaW5kIG1hbnkgZmVhdHVyZSBoZXJlLiBub3cgSSB3YW50IHRvIHVz
ZWQgdGhpcyByb290ZnMuIGJ1dCB3aGVuIEkgdXNlZCBpdCBhcyB0aGUgcm9vdGZzIHRvIHJlcGxh
Y2UgYXNwZWVkLWltYWdlLWluaXRyYW1mcy1ldmItYXN0MjUwMC5jcGlvLnh6LiBUaGVuIGl0IGNh
biBub3QgYm9vdCB1cCBhbnltb3JlIQoKClNvIHdvdWxkIHUgcGxlYXNlIHRlbGwgbWUgaG93IHRv
IHVzZSB0aGUgb2JtYy1waG9zcGhvci1pbWFnZS1ldmItYXN0MjUwMC0yMDIwMDUxMTA4MzMwOS5y
b290ZnMudGFyLmd6LiBPciBqdXN0IGdpdmUgbWUgc29tZSBjbHVlIG9uIHRoaXMhCgoKVGhhbmtz
ClN0ZXZlbgoK
------=_Part_30420_137526944.1589341261802
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+RGVhciBvcGVuYm1jLDwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+bm93IEkgdXNlIHRoZSBvcGVuYm1jIHB1YmxpYyBpbWFnZSB0byB0ZXN0IG9uIG15IGV2
YiBib2FyZC4gdGhlIGZpdEltYWcmbmJzcDtyb290ZnMgdXNlZCZuYnNwO2FzcGVlZC1pbWFnZS1p
bml0cmFtZnMtZXZiLWFzdDI1MDAuY3Bpby54ei48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PmJ1
dCBmb3Igb2JtYy1waG9zcGhvci1pbWFnZS1ldmItYXN0MjUwMC0yMDIwMDUxMTA4MzMwOS5yb290
ZnMudGFyLmd6IG5vdCB1c2VkISBJIHVuemlwIHRoZSBvYm1jLXBob3NwaG9yLWltYWdlLWV2Yi1h
c3QyNTAwLTIwMjAwNTExMDgzMzA5LnJvb3Rmcy50YXIuZ3ogYW5kIGZpbmQgbWFueSBmZWF0dXJl
IGhlcmUuIG5vdyBJIHdhbnQgdG8gdXNlZCB0aGlzIHJvb3Rmcy4gYnV0IHdoZW4gSSB1c2VkIGl0
IGFzIHRoZSByb290ZnMgdG8gcmVwbGFjZSBhc3BlZWQtaW1hZ2UtaW5pdHJhbWZzLWV2Yi1hc3Qy
NTAwLmNwaW8ueHouIFRoZW4gaXQgY2FuIG5vdCBib290IHVwIGFueW1vcmUhPC9kaXY+PGRpdj48
YnI+PC9kaXY+PGRpdj5TbyB3b3VsZCB1IHBsZWFzZSB0ZWxsIG1lIGhvdyB0byB1c2UgdGhlIG9i
bWMtcGhvc3Bob3ItaW1hZ2UtZXZiLWFzdDI1MDAtMjAyMDA1MTEwODMzMDkucm9vdGZzLnRhci5n
ei4gT3IganVzdCBnaXZlIG1lIHNvbWUgY2x1ZSBvbiB0aGlzITwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+VGhhbmtzPC9kaXY+PGRpdj5TdGV2ZW48L2Rpdj48ZGl2Pjxicj48L2Rpdj48L2Rpdj48
YnI+PGJyPjxzcGFuIHRpdGxlPSJuZXRlYXNlZm9vdGVyIj48cD4mbmJzcDs8L3A+PC9zcGFuPg==

------=_Part_30420_137526944.1589341261802--

