Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C875A173238
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 08:57:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TMMM1W3HzDrBZ
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 18:57:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.13.54; helo=m13-54.163.com;
 envelope-from=ouyangxuan10@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=PFIUYNeP; dkim-atps=neutral
X-Greylist: delayed 926 seconds by postgrey-1.36 at bilbo;
 Fri, 28 Feb 2020 18:56:42 AEDT
Received: from m13-54.163.com (m13-54.163.com [220.181.13.54])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TMLf1CyrzDq5y
 for <openbmc@lists.ozlabs.org>; Fri, 28 Feb 2020 18:56:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=XaGWq
 NlTpvq+O4q2BLp6WsHqUo9HV15SVNVwksqXEas=; b=PFIUYNeP+l/7ym0QNZ/br
 Yr2QDlfUg+gtOAQCjZG97kiIx7RBkK6MKFqA8poyLzrLea7aGvxqd3cv0oEe1j6e
 xG77dtKe9XkZZVNCDjveQXNuZkBh5uRyfTsbEoZ5k8hPnXV8/7DYrocqylqF1n0F
 cw4p7Em6D2sjF56UKcYrXs=
Received: from ouyangxuan10$163.com ( [106.120.127.15] ) by
 ajax-webmail-wmsvr54 (Coremail) ; Fri, 28 Feb 2020 15:40:55 +0800 (CST)
X-Originating-IP: [106.120.127.15]
Date: Fri, 28 Feb 2020 15:40:55 +0800 (CST)
From: www <ouyangxuan10@163.com>
To: openbmc@lists.ozlabs.org
Subject: [OpenBMC]: How to get the update progress when flashing BMC firmware?
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2020 www.mailtech.cn 163com
X-CM-CTRLDATA: hWUN3mZvb3Rlcl9odG09MjUzOjU2
Content-Type: multipart/alternative; 
 boundary="----=_Part_72266_1588454182.1582875655766"
MIME-Version: 1.0
Message-ID: <2042ec12.4c6e.1708abdbe56.Coremail.ouyangxuan10@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: NsGowAAXo5wHxFheQY2FAQ--.41502W
X-CM-SenderInfo: prx1t0pj0xt0irq6il2tof0z/1tbiMRPX2lUMSS0i5gABsX
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

------=_Part_72266_1588454182.1582875655766
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

aGmjrAoKCkhvdyB0byBnZXQgdGhlIHVwZGF0ZSBwcm9ncmVzcyB3aGVuIEJNQyBpcyBmbGFzaGlu
Zy4gSXQgY2FuIGJlIGRpc3BsYXllZCBvbiB3ZWJ1aS4KCgp0aGFua3MsCkJ5cm9u
------=_Part_72266_1588454182.1582875655766
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+aGmjrDwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SG93
IHRvIGdldCB0aGUgdXBkYXRlIHByb2dyZXNzIHdoZW4gQk1DIGlzIGZsYXNoaW5nLiBJdCBjYW4g
YmUgZGlzcGxheWVkIG9uIHdlYnVpLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+dGhhbmtzLDwv
ZGl2PjxkaXY+Qnlyb248L2Rpdj48L2Rpdj48YnI+PGJyPjxzcGFuIHRpdGxlPSJuZXRlYXNlZm9v
dGVyIj48cD4mbmJzcDs8L3A+PC9zcGFuPg==
------=_Part_72266_1588454182.1582875655766--

