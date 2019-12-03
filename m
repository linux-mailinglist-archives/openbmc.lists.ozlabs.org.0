Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 650D610FD2C
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2019 13:05:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47S0zP25cMzDqVk
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2019 23:05:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.40.135;
 helo=mail-40135.protonmail.ch; envelope-from=rgrs@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.b="lSV0bqU+"; 
 dkim-atps=neutral
Received: from mail-40135.protonmail.ch (mail-40135.protonmail.ch
 [185.70.40.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47S0wm2J4VzDqVc
 for <openbmc@lists.ozlabs.org>; Tue,  3 Dec 2019 23:02:44 +1100 (AEDT)
Date: Tue, 03 Dec 2019 12:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1575374559;
 bh=jL+QFclVBVln10SSlh4LRf5u1O0qd9xK/phBxUIUjHQ=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=lSV0bqU+qJhTs1OBUm8wfYH9LegZ5ESujM+NOsh42OlPnTtRorgDSHniGjNm1pmo4
 qj0mKyHxq+T/8zvVlVffc0LhEE+wzGk8vQZKJctWnuVlSJpD9NET/wfklM8uTzQysJ
 zavbciB8pgUa06Pqf4A26G9um0xVAsaSS5ky1TvI=
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: rgrs <rgrs@protonmail.com>
Subject: BMC update via TFTP
Message-ID: <q7_GhCRdlxUNHfFX0Y4tW7FPq5Md7qwdFWbwd39V_S5zxrSBYtoXtvlNpQdZchvPB27edbJ3-QKFyZ97kzXoeH3Bby8IIHSWhxle9jzteKA=@protonmail.com>
Feedback-ID: N7x9TweAIUMPpfpzQuNzrCOD67M7xMEA9S-zwPBDoWaGjAvK1DkvyqGEcVQ17b2imFZOeXQ1Gawv906j51YTTw==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_b169be4adf4d6887b1ff82e634b43930"
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

--b1_b169be4adf4d6887b1ff82e634b43930
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGksCgpJbiBCTUMgV2ViVUkgdW5kZXIgIkRvd25sb2FkIGltYWdlIGZpbGUgZnJvbSBURlRQIHNl
cnZlciIgc2VjdGlvbiwKd2UgaGF2ZSB0ZXh0IGZpZWxkcyAiVEZUUCBTZXJ2ZXIgSVAgYWRkcmVz
cyIgYW5kICJGaWxlIG5hbWUiLgoiRmlsZSBuYW1lIiBkb2Vzbid0IHRha2UgZm9sZGVycyBpbiBw
YXRoLiBJcyB0aGlzIGEgYnVnIG9yIGV4cGVjdGVkIGJlaGF2aW9yPwoKVEZUUCBkb3dubG9hZHMg
d29yayBvbmx5IGlmIGZpbGUgaXMga2VwdCBpbiByb290IG9mIHRmdHAgc2hhcmUuCgpUaGFua3Ms
ClJhag==


--b1_b169be4adf4d6887b1ff82e634b43930
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5IaSw8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JbiBCTUMgIFdlYlVJIHVuZGVy
ICJEb3dubG9hZCBpbWFnZSBmaWxlIGZyb20gVEZUUCBzZXJ2ZXIiIHNlY3Rpb24sPGJyPjwvZGl2
PjxkaXY+d2UgaGF2ZSB0ZXh0IGZpZWxkcyAiVEZUUCBTZXJ2ZXIgSVAgYWRkcmVzcyIgYW5kICJG
aWxlIG5hbWUiLjxicj48L2Rpdj48ZGl2PiJGaWxlIG5hbWUiIGRvZXNuJ3QgdGFrZSBmb2xkZXJz
IGluIHBhdGguIElzIHRoaXMgYSBidWcgb3IgZXhwZWN0ZWQgYmVoYXZpb3I/PGJyPjwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+VEZUUCBkb3dubG9hZHMgd29yayBvbmx5IGlmIGZpbGUgaXMga2Vw
dCBpbiByb290IG9mIHRmdHAgc2hhcmUuPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhh
bmtzLDxicj48L2Rpdj48ZGl2PlJhajxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2IGNsYXNz
PSJwcm90b25tYWlsX3NpZ25hdHVyZV9ibG9jayI+PGRpdiBjbGFzcz0icHJvdG9ubWFpbF9zaWdu
YXR1cmVfYmxvY2stdXNlciBwcm90b25tYWlsX3NpZ25hdHVyZV9ibG9jay1lbXB0eSI+PGJyPjwv
ZGl2PjxkaXYgY2xhc3M9InByb3Rvbm1haWxfc2lnbmF0dXJlX2Jsb2NrLXByb3RvbiI+PGJyPjwv
ZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2Pg==



--b1_b169be4adf4d6887b1ff82e634b43930--

