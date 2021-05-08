Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF488377171
	for <lists+openbmc@lfdr.de>; Sat,  8 May 2021 13:34:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fclb16cTQz3bvV
	for <lists+openbmc@lfdr.de>; Sat,  8 May 2021 21:34:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=gfcDGTLq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=gfcDGTLq; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FclZf5WTqz308D
 for <openbmc@lists.ozlabs.org>; Sat,  8 May 2021 21:34:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1620473634;
 bh=yjwGGl/zXrCMTYrbrC8+EDsU3PDJjMfbSr5bOfa/aUs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=gfcDGTLqH3UCeLP+S3GOVF29duDBm+2SDB99bPxbPurHTIZHiroO4i8TEnA3JsyRy
 t6b9aQbedOsgOH1o+a5XMOOdaZ1fQE63cZH6a7ww7T8J0hWxXfDMj5SqzYMdzLWCzD
 TbYYaCKnPMZT2jgyRW/dFEDR+93dQamCFeLc1DDI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.126]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1Obb-1lYVVB21Sl-012mdI; Sat, 08
 May 2021 13:33:54 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] MAINTAINERS: Nuvoton NPCM: Add myself as reviewer
Date: Sat,  8 May 2021 13:33:42 +0200
Message-Id: <20210508113342.94457-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xLX2yTtE7abk1R7iXLdEZMFtMYhhVRIWGEg/Vj3E2nmwZpZ1z7y
 u66rYrr3YqalW21cR34Xl/RSYAj7p1d7igxQ+nz67NiQIXcjBmkvNYQwbl+AnwnOKqUpFPE
 Rcpd++5QeRpXUiRbcuOMx0ZMG/UBfcQgOBCcOkyoNIgRYOn8rib3ldUxVoTtbhG3BYoP28K
 QvmcAHTdEPKr4smh5Q1GQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3fQgF26cF/c=:JXq4DYe5tCORfk5c2rBx5w
 1U5BcnwhuHmCDmRSxBesN5/l2UMjSZUB0pTS9xiEgFDmvA4yuzrQau8+LSr/5rwr+so9XzDPG
 WrKnWsvh7dKyYBzkJqxY92Gai2RmIVKDixknWAHkPcJIDw3yg5fu3v0/cmqvJedWCywof0gtJ
 8ZtqDXmq8HZ/yINZlHCQb8fnBJvXhK4Ud5UZOHqc+lxeNjYebyr2jF4+UEI5yzZcui0C+8DW6
 WeTRK/j5eEA3Fsc+956TWkq92UpkI7DYb3yTomt/R2pTCEmIciucTJUY4jseGRW+1bKMdWL4I
 2lVufeMjipknpqSwFSl2cv1X1VYIVN195hQZ+J73LH/u87EK8MpMt61UbtI3Q3R3wBaCgiSni
 ZoQgLaBvXgTYrRoOq3PAeCJswY3PcsodFMiqxQ2xExk7SSuDcpTX6brVH5aLo0j8sD8svN1cz
 pAovO8CCwnchKfa6eHcO7iX/avqxQGYsG37NWOuL3018Jv7cfQQyXmRt/L6l4PtVY1A4rxxJN
 36dE6UmzHHMhuPM7P9zKXEZWycuZoRtQM/MqPkrS+97tG/K4fmgvd0uSJwupOE45IPiA8xwDY
 prCxFWJGs5slZ7Gu1XhTUsi64XWxkHqYQwASKpE+p4CvfZ/eF1uCvXmKJjxuPb7z2jSng61Yd
 tg+V5nmXs3DwBttHZ+wu8o0D0MlGMZiWYK5PJJrQCngVnN6xDHLHY+2EtUZCzTpiz8wbemS9W
 /X8MmZrfA2KuyuA+1F5Y8JqGluvk2zO2M53Jyaka490DAW1R9Pcwnjr0McR+bpJQ5TQbPy4Vg
 mLDPBP/S6kzOPHSohf03ohI0qmumEH1VNZvCTUxamAk5uQOHK7mIhOrc2O4AsqyNYx2JnJCf6
 J0x2De+u1Dlxk4DHXNQn+FBbPDczbLFWtRJ/oA4E6aAiIs0GqYdS64eCMxt6VHzdmhjL9WprY
 zbvCA0VEZ3V43mRsvRlGrTCNtSz+pPThXWE8bmDq+4GQX5q0pc2yw5yagrYzwGMVd8GdtuDFE
 lZHa15swFRLo1bjyLbpNiLmqHnuYzwBB29ITbZMAL+71FB4ymYqx3axnrwhSLdM0fd8AQXYVs
 4CWX2JDmv+liF+q4Wb7L9Rmq4bWjUJrWtdDewxMHsi1G1pWnGNJl1SLKBwbcr1jW1mlh9rrA0
 abYR/wMZ+INXWdjww6Hk/1eICf2bpW35naxtTqJjeTTrIe3evO43HcwOCmhKdvN5/rBfuGqe1
 0QxVdj9DkVcCZMXmW
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
Cc: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Nuvoton NPCM7xx SoCs share a lot of the hardware design with Nuvoton
WPCM450. I'm adding myself as a reviewer, so I don't miss patches that
affect both NPCM7xx and WPCM450.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 661770e8e6fc1..78f9df2b6cd20 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2184,6 +2184,7 @@ M:	Tali Perry <tali.perry1@gmail.com>
 R:	Patrick Venture <venture@google.com>
 R:	Nancy Yuen <yuenn@google.com>
 R:	Benjamin Fair <benjaminfair@google.com>
+R:	Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
 L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/*/*/*npcm*
=2D-
2.30.2

