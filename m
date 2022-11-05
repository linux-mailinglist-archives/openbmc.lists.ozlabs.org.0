Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE6D61DD84
	for <lists+openbmc@lfdr.de>; Sat,  5 Nov 2022 20:01:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N4RfQ3dM6z3cMh
	for <lists+openbmc@lfdr.de>; Sun,  6 Nov 2022 06:01:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=DH9p80zO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=DH9p80zO;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N4Rcl1j0Mz3cC5
	for <openbmc@lists.ozlabs.org>; Sun,  6 Nov 2022 05:59:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1667674764; bh=V4GXrGaQHm3pKTNYE49mNU284Y8Z/26NNgl/v5gp/Xk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DH9p80zOnQO7O2133KFhyH6bATFm/mowoCqO+1si3qQ2Ozf/OKu6yTILTGVEp/ErZ
	 wgR6jLXvRdi+tBEnOS/L8W8WrYJxNEP+vY7gO/TMVCBmfMl7MlHCG2KCDIxu65Fzia
	 IomHOQywxG4ksExKigd+xbM6NWq4L7EerAWJwM2dmDkwtrRH6s7nel/mFWfuZN+F0J
	 BgTiBC3EiQH6ZKGaKulz4N4LFDU9L6sV+fhkfazK0g4gkjJ6OTqRvSKnCf5LlfnqfH
	 ZDsbEhUTrw+2ReooXZVFB1kv7HbwYHFVTAknfajI539DMk/mUlSMN/1TBACVwIrQil
	 KwNqEMTnyfyKQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([87.78.44.193]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MysRk-1pCkjG0qzy-00vwp3; Sat, 05
 Nov 2022 19:59:24 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-spi@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 4/8] dt-bindings: mfd: syscon: Add nuvoton,wpcm450-shm
Date: Sat,  5 Nov 2022 19:59:07 +0100
Message-Id: <20221105185911.1547847-5-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221105185911.1547847-1-j.neuschaefer@gmx.net>
References: <20221105185911.1547847-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XooQiqVVZh/n9MhWx2shMMIRTpxqDE+qHgQ0zij3Pxan6E+iOFd
 onv+cowItr0XS/P5Dt/9XOhHTSwGBwUUgVDxC0NXg+PbKfKDjXtojVIiQZaiDrDcFubJetD
 D47zRFWoS+AeOTxi++yGMkrdTJ8w034AGU+nBpacci70jWcKuWoDumY8mNkW3SBJcw67J0b
 tBzqNGFDTCnS3xdpIRgWQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SAMvsW5d1p0=;YDbGzosJ1GuA93A0FnmAXh011rQ
 fKekKhUXNqbp5PMBw6bGKZ65UAKEdOy+Do3OCMie+L9Pu5cy2uPSod+Bp0/tZBYiLMyTmKVet
 8CPcwW0aw/aZkP3AL/0QD/n5z6pwrfENwnszFpGMZ6XJWn3+2Q9z5r7mw2rz2WnaWSjhTIzk+
 V2zA33ULmW474odP/+S3uhJOmoscHdgRaiqE/aRan1Yfd/bYmQl1BQYr+g3m4LxVpnD941hno
 jkndRaSVSZHDA1wuXdCIYcR+t3nwKLAgE0PFGT7dSHgyRwt+na7peQIkD0GqMGHz6q1BL2mZW
 qpDTxkBE5shMCSRiI62/Gk1soATJbhWQlJ11uBz3lsv69XS6jlLXVBOTke7EHeaXeRDxG/MzM
 BN4Fhxq9Aqd1WCmWmlCcjxNt17bIvuOddZZO1HEWzHdmxnF9SEwA+UPISNWISyAh9OLnN75lq
 f+lg2BEe/Jpatnb5iwodTb0pGz+K9QjpepHmj3fNQXIKNNeQ2Ef44djwveWjIxeq7Xa9gkoaU
 +R3uiukppWxiH07P4BOM+7quDfWs0b4R9v/jF544IpS2pawc2qbqUaAox83jqszDCLepnB7oT
 yk8XabJ4uIKWIiQTBgS+qUozJrN+orhz+ei508zkxUdypu2kpfoGYXJqPwqLMB5YlNQ8IsyUE
 B6nbHHfh3IsFI2wUOxAcYROuisjyPnwTxr1EFQoeVNZOFI16fUT2Bmw6btcqzPXIiQ5yZOvPR
 eMOlXJiEJDoE1elwPkM8AF0Y4W8bCZYQGmtV8nlZIpZYfJhqCxRDNUZE0O0FzPSAiowz6AtIH
 77t7v/YLfzFz5sUxBYHvVwwVSxaKrVHfhxBcso34ggfW8KHrrQaTxuGTUpnUFuWVcfDWA5mFi
 3Tj8O6h0M1TuD3148R8t4UzTmYxVtnSWFZPio2sgIL/F9nu+LYB70BrqnzGnfKVnKMR5o9/bC
 rHQyvQKItWKcRfQQvQABLiVLcI4=
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
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Shared Memory interface (SHM) is a piece of hardware in Nuvoton BMCs
that allows a host processor (connected via LPC) to access flash and RAM
that belong to the BMC. The SHM includes a register block accessible from
the BMC side.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documenta=
tion/devicetree/bindings/mfd/syscon.yaml
index 4e4baf53796de..1b01bd0104316 100644
=2D-- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -53,6 +53,7 @@ properties:
               - microchip,lan966x-cpu-syscon
               - microchip,sparx5-cpu-syscon
               - mstar,msc313-pmsleep
+              - nuvoton,wpcm450-shm
               - rockchip,px30-qos
               - rockchip,rk3036-qos
               - rockchip,rk3066-qos
=2D-
2.35.1

