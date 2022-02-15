Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C746C4B622A
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 05:37:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JySwp1wv5z3c5g
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 15:36:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=fJmsQto5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.13.151; helo=m13151.mail.163.com;
 envelope-from=damon3000@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=fJmsQto5; dkim-atps=neutral
X-Greylist: delayed 907 seconds by postgrey-1.36 at boromir;
 Tue, 15 Feb 2022 14:28:43 AEDT
Received: from m13151.mail.163.com (m13151.mail.163.com [220.181.13.151])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JyRQ35Tzqz30Ld
 for <openbmc@lists.ozlabs.org>; Tue, 15 Feb 2022 14:28:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=QDX9k
 4JLlzppb+YiYyTle3Yu0nIXc7OghSRyDuZAlew=; b=fJmsQto5tngiNnL9aIfMt
 qQogbY4wzN2p/A1cNJNP57rFUMyE0RaAYI8jJ5yst4rxozGGYZ3BQuPiW/opBAfk
 l9MKPvGqBnHm9TOJL5lLWRjnbgCoIS5jsIvIZHn3n4RIQXPUt0JyBZgYV1Zv9Jl+
 hgZywrsbwkKdXY6fge1/fY=
Received: from damon3000$163.com ( [120.253.234.196] ) by
 ajax-webmail-wmsvr151 (Coremail) ; Tue, 15 Feb 2022 11:13:22 +0800 (CST)
X-Originating-IP: [120.253.234.196]
Date: Tue, 15 Feb 2022 11:13:22 +0800 (CST)
From: damon3000 <damon3000@163.com>
To: openbmc@lists.ozlabs.org
Subject: FRU access configuration
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210622(1d4788a8)
 Copyright (c) 2002-2022 www.mailtech.cn 163com
X-CM-CTRLDATA: Fz0okGZvb3Rlcl9odG09NDI1OjU2
Content-Type: multipart/alternative; 
 boundary="----=_Part_45933_1171061408.1644894802139"
MIME-Version: 1.0
Message-ID: <ad1d881.3105.17efb5ed0dc.Coremail.damon3000@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: l8GowACXn0tTGgtio681AA--.30476W
X-CM-SenderInfo: pgdp00atqqiqqrwthudrp/1tbiEwSnJGE13y9DMAACsB
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Approved-At: Tue, 15 Feb 2022 15:34:02 +1100
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

------=_Part_45933_1171061408.1644894802139
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGkgQWxsLAoKSSBhbSBuZXcgdG8gb3BlbmJtYy4gSSBhbSBzdGFydGVkIHBvcnRpbmcgb3BlbmJt
YyBmZWF0dXJlcyB0byBuZXcgaGFyZHdhcmUuClNvLCBJIHdhbnQgdG8gYWRkIHN1cHBvcnQgZm9y
IEZSVUlEIEVFUFJPTS4gRlJVSUQgY29udGVudHMgc2hvdWxkIGJlIGF2YWlsYWJsZSBhcyBkYnVz
IG9iamVjdHMuIFdoYXQgY2hhbmdlcyBuZWVkcyB0byBkb25lIGluIHRoZSBhcHBsaWNhdGlvbiBz
aWRlLgoKUGxlYXNlIHByb3ZpZGUgdGhlIHN0ZXBzIG9yIHN1Z2dlc3Rpb25zIHRvIGZvbGxvdy4=

------=_Part_45933_1171061408.1644894802139
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxwIGRpcj0iYXV0byI+SGkgQWxsLDwvcD4KPHAgZGlyPSJhdXRv
Ij5JIGFtIG5ldyB0byBvcGVuYm1jLiBJIGFtIHN0YXJ0ZWQgcG9ydGluZyBvcGVuYm1jIGZlYXR1
cmVzIHRvIG5ldyBoYXJkd2FyZS48YnI+ClNvLCBJIHdhbnQgdG8gYWRkIHN1cHBvcnQgZm9yIEZS
VUlEIEVFUFJPTS4gIEZSVUlEIGNvbnRlbnRzIHNob3VsZCBiZSAKYXZhaWxhYmxlIGFzIGRidXMg
b2JqZWN0cy4gV2hhdCBjaGFuZ2VzIG5lZWRzIHRvIGRvbmUgaW4gdGhlIGFwcGxpY2F0aW9uCiBz
aWRlLjwvcD4KPHAgZGlyPSJhdXRvIj5QbGVhc2UgcHJvdmlkZSB0aGUgc3RlcHMgb3Igc3VnZ2Vz
dGlvbnMgdG8gZm9sbG93LjwvcD48L2Rpdj48YnI+PGJyPjxzcGFuIHRpdGxlPSJuZXRlYXNlZm9v
dGVyIj48cD4mbmJzcDs8L3A+PC9zcGFuPg==
------=_Part_45933_1171061408.1644894802139--

