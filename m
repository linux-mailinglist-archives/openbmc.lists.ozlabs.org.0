Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 970398C6A59
	for <lists+openbmc@lfdr.de>; Wed, 15 May 2024 18:15:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-04 header.b=P+1+DBmE;
	dkim=pass (2048-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-03 header.b=dL7NjyQc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfdcV0Wx0z3cyM
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2024 02:15:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-04 header.b=P+1+DBmE;
	dkim=pass (2048-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-03 header.b=dL7NjyQc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yadro.com (client-ip=89.207.88.248; helo=mta-04.yadro.com; envelope-from=d.sharikhin@yadro.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 516 seconds by postgrey-1.37 at boromir; Thu, 16 May 2024 02:14:15 AEST
Received: from mta-04.yadro.com (mta-04.yadro.com [89.207.88.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfdZv635Hz3cfT
	for <openbmc@lists.ozlabs.org>; Thu, 16 May 2024 02:14:15 +1000 (AEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 7FA38C0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1715789179; bh=npNUZlBM1eXoVGy4N52jzT3cJPif0iuslWCDtQRswzs=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=P+1+DBmEEUqbp1nw4VAgOfKet8aJJXYQoJtZmptCh5K/d1qK9svCgYJseeVdhx+7S
	 x86qvaceGbb3dn8b19KviGir/FxEprnknQIrA+pKiKWvewcBThv75Pg9C9sx0TDTQn
	 lCMBlRs0OggijMqjZx24qeVvRbTQQnfh/aG65QjVv3Kh9MFWIHzzVmILHZ1fSwVk/D
	 uDS8u0PBOtiu+Yp/mLZFXhNCijYXkMpeDwPhNWdKskegt/bX6qNAty4/2BueOOBdr0
	 7hIkDRHMNUTQu7oGfne6Z+rwzZ0QNxmdMY2T3tnaakPQGEKECryx0Bt2vrre3sj3mY
	 VAMAYQpxgU2Ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1715789179; bh=npNUZlBM1eXoVGy4N52jzT3cJPif0iuslWCDtQRswzs=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=dL7NjyQcyODE8aP0SFqhKQqo/SpJR33NGOmfH6YADrJ9fel6KbmDK5EsLR7vlJURG
	 R0j5l9cL0mGEhOvAvWjq4Fm4hRrN/Lv1mZNS0FdYQubibQ2Ex2QuPTDHrTy4aMET6X
	 +qnj1kdE49Mnjoe8fgt7jmDFuEJfHOLeFq+yRah7oxN3nd6AAyDPCWusGLDwuwPIYP
	 tmB5AvoufKUUqe/nKzOxdORmMbrh9IAtb1oso5wpMkZmheZIDJ2vsv+tun0Br9I5jF
	 +khyYFgxtBu2+JoPdYyd4XOTQPSJrfS9aGe0HaEfj0asSoBj+aVeUpxddmyG0A/Et1
	 dDA69gNUwPcKA==
From: Dmitriy Sharikhin <d.sharikhin@yadro.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [PATCH u-boot, v2019.04-aspeed-openbmc v1 3/3] dts: aspeed: append
 SGPIO nodes for ast2500 and ast2600
Thread-Topic: [PATCH u-boot, v2019.04-aspeed-openbmc v1 3/3] dts: aspeed:
 append SGPIO nodes for ast2500 and ast2600
Thread-Index: AQHapuHSmoMVp4cL4kmXcYOYzeNtYQ==
Date: Wed, 15 May 2024 16:06:18 +0000
Message-ID: <4f621d3d603f9824ce744397833a8e66651f3fe0.camel@yadro.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-ID: <F3C30F5DD321DE4F9C2578AA6B66C026@yadro.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: Alexander Amelkin <a.amelkin@yadro.com>, Igor Kononenko <i.kononenko@yadro.com>, "Alexander A. Filippov" <a.filippov@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

VGhpcyBwYXRjaCBlbmFibGVzIHN1cHBvcnQgZm9yIFNHUElPIGRyaXZlciBpbiBkZXZpY2UgdHJl
ZS4NCg0KU2lnbmVkLW9mZi1ieTogRG1pdHJpaSBTaGFyaWtoaW4gPGQuc2hhcmlraGluQHlhZHJv
LmNvbT4NCi0tLQ0KIGFyY2gvYXJtL2R0cy9hc3QyNTAwLmR0c2kgfCAxOSArKysrKysrKysrKysr
KysrKysrDQogYXJjaC9hcm0vZHRzL2FzdDI2MDAuZHRzaSB8IDM4ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrDQogMiBmaWxlcyBjaGFuZ2VkLCA1NyBpbnNlcnRpb25zKCsp
DQoNCmRpZmYgLS1naXQgYS9hcmNoL2FybS9kdHMvYXN0MjUwMC5kdHNpIGIvYXJjaC9hcm0vZHRz
L2FzdDI1MDAuZHRzaQ0KaW5kZXggYWYwM2Q4OGQxMy4uZjA0OTQxNjA5MSAxMDA2NDQNCi0tLSBh
L2FyY2gvYXJtL2R0cy9hc3QyNTAwLmR0c2kNCisrKyBiL2FyY2gvYXJtL2R0cy9hc3QyNTAwLmR0
c2kNCkBAIC0yNjYsNiArMjY2LDIwIEBADQogCQkJCWludGVycnVwdC1jb250cm9sbGVyOw0KIAkJ
CX07DQogDQorCQkJc2dwaW86IHNncGlvQDFlNzgwMjAwIHsNCisJCQkJI2dwaW8tY2VsbHMgPSA8
Mj47DQorCQkJCWNvbXBhdGlibGUgPSAiYXNwZWVkLGFzdDI1MDAtc2dwaW8iOw0KKwkJCQlncGlv
LWNvbnRyb2xsZXI7DQorCQkJCWludGVycnVwdHMgPSA8NDA+Ow0KKwkJCQlyZWcgPSA8MHgxZTc4
MDIwMCAweDAxMDA+Ow0KKwkJCQljbG9ja3MgPSA8JnNjdSBBU1BFRURfQ0xLX0FQQj47DQorCQkJ
CWludGVycnVwdC1jb250cm9sbGVyOw0KKwkJCQlidXMtZnJlcXVlbmN5ID0gPDEyMDAwMDAwPjsN
CisJCQkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCisJCQkJcGluY3RybC0wID0gPCZwaW5j
dHJsX3NncG1fZGVmYXVsdD47DQorCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQorCQkJfTsNCisN
CiAJCQl0aW1lcjogdGltZXJAMWU3ODIwMDAgew0KIAkJCQkvKiBUaGlzIHRpbWVyIGlzIGEgRmFy
YWRheSBGVFRNUjAxMCBkZXJpdmF0aXZlICovDQogCQkJCWNvbXBhdGlibGUgPSAiYXNwZWVkLGFz
dDI0MDAtdGltZXIiOw0KQEAgLTEyNzcsNiArMTI5MSwxMSBAQA0KIAkJZ3JvdXBzID0gIlNEQTIi
Ow0KIAl9Ow0KIA0KKwlwaW5jdHJsX3NncG1fZGVmYXVsdDogc2dwbV9kZWZhdWx0IHsNCisJCWZ1
bmN0aW9uID0gIlNHUE0iOw0KKwkJZ3JvdXBzID0gIlNHUE0iOw0KKwl9Ow0KKw0KIAlwaW5jdHJs
X3NncHMxX2RlZmF1bHQ6IHNncHMxX2RlZmF1bHQgew0KIAkJZnVuY3Rpb24gPSAiU0dQUzEiOw0K
IAkJZ3JvdXBzID0gIlNHUFMxIjsNCmRpZmYgLS1naXQgYS9hcmNoL2FybS9kdHMvYXN0MjYwMC5k
dHNpIGIvYXJjaC9hcm0vZHRzL2FzdDI2MDAuZHRzaQ0KaW5kZXggMjkwZDRkYTUxYS4uOGZiNDRk
NzUxMCAxMDA2NDQNCi0tLSBhL2FyY2gvYXJtL2R0cy9hc3QyNjAwLmR0c2kNCisrKyBiL2FyY2gv
YXJtL2R0cy9hc3QyNjAwLmR0c2kNCkBAIC00NDUsNiArNDQ1LDM0IEBADQogCQkJCW5ncGlvcyA9
IDwyMDg+Ow0KIAkJCX07DQogDQorCQkJc2dwaW9tMDogc2dwaW9tQDFlNzgwNTAwIHsNCisJCQkJ
I2dwaW8tY2VsbHMgPSA8Mj47DQorCQkJCWdwaW8tY29udHJvbGxlcjsNCisJCQkJY29tcGF0aWJs
ZSA9ICJhc3BlZWQsYXN0MjYwMC1zZ3Bpb20iOw0KKwkJCQlyZWcgPSA8MHgxZTc4MDUwMCAweDEw
MD47DQorCQkJCWludGVycnVwdHMgPSA8R0lDX1NQSSA1MSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsN
CisJCQkJY2xvY2tzID0gPCZzY3UgQVNQRUVEX0NMS19BUEIyPjsNCisJCQkJaW50ZXJydXB0LWNv
bnRyb2xsZXI7DQorCQkJCWJ1cy1mcmVxdWVuY3kgPSA8MTIwMDAwMDA+Ow0KKwkJCQlwaW5jdHJs
LW5hbWVzID0gImRlZmF1bHQiOw0KKwkJCQlwaW5jdHJsLTAgPSA8JnBpbmN0cmxfc2dwbTFfZGVm
YXVsdD47DQorCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQorCQkJfTsNCisNCisJCQlzZ3Bpb20x
OiBzZ3Bpb21AMWU3ODA2MDAgew0KKwkJCQkjZ3Bpby1jZWxscyA9IDwyPjsNCisJCQkJZ3Bpby1j
b250cm9sbGVyOw0KKwkJCQljb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNjAwLXNncGlvbSI7DQor
CQkJCXJlZyA9IDwweDFlNzgwNjAwIDB4MTAwPjsNCisJCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJ
IDcwIElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KKwkJCQljbG9ja3MgPSA8JnNjdSBBU1BFRURfQ0xL
X0FQQjI+Ow0KKwkJCQlpbnRlcnJ1cHQtY29udHJvbGxlcjsNCisJCQkJYnVzLWZyZXF1ZW5jeSA9
IDwxMjAwMDAwMD47DQorCQkJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQorCQkJCXBpbmN0
cmwtMCA9IDwmcGluY3RybF9zZ3BtMl9kZWZhdWx0PjsNCisJCQkJc3RhdHVzID0gImRpc2FibGVk
IjsNCisJCQl9Ow0KKw0KIAkJCWdwaW8xOiBncGlvQDFlNzgwODAwIHsNCiAJCQkJY29tcGF0aWJs
ZSA9ICJhc3BlZWQsYXN0MjYwMC1ncGlvIjsNCiAJCQkJcmVnID0gPDB4MWU3ODA4MDAgMHg4MDA+
Ow0KQEAgLTE4NTIsNiArMTg4MCwxNiBAQA0KIAkJZ3JvdXBzID0gIlNEQTIiOw0KIAl9Ow0KIA0K
KwlwaW5jdHJsX3NncG0xX2RlZmF1bHQ6IHNncG0xX2RlZmF1bHQgew0KKwkJZnVuY3Rpb24gPSAi
U0dQTTEiOw0KKwkJZ3JvdXBzID0gIlNHUE0xIjsNCisJfTsNCisNCisJcGluY3RybF9zZ3BtMl9k
ZWZhdWx0OiBzZ3BtMl9kZWZhdWx0IHsNCisJCWZ1bmN0aW9uID0gIlNHUE0yIjsNCisJCWdyb3Vw
cyA9ICJTR1BNMiI7DQorCX07DQorDQogCXBpbmN0cmxfc2dwczFfZGVmYXVsdDogc2dwczFfZGVm
YXVsdCB7DQogCQlmdW5jdGlvbiA9ICJTR1BTMSI7DQogCQlncm91cHMgPSAiU0dQUzEiOw0KLS0g
DQoyLjM5LjINCg0KDQoNCg==
