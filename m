Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C18D18BF3C0
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2024 02:35:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=asus.com header.i=@asus.com header.a=rsa-sha256 header.s=asuscom header.b=vys/Q/CT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYx4k2qGGz3cRR
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2024 10:35:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=asus.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=asus.com header.i=@asus.com header.a=rsa-sha256 header.s=asuscom header.b=vys/Q/CT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=asus.com (client-ip=103.10.4.13; helo=ms.asus.com; envelope-from=prvs=850fd42a3=kellyhung@asus.com; receiver=lists.ozlabs.org)
Received: from ms.asus.com (ms.asus.com [103.10.4.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYXqw4GgPz30VV;
	Tue,  7 May 2024 19:22:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=asus.com; i=@asus.com; q=dns/txt; s=asuscom;
  t=1715073773; x=1746609773;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IMAu6x+qCtbZr1W/VVa+wRTjMW2Dpmn9+4xFqh9ddT4=;
  b=vys/Q/CTOzS22M8jsCYN7K2QnnsF535eiM8WFq9mE0+apEcF3qCdVspW
   W85GrC17HEaT8GusvV+iCKImGC4XQQ7DT9DJbb/y83jhABh3vM7bqMdUB
   lNqepoOJcCCJhpkCjxxxLDYjyDEPsDjucYpEXjw9bgndSaJxAFXMwJitr
   o=;
X-IPAS-Result: =?us-ascii?q?A2EXAwBP8jlm/xEvFqxagRKBRoU+liKSJ4tmFIFqDwEBA?=
 =?us-ascii?q?QEBAQEBAQgBRAQBAYUGiDMnNAkOAQIEAQEBAQMCAwEBAQEBAQgBAQEFAQEBA?=
 =?us-ascii?q?QEBBgQBAQECgRmFL1KCYIR/KCB1DoMFgmW1Oxpn3jGBawkBgT6BaYZFAYRYh?=
 =?us-ascii?q?Gl7ggtEJm+HZBIBEgFgDoV3BI4xO4Jcg0eCUYUBggRZD4hKSoEHHANZMgFVE?=
 =?us-ascii?q?w0KCz4JFgIWAxsUBDAPCQsmAyoGNgISDAYGBlkgFgkEIwMIBANEAyBxEQMEG?=
 =?us-ascii?q?gQLB3WDMQQTRAOBOIl6gz0pgXeEIEuEdoF4DmKHIwMHBSwdQAMLGA1IESw1F?=
 =?us-ascii?q?BsGIh9uB6MsE2gBQBAQLxNwK2UROZJ+gz+OVKBuhB2BYQyfPxozhAWMfoZBH?=
 =?us-ascii?q?gOST5hio1iFBQIEAgQFAheBZYEmcDMaI4EKDlaBSlEXArBVgSYCBwsBAQMJi?=
 =?us-ascii?q?G4FLywBO2ABAQ?=
IronPort-PHdr: A9a23:9riU6xL5MjldUWyErdmcuINhWUAX0o4c3iYr45Yqw4hDbr6kt8y7e
 hCFtLM31g+CBN6TwskHotSVmpijY1BI2YyGvnEGfc4EfD4+ouJSoTYdBtWYA1bwNv/gYn9yN
 s1DUFh44yPzahANS47xaFLIv3K98yMZFAnhOgppPOT1HZPZg9iq2+yo9JDffQFFiCCjbb9sL
 xi6ohjdu8cLioZ+N6g9zQfErXRPd+lK321kIk6dkQjh7cmq5p5j9CpQu/Ml98FeVKjxYro1Q
 79FAjk4Km45/MLkuwXNQguJ/XscT34ZkgFUDAjf7RH1RYn+vy3nvedgwiaaPMn2TbcpWTS+6
 qpgVRHlhDsbOzM/7WrajNF7gqBGrxK7vxFxw5DabZ+IOvRwfa3TetwVS2VdUcZQTCFBHpq8Y
 pETA+cbIepUs4/wrEYOoxukAgmsAfvixDpWiX/y2a070/kqHwPb3AwmENIFrXPZotDrO6cWV
 eC0zKvGzSjFb/NZwjry8pPIcg06of2WQb1wds/RxFApGgjYgVqetZbrMCmJ1uQRrWeb9exgW
 PqghWApqgx8viajytsshITNiYwZ1EzI+Dh2zYorKtC0Vk51b9GqHZdMtCyXNZd7T8w8T211u
 is3xKALtJqmcCUKzpks2h3Ra+SffoSV4B/vSvydLSlmiH5/d7+yhQy+/VWix+HkV8S4zUxGo
 jRYntTNrHwA1hze5tKaRvZ+/Eqs3yuE2h7X6uFZOkA0ibTUK4Q8zL4xl5scr1zOEjPwlU7rl
 qGZbF8k9fKt6+n/Z7XmoYKTOJFshwHlN6QuhtS/AeMlMggSR2Sb+fqz1Lnk/UDhXrtElOQ6n
 K7XvpzDKssXurO1DxVJ3YYk8Ra/FzGm38oEnXUdNl1FYw+Hj5PxN1HPJvD3E+u/jkyxnDpp2
 fzKJKPtDovXInXMkrrtZ6tx5kxExAo2199f5pZUCr8bIPL0X0/8rNnWAQE9Mwyww+fpCsh91
 oURWW+UGKCZK77SsUSS6u0zJOmMYZcZuDDmJPc9/f7hkWc5mUMBfamuxZYbdWy0Eux8I0qFe
 XrsnssBEWASswokS+zlk12CXTlOaHauRK885S80CJigDYjdQoChmruB3D20HpFOfGBJFkiME
 Wv0d4WDQ/oMaziSI85hkzwfVLmhV4gh1R+0uA/5zLpmL+7U+ioWtJL419h15urfmgwu9TFvC
 8Sd0meNQHtunmMPXTM227p/oUNlxleZzad4m+BYFcBU5/5RTgg6Mpjcz+tgC9z1Rw3BYsyES
 FW4TdW8BzE+UNYxz8UJY0ZnFNWulgrD0DayA78Ji7yLA4Q58qDb33fvI8Zw0HTG1Kw6j1U8Q
 8tAKHeqibRi9wTLHY7Gj12Zl7q2daQbxCPC7mGDwneUvE5GXg99SrnKXXcCaUTIsdv54UXCT
 6SyCbQ9LwtO1dKCJrFWZd3uiFVKXu3sOMmNK162zjOqAhyIhb+QRInnYWMQ2GPaEkdSwC4J+
 nPTFgU6Ajbpg3/YA3Q6Nl/rZ1LM7O9xgHqgU1RyxAaPOR4yn4Gp8wIY0KTPA8gY2agJ7X9Jl
 g==
IronPort-Data: A9a23:JuOUkK798P7D4jg4tlh4fAxRtK7GchMFZxGqfqrLsTDasY5as4F+v
 mYZW27SbvncMDGgfNhzYI3i9xsDv8XWxoQyHlY5qyBkEysa+MHILOrCIxarNUt+DOWaFxs/s
 J92hvosjiwQZiWBzvt4GuW5xZVE/fjUAOC6U4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE0
 T/Ii5S31GKNglaYDEpFs8pvlzsy5JweiBtA1nQiaPZCukPplnV9JPrz8onqdxMU6qENdgKLb
 76rIIORpws1zD90Yj+RqYsXR2VRKlLk0ahivVINM0SqqkAqSiXfSc/XPtJEAatco23hc9ycV
 LyhHHF/IOskFvSkpQgTb/VXOyJQOYBK9aTIHXm6ku/Cz2KXbiXu5Oo7WSnaPaVAkgp2KV12s
 Nk0bQ5VN1aIgPiuxr+nDOB3m99LwMvDZdxF/Cs6i22GS695KXzAa/yiCdtw/zo0gtFuAPDRT
 8MCdCEpZxPFC/FKEg1LUs1gzb301hETdRVHo0+bo6YZpFSL7zVJ9b/EItuSSMWzEJA9ckGw4
 ziuE37CKgsdPtzcxSat8X+2gOLL2yThV+o6F6eq5+V4nFqdgG8UGhkRSkC4oLq1lma6WtRWM
 UtS/TAhxYA580qsVJrxQzW7rWSCsxpaXMBfe8U47wyJ4qjR+ECYCi4NU1ZpYdoqrsIpbTct2
 lKCmNXyGSZyu6HTQnWYsL6JxRu+NDYUJmIefyIJZRUK7sOlo4wpiB/LCNF5H8aditzzBCG1y
 iqP6SsznbMeieYP1r6n5hbGhTy2r5TERwJz4R/YNkqh7wVkdMusfJSl5FTz6fdbMJ3fSUuFt
 XIf3c+E44gmCZCLiTzIQ+gXGrytz+iKPSeaglN1GZQlsTO39BaLephd5jt7L29tM90YYnnuc
 kvasxgX44VcVEZGdocuPNj3UZ5skfemTIuNuu3oU+eiq6NZLGevlByCr2bNgwgBTGBEfXkDB
 Kqm
IronPort-HdrOrdr: A9a23:5/5A3KmcfxgJACfYCrLKQ8lJNZzpDfIQ3DAbv31ZSRFFG/Fxl6
 iV8MjzsiWE6gr5OUtQ/OxoV5PvfZqxz/RICOoqTNSftWvd2VdARbsKheDfKlXbaknDH4Vmup
 uIHZISNDWmZmIK6/oSmDPZLz92+qjhzEjt7t2utktQcQ==
X-Talos-CUID: 9a23:8yVBIWxme5HhLHLEcMZfBgUXNMQIfnDGw0vRJmybWGZGGaDLS3iPrfY=
X-Talos-MUID: 9a23:Z98sbQTzVXRE8wA/RXTzjyxsMstGpJj2K3k1tJIvqcjDBzVJbmI=
X-IronPort-Anti-Spam-Filtered: true
Received: from unknown (HELO TP-MD-V01.corpnet.asus) ([172.22.47.17])
  by ms.asus.com with ESMTP; 07 May 2024 17:21:18 +0800
Received: from localhost.localdomain (61.216.65.187) by TP-MD-V01.corpnet.asus
 (172.22.47.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.37; Tue, 7 May
 2024 17:21:17 +0800
From: Kelly Hung <KellyHung@asus.com>
To: <robh+dt@kernel.org>
Subject: [PATCH v8 0/2] Change email sender
Date: Tue, 7 May 2024 17:21:07 +0800
Message-ID: <20240507092109.6018-1-KellyHung@asus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [61.216.65.187]
X-ClientProxiedBy: APZA002EXB.corpnet.asus (172.22.6.14) To
 TP-MD-V01.corpnet.asus (172.22.47.17)
X-TM-SNTS-SMTP: 	B8F59B0ACED995AB7CCCBC55F8C33C843CCFBC001F1A9CBA46C9B128287EE92B2000:8
X-Mailman-Approved-At: Wed, 08 May 2024 10:34:05 +1000
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Kelly Hung <KellyHung@asus.com>, kelly_hung@asus.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, Allenyy_Hsu@asus.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Requesting assistance from ASUS IT, I obtained a new smtp account.
So send the patch again using new smtp account.

Kelly Hung (2):
  dt-bindings: arm: aspeed: add ASUS X4TF board
  ARM: dts: aspeed: x4tf: Add dts for asus x4tf project

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts  | 581 ++++++++++++++++++
 3 files changed, 583 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts

--
2.25.1

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
This email and any attachments to it contain confidential information and a=
re intended solely for the use of the individual to whom it is addressed. I=
f you are not the intended recipient or receive it accidentally, please imm=
ediately notify the sender by e-mail and delete the message and any attachm=
ents from your computer system, and destroy all hard copies. Please be advi=
sed that any unauthorized disclosure, copying, distribution or any action t=
aken or omitted in reliance on this, is illegal and prohibited. Any views o=
r opinions expressed are solely those of the author and do not represent th=
ose of ASUSTeK.

For pricing information, ASUS is only entitled to set a recommendation resa=
le price. All customers are free to set their own price as they wish.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
