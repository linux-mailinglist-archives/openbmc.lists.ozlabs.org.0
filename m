Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E495F855B
	for <lists+openbmc@lfdr.de>; Sat,  8 Oct 2022 15:09:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ml59K15rCz3cS8
	for <lists+openbmc@lfdr.de>; Sun,  9 Oct 2022 00:09:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=GosGbCrv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=GosGbCrv;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ml58l4Mrkz2xvr
	for <openbmc@lists.ozlabs.org>; Sun,  9 Oct 2022 00:08:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1665234508;
	bh=sUJ7rGrDhsXyiLiiUOI9cGeDVhb61syNCQPU8vfJcWQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=GosGbCrvX5QT+MZy6sI9ivd71Ru6yotEaj5u8GsHB8FW7bMkNaXjI52y3uDjMeFxv
	 +Y4EyYxpExeGc9WEeA+dIgn3Jp7f3YciGikabUSsqPBaz3uGBSLjiJLRNhfwXRUbfP
	 NxL2fJlf0pzKSWIz1vAf5pFauX+QbDNGIh22we4s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from probook ([78.35.76.13]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkYc0-1pT6dm1nSg-00m0Il; Sat, 08
 Oct 2022 15:08:28 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v4] ARM: dts: nuvoton: wpcm450: Add missing aliases for serial0/serial1
Date: Sat,  8 Oct 2022 15:08:22 +0200
Message-Id: <20221008130822.1227104-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yq01Se6miRqCnyzl5NuCHJ5fjVBViQ3GCFFnp367xQNi6yKx1tf
 ejENkYCyaoIyezJUH3We2JvBqgKTB6hcI9OKBrMnQycn1Fg2h+ctNetgRF4MNgvA+1eq7y/
 HPZLCVs/y1p+GXIB5vwqhDjbt0vBJgNjD8NLbsyvmybkECkZIIPKLC0/oO5/Kz5xK5zopO0
 nqGKxMGUEPgxJWug5yIvg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oeket5Z0JLs=:Y6a/Z1Q9bovDN9yelseRtr
 PKdqn1dkME9rGjrmmTY3otCBVRAySK9eoGz4/v7frJRf9qrVv1UIuYjOYVF9vIrTjf/p8JRT5
 3my6e152POFG1pngk7tmYH1Timl3ISFiLoAl718UEliQlogzcf6V6PXp7Cyl/gU3Zfpp2J3PR
 IhrJ4M2NcncCg/ZaA9g7Fx6GmqsaIZ4a9z9w8RW+SyLXB0zZu4CikTsnN2oIg42GC0386PaPs
 e0Iv3WapYNZYSJbIjCkdrjLnrS5sxG0J/xITrkiNwNxKSXY/YB3spNx7XRK7n4TWrwhVZdKVj
 HPpbI7BEMOhksdhbUWjG0hecowtZvxUbKE6WS/aaJc9WROPfCSnhegpm0hi/mh6VWi+k+Fbq1
 sj5dJu+qhrcTv1gbpTQf/X+WVgj/nVM7qQ1+aori/9wjYD/DilUnHlqWTuNL9H1UqoNvFBZIR
 212rDqmq9SLkY/XgGEWAmNWKkmiiRUwt2HxfXCaWy1NPkP5ttwjykyMLIY4NdHBUlRcZXKGDh
 a8dWwu+5mO3D6e0uuK29lOc4XsIv8sMNwlyyvjmhhyzYhQkfbJ9Iq+bv66qOHTui4j8zLmjJu
 kY2IQpXsIhNocYOen2w9iDRa3xZSnFkB2OzdVvAB/h+tLF99+gnSDfOS0siovCmn782ZG/6zD
 8+/EhwZsUNYyx3a29Bv/qWKTdu4jjpFcrBKZ8hQ0tsGoa9i4HnYNj2yryW/bRh3SNBtmYC1Hf
 bdDaCe7B/qyfnUiLhcCswTPHRStC3vrV2jfYNFBubT6mmW1HFBjxbqCmimyNz/GFLfTWlw2mz
 WN5/TESeh8HePsvguWSc5MdBvt62WB847zztS6SDR/hgg8+PXZG1dM2UEjVHF78tNIrH2/egD
 Q2LuWxWSB9oaKwr6q1uUYomDj6rqcTGNFPl0hToH8AMqSE8KfRGDfdhnyO5L97ZIQxMLsImRW
 osyIdVbspiukkDpgTKI71RWVXKmIUXq+EdrUglYlvyvxwpVqNA6KCgJ6Isw0xI2s3Q6iHTU0Y
 NmxDn5dYp5mFstyMEZICrf19aevhKDUeczROPOCZfeD5dyAUlb0REZqagXf6cZfnwimIA1L7K
 PssLKNhT8jJGKN9SXoPZLXcb8vbhQyetqR08UQi6vAmE2NtQJllTTSIuaGE04FAeR+AKMVy5D
 /To1/2WgscWfP/ecY5WtBRa3AIVxO5Ci29KvqHL1YelIg2b/DLOFo/SohM2OSYY8Sp63PxCD4
 kcVJPFMi8U/Ga5exo28QZIvND+27p4tIc4VcO1oXbBd8qK8/fCidLDVF5xUBPbwCpdfVP4CCR
 6YEkyBpcLbZMv0L9/I/z4vRzUveKpYw3fNyckdEDGQrIdKpS3R/ZzTpYEBqBgxNKeBnNczE78
 Z4Wf59d+XScfF8BWqPLd6/iFU1/HLM8bpEU7duHWSIyUMCoKgh6TRysWYMvV8KKgYKldgSp5o
 1PkhYk7Rvd7uNz3H+4Pq4JcLBNyT4yQUzf0uoJxPHnpN9teCmy7Dj5keOGwG3eU99lOKSsKNG
 DLINR73fOGlzWX3bgIye5syVP3DVzh1ySPb4KCHSbU/wZ
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
Cc: devicetree@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Without these, /chosen/stdout-path =3D "serial0:115200n8" does not work.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
=2D--
v4:
- Add R-b tag

v3:
- Move serial aliases to board-specific file

v2:
- mention WPCM450 in the summary
=2D--
 arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts b=
/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
index 3ee61251a16d0..83363c578f53c 100644
=2D-- a/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
+++ b/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
@@ -15,6 +15,11 @@ / {
 	model =3D "Supermicro X9SCi-LN4F BMC";
 	compatible =3D "supermicro,x9sci-ln4f-bmc", "nuvoton,wpcm450";

+	aliases {
+		serial0 =3D &serial0;
+		serial1 =3D &serial1;
+	};
+
 	chosen {
 		stdout-path =3D "serial0:115200n8";
 	};
=2D-
2.35.1

