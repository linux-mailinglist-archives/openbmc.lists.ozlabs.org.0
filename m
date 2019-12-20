Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FA91277B5
	for <lists+openbmc@lfdr.de>; Fri, 20 Dec 2019 10:04:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47fN8j186czDqw2
	for <lists+openbmc@lfdr.de>; Fri, 20 Dec 2019 20:04:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.40.132;
 helo=mail-40132.protonmail.ch; envelope-from=rgrs@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.b="i2XtjTpU"; 
 dkim-atps=neutral
Received: from mail-40132.protonmail.ch (mail-40132.protonmail.ch
 [185.70.40.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47fN7t10CfzDqvg
 for <openbmc@lists.ozlabs.org>; Fri, 20 Dec 2019 20:03:17 +1100 (AEDT)
Date: Fri, 20 Dec 2019 09:03:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1576832592;
 bh=WWWeC/edM1b8z4r2SOzp/IsSPpDiHX/mkGzvohisbWk=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=i2XtjTpUczEhh6lT7kXnLNgxnbkSVfdVuJ+SkXl+yTGR01DyPXbf0h1tj8k7qtPgD
 3xYED1/a5Mokh9TmZcIKcDiPfe7V58QSumZXFiAubaVSy9ET4VKa53Ef9ReuJjuQZn
 2o5I/WFhOaAqqhH/loMxiXAQokhoOpeYEfZubAYM=
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: rgrs <rgrs@protonmail.com>
Subject: Chassis/Host power control and power state transition
Message-ID: <LaJKNX5u1Gewmtk7WV2o3ufGh-xztXj98XR8rLkSa-CECssG7a680W12zKTVsYyD1HaarZqtEtXyQs6GCSyyvk4TJ1lqMYBcIzOT2CUCNnQ=@protonmail.com>
Feedback-ID: N7x9TweAIUMPpfpzQuNzrCOD67M7xMEA9S-zwPBDoWaGjAvK1DkvyqGEcVQ17b2imFZOeXQ1Gawv906j51YTTw==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_f040398e6c039775902de24e03975eeb"
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

--b1_f040398e6c039775902de24e03975eeb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGkgQWxsLAoKU29tZXRpbWVzIHdoZW4gSSBkbyAiaXBtaXRvb2wgY2hhc3NpcyBwb3dlciBjeWNs
ZSIsICBzeXN0ZW0gZ2V0cyBwb3dlcmVkIG9mZiBidXQgbm90IHBvd2VyZWQgb24gYmFjayBhZ2Fp
bi4KTG9ncyBzaG93IHNvbWUgc2RfYnVzX3NldF9wcm9wZXJ0eSByZXR1cm5zIGVycm5vIDUgKElu
cHV0L091dHB1dCBlcnJvcikuCgpNeSBndWVzcyBpcyB0aGF0IENQTEQgdGhhdCB0YWtlcyBjYXJl
IG9mIHBvd2VyIGRpc3RyaWJ1dGlvbiAgaW4gbXkgc2VydmVyIGlzIGNhdXNpbmcgdGhlIElPIGVy
cm9yLCBidXQgaSBuZWVkIGVub3VnaCBkYXRhL2xvZ3MgdG8gcHJvdmUgaXQuCgpJJ20gbm90IGFi
bGUgdG8gZGVidWcgZnVydGhlciB3aXRob3V0IHVuZGVyc3RhbmRpbmcgdGhlIHN0YXRlIG1hY2hp
bmUsIHN5c3RlbSB0YXJnZXRzLCBhbmQgdGhlaXIgb3JkZXIgb2YgZXhlY3V0aW9uLgpJcyB0aGVy
ZSBhbnkgZG9jcyB0byB0b29scyB0byBoZWxwIG1lIHVuZGVyc3RhbmQgb3IgdmlzdWFsaXplIHRo
ZSBleGVjdXRpb24gc2VxdWVuY2UgKGZvciBwb3dlciBvcGVyYXRpb25zIGF0bGVhc3QpPwoKVGhh
bmtzLApSYWo=


--b1_f040398e6c039775902de24e03975eeb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5IaSBBbGwsPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+U29tZXRpbWVzIHdoZW4g
SSBkbyAiaXBtaXRvb2wgY2hhc3NpcyBwb3dlciBjeWNsZSIsJm5ic3A7IHN5c3RlbSBnZXRzIHBv
d2VyZWQgb2ZmIGJ1dCBub3QgcG93ZXJlZCBvbiBiYWNrIGFnYWluLjxicj48L2Rpdj48ZGl2Pkxv
Z3Mgc2hvdyBzb21lIHNkX2J1c19zZXRfcHJvcGVydHkgcmV0dXJucyBlcnJubyA1IChJbnB1dC9P
dXRwdXQgZXJyb3IpLjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pk15IGd1ZXNzIGlzIHRo
YXQgQ1BMRCB0aGF0IHRha2VzIGNhcmUgb2YgcG93ZXIgZGlzdHJpYnV0aW9uJm5ic3A7IGluIG15
IHNlcnZlciBpcyBjYXVzaW5nIHRoZSBJTyBlcnJvciwgYnV0IGkgbmVlZCBlbm91Z2ggZGF0YS9s
b2dzIHRvIHByb3ZlIGl0Ljxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkknbSBub3QgYWJs
ZSB0byBkZWJ1ZyBmdXJ0aGVyIHdpdGhvdXQgdW5kZXJzdGFuZGluZyB0aGUgc3RhdGUgbWFjaGlu
ZSwgc3lzdGVtIHRhcmdldHMsIGFuZCB0aGVpciBvcmRlciBvZiBleGVjdXRpb24uPGJyPjwvZGl2
PjxkaXY+SXMgdGhlcmUgYW55IGRvY3MgdG8gdG9vbHMgdG8gaGVscCBtZSB1bmRlcnN0YW5kIG9y
IHZpc3VhbGl6ZSB0aGUgZXhlY3V0aW9uIHNlcXVlbmNlIChmb3IgcG93ZXIgb3BlcmF0aW9ucyBh
dGxlYXN0KT88YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdiBjbGFzcz0icHJvdG9ubWFpbF9z
aWduYXR1cmVfYmxvY2siPjxkaXYgY2xhc3M9InByb3Rvbm1haWxfc2lnbmF0dXJlX2Jsb2NrLXVz
ZXIgcHJvdG9ubWFpbF9zaWduYXR1cmVfYmxvY2stZW1wdHkiPjxicj48L2Rpdj48ZGl2IGNsYXNz
PSJwcm90b25tYWlsX3NpZ25hdHVyZV9ibG9jay1wcm90b24iPlRoYW5rcyw8YnI+UmFqPGJyPjwv
ZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2Pg==



--b1_f040398e6c039775902de24e03975eeb--

