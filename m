Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEE75456B6
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 23:49:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJyRQ10cPz3bs2
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 07:49:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=hDjstnzn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=hDjstnzn;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJyQz4xDkz3bph
	for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 07:48:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1654811322;
	bh=U7dqB8UZdHHYcktusZM81tIBeUrwtsptS8hwCJ84BSQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=hDjstnznxLfq8PyokZ8miSDWv11KasD/PgGoA6wBP/6nvp6p++vf/ch4i57RAz0nF
	 1WnZLBjnhoUh+kta+4z09+pfDJY6L87BcyO++TAFk9sB92Yl77akx+n7OFnRQ/y2HA
	 s5mEOIpKnP3kRBEjQS9t+8JOwH7c1hvBt3cuX6lo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([81.173.137.165]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLiCo-1oGwu22ba4-00Hd8L; Thu, 09
 Jun 2022 23:48:42 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2 RESEND] ARM: dts: wpcm450: Enable watchdog by default
Date: Thu,  9 Jun 2022 23:48:29 +0200
Message-Id: <20220609214830.127003-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:R413OIxSVSQYRw8jKEwpcm/ZgoQ1U2Jl5TG7MPAjVmUQU2DPnje
 CxiTcmbinj+EEOgd1ULAxSgrnBUUtZ5/rO7yzE91skR2/LUDQgOjmuj2Lyah5Fs3j79Aixa
 CKtXzG4gMSFRAyFgzzUJmnAlKe0wwv4Tc47p7Sa+uEVrrI3DNrypzZYivWFtxJ7jY4rxN4O
 9+ZC6YK4I3C1GgNnlWx1Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NEaxQCxCa38=:AoJWebXCsRpZnJW538RGg1
 SyY3EDWz1pzJON2su0Tdf2Uphqy8AbJd4feK3XD+gO+DD339i0hMThxlbd/o28MO03GAws6wX
 DQ79Tg8hFuAKFLg0k6WPSXzV508w8ANwjkIjjQKPVKDPNcnrfpGan+GX7kVhZ3Ya3ktWSU1nl
 +Fc0lh4PC3a3XWOA9aOEjjphIgHHRPyqBADciEf3u88Pu3HZ31kpNcmzXXAx8lTEbicvJdt7g
 Njk2zzC+miAo+B+0kfqpx5a2BZIRaIhijbzJEwDtk+O9dhMKTrUzRHpN/auIQimXYj00WvCwF
 OsTtaYUNMzpd8WQR48Jct1wph+S1EKpXH2KsOJAOV+JJDmEi2R8ozw23b2FWsalVbq9z4yEQO
 /F339q9NanuIfgG2+wRuZ/yv5Opd+m/48vYv0Gk9hFFoAyJT7fZezz5hMUOfeb2YAnkIu3oQ+
 o0wX7o4F/xymd9ucS7F8Zjmqz1gxo+nKugAtfogt12e4Qd6wEeOWPvLoGOcYgsaW6/GznmYdN
 pvbssJphONnDyZWjgwd3Fh98jZ0TE9iuGs7Cdst/vK+4Qv1HLnoZmAI8GRGu0Syf2vfxpLx40
 5+O8QMP6VdJhmopNo6l7u7eCUJrN4p7+OMf8hPtO+B6NQB0UF5O38NGQVPu4pLAN50I/hAF03
 cXIhZt0gelHy9dbHUsQTC16MILvQl6SrgvWBQDN25ICl0GcjMwXjo7d7+Am/KPY08tJVyLYf+
 7SyKLLEiRmC69hli8SoZCffrEOJgUrOW7W6nsQkcHaC2V7x3+csSxjl6N1mrzHuvlOd0jQiAx
 CQpr4+4cWFgm+RWmjlNfYSIZlyqg1QcHJEyiq69MTbftKEZQmlkKQLWVJ3Cn1TrEYLzGfH0vm
 NrPbjgcAT2lDuUr5oNWR2Rw/dhwzyqFHWQPwhzm0ogtf+8YY1j9c19H6ay7eemxqAqd4DJybP
 +zXJT292srIQ7Nfgh2HmeH2KmKKUv4r+keizUL2FQS6Y/Gat1ndpbeD5LpfKeTR7h0KMq5GwS
 uU4zBZADuE5Xrj09jjw/At2lvC1wFNMurJTBs1wyRbhAWO0xzX3Pm3+rtdY8/METy5ssoKrTe
 7tBpBtgtqVX7tda2Da5cysDaR3GwiL93uYm0Llumd3bDel66Ppd9ZQy1Q==
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The watchdog timer is always usable, regardless of board design, so
there is no point in marking the watchdog device as disabled-by-default
in nuvoton-wpcm450.dtsi.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Reviewed-by: Joel Stanley <joel@jms.id.au>
=2D--

v2:
- add Reviewed-by tag

v1:
- https://lore.kernel.org/lkml/20220128221054.2002911-1-j.neuschaefer@gmx.=
net/
=2D--
 arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts | 4 ----
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi                      | 1 -
 2 files changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts b=
/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
index 3ee61251a16d0..1ae7ae4804275 100644
=2D-- a/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
+++ b/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
@@ -77,7 +77,3 @@ &serial1 {
 	/* "Serial over LAN" port. Connected to ttyS2 of the host system. */
 	status =3D "okay";
 };
-
-&watchdog0 {
-	status =3D "okay";
-};
diff --git a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi b/arch/arm/boot/dts/nu=
voton-wpcm450.dtsi
index 57943bf5aa4a9..1c63ab14c4383 100644
=2D-- a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
+++ b/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
@@ -83,7 +83,6 @@ watchdog0: watchdog@b800101c {
 			interrupts =3D <1 IRQ_TYPE_LEVEL_HIGH>;
 			reg =3D <0xb800101c 0x4>;
 			clocks =3D <&clk24m>;
-			status =3D "disabled";
 		};

 		aic: interrupt-controller@b8002000 {
=2D-
2.35.1

