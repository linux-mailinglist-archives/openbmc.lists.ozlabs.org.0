Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E3E14D655
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 07:06:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487VGj21lLzDqVm
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 17:06:21 +1100 (AEDT)
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
 header.s=default header.b=UnmQ1ffJ; dkim-atps=neutral
Received: from mail-40135.protonmail.ch (mail-40135.protonmail.ch
 [185.70.40.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487VFv4PhczDqTm
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jan 2020 17:05:35 +1100 (AEDT)
Date: Thu, 30 Jan 2020 06:05:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1580364330;
 bh=v2ciAKeeXVIf1BCpMHvNYF2UHIlhs3IpG/jrP1WtB0g=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=UnmQ1ffJphhwF4H6F/VNUB+A8JX1/58QPfHUN8vsLkMlKKV4UaDfneO5d2tdrobJt
 zqKa4Nrfk3lTyDROkIwDglEDoK5WYEwwywvW0kzoGAbbEo2Ltg4eVgEtznKDF881oH
 3/0C0L1zPeJQHiMw6A5f7BW0zed33HP3dEUeqzqE=
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: rgrs <rgrs@protonmail.com>
Subject: JTAG master driver for AST2500
Message-ID: <96sA8pOvFp78a8JlbeysPwi0ocDnnLYFkXxMGzpsvxf_sJ4qZdmKp37rtkZHNHTmC1Gb_7E1yV5yUkQU2dqGb0dd7Tv4WzrESzrEgfx91No=@protonmail.com>
Feedback-ID: N7x9TweAIUMPpfpzQuNzrCOD67M7xMEA9S-zwPBDoWaGjAvK1DkvyqGEcVQ17b2imFZOeXQ1Gawv906j51YTTw==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_0ef4ae417c8f9a757d57b0c65fbf05e0"
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,BAYES_60,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
 HTML_MESSAGE shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.2
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

--b1_0ef4ae417c8f9a757d57b0c65fbf05e0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGkgQWxsLAoKRG8gd2UgaGF2ZSBzdXBwb3J0IGZvciBKVEFHIGRyaXZlciBmb3IgQVNUMjUwMD8K
QXJlIHRoZXJlIGFueSBhcHBzIGluIG1haW4gdHJlZSB0byBwZXJmb3JtIGluLXN5c3RlbSBwcm9n
cmFtbWluZyBvZiBjb21wb25lbnRzIHRocm91Z2ggQk1DPwoKVGhhbmtzLApSYWo=


--b1_0ef4ae417c8f9a757d57b0c65fbf05e0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5IaSBBbGwsPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+RG8gd2UgaGF2ZSBzdXBw
b3J0IGZvciBKVEFHIGRyaXZlciBmb3IgQVNUMjUwMD88YnI+PC9kaXY+PGRpdj5BcmUgdGhlcmUg
YW55IGFwcHMgaW4gbWFpbiB0cmVlIHRvIHBlcmZvcm0gaW4tc3lzdGVtIHByb2dyYW1taW5nIG9m
IGNvbXBvbmVudHMgdGhyb3VnaCBCTUM/PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhh
bmtzLDxicj48L2Rpdj48ZGl2PlJhajxicj48L2Rpdj4=



--b1_0ef4ae417c8f9a757d57b0c65fbf05e0--

