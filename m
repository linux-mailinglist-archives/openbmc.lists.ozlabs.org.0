Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB61312686
	for <lists+openbmc@lfdr.de>; Sun,  7 Feb 2021 18:59:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DYcNg4j2szDwk9
	for <lists+openbmc@lfdr.de>; Mon,  8 Feb 2021 04:59:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d32;
 helo=mail-io1-xd32.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=oT0+jEMz; dkim-atps=neutral
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DYcMv1vmWzDwhg
 for <openbmc@lists.ozlabs.org>; Mon,  8 Feb 2021 04:58:26 +1100 (AEDT)
Received: by mail-io1-xd32.google.com with SMTP id n201so12643033iod.12
 for <openbmc@lists.ozlabs.org>; Sun, 07 Feb 2021 09:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=bTFbqDNGh0lY4DDg3pM2ZZG8MbMTdtdst9kY5eS3h/s=;
 b=oT0+jEMznyj9JKnmj3HbHm5yf/xmMfhonJnwHfzfmtsvbDWx7lKjMBzT9QvKavGXsv
 fqLtZG7kGTqLxMk9evSoktJUSJas4gQPeHmbnwh/mDHD1ex6u11q8bxzaVQx0oX+7kLF
 a+GDDQTEhTbr9h52VNkxL7KhrOtPcOXNCJffmaOe79BFcAidmupFDpzvyXhRWxIboUcs
 JTca5pTMCADQ82tcRzoM92I3BKQrzDmJl9hPMWswLRdcpprOZ09IUAQfhw9XTR33DE5i
 O8Sn2SDgcVJlBwUi75Mu8uLdhnibm5PfQU0TH8v6vLGThDjFEyLLSPSi+sj8bCACX8kw
 qq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=bTFbqDNGh0lY4DDg3pM2ZZG8MbMTdtdst9kY5eS3h/s=;
 b=pekUdXJnG50Zc7iFA2E393cdmxP/b6elqzMnQISzYPgejc7B8Vw3VFuBxlS5CHGus5
 iSu2CoWQlvmc7nxO1GBnhUjDrgvHsEY3t97ilWMOB67nVpLjjY9FdbcPE3IJprTkmnMn
 IcOgrzwFThOXAh2j9MCig7IvnXLVig3qWka90Oh2puqnhSN+M8mipj1z9mlZ2eqlqpJ6
 2u9HsjnpHI/Lwh4y2B+vdlOk1LH0PcL5km+Aa46mGWZs+AacqGJou1Ng0i+K5DZPUiKj
 lmeFcu7QbY2wbMzP5qqDJbhRk2Bq9kEqksvK7pZDED8ddIWVxgxoIlTVaV6oaDNa0BYW
 j8Ug==
X-Gm-Message-State: AOAM532hCwRPp8kg2V26Krm0jyPJtP61jekRFCuWWsKtSZeqkXbfymOM
 G40mRvV1dZMbk3os2FtosTWo+T+9a1PNC9+mwb59+9r6f8bGzA==
X-Google-Smtp-Source: ABdhPJzXLB9ixTsWn9c+my6SxEKNj1f10uiYF/tuCtYtGmLlpF7IPJIpddrn1R0pJDC6ZM7JoMXTUzvOq8G+q7pkRCw=
X-Received: by 2002:a05:6638:a1b:: with SMTP id
 27mr14228258jan.144.1612720701911; 
 Sun, 07 Feb 2021 09:58:21 -0800 (PST)
MIME-Version: 1.0
From: Anton Kachalov <rnouse@google.com>
Date: Sun, 7 Feb 2021 18:58:11 +0100
Message-ID: <CADVsX8_ua6nShjGQbK1nVqsn34+dArF69sCLcLt6U+0_zXj54w@mail.gmail.com>
Subject: [PATCH] ARM: dts: nuvoton: Fix flash layout
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000008f8f2605bac2ccac"
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

--0000000000008f8f2605bac2ccac
Content-Type: text/plain; charset="UTF-8"

This change satisfies OpenBMC requirements for flash layout.

Signed-off-by: Anton D. Kachalov <gmouse@google.com>
---
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 28 +++++++----------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
index bd1eb6ee380f..741c1fee8552 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
@@ -182,8 +182,8 @@ bbuboot2@80000 {
  reg = <0x0080000 0x80000>;
  read-only;
  };
- envparam@100000 {
- label = "env-param";
+ ubootenv@100000 {
+ label = "u-boot-env";
  reg = <0x0100000 0x40000>;
  read-only;
  };
@@ -195,25 +195,13 @@ kernel@200000 {
  label = "kernel";
  reg = <0x0200000 0x400000>;
  };
- rootfs@600000 {
- label = "rootfs";
- reg = <0x0600000 0x700000>;
+ rofs@780000 {
+ label = "rofs";
+ reg = <0x0780000 0x1680000>;
  };
- spare1@D00000 {
- label = "spare1";
- reg = <0x0D00000 0x200000>;
- };
- spare2@0F00000 {
- label = "spare2";
- reg = <0x0F00000 0x200000>;
- };
- spare3@1100000 {
- label = "spare3";
- reg = <0x1100000 0x200000>;
- };
- spare4@1300000 {
- label = "spare4";
- reg = <0x1300000 0x0>;
+ rwfs@1e00000 {
+ label = "rwfs";
+ reg = <0x1e00000 0x200000>;
  };
  };
  };
-- 
2.30.0.478.g8a0d178c01-goog

--0000000000008f8f2605bac2ccac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This change satisfies OpenBMC requirements for flash =
layout.<br><br>Signed-off-by: Anton D. Kachalov &lt;<a href=3D"mailto:gmous=
e@google.com">gmouse@google.com</a>&gt;<br>---<br>=C2=A0arch/arm/boot/dts/n=
uvoton-npcm750-evb.dts | 28 +++++++----------------<br>=C2=A01 file changed=
, 8 insertions(+), 20 deletions(-)<br><br>diff --git a/arch/arm/boot/dts/nu=
voton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts<br>index =
bd1eb6ee380f..741c1fee8552 100644<br>--- a/arch/arm/boot/dts/nuvoton-npcm75=
0-evb.dts<br>+++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts<br>@@ -182,8 +=
182,8 @@ bbuboot2@80000 {<br>=C2=A0				reg =3D &lt;0x0080000 0x80000&gt;;<b=
r>=C2=A0				read-only;<br>=C2=A0				};<br>-			envparam@100000 {<br>-				lab=
el =3D &quot;env-param&quot;;<br>+			ubootenv@100000 {<br>+				label =3D &q=
uot;u-boot-env&quot;;<br>=C2=A0				reg =3D &lt;0x0100000 0x40000&gt;;<br>=
=C2=A0				read-only;<br>=C2=A0				};<br>@@ -195,25 +195,13 @@ kernel@200000=
 {<br>=C2=A0				label =3D &quot;kernel&quot;;<br>=C2=A0				reg =3D &lt;0x02=
00000 0x400000&gt;;<br>=C2=A0				};<br>-			rootfs@600000 {<br>-				label =
=3D &quot;rootfs&quot;;<br>-				reg =3D &lt;0x0600000 0x700000&gt;;<br>+			=
rofs@780000 {<br>+				label =3D &quot;rofs&quot;;<br>+				reg =3D &lt;0x078=
0000 0x1680000&gt;;<br>=C2=A0				};<br>-			spare1@D00000 {<br>-				label =
=3D &quot;spare1&quot;;<br>-				reg =3D &lt;0x0D00000 0x200000&gt;;<br>-			=
	};<br>-			spare2@0F00000 {<br>-				label =3D &quot;spare2&quot;;<br>-				r=
eg =3D &lt;0x0F00000 0x200000&gt;;<br>-				};<br>-			spare3@1100000 {<br>-	=
			label =3D &quot;spare3&quot;;<br>-				reg =3D &lt;0x1100000 0x200000&gt;=
;<br>-				};<br>-			spare4@1300000 {<br>-				label =3D &quot;spare4&quot;;<=
br>-				reg =3D &lt;0x1300000 0x0&gt;;<br>+			rwfs@1e00000 {<br>+				label =
=3D &quot;rwfs&quot;;<br>+				reg =3D &lt;0x1e00000 0x200000&gt;;<br>=C2=A0=
			};<br>=C2=A0		};<br>=C2=A0	};<br>-- <br>2.30.0.478.g8a0d178c01-goog<br><=
br></div><div><br></div></div>

--0000000000008f8f2605bac2ccac--
