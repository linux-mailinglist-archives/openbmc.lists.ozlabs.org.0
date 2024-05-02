Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 196778B9918
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2024 12:41:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=XBLWkNmf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVVpY1JXVz3cYJ
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2024 20:41:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=XBLWkNmf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VVVnw3x1zz3cW1
	for <openbmc@lists.ozlabs.org>; Thu,  2 May 2024 20:40:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1714646410; x=1715251210; i=j.neuschaefer@gmx.net;
	bh=n2e88QE5epBSVSFicZ+xqo5ic/O/WtKAyeT8qBcSr5U=;
	h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=XBLWkNmfCJ1LedKg3QzKOShdZwoK6kFYjyQw/5JCleg+m/Gjyccbsf6m5QDis+k3
	 O+4SPBRi7Iug7uD6urGq49hnCnmmdCs31cgjhoWPS25aA7/v4GEaF3BRN7k0DWtn+
	 uqyR3c5esbjjICJewjr7m+RH8akfkXXKRUeTk0ZxJv42irC2RsoDzTCjVtnTWvchF
	 Kizs2Dd1Z0zUs+MgcHu52zY3WfHFmhcp0C7AJWsBPGNybVObj+Ca/cL6VZU1R55qZ
	 p/1RemQ6Jd+U4Z/1H0+OysAXQCC0IS+XW6g9I2KvGDFRD03IZek87QaqmAxVGguZ8
	 YaICM0tgtth2wcK7vg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.1.59.78]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIwzA-1sLedM12Lq-00LJxi; Thu, 02
 May 2024 12:40:10 +0200
From: =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Date: Thu, 02 May 2024 12:40:01 +0200
Subject: [PATCH v12 2/6] clk: Introduce
 devm_clk_hw_register_divider_table_parent_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20240502-wpcm-clk-v12-2-1d065d58df07@gmx.net>
References: <20240502-wpcm-clk-v12-0-1d065d58df07@gmx.net>
In-Reply-To: <20240502-wpcm-clk-v12-0-1d065d58df07@gmx.net>
To: openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714646407; l=1760;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=VjLniaHS+bKcYFjCZNozqsTADYqMusOVNK5lpprhRBg=;
 b=sX4JaPRF9uqkZaXe/H1tOsITjWEPOfX/cwh/WwBgOmdfDzoHO0R2RxVm1FhomjMVU8eItiw57
 TLL9wD7ORzjBP1MKzRgE1q4qCvMKspuYEz8Rmmb1TruJORjL9UNGrzD
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:+DtwGYQjt2x8GVjHjT0VdQrQ5fiyA2Cpx2yeh9o2vTCRIYKNWoU
 OJ62sDPJ3xaCTsmcqVyLNjeHcft6kh70vSEzkYGZMED6eI9Mz4FHzqDLzhWVJAk0JTbDv6w
 jp5yVlw/MiWWmdhY7Af9U5GnOegLYn4JEBN5X71PXHNytZs7tHQ8COnZvnpUOptn5EP4ty8
 rxFlstpwa0tybgy5hjOzw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:czppJQZDsyY=;SpRHVuFG/OdBmW0gPVgXKhqSBVm
 YV0f5C289zEt29eERNBiaRHOsFpIj9KKOACl5VF2fZ/rYfd+JdS/xbZdkED2eGeIElq9xIi4J
 /sLh5tNaYBPvdSVYxzoOxVjQKu8gPeLpxxwS6fJS5HtIsXkTTibRrwRlWi2ObhoQNPZkX4kcZ
 8/VznYrGJixio/PJTyLxHB3ziFnhEFpQPUSQwPf1hyh+DJptEGzcn9kq2yGhD+0lvJ9MFwLNA
 TrKORAVJb22FzCR0ySckD01/63k5WW9zYCbzqNMOQHmssGuAWvRiBI/vdN+C5FR6c66v9YzGq
 Ll3Vj0yT/f9v9JioU3zGRZZ/oCetZbi2hiXVPaY2bZVTgWYK0horYBwpH2ekbVb1w17cT6Z5r
 Jf+tGIHqphyhvnmr4nA/2/4U10PqkfLZQPzCPV+IgXmib3D4maloXooUTd1Lflsdsy8h07qlr
 56fYoI8PKWea1Z38iucmfzaRCPhU7wv2Qk+Mb9Wk4c8N0SfA+zoZhes++qNAdrNmEa2iXDu1f
 Th5QMhX5XwDzxkW9g6s6FwEqvjy7VoGEtXf+WmnuyZQ9UW50aZ/B64WpQACoT5BBRQfKNdoOm
 AB7d040y4Cwn8+mu4Ron1IuU59qhQNltazJwJAIJWxP/dQkgX+mUzvQueQiIXmX9zthktzy4I
 wsF4XUVJPGmU+SXsQxsMRYJlfiT0sxP2G4Jc4XuLzszN28pejtWYjcC/gfi8Q5QWrw4qo21oS
 VIhpKFQomIbcjuECA/afO5g0SE6PX/i4I02TNJ4CsisT6+7F9/m9X46mxrAHABgQwUIeI/faD
 SXpzTkZnmBpAR4yUtTI4YvOSSIpuT7se3CDE4LL0JuJro=
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

Introduce the devm pendant to clk_hw_register_divider_table_parent_data.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 include/linux/clk-provider.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 4a537260f6557d..5d537d0776a11f 100644
=2D-- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -932,6 +932,28 @@ struct clk *clk_register_divider_table(struct device =
*dev, const char *name,
 				       (width), (clk_divider_flags), (table), \
 				       (lock))

+/**
+ * devm_clk_hw_register_divider_table_parent_data - register a table base=
d divider clock
+ * with the clock framework (devres variant)
+ * @dev: device registering this clock
+ * @name: name of this clock
+ * @parent_data: parent clk data
+ * @flags: framework-specific flags
+ * @reg: register address to adjust divider
+ * @shift: number of bits to shift the bitfield
+ * @width: width of the bitfield
+ * @clk_divider_flags: divider-specific flags for this clock
+ * @table: array of divider/value pairs ending with a div set to 0
+ * @lock: shared register lock for this clock
+ */
+#define devm_clk_hw_register_divider_table_parent_data(dev, name, parent_=
data, flags,   \
+						       reg, shift, width,               \
+						       clk_divider_flags, table, lock)  \
+	__devm_clk_hw_register_divider((dev), NULL, (name), NULL,               =
        \
+				       NULL, (parent_data), (flags), (reg), (shift),    \
+				       (width), (clk_divider_flags), (table),           \
+				       (lock))
+
 void clk_unregister_divider(struct clk *clk);
 void clk_hw_unregister_divider(struct clk_hw *hw);


=2D-
2.43.0

