Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 604F5129E1F
	for <lists+openbmc@lfdr.de>; Tue, 24 Dec 2019 07:37:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hmjz2tgSzDqMl
	for <lists+openbmc@lfdr.de>; Tue, 24 Dec 2019 17:37:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.40.130;
 helo=mail-40130.protonmail.ch; envelope-from=rgrs@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.b="Afmx/BLX"; 
 dkim-atps=neutral
Received: from mail-40130.protonmail.ch (mail-40130.protonmail.ch
 [185.70.40.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hmjC374kzDqLS
 for <openbmc@lists.ozlabs.org>; Tue, 24 Dec 2019 17:36:59 +1100 (AEDT)
Date: Tue, 24 Dec 2019 06:36:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1577169414;
 bh=1HRL2a2iSlCbASLpjnGTdEVTgYiGcNc/tXCXV0sPzlI=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=Afmx/BLXrLETreIevaNwPvp5RV0LpJXKz6xkcThL8a+Iyg+IPiaGCBUM8LH/yUce7
 ZJcxx5VcaIgD2NFRb5XiBZtcg+FpDoHBGy/6C7XeLCajhJzo3Ce9MzaKSeaabUb9aZ
 NTF978voNzhlxIIPqXSl7j1N+vEu+0wd+76rb2Dc=
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: rgrs <rgrs@protonmail.com>
Subject: BMC UUID property/object not found
Message-ID: <yepdfnStu5NH94jUzVoKLGdX2kVPErynD7ERZlcm_Ig8_K1zkvmSLoC1SYhdm0b3ASb_B8D0r_PTN5Ct_kGk_3aoyi31V6GaM0q3T_DxunU=@protonmail.com>
Feedback-ID: N7x9TweAIUMPpfpzQuNzrCOD67M7xMEA9S-zwPBDoWaGjAvK1DkvyqGEcVQ17b2imFZOeXQ1Gawv906j51YTTw==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_1d9d8aa61937ae94f0c29c39e8cb3682"
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.2
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

--b1_1d9d8aa61937ae94f0c29c39e8cb3682
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGksCgpJIGdldCBiZWxvdyBlcnJvciBtZXNzYWdlIG9uICJpcG1pdG9vbCBtYyBndWlkIiBjb21t
YW5kLAoKRGVjIDI0IDA1OjA5OjMzIG9ibWMgaXBtaWRbMTQ1N106IEZhaWxlZCBpbiByZWFkaW5n
IEJNQyBVVUlEIHByb3BlcnR5CkRlYyAyNCAwNTowOTo0MiBvYm1jIGlwbWlkWzE0NTddOiBObyBP
YmplY3QgaGFzIGltcGxlbWVudGVkIHRoZSBpbnRlcmZhY2UKRGVjIDI0IDA1OjA5OjQyIG9ibWMg
aXBtaWRbMTQ1N106IFRoZSBvcGVyYXRpb24gZmFpbGVkIGludGVybmFsbHkuCgpJcyB0aGlzIHNh
bWUgYXMKaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYy9pc3N1ZXMvMzUzMgoKV2hp
Y2ggYXBwL3NlcnZpY2UgaW1wbGVtZW50cyB0aGlzIGludGVyZmFjZT8KClRoYW5rcwoKUmFq


--b1_1d9d8aa61937ae94f0c29c39e8cb3682
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5IaSw8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIGdldCBiZWxvdyBlcnJvciBt
ZXNzYWdlIG9uICJpcG1pdG9vbCBtYyBndWlkIiBjb21tYW5kLDxicj48L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2PkRlYyAyNCAwNTowOTozMyBvYm1jIGlwbWlkWzE0NTddOiBGYWlsZWQgaW4gcmVh
ZGluZyBCTUMgVVVJRCBwcm9wZXJ0eTxicj48L2Rpdj48ZGl2PkRlYyAyNCAwNTowOTo0MiBvYm1j
IGlwbWlkWzE0NTddOiBObyBPYmplY3QgaGFzIGltcGxlbWVudGVkIHRoZSBpbnRlcmZhY2U8YnI+
PC9kaXY+PGRpdj5EZWMgMjQgMDU6MDk6NDIgb2JtYyBpcG1pZFsxNDU3XTogVGhlIG9wZXJhdGlv
biBmYWlsZWQgaW50ZXJuYWxseS48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JcyB0aGlz
IHNhbWUgYXMgPGJyPjwvZGl2PjxkaXY+PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL29wZW5i
bWMvb3BlbmJtYy9pc3N1ZXMvMzUzMiI+aHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJt
Yy9pc3N1ZXMvMzUzMjwvYT48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5XaGljaCBhcHAv
c2VydmljZSBpbXBsZW1lbnRzIHRoaXMgaW50ZXJmYWNlPzxicj48L2Rpdj48ZGl2Pjxicj48L2Rp
dj48ZGl2PlRoYW5rczxicj48L2Rpdj48ZGl2IGNsYXNzPSJwcm90b25tYWlsX3NpZ25hdHVyZV9i
bG9jayI+PGRpdiBjbGFzcz0icHJvdG9ubWFpbF9zaWduYXR1cmVfYmxvY2stdXNlciBwcm90b25t
YWlsX3NpZ25hdHVyZV9ibG9jay1lbXB0eSI+PGJyPjwvZGl2PjxkaXYgY2xhc3M9InByb3Rvbm1h
aWxfc2lnbmF0dXJlX2Jsb2NrLXByb3RvbiI+UmFqPGJyPjwvZGl2PjwvZGl2PjxkaXY+PGJyPjwv
ZGl2Pg==



--b1_1d9d8aa61937ae94f0c29c39e8cb3682--

