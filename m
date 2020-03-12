Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E647018293E
	for <lists+openbmc@lfdr.de>; Thu, 12 Mar 2020 07:41:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dK3t6r9czDqM6
	for <lists+openbmc@lfdr.de>; Thu, 12 Mar 2020 17:41:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.13.149; helo=m13-149.163.com;
 envelope-from=zhang_cy1989@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=gMJVAEyC; dkim-atps=neutral
Received: from m13-149.163.com (m13-149.163.com [220.181.13.149])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dK3341bMzDqLc
 for <openbmc@lists.ozlabs.org>; Thu, 12 Mar 2020 17:40:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=69tHT
 LMER4Z6NyoLAhubKUqaH6YZdk4mWD6Okkt9D3s=; b=gMJVAEyCJum5HXKDCveK5
 TdbEbcyUF7/27w02n/YXaYGqsHYqqKMmGZFn3RRL1PJMJAxwRIQFt9Z+r5P3/V4m
 q3gMtpMWqqr7sfVYSU5EREB4QAbpx5EcJEcZTmzeUb9mKjK7LaIx3BTuOSgNugQ5
 ES4lKkdcCCYUFu/P5YcZeg=
Received: from zhang_cy1989$163.com ( [111.199.187.5] ) by
 ajax-webmail-wmsvr149 (Coremail) ; Thu, 12 Mar 2020 14:40:35 +0800 (CST)
X-Originating-IP: [111.199.187.5]
Date: Thu, 12 Mar 2020 14:40:35 +0800 (CST)
From: zhang_cy1989 <zhang_cy1989@163.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: How to deal some fatal error causing from host in openbmc
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2020 www.mailtech.cn 163com
X-CM-CTRLDATA: Vdl7z2Zvb3Rlcl9odG09MTAzNzo1Ng==
Content-Type: multipart/alternative; 
 boundary="----=_Part_96825_771059046.1583995235640"
MIME-Version: 1.0
Message-ID: <24ed437.6642.170cd792d39.Coremail.zhang_cy1989@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: lcGowAD3_9tj2WlepXQJAw--.63936W
X-CM-SenderInfo: x2kd0w5bf1imiyz6il2tof0z/1tbiyAHkT1p6-SRSsgABs6
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

------=_Part_96825_771059046.1583995235640
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

RGVhciBBbGwKICAgICBUaGVyZSBhcmUgc29tZSBmYXRhbCBlcnJvcnMgaW4gaG9zdCBzaWRlLgog
ICAgICBFeDoKICAgICAgICAgICBVbmNvcnJlY3RhYmxlIEVDQy8gb3RoZXIgdW5jb3JyZWN0YWJs
ZSBtZW1vcnkgZXJyb3IKICAgICAgICAgICBVbnJlY292ZXJhYmxlIGhhcmQtZGlzayBkZXZpY2Ug
ZmFpbHVyZS4uLgogICAgICAgICAgIFBDSUUgQUVSIGFuZCBzbyBvbi4KICAgICAgSG93IGRvc2Ug
Qk1DIGdldCBhbGwgcmVhc29ucyBvZiB0aG9zZSBmYXRhbCBlcnJvcnM/CiAgICAgIEJJT1MgZ2l2
ZXMgdGhvc2UgaW5mb3JtYXRpb25zIHRvIEJNQyBieSBpcG1pPwogICAgICBPciBsaWtlIHBlY2kg
aW4gaW50ZWwgcGxhdGZvcm0/CgoKICAgICAgV2hhdCByZWNpcGVzICBjYW4gSSByZWZlciB0byBp
biBvcGVuYm1jPwogICAgICBXYXRpbmcgZm9yIHlvdXIgaGVscCEKICAgICAgVGhhbmtzLgpGZWxp
eAo=
------=_Part_96825_771059046.1583995235640
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+RGVhciBBbGw8L2Rpdj48ZGl2PiZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyBUaGVyZSBhcmUgc29tZSBmYXRhbCBlcnJvcnMgaW4gaG9zdCBzaWRlLjwvZGl2
PjxkaXY+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IEV4OjwvZGl2PjxkaXY+Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IFVu
Y29ycmVjdGFibGUgRUNDLyBvdGhlciB1bmNvcnJlY3RhYmxlIG1lbW9yeSBlcnJvcjwvZGl2Pjxk
aXY+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7IFVucmVjb3ZlcmFibGUgaGFyZC1kaXNrIGRldmljZSBmYWlsdXJlLi4uPC9kaXY+PGRp
dj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsgUENJRSBBRVIgYW5kIHNvIG9uLjwvZGl2PjxkaXY+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7IEhvdyBkb3NlIEJNQyBnZXQgYWxsIHJlYXNvbnMgb2YgdGhvc2UgZmF0YWwgZXJy
b3JzPzwvZGl2PjxkaXY+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IEJJT1MgZ2l2ZXMg
dGhvc2UgaW5mb3JtYXRpb25zIHRvIEJNQyBieSBpcG1pPzwvZGl2PjxkaXY+Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7IE9yIGxpa2UgcGVjaSBpbiBpbnRlbCBwbGF0Zm9ybT88L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBXaGF0IHJl
Y2lwZXMmbmJzcDsgY2FuIEkgcmVmZXIgdG8gaW4gb3BlbmJtYz88L2Rpdj48ZGl2PiZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBXYXRpbmcgZm9yIHlvdXIgaGVscCE8L2Rpdj48ZGl2PiZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBUaGFua3MuPC9kaXY+PGRpdj5GZWxpeDxicj48
L2Rpdj48L2Rpdj48YnI+PGJyPjxzcGFuIHRpdGxlPSJuZXRlYXNlZm9vdGVyIj48cD4mbmJzcDs8
L3A+PC9zcGFuPg==
------=_Part_96825_771059046.1583995235640--

