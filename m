Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BD9929A15
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2024 00:43:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=M16xJrhm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WHMjH1nhcz3dWK
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2024 08:43:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=M16xJrhm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WHMb62mfgz30Wq
	for <openbmc@lists.ozlabs.org>; Mon,  8 Jul 2024 08:37:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1720391851; x=1720996651; i=j.neuschaefer@gmx.net;
	bh=mi0PezsKxlt4YHnZxxM0jZD6ggEqlUX2jNwgc7Ancas=;
	h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=M16xJrhmAcM9WZKw2+gndFWN8Fmm6KddUUs45Ds0sNXnZNLQgxkv4BQFEoDiHwfD
	 /ygwTXRNxZWvzK2q0oa6/NFBPY6sgpk3idMj88NrrcuqKVH+PaVUIPLWwAj6kpMzD
	 aZyxLm6m+I+TKuu1oL3I/ajLTXVdvvlh0jB4OO14r/MGctIyGAy4JUhkl3FD3gKKK
	 SVA0JEdO+YAFGtU+xdjBEVVP4nZUwg9ERPHVHErp+UE7n6LTr/qFpK61Vez1fFLI3
	 MkXEMj3vSsBskpsIEXQWoW8thOOgkfkYNfpUfMFi/XLW3kBoHNbZtaKemhKh/FkxK
	 v4sp3YvmZ92USy9//w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.161]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVeI2-1ssC4N1hRs-00R9Kf; Mon, 08
 Jul 2024 00:37:31 +0200
From: =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Date: Mon, 08 Jul 2024 00:37:16 +0200
Subject: [PATCH RESEND v12 3/6] clk: provider: Address documentation
 pitfall in struct clk_parent_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20240708-wpcm-clk-v12-3-1afac539c37d@gmx.net>
References: <20240708-wpcm-clk-v12-0-1afac539c37d@gmx.net>
In-Reply-To: <20240708-wpcm-clk-v12-0-1afac539c37d@gmx.net>
To: openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720391846; l=1209;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=1uiYw4A/lLLh/mTtdxttn1wy5i6b5KyOE0h65+zswio=;
 b=SoPHDFAoOK/kLuq+yWRUtieGEfwTb95/pAmzeW9Um6JRqHEspAR/tqeWlNH3wGdHRxmngwikn
 kuAlaTSN9/DBuxNWZQ2OjnIXZeTRu09kvz2dA1q/lgeMjn0akQoHK6w
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:rr3gzaxoTF4B6FifwJso/858vBXoLg/bHDfpgjv7fOrjouocjVU
 5lbQUMs96Tgf+iKbc3BibhvSmAD9sgQgqo1ZtxA5upI5vPzQH/d9V9DnIXK7qY4B7FqiIIm
 Fh2VnZuW4dpi0SfYTriH8ktpWUanNEbwLojyCcGxaxZRkYm7I/5xIsAB/tj39MykNd4x7Br
 YaSl2FPXSfGP3ti99fcMg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BldRFGiEc3M=;Pki+aikhIANvKonFR9z2VgwjHgq
 Bjsr+Xo5t4wtZcu3jBhNNQBcDyj3zqrQVML5i9FbITqaHG5Fo5JIm60wRXuhHTUYFxfjLHroj
 7GM5LjQBB0PmFwpGmOirUiYr7kS43lZAYWLsgLjK9kNBNeHe1yjNm4WBV3UaFeWmICRB5jv2W
 z9bjKqUr/mq2Ev718p9BJf1NA0lHSaFzbem9lQBdwUkWKvp/1QEUXuILH/gw5JiFTzZxcf4aE
 pPsdwUEJOzD7yw1w56NTs9C31heL9zehNm7a11f8g/JT3u1ggqUJkus8vIi0KEpmdeKx+4aS8
 OVKoBcJh4P0lII4b8prxUCVPqil9Ty9y7BMIXi8RiuC4KwOIJXkW/BvbBMIwtTH0mYOArAtGN
 A6ZkDsTHpv+Mt5nDrM3pNo3YYiVvoFPLRz4goMT5FSQB3UVL5xFRYTOP3M8JDTppeNtMP6FKI
 kPXheRPk8am2n9R6eDb26nYfDpWPpjXRqjxipvJXGgvjEiW4AnrXyLknVNue5X7WMlqAJome6
 zLnQAYOKY213n+pE3Wi8uY+ZbfVA7cBF4TOucbcwnO8UBGdlnwmYpeEL4oPAeNUKWVCsGgB+o
 ReGRrjdwp1UxTZlhWqOjwnzeXWKsxbWZDj3YsFFkX4/2bR5l1OrqCSnLnCe7KX3p4Jeo9ftJE
 KS0L+RloKFPRXugLbsUy3yMPNjsZJN9NNGwkEgJmrhlPF4Y6dvtVSOUTYM7mjhencl1zQP56U
 e1pfZeImzg2EI3kLcOJOO/1m1Zdn6N7j/0kiJsmxZZQEIDSWgUYIgBsubb73FYDaCTkkJSb6A
 /+F5ixpS3hvwtX9YY8HHpf/EaERpiTCfeGDifpxRuoShc=
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Joel Stanley <joel@jms.id.au>, Philipp Zabel <p.zabel@pengutronix.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

For some reason, I understood the description of .index to mean an index
into the list of clocks defined by the provider itself. This is not the
case, and it caused me much confusion.

Let's be a bit more explicit for those who read the documentation after me=
.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 include/linux/clk-provider.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 5d537d0776a11f..88bdada390c772 100644
=2D-- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -273,7 +273,9 @@ struct clk_ops {
  * @hw: parent clk_hw pointer (used for clk providers with internal clks)
  * @fw_name: parent name local to provider registering clk
  * @name: globally unique parent name (used as a fallback)
- * @index: parent index local to provider registering clk (if @fw_name ab=
sent)
+ * @index: parent index local to provider registering clk (if @fw_name ab=
sent).
+ *         Note that this is not an index into the provider's own clocks =
but
+ *         into its list of parents!
  */
 struct clk_parent_data {
 	const struct clk_hw	*hw;

=2D-
2.43.0

