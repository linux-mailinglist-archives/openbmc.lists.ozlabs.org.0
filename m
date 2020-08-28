Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C6A25533B
	for <lists+openbmc@lfdr.de>; Fri, 28 Aug 2020 05:17:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bd4XB5hq3zDqMn
	for <lists+openbmc@lfdr.de>; Fri, 28 Aug 2020 13:17:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=aspeedtech.com
 (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
X-Greylist: delayed 1402 seconds by postgrey-1.36 at bilbo;
 Fri, 28 Aug 2020 13:16:31 AEST
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bd4WM2XDhzDqkg
 for <openbmc@lists.ozlabs.org>; Fri, 28 Aug 2020 13:16:31 +1000 (AEST)
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
 by twspam01.aspeedtech.com with ESMTP id 07S2Zph5067722
 for <openbmc@lists.ozlabs.org>; Fri, 28 Aug 2020 10:35:51 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 07S2ZaLC067624;
 Fri, 28 Aug 2020 10:35:36 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 28 Aug
 2020 10:52:54 +0800
Received: from TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7]) by
 TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7%12]) with mapi id
 15.00.1497.000; Fri, 28 Aug 2020 10:52:54 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: =?iso-2022-jp?B?GyRCRm5MbiVgJWslNyUoJWklNBsoQg==?= <1181052146@qq.com>,
 openbmc <openbmc@lists.ozlabs.org>
Subject: RE: XDMA engine for AST2400
Thread-Topic: XDMA engine for AST2400
Thread-Index: AQHWfOFG9IgKj1kx+kumz5G2raFA66lM0pUQ
Date: Fri, 28 Aug 2020 02:52:53 +0000
Message-ID: <23a6e0dde0144751b936877af5f049ef@TWMBX02.aspeed.com>
References: <tencent_6FC98F43C847A4FA599681BF8ABCC554C006@qq.com>
In-Reply-To: <tencent_6FC98F43C847A4FA599681BF8ABCC554C006@qq.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.2.87]
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 07S2ZaLC067624
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,=20
	AST2400 support xDMA, the different will be command format. It need to mod=
ify for AST2400.

From: openbmc <openbmc-bounces+ryan_chen=3Daspeedtech.com@lists.ozlabs.org>=
 On Behalf Of =1B$BFnLn=1B(B??????
Sent: Friday, August 28, 2020 10:13 AM
To: openbmc <openbmc@lists.ozlabs.org>
Subject: XDMA engine for AST2400

Greetings,

I am learning Openbmc with a AST2400 BMC. I am learning XDMA engine. I saw =
there is a driver in the linux kernel(/drivers/soc/aspeed/aspeed-xdma.c) fo=
r XDMA engine. But this driver's "of_match_table" only support AST2500 and =
AST2600.
Does AST2400 not support XDMA engine? But in the datasheet, the AST2400 has=
 a XDMA engine as with AST2500.
Can some one help me? Thanks!

Best Regards!
Liu Hongwei
