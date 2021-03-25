Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8487C349262
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 13:49:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5lLF3m57z303J
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 23:49:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail header.b=ajwMRejv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.40.130;
 helo=mail-40130.protonmail.ch; envelope-from=rgrs@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256
 header.s=protonmail header.b=ajwMRejv; 
 dkim-atps=neutral
X-Greylist: delayed 74488 seconds by postgrey-1.36 at boromir;
 Thu, 25 Mar 2021 23:49:28 AEDT
Received: from mail-40130.protonmail.ch (mail-40130.protonmail.ch
 [185.70.40.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5lL05Nnxz302Z
 for <openbmc@lists.ozlabs.org>; Thu, 25 Mar 2021 23:49:25 +1100 (AEDT)
Date: Thu, 25 Mar 2021 12:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1616676559;
 bh=5q+yhtBgQVFOr+iVfCN7UxvCxozmFow1KyZnC9jR7I8=;
 h=Date:To:From:Reply-To:Subject:From;
 b=ajwMRejvot4NzpJwpA9+xvH2CPXYjn6iInYybhV3yEfMLp/ZsPyWtAgStP1SKNUfo
 nwzDu1E6iITyo+hFydNNkh+4otKkxKYalcwWFvEFcJlIPPJdLmMuEYsBfeZ0BtEh5S
 atnjD2cAHMPHkmcjFlhnYfmMOWYjSaWaUw9y6evo=
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: rgrs <rgrs@protonmail.com>
Subject: IPMI SEL Parsing
Message-ID: <gmu36wVnmbV9lyt9EpYcnZmnPwjF9wtDS0N8K0jOk9UR2uUO0QwQaackzJRPLjil_ZqLxTzX3qEMGl3IE6baoIpS-xh9aMnQL3VkAyXK6KU=@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_XAHHwPwIYXwPU1tmEhNbzBLQjztvef4Nd3NpYs6VA"
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE
 shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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

--b1_XAHHwPwIYXwPU1tmEhNbzBLQjztvef4Nd3NpYs6VA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGkgQWxsLAoKImlwbWl0b29sIHNlbCBsaXN0IiBhbHdheXMgc2hvd3MgdGhlIHJlY29yZHMgYXMg
IlVuZGV0ZXJtaW5lZCBzeXN0ZW0gaGFyZHdhcmUgZmFpbHVyZSIuCkxvZ2dpbmcvZW50cnkgZG9l
c24ndCBoYXZlIHRoZSBwcm9wZXIgYXNzb2NpYXRpb24uIEhvdyBkbyBJIGFkZCBhc3NvY2lhdGlv
biBmb3IgbG9nIGVudHJpZXMgYW5kIHJlc3BlY3RpdmUgRlJVcz8KCldoaWNoIHBhY2thZ2UgY3Jl
YXRlcyBMb2dnaW5nL2VudHJ5IG9iamVjdCBvbiBzZW5zb3IgZXZlbnRzPyBJIGRvbid0IHNlZSBh
bnkgY2FsbCB0byBTZWxBZGQgaW4gcGhvc3Bob3ItaHdtb24uCgpUaGFua3MsClJhag==

--b1_XAHHwPwIYXwPU1tmEhNbzBLQjztvef4Nd3NpYs6VA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdj5IaSBBbGwsPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+ImlwbWl0b29sIHNlbCBs
aXN0IiBhbHdheXMgc2hvd3MgdGhlIHJlY29yZHMgYXMgIlVuZGV0ZXJtaW5lZCBzeXN0ZW0gaGFy
ZHdhcmUgZmFpbHVyZSIuPGJyPkxvZ2dpbmcvZW50cnkgZG9lc24ndCBoYXZlIHRoZSBwcm9wZXIg
YXNzb2NpYXRpb24uIEhvdyBkbyBJIGFkZCBhc3NvY2lhdGlvbiBmb3IgbG9nIGVudHJpZXMgYW5k
IHJlc3BlY3RpdmUgRlJVcz88L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PldoaWNoIHBhY2thZ2Ug
Y3JlYXRlcyBMb2dnaW5nL2VudHJ5IG9iamVjdCBvbiBzZW5zb3IgZXZlbnRzPyBJIGRvbid0IHNl
ZSBhbnkgY2FsbCB0byBTZWxBZGQgaW4gcGhvc3Bob3ItaHdtb24uPGJyPjwvZGl2PjxkaXY+PGJy
PjwvZGl2PjxkaXY+VGhhbmtzLDxicj48L2Rpdj48ZGl2PlJhajwvZGl2Pg==


--b1_XAHHwPwIYXwPU1tmEhNbzBLQjztvef4Nd3NpYs6VA--

