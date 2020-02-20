Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2107A1659A6
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 09:54:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NT12179CzDqWg
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 19:54:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.40.135;
 helo=mail-40135.protonmail.ch; envelope-from=rgrs@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256
 header.s=default header.b=hF0/RJCr; dkim-atps=neutral
Received: from mail-40135.protonmail.ch (mail-40135.protonmail.ch
 [185.70.40.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NSwC4TjJzDqYB
 for <openbmc@lists.ozlabs.org>; Thu, 20 Feb 2020 19:50:17 +1100 (AEDT)
Date: Thu, 20 Feb 2020 08:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1582188613;
 bh=iImHyQQX6WCf4x1xOorD3xTj0YfWmmoIOmee9GvH1ww=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=hF0/RJCr530JxMeWkwOWTqRW3Tbo95E9fW5MEvVVnfnafVJOt14OVs1Dc7t/Z7ovk
 QIEwT7w2o3QWM9xe2xFx+YxXgw0rXv2qJF80dyWklqEKpctNuZpyGYRwwsnRFEXwRG
 t4cgqzKCKWp9Q3BenVDjdIsiwqgJrZHWKEtfm+6o=
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: rgrs <rgrs@protonmail.com>
Subject: Adding new system in OpenBMC
Message-ID: <SSjvnSywILgR_2FmB69QES8cK7eG3foVtwIhGtJcOsLfecp-OvvQ6fZkW-G5SHO0_zJlgGbZBeVtNI49tLlcj0hT1S3yriH5GGN1uX62NrY=@protonmail.com>
Feedback-ID: N7x9TweAIUMPpfpzQuNzrCOD67M7xMEA9S-zwPBDoWaGjAvK1DkvyqGEcVQ17b2imFZOeXQ1Gawv906j51YTTw==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_9c353eabc244dd874c0e55040ace022f"
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE
 shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: rgrs <rgrs@protonmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.

--b1_9c353eabc244dd874c0e55040ace022f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGksCgpJIGFtIGluIHRoZSBwcm9jZXNzIG9mIGFkZGluZyBuZXcgc3lzdGVtLCB3YW50ZWQgdG8g
Y29uZmlybSBpZiBiZWxvdyBsaW5rIGlzIGxhdGVzdD9odHRwczovL2dpdGh1Yi5jb20vb3BlbmJt
Yy9kb2NzL2Jsb2IvbWFzdGVyL2RldmVsb3BtZW50L2FkZC1uZXctc3lzdGVtLm1kCihzdHVmZiBs
aWtlIGVudGl0eSBtYW5hZ2VyLCBldGMgYXJlIG5vdCBkb2N1bWVudGVkIGluIGFib3ZlIGxpbmsp
CgpJdCB3b3VsZCBiZSBvZiBncmVhdCBoZWxwIGlmIHNvbWVvbmUgY2FuIHBvaW50IHRvIGFueSBs
YXRlc3QgbWFjaGluZSBmb3IgcmVmZXJlbmNlIChBU1QyNTAwIGJhc2VkKS4KClRoYW5rcywKUmFq


--b1_9c353eabc244dd874c0e55040ace022f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

SGksPGJyPjxicj5JIGFtIGluIHRoZSBwcm9jZXNzIG9mIGFkZGluZyBuZXcgc3lzdGVtLCB3YW50
ZWQgdG8gY29uZmlybSBpZiBiZWxvdyBsaW5rIGlzIGxhdGVzdD88YSBocmVmPSJodHRwczovL2dp
dGh1Yi5jb20vb3BlbmJtYy9kb2NzL2Jsb2IvbWFzdGVyL2RldmVsb3BtZW50L2FkZC1uZXctc3lz
dGVtLm1kIj48YnI+aHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvZG9jcy9ibG9iL21hc3Rlci9k
ZXZlbG9wbWVudC9hZGQtbmV3LXN5c3RlbS5tZDwvYT48YnI+KHN0dWZmIGxpa2UgZW50aXR5IG1h
bmFnZXIsIGV0YyBhcmUgbm90IGRvY3VtZW50ZWQgaW4gYWJvdmUgbGluayk8YnI+PGJyPkl0IHdv
dWxkIGJlIG9mIGdyZWF0IGhlbHAgaWYgc29tZW9uZSBjYW4gcG9pbnQgdG8gYW55IGxhdGVzdCBt
YWNoaW5lIGZvciByZWZlcmVuY2UgKEFTVDI1MDAgYmFzZWQpLjxicj48YnI+VGhhbmtzLDxicj5S
YWo8YnI+PGJyPjxkaXY+PGJyPjwvZGl2Pg==



--b1_9c353eabc244dd874c0e55040ace022f--

