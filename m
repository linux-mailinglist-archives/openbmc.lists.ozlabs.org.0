Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 682D51033FD
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 06:42:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hs5S4zgLzDqBt
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2019 16:42:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.40.130;
 helo=mail-40130.protonmail.ch; envelope-from=rgrs@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.b="ccfuSvYr"; 
 dkim-atps=neutral
X-Greylist: delayed 574 seconds by postgrey-1.36 at bilbo;
 Wed, 20 Nov 2019 16:35:56 AEDT
Received: from mail-40130.protonmail.ch (mail-40130.protonmail.ch
 [185.70.40.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HryP1Vc4zDqvw
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 16:35:55 +1100 (AEDT)
Date: Wed, 20 Nov 2019 05:26:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1574227572;
 bh=em6hbABj/bYbPnkNKn+tcqjsUiYfUMRsMTjdiCLnhkA=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=ccfuSvYrcjLuv3n/8cdoExZY8DLpIjFc4Z+A4pk3HsIZD5lzbbNxkA8vMTFBdKBIL
 slPokWKhOGQGg8vTG3y9rwvc7fEdOiO4JttJpeMxWKSie/8MlFMPbuHQszcbBG2tnT
 ukIUSMLzXic2JUkoHUUQnO8Ow1aNtrPdep+wtlPw=
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: rgrs <rgrs@protonmail.com>
Subject: MCTP over PCI on AST2500
Message-ID: <gqnvvFdbRiXJzS3sVr0pSSo8kD6KjPbFMgg8CV1tsi0cKt0zT5mrnSTfBB1cpiOt-MVrXNzlg95DqgWZ3AxD8zOyEbFYRykqjP-DxEW4Mww=@protonmail.com>
Feedback-ID: N7x9TweAIUMPpfpzQuNzrCOD67M7xMEA9S-zwPBDoWaGjAvK1DkvyqGEcVQ17b2imFZOeXQ1Gawv906j51YTTw==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_84fa0642c3dad597992ddf5b3a678cc4"
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

--b1_84fa0642c3dad597992ddf5b3a678cc4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGksCgpEb2VzIE9wZW5CTUMgc3VwcG9ydCBNQ1RQIG92ZXIgUENJPwpBcyBpbiwgZHJpdmVycyB0
aGF0IHVzZSBQQ0llIFZETSBkYXRhIHRyYW5zZmVycyB1c2luZyBNQ1RQIGNvbnRyb2xsZXIgaW4g
QVNUMjUwMC4KClRoYW5rcywKcmc=


--b1_84fa0642c3dad597992ddf5b3a678cc4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5IaSw8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5Eb2VzIE9wZW5CTUMgc3VwcG9y
dCBNQ1RQIG92ZXIgUENJPzxicj48L2Rpdj48ZGl2PkFzIGluLCBkcml2ZXJzIHRoYXQgdXNlIFBD
SWUgVkRNIGRhdGEgdHJhbnNmZXJzIHVzaW5nIE1DVFAgY29udHJvbGxlciBpbiBBU1QyNTAwLiA8
YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdiBjbGFzcz0icHJvdG9ubWFpbF9zaWduYXR1cmVf
YmxvY2siPjxkaXYgY2xhc3M9InByb3Rvbm1haWxfc2lnbmF0dXJlX2Jsb2NrLXVzZXIgcHJvdG9u
bWFpbF9zaWduYXR1cmVfYmxvY2stZW1wdHkiPjxicj48L2Rpdj48ZGl2IGNsYXNzPSJwcm90b25t
YWlsX3NpZ25hdHVyZV9ibG9jay1wcm90b24iPlRoYW5rcyw8YnI+PC9kaXY+PGRpdiBjbGFzcz0i
cHJvdG9ubWFpbF9zaWduYXR1cmVfYmxvY2stcHJvdG9uIj5yZzxicj48L2Rpdj48L2Rpdj48ZGl2
Pjxicj48L2Rpdj4=



--b1_84fa0642c3dad597992ddf5b3a678cc4--

