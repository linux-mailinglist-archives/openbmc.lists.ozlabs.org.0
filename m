Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9D28B9942
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2024 12:45:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=cDDWlnqe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVVvG013xz3cfn
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2024 20:45:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=cDDWlnqe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VVVnw3zKJz3cW2
	for <openbmc@lists.ozlabs.org>; Thu,  2 May 2024 20:40:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1714646411; x=1715251211; i=j.neuschaefer@gmx.net;
	bh=mi0PezsKxlt4YHnZxxM0jZD6ggEqlUX2jNwgc7Ancas=;
	h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=cDDWlnqeeZFFzxvFuSEHECtppp8V3bO4d0UkuCq3A5b73duZ4OZldbbzH0h+ta5k
	 SbW2Kj7CgMwu+w4azimZSIEq+Vi06vhkqPKgIG8Pxw4nkEg2hHqrBa0bmIVAqrT8l
	 8S58133jSf5PKlaJR5E8BhZsdbiePGT29Yt1ZGs3pOrjegow9LXg3yiRqYGoQBxDd
	 V54n9fQAnvdgFuEySX5S++5GMwWQsYwmCbpcs91ZOFCGgAxyrrvWtT8Th23H8htXf
	 RWed7gP1ZhOCUJPbWZfE4olMjlj+HbHzpbZ4pA+QXcfWpGMtz9iw1/gkm3GmPgGhH
	 YiBS7YbZr2PrVjfOcQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.1.59.78]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvsEn-1stcLN3h0p-00sxJe; Thu, 02
 May 2024 12:40:10 +0200
From: =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Date: Thu, 02 May 2024 12:40:02 +0200
Subject: [PATCH v12 3/6] clk: provider: Address documentation pitfall in
 struct clk_parent_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20240502-wpcm-clk-v12-3-1d065d58df07@gmx.net>
References: <20240502-wpcm-clk-v12-0-1d065d58df07@gmx.net>
In-Reply-To: <20240502-wpcm-clk-v12-0-1d065d58df07@gmx.net>
To: openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714646407; l=1209;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=1uiYw4A/lLLh/mTtdxttn1wy5i6b5KyOE0h65+zswio=;
 b=q8eunMEY8w2HoF/7ikaMihIPI7LizlxmNI2AG/eDzXjlhl2U+uKHSEJT5Ym5KVbp87uTYyrJE
 AsUnl9akjWMChwF/fhXANkLvLIj7hWB8pZfRegYAJxtuh1LWZmKKMIZ
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:3o8FPKXfGjyk93wzOJ3/PA3/k/PDZ5csIAPUA7P5cEj1cE6h3Ft
 O8DBykUoXJLl5+vki/ykwSOk338sas9GAaDAp4a/4AVcQUSRxU2aGDTxXoc6Ui84Zc3kiNt
 NJfqgol6F557lCLuXn9wGKWqMZbYiuAPIsvZtz+vMfWByLLri5v9NKzn1qEpZjvA0ICVrna
 BlJyDfttl367Tv7+wr7Wg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rtAsOuEidkw=;ZNWcbyZHMyEKVXpZBIBuhL/i8/B
 e95tM5/mT/kG6qejGhOA9k8j4QINJtxDZf9bFnWv12BUJjIkcI3D+HdZGDbmAXLGFUqOByZuK
 trU+p1lm1TyWfZ6WSzUyM43lnvOJE4BTEuHqGqq7dMwotwRpE6EItROCIykUvm6/8Qpyvkbck
 6XLsFjPlEYtadw1g44uWWI0MXsROdRY7mEzzu2byQ8V1zq2YuPDWWMRj2p6khcMHtttkmsLp3
 G5jvBGtzpGuEsPIeam4CevcY1cHnzqpBhBoggZZlFnXCuUI8b1CCnnHHgOvYTbkVUT9ex+j1T
 jVdiGH5iKEr1GKQ7C2gimWr/Vnny84wkgLxOlE7cJKu/innA3po25mf1uRQi1BLEo26D3BfvB
 elPPat1dqFTf3BcSlZdXdV3qWMdaARZU3Q+7y8KUHc9d3iiyKNqAl6W+KAe697sbOxmFVxP5p
 YP8GAy5f3+CVMvDyxiLOGwl46mnXNmG3sF/k9qFrBNxVYNWVJzkYvvIz4hBMG+FaCpVkTJgJO
 PVGoN16Qu84/FrBPtpJF03gClgU4oJ+6wGAJtnYnhIkSxmE8SO1NGM2zBikST3G9OpHjQ0JHA
 taEQN2XluwoYFiF+aDZGSUJRgiL8zWjJ+HM+aGlviWgKYVfiUD7nKLTM71MpZuTU5YJHwqpVR
 TYfiv9cd4Q43U2FlA+ENxUD3GYLQMzKafcLStVAx/Mf7XRwswxew69TpX/wyek7Huu8PXJ7yU
 LZ6d7pHahHwMLc8+lbnofYDw3CHu+m9zOTKccJJHwRG+vedJHF6r54a+hKpJJM0xqjUcjdw9l
 Oa/tjKX7wcS/SujMgT9JfzT+WEPMTIPVHuRZLK6ffOWsA=
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

