Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B43577E57
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 11:08:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmbjN1bJhz3c3r
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 19:08:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=TEe62Oty;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.181.13.150; helo=m13150.mail.163.com; envelope-from=geratul@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=TEe62Oty;
	dkim-atps=neutral
X-Greylist: delayed 915 seconds by postgrey-1.36 at boromir; Sat, 02 Jul 2022 20:07:36 AEST
Received: from m13150.mail.163.com (m13150.mail.163.com [220.181.13.150])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZnn45G6kz2xD3
	for <openbmc@lists.ozlabs.org>; Sat,  2 Jul 2022 20:07:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=m97WV
	3/Te4ziHtpk+Tmwdg5NcIUQSnnGBmXblZsvPDE=; b=TEe62OtyYmhRITWIqz5Bm
	igbZ/w2KvRNxpdKqI8iKDn4lR836+8ls69rR/SXMsw5rGq+7SbjmvmdWgwpd4AlF
	RmvLN3Sg7ssSNcjBDpOPVq7t0fEvY30i2BMwkAcUZqqIn7XlVaUoKwB5qhD9lrWD
	6XRtCrc2uKH7saGMT78Zi0=
Received: from geratul$163.com ( [111.164.174.56] ) by ajax-webmail-wmsvr150
 (Coremail) ; Sat, 2 Jul 2022 17:52:07 +0800 (CST)
X-Originating-IP: [111.164.174.56]
Date: Sat, 2 Jul 2022 17:52:07 +0800 (CST)
From: Yang <geratul@163.com>
To: openbmc@lists.ozlabs.org
Subject: about webui-vue vue version
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 163com
Content-Type: multipart/alternative; 
	boundary="----=_Part_31300_10631679.1656755527496"
MIME-Version: 1.0
Message-ID: <4fd07678.20a7.181be531f49.Coremail.geratul@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: lsGowADn77NHFcBiLuUmAA--.4558W
X-CM-SenderInfo: pjhut3lxo6il2tof0z/1tbiKBwysF7WJ5ja+QACsg
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Approved-At: Mon, 18 Jul 2022 18:59:37 +1000
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

------=_Part_31300_10631679.1656755527496
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGVsbG8KCgogICAgSSBhbSBhIHdlYiBkZXZlbG9wZXIuSSB3YW50IHRvIGFzayBpZiB5b3UgaGF2
ZSBhbnkgcGxhbiB0byB1cGdyYWRlIHRoZSB2dWUgZnJhbWV3b3JrIG9mIHdlYnVpLXZ1ZSB0byB2
dWUzLnguIElmIHllcyAsd2hlbiBkbyB5b3UgYmVnaW4gdG8gZG8gdGhpcy4KVGhhbmsgeW91IHZl
cnkgbXVjaCAh
------=_Part_31300_10631679.1656755527496
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXYgc3R5bGU9Im1hcmdpbjowOyI+SGVsbG88L2Rpdj48ZGl2
IHN0eWxlPSJtYXJnaW46MDsiPjxicj48L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPiZuYnNw
OyZuYnNwOyZuYnNwOyBJIGFtIGEgd2ViIGRldmVsb3Blci5JIHdhbnQgdG8gYXNrIGlmIHlvdSBo
YXZlIGFueSBwbGFuIHRvIHVwZ3JhZGUgdGhlIHZ1ZSBmcmFtZXdvcmsgb2Ygd2VidWktdnVlIHRv
IHZ1ZTMueC4gSWYgeWVzICx3aGVuIGRvIHlvdSBiZWdpbiB0byBkbyB0aGlzLjwvZGl2PjxkaXYg
c3R5bGU9Im1hcmdpbjowOyI+PHByZSBzdHlsZT0id2hpdGUtc3BhY2U6IHByZS13cmFwOyBjb2xv
cjogcmdiKDAsIDAsIDApOyBmb250LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1saWdhdHVy
ZXM6IG5vcm1hbDsgZm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsg
bGV0dGVyLXNwYWNpbmc6IG5vcm1hbDsgb3JwaGFuczogMjsgdGV4dC1hbGlnbjogc3RhcnQ7IHRl
eHQtaW5kZW50OiAwcHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aWRvd3M6IDI7IHdvcmQtc3Bh
Y2luZzogMHB4OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IHRleHQtZGVjb3JhdGlv
bi10aGlja25lc3M6IGluaXRpYWw7IHRleHQtZGVjb3JhdGlvbi1zdHlsZTogaW5pdGlhbDsgdGV4
dC1kZWNvcmF0aW9uLWNvbG9yOiBpbml0aWFsOyI+VGhhbmsgeW91IHZlcnkgbXVjaCAhPC9wcmU+
PC9kaXY+PC9kaXY+
------=_Part_31300_10631679.1656755527496--

