Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9A24FA90A
	for <lists+openbmc@lfdr.de>; Sat,  9 Apr 2022 16:33:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KbHg570pkz3bYy
	for <lists+openbmc@lfdr.de>; Sun, 10 Apr 2022 00:33:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=VYtBQJ4Z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=VYtBQJ4Z; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KbHfd2MFLz2ygC
 for <openbmc@lists.ozlabs.org>; Sun, 10 Apr 2022 00:33:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1649514793;
 bh=8hN+2AVbFXleT27mHGzC218qFEUyVtCqOPDIaAbNPX0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=VYtBQJ4ZBZgI2YKC51XQHYkbw2j5rDmErWTNFYKXbXO3ZXAYDGhXezPvSqnP7vQBm
 ZtzisTD6h/05mU9+ZLcvA5w+YxM7TBt9PfZYh/GB+FnnnAt92QMYsun3z/1EoEFmfH
 9V63dxMcGk+wfmBT2+kn+ueKToa68O2qYITDZlNs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([78.35.207.192]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MzQgC-1nqJDs3vvs-00vPuC; Sat, 09
 Apr 2022 16:33:12 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] ARM: dts: nuvoton: Add missing aliases for serial0/serial1
Date: Sat,  9 Apr 2022 16:33:09 +0200
Message-Id: <20220409143309.2446741-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iIZmxWytLTz+5+OF4HAMOkkSGGLVy/iwOE4rQF3lm0xhe1C8IgA
 mP/2HFSpfKUGUR5HhsLAbjIZhplUAPi3xtGMOOlq0HatVIJOvbG9ABGJvMkilaKnyPasI/7
 Ghe1SK+JUV6u5GPvWD3u5g1G90+y0CdRSy+vOo4nS5k1nm445bdDn0SIMsiVKxPzGx81iz0
 fr2CtmMkSgjsmn0LjdXKw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/LlXazknttE=:+z+MkVSa87IJ4Xv6hrvBc+
 Sfo0R2vSjFWmfRFwJq83Qn2u1D4+v5pdJAe8CTqPaHpJxXqJii2Ca44B32K7ue8N1xuk6dXw1
 CydANBAsinVCRybAcwh2jnUVS/RZzIobX6WJo6WrKDY3LG0EOnOoGmA/NYABpguF8UOe6P5id
 By3HCrUubrFBKW+3b2ElstNE4CP6bNZ6hhbWontQmWKIxNVyVGrKq4zwab+JlgpcQQrkNtcsb
 /PjjFXRLpeGd/nA9k/IDcez3LwtvXrXAmX5No1/aeiNuDBWxPXDMrKx4diInCBELPzJf2m7ax
 EN3GmdKm0go3Lai4KY3SIFFO7gia5SPj6QnByfFw9P4VKHYNwcjyDbo8w16RyoUQ+VzOETKdY
 ZTAPD7VpjDo2guXVbQfnC8E2se80rnqsGjPOHxHJDjkXZaAY0bWpIPxF9wOp0GJxJAPq9UA5S
 tZpsvpKL2Ls9r3hsv6UA/OTLbfwYDlr6t0DFPGmLDMsI6GoJ/XCH4KriMTeyb7zhnIEOAjNkZ
 utajzHMf6PqYPb26VTM01GfbZPX/yeTwghfA58lFxzt9z9LBf71SV5WbH5c/Wa0VOeGPwMFMF
 gHimbfn5Uwau+yGYIStS9L9pyQhsL0khyVcRf7cWR0CpHXdCU6VbLq42aniLCOjhLEYZVebC+
 spLR+kADqTfEU1xUgasT5WYUysfWXE0vJ+Uo5VTs33sqy4YFOd9uBo5fU7P+7AHz+HLQJJO6y
 elVYDJ2ATHZjZG8UoOI7P6uLNonpvp4MN5PLSBNgcHxwV307XpfUKKznKZx/EsIJSiHzlBjtt
 esNUShDyjdfTNbkZbPcH9a5kN5542jzZSmElaepeweP/MZcprOrXbkvNz91li0rk5RV2/eEJm
 L6zomOqUXTXNKF4XuaUVp0eENJCUlMppB3atjK69qXOj5LycR/C/zPSmwuJ18oB6hxky54GoW
 KRtms2U4strSZ6Kh6RR7q+cZwNnm53Gqmu0RTqV7A1Z8a6gcbl7//pFxvpcF6/ShY1eQJUMld
 u1zcpq4w+/R7TtoxCLnXH1zzvydWN4Tyj/x7JoSgCJxItyJoEI1HOedcBnypIOHHNWHXeAiFj
 gidGV207Ov6X3g=
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Without these, /chosen/stdout-path =3D "serial0:115200n8", as done in
nuvoton-wpcm450-supermicro-x9sci-ln4f.dts, does not work.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi b/arch/arm/boot/dts/nu=
voton-wpcm450.dtsi
index 93595850a4c3c..57943bf5aa4a9 100644
=2D-- a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
+++ b/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
@@ -17,6 +17,8 @@ aliases {
 		gpio5 =3D &gpio5;
 		gpio6 =3D &gpio6;
 		gpio7 =3D &gpio7;
+		serial0 =3D &serial0;
+		serial1 =3D &serial1;
 	};

 	cpus {
=2D-
2.35.1

