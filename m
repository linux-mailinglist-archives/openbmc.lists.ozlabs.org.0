Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E3E10C617
	for <lists+openbmc@lfdr.de>; Thu, 28 Nov 2019 10:40:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Nt0w0THZzDr0v
	for <lists+openbmc@lfdr.de>; Thu, 28 Nov 2019 20:40:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.13.124; helo=m13-124.163.com;
 envelope-from=xiaoqian1641@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.b="NXuSgLDj"; 
 dkim-atps=neutral
Received: from m13-124.163.com (m13-124.163.com [220.181.13.124])
 by lists.ozlabs.org (Postfix) with ESMTP id 47Nszx1YpszDqyg
 for <openbmc@lists.ozlabs.org>; Thu, 28 Nov 2019 20:39:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=YKEmU
 9u6rjQfG25H6vR8RqtFDSg5HBjequ/fQoUqeSQ=; b=NXuSgLDj0vp+RrOcCVIAs
 W308LTnYSHQS0Yeij1Form9oAl8ZONrjhiKSgFhD1BxrVerwIjU//IjrTZX/ORDE
 Ip2DHsXkIMmAkfxED7ulxt+bqnLgJDZ7NUMU3TKF+WAiMVOnp7Xs/cwL5ktpDiwG
 GqF7G85vP0jnHJdrmQgUxA=
Received: from xiaoqian1641$163.com ( [106.120.127.15] ) by
 ajax-webmail-wmsvr124 (Coremail) ; Thu, 28 Nov 2019 17:39:32 +0800 (CST)
X-Originating-IP: [106.120.127.15]
Date: Thu, 28 Nov 2019 17:39:32 +0800 (CST)
From: =?GBK?B?s6PP/sP3?= <xiaoqian1641@163.com>
To: "OpenBMC Development" <openbmc@lists.ozlabs.org>
Subject: Is there any plan to introduce tightvnc into openbmc
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2019 www.mailtech.cn 163com
X-CM-CTRLDATA: LfQQnGZvb3Rlcl9odG09MjI2OjU2
Content-Type: multipart/alternative; 
 boundary="----=_Part_170784_153265314.1574933972839"
MIME-Version: 1.0
Message-ID: <630491b9.b0a5.16eb1614767.Coremail.xiaoqian1641@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: fMGowAD3_9vUld9dddaFAQ--.51034W
X-CM-SenderInfo: 50ld01pldqiliur6il2tof0z/xtbB0xR7fFXlorHwLwAAs8
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

------=_Part_170784_153265314.1574933972839
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGmjrEFsbCwKCgpJcyB0aGVyZSBhbnkgcGxhbiB0byBpbnRyb2R1Y2UgdGlnaHR2bmMgaW50byBv
cGVuYm1jID8KCgoKCkpvaG55
------=_Part_170784_153265314.1574933972839
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+SGmjrEFsbCw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PklzIHRoZXJlIGFueSBwbGFuIHRvIGludHJvZHVjZSB0aWdodHZuYyBpbnRvIG9wZW5ibWMgPzwv
ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+Sm9obnk8L2Rpdj48L2Rpdj48
YnI+PGJyPjxzcGFuIHRpdGxlPSJuZXRlYXNlZm9vdGVyIj48cD4mbmJzcDs8L3A+PC9zcGFuPg==

------=_Part_170784_153265314.1574933972839--

