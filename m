Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D70F410FD5C
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2019 13:09:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47S14Q09NpzDqVk
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2019 23:09:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.40.130;
 helo=mail-40130.protonmail.ch; envelope-from=rgrs@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.b="iMntR/EF"; 
 dkim-atps=neutral
Received: from mail-40130.protonmail.ch (mail-40130.protonmail.ch
 [185.70.40.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47S11p6XKvzDqVb
 for <openbmc@lists.ozlabs.org>; Tue,  3 Dec 2019 23:07:10 +1100 (AEDT)
Date: Tue, 03 Dec 2019 12:06:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1575374826;
 bh=W9HZ+OFrKNF8YIwrZ57nBSnZF79TPhAO+h3eDEWkhd4=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=iMntR/EFBqCbkjPjMRzMcZcl3AqGUdkOYLTfgqm7QzMoX/aGxMTvUjv21MPTF16Ef
 ElY73BAU02QFctbubFchFhU7mfG0yQzcdEnwk+OchuOvWu9eM6UYi0Yd9VHeVY3iXQ
 +M5NArpbuqaD5O2ohLKZy27XPkc+i5XRek8OcnI0=
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: rgrs <rgrs@protonmail.com>
Subject: Faking Sensor Readings
Message-ID: <QVdDJHlLW9JS_3uowBPTzSCb1dwpqJjml0ORFR_aQGpuKCve1l8Qwy4GF4X0_dgJmExy8sjJQD_VjnI-o4xwoYhivHJlSPBt42fc1cuDKjw=@protonmail.com>
Feedback-ID: N7x9TweAIUMPpfpzQuNzrCOD67M7xMEA9S-zwPBDoWaGjAvK1DkvyqGEcVQ17b2imFZOeXQ1Gawv906j51YTTw==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_b06657c626622b77c2346e4d3b370090"
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE
 autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
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

--b1_b06657c626622b77c2346e4d3b370090
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGksCgpIb3cgZG8gSSBmYWtlIHNlbnNvciByZWFkaW5ncyBpbiBPcGVuQk1DPwpXZSdyZSB0cnlp
bmcgdG8gZmFrZSB0ZW1wZXJhdHVyZSBzZW5zb3JzIGFuZCBtYWtlIHN1cmUgZmFucyByYW1wIHVw
L2Rvd24gYWNjb3JkaW5nbHkuCgpQbGVhc2Ugc2hhcmUgYW55IGRvY3VtZW50cyByZWxhdGVkIHRv
IHRoZXNlIHRlc3RzLgoKVGhhbmtzLApSYWo=


--b1_b06657c626622b77c2346e4d3b370090
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5IaSw8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5Ib3cgZG8gSSBmYWtlIHNlbnNv
ciByZWFkaW5ncyBpbiBPcGVuQk1DPzxicj48L2Rpdj48ZGl2PldlJ3JlIHRyeWluZyB0byBmYWtl
IHRlbXBlcmF0dXJlIHNlbnNvcnMgYW5kIG1ha2Ugc3VyZSBmYW5zIHJhbXAgdXAvZG93biBhY2Nv
cmRpbmdseS48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5QbGVhc2Ugc2hhcmUgYW55IGRv
Y3VtZW50cyByZWxhdGVkIHRvIHRoZXNlIHRlc3RzLjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48
ZGl2PlRoYW5rcyw8YnI+UmFqPGJyPjwvZGl2Pg==



--b1_b06657c626622b77c2346e4d3b370090--

