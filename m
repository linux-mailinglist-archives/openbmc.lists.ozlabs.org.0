Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE1A63BDEC
	for <lists+openbmc@lfdr.de>; Tue, 29 Nov 2022 11:25:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLz456zS8z3bT5
	for <lists+openbmc@lfdr.de>; Tue, 29 Nov 2022 21:25:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=WqPCkIiJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=WqPCkIiJ;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLz1V1Vlqz30RN
	for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2022 21:22:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1669717356; bh=MMa4AO2sLZOUO1ZQc5/iouT+dUCNR9+JoyIz9Fi7pcU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=WqPCkIiJP/IZKyV2Yb9zkuL5qt/lFO/oGo0PD1O8e7lU6IZkXTnEtNKd7lTQ47rT9
	 JkNUUGJG38ouiafaXahd9V78yBIf6aL9wrkE8oIwiZYL81tUc58YqkQpLJZgL6lPqa
	 ydk+CONlDoO4ANx8DW196//YueWLMARvzYYhcP/+ssNzMSySaZWw0xrDSZ34zT71nD
	 Aw5RGr64rW/+wxS9P6ndkHnUVjMMsmNKEgxrUI8+LhIe9euSpoGlp1BSeHyKm3WCo2
	 JhrXGNZbDtNEk1cIpaNVY/clQOi4X5a2HQrDBuxlmxNyBP45f0WsdhIR/n837t1ilM
	 DooVHza9gY7rQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([95.223.44.31]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNKhs-1pOcQ22Kba-00OnzX; Tue, 29
 Nov 2022 11:22:36 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-spi@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/2] nuvoton,wpcm450-fiu binding example fixes
Date: Tue, 29 Nov 2022 11:22:23 +0100
Message-Id: <20221129102225.3598044-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FiDZAdVgDwpknp8WvU7HBvgO8DkgRVuEb0Gpdheq9J8nULoSy0v
 bibH1XDidAcRaWDy67Wlg3JBdS4UHH55TbrRqJP5J1sNP1BnpkqIDlahjVVntK1FDckhFdi
 UeUlL1EB3g9rnNBMYredwfkGFVHnaDsYiorBcVUrXKJaDahHoNX2LU8wJtyJXqDdk6Vdrol
 N9vfFrx/URnuAIdjP5fww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qsYyjdY6MEI=;0ejfVFts21PTOpAao7mXCEz8Ch4
 l+4iG+o0n32gYWBxTOPJJNJXGenmBp76V931/iTJ94t6m5AO0fg34oxSsUVEKQI4J4tgJAhRT
 0ALq0thQ54bD2aWOfpyJMrRvz1S0wvChh4h4wFnmvcv68e723HBD8AiayTRS8OZXcaTOs8I2Q
 o+TKbonNEALZ2gElrNTf6ABpHI6ZVI5+NzwlX7aqI4Z7h7nqJFF82qYSlGyZvAMp+UrtLLNjF
 //+5kGi8qFxQxAb23GtFRty/oDJeCsHWD4berEE8XmauLC03MEflpwn6Rjt2M9zxeOdEM3o+T
 ICTSbx1i0YmwJGi+lBI2bYdd9e4f6Kmcs6G5rjXsujB4KhPe9g6Nl5KvK5xhsD4QUsI9lsOiy
 zYixI8JojvOMbnU6ZcfhVgcBiZvauYjMzfyLITRToaB9irVzKFQ2DvbGIeNbvW1wu6pNlr5NO
 zgSNVv80FqsUEuxrpnt7LUqNy4V8GttB7L4B+INv+99phvMZjLDRbLPdexhvzQzFaHKLy+6m+
 2bUXyiytC6QGn63r5pTlZ91bn5OfkFK7IkFr2gUTO6Ss1oCXXhtLhK0RfdQT0JIobQW+u03/h
 cWs30ovINjgapTqtb9eXZgOpKObNQNbInbjg7+/rNdUZAWHMkr5Mpd8CD5hE3dXN2tQ1yfd5y
 dha9oi9jZYubO0bxJAhwJR54LNXKyZHTq0Np7rliUTzyTg8PB+WOxNuoNHZ6Y3bQhg74sF837
 Ajg9rkA3hYAWzvz9m8C9cqRlA1yaQBt/M8+PJExB22e1+hyAA4bh+DmfFXZpt7++ayiw0UiEe
 o59d6WikYVmBaNzLtpGzHsbJGZ/ayd9tlRP/Ct05oyraLWGzamXiqrNqA9hErTkaaZAgygDc+
 sMs4enQWZNsdZsOKqBUeeEi0a0rmIlGtlAGzPnhJUNwDQv2e3r+s7cH17BqyrxBo9w1WdvcQ3
 +thpualLAMtPsyn9y2Ce5e6RkzM=
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

My recently merged nuvoton,wpcm450-fiu DT binding caused some
dt_binding_check issues in linux-next. This series attempts to fix them
before the breakage spreads any further.

Thanks to Rob Herring for running his dt_binding_check bot, and Conor
Dooley who notified me that the issue has reached linux-next.

v2:
- Some commit message improvements, as suggested by Krzysztof Kozlowski

Jonathan Neusch=C3=A4fer (2):
  spi: dt-bindings: nuvoton,wpcm450-fiu: Fix error in example (bogus
    include)
  spi: dt-bindings: nuvoton,wpcm450-fiu: Fix warning in example (missing
    reg property)

 .../devicetree/bindings/spi/nuvoton,wpcm450-fiu.yaml          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

=2D-
2.35.1

