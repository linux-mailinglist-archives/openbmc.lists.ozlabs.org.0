Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AE6342ECF
	for <lists+openbmc@lfdr.de>; Sat, 20 Mar 2021 19:19:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2pv96s5Cz300B
	for <lists+openbmc@lfdr.de>; Sun, 21 Mar 2021 05:19:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=FFNzXu/l;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=FFNzXu/l; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2ptk1spBz2yqD
 for <openbmc@lists.ozlabs.org>; Sun, 21 Mar 2021 05:19:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616264339;
 bh=xJcnBN1J6AwlpjL6XnhA7z8+cNAcOly79skhuWm8OhY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=FFNzXu/lKQD7uNanoz0O9twVKQTJwxKyuo6/9N99vWPjDHNKU+bN7G5Il+vxvRdEf
 PDdOvV44X//D1G5pfvK9DR7rxFOgh/mHyxMLmCd5yqqVQG0YowWfmIVShF7AyYUuuB
 NnURRESyWM96dOilGrv3c3owUQgcgK3xnCYYmN0I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M4JmT-1lNxIo0mPp-000I0x; Sat, 20
 Mar 2021 19:18:59 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 04/14] dt-bindings: serial: 8250: Add nuvoton,wpcm450-uart
Date: Sat, 20 Mar 2021 19:16:00 +0100
Message-Id: <20210320181610.680870-5-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210320181610.680870-1-j.neuschaefer@gmx.net>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QeUUPtlUqlVLexPlH4ILr9nkaoFgSKUdwwzFKXl0oCP26XDXJoB
 DZT8tcFDulDnnLdmw1d7tCs6PGKqSuCQSMgnh2cvmoiBdqz/wERwAJYIKkQ0nKLNhd2Yu0S
 X0z8jjeCCbGnx2HWmY5BBuQYNBFLP6Tk/OTiSpC6gSYqhrXhlO2iYW6NrFKZxJKbHlsU4jY
 rdpjWniS3lrV9xDbhaYFQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yfzjPC32jQA=:q1+WgT0XrgyFgnawBY3hbz
 iG9t8HwRMsoaIHLnjDoyEk0qAXvXgDOMLMEpdIbPFMxBKQUpJKfBImDA+/pQsGlEEv1AlcNEh
 /AMIQjFp+hFGcx4wp2MnaLEoQvGLAPUv9WEM+6ToRDL+VA0f0xa/XW1GXRQ5A/tkUXyxaqFBe
 aYt7Elo/PtxQKO8HXTkQ3G0JvTSUZewc7WeI/5SGuipOiBx9A/a335EEbbs3gK3W0RBouNF7V
 im15dhG/yoWWoIwpfsYDsVaU9/phEoYm2H6WmSAwejEgiyNmLIcT4aqwj9IiNZeWL2PVLjejV
 PaTkR37RyxJ+Vn3KJHtq9EFUsc58BxJepFkFWs6Svf1NPs+cBJpi4eoSw139q4vrXhNOp1z+e
 iqIyKnNK194uABp8eafjw6KgtIu91Du5Uxjw9e6X834/7HqLWJjRGWa8enW63CmoPA5DiR3vt
 jNslYKN52afaFxsnIhk7pojxtHvAxBqUpPgN3MMwpMjzAUVeCT0iqwg+jBkE2XAgzTiCauPZh
 KIgDIgRpTluYFOyV3e34SJ7GOeKP3q4AesZFAdfdNmGcNk1Iu/8Y51V+9LyggZzwQnP9U0COA
 b2M5U1DAzZ3lcco9tPk6DLwfM3dnO2scgSoRPuej9ys5fWCI3V8iAZnNGl3LVVCGky5uTkQfI
 ydyss1PIUu9knvlHbHlHPE+trsCZO0U/6gb7CuBysE96CWwB/phGspjTRgJanQXqf79oLGXW4
 clbqmTEijdH2XqGDvpx3FKdA/pwwlMZp1HaBORwyI4YjhYW/Zk8aj7QJ5SKKEgcgFJ4wHWmA3
 Nt01VaBtsMoeUhvay9xXsX5ZohVENE+YlrA30wArBGZQo5fnWrO2+YoD/L92l3qRfQhSt87BL
 XC7jYIqrMiorY2Pjstpw==
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
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add a compatible string for the UART inside the Nuvoton WPCM450 SoC.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 Documentation/devicetree/bindings/serial/8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Document=
ation/devicetree/bindings/serial/8250.yaml
index f54cae9ff7b28..c0e292cdaa6bc 100644
=2D-- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -55,6 +55,7 @@ properties:
       - const: aspeed,ast2500-vuart
       - const: intel,xscale-uart
       - const: mrvl,pxa-uart
+      - const: nuvoton,wpcm450-uart
       - const: nuvoton,npcm750-uart
       - const: nvidia,tegra20-uart
       - const: nxp,lpc3220-uart
=2D-
2.30.2

