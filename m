Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 866F8BD888
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 08:52:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dTJY0gsMzDqjW
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 16:52:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=protonmail.com
 (client-ip=185.70.40.136; helo=mail-40136.protonmail.ch;
 envelope-from=rgrs@protonmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.b="wJ5YO2Bk"; 
 dkim-atps=neutral
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dTJ05yRgzDqWT
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 16:51:59 +1000 (AEST)
Date: Wed, 25 Sep 2019 06:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1569394316;
 bh=Vtf2ZwHdKHFgxcK3Ew6eQEZymOU/efszwuVrhGmjXCQ=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=wJ5YO2BkMgXi9gyuiuYIaTl6MMdnlP8BOyGJSwg7N0zJ/2RRLfWii36Wtv+dooRKj
 kNUpIByhNcILcYE3Iv+GVnFyaH+/Iq9XWZw/9XbJBWIfkAw6/TMS+Z+tk50uuAGxLf
 yQneul3A8v2s+35f8LwqVEYwMlzX7ac43U/1nTZ8=
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: rgrs <rgrs@protonmail.com>
Subject: How can I reset BMC to factory-defaults?
Message-ID: <gcJgOuxYS4Cxh1DTuyIwbad8Dep30bKCasyE2I4YOJ8K4SZ-nuK9SWjh9Jaural_Eo3mSVWHiCGEk6QZZHUUAe3F9UhsQYTuXumP6_aitGE=@protonmail.com>
Feedback-ID: N7x9TweAIUMPpfpzQuNzrCOD67M7xMEA9S-zwPBDoWaGjAvK1DkvyqGEcVQ17b2imFZOeXQ1Gawv906j51YTTw==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_7c798a7b5fbb6d9991f003f5076201ea"
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

--b1_7c798a7b5fbb6d9991f003f5076201ea
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGkgRXZlcnlvbmUsCgpJIHRoaW5rIG15IGZsYXNoL2ZpbGVzeXN0ZW0gaXMgY29ycnVwdCwgSSBn
ZXQgbmV3IGNlcnRzIGdlbmVyYXRlZCBhdCBldmVyeSByZWJvb3Qgb2YgQk1DLgpOb25lIG9mIHRo
ZSBzZXR0aW5ncyBhcmUgcGVyc2lzdGVudC4KCklzIHRoZXJlIGEgd2F5IHRvIHJlc3RvcmUvcmVj
cmVhdGUgdGhlIHBhcnRpdGlvbnMgd2l0aG91dCB1c2luZyBTUEkgcHJvZ3JhbW1lcj8KClRoYW5r
cywKUmFq


--b1_7c798a7b5fbb6d9991f003f5076201ea
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5IaSBFdmVyeW9uZSw8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIHRoaW5rIG15
IGZsYXNoL2ZpbGVzeXN0ZW0gaXMgY29ycnVwdCwgSSBnZXQgbmV3IGNlcnRzIGdlbmVyYXRlZCBh
dCBldmVyeSByZWJvb3Qgb2YgQk1DLjxicj48L2Rpdj48ZGl2Pk5vbmUgb2YgdGhlIHNldHRpbmdz
IGFyZSBwZXJzaXN0ZW50LiA8YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JcyB0aGVyZSBh
IHdheSB0byByZXN0b3JlL3JlY3JlYXRlIHRoZSBwYXJ0aXRpb25zIHdpdGhvdXQgdXNpbmcgU1BJ
IHByb2dyYW1tZXI/PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhhbmtzLDxicj5SYWo8
YnI+PC9kaXY+



--b1_7c798a7b5fbb6d9991f003f5076201ea--

