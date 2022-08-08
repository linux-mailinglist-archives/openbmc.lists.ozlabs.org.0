Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1741B58D004
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 00:09:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1r2n0gzqz3bXZ
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 08:09:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm2 header.b=HIPjQlwI;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=XYxclB/h;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pjd.dev (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com; envelope-from=peter@pjd.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm2 header.b=HIPjQlwI;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=XYxclB/h;
	dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1r2L0rkmz2xGv
	for <openbmc@lists.ozlabs.org>; Tue,  9 Aug 2022 08:08:57 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.nyi.internal (Postfix) with ESMTP id 118865815F5;
	Mon,  8 Aug 2022 18:08:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 08 Aug 2022 18:08:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
	:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1659996536; x=1660000136; bh=MV
	df/JbMe5sUTgfiEhIdPbqrqYx3GM1FZV8oD5XHr/U=; b=HIPjQlwIjCFlOGi0W5
	XMiPGGtAhohUWUQCXSGGFrXPI8GiTySBpvnYU/IlXZhaL9gf0W/Rk8p/GsDhXa2Z
	DFdmqwI1AdOiBj5n/smoG2Y1qWF1roQDeNZe1j9wMH3W4ODKQBj5DWpl6e60Ab+r
	bCHem97ca1Jc/Xp3/JJiMuNBwhoxrmtPXQ7nXkXnN3KtITL2+qJEl/PWyLyoPjN9
	+KnvQ4F8geB7oCIOZ6GkXvReo9VvC/3HGjxmBJ7P5PqIvxt3sfYSoK/TbQN+jxtN
	XUVh73ieFJCAIosBOlOAty8WPrwRxTMGBKUQ21RXfHbdXKeezprdPy0N4Pk2NmY4
	ktjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1659996536; x=1660000136; bh=MVdf/JbMe5sUT
	gfiEhIdPbqrqYx3GM1FZV8oD5XHr/U=; b=XYxclB/hpf2u/4Bo49Z8iLfVcajq6
	Z5UD7kpI2w173BHLB5c2T4t0IK3whgXhjSJ6mh5XcSp0R36qWS7oUhMjsUwvbT43
	V6T+mz2u0QVSZmDeFXmSLnjhdQq8PzUUO4sPSi95RyGNlm/iR29EyeaNrBDQPOyo
	sUy7VUnb0CS4q2esvFLn4XwhSZ05Wjl0KTFdgHtxhJPrSk4TkvbMTXC2OzcrnagA
	eCcGAb9yXYFCad8R9/8R6cvVerZaA7SNVojzK7Z4mHiyGRNscgWc/dzuFJMrxvKB
	EWFy4NadacGQhJo+814OFgUr3vNQk/4wh3J19KgxaQ/8vl/lB1odC7zpQ==
X-ME-Sender: <xms:d4nxYrVKfKIO16uqmz8607IYJahhDJeCqrzupehbyF8P8lBQM28Uzw>
    <xme:d4nxYjmJ3PZTUo1_UPKx3he1DQLvTrv5BW1BVqteu9gqHh3LqjBR4KbpcgNznYtUW
    h8KCngDPZl8Og752-4>
X-ME-Received: <xmr:d4nxYnb7GyW0yU_TBK30MXdyQENrnw7gsru0htFVLFFS0aFnZKSVFOXEPBlPZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefledgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
    dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgjfhgggfestdek
    redtredttdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrh
    esphhjugdruggvvheqnecuggftrfgrthhtvghrnhepteelgfeuleeffffffeekiefghfej
    uefgtdfgteeigeekvdefffevieekvdelteevnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:d4nxYmWBgVql-379smTo9RXOF-ew5xhwhu54FejYYPpLmEiXotuvZA>
    <xmx:d4nxYlmaxP6EWkFBGE0k4dFiUfdDI82gBwqukdVmE1wp0u9ZhifXcg>
    <xmx:d4nxYjdKVBVDlCx0CtzO1TTpcURkolQaEgXqYDs4ElJdpPkG7GOPYw>
    <xmx:d4nxYrgfkeLxwRmP4LDFsOOw6HIE1wFO0bewOTfuPpSTTwFGotZcOw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Aug 2022 18:08:55 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Subject: [PATCH 3/7] dt-bindings: trivial-devices: Add Infineon SLB9673 TPM
Date: Mon,  8 Aug 2022 15:08:35 -0700
Message-Id: <20220808220839.1006341-4-peter@pjd.dev>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808220839.1006341-1-peter@pjd.dev>
References: <20220808220839.1006341-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Alexander.Steffen@infineon.com, peter@pjd.dev, joel@jms.id.au, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Alexander Steffen <Alexander.Steffen@infineon.com>

Initial device to be supported by the upcoming tpm_tis_i2c driver. More
to be added later.

Signed-off-by: Alexander Steffen <Alexander.Steffen@infineon.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 1e4b3464d734..9c37f57de919 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -123,6 +123,8 @@ properties:
           - infineon,slb9635tt
             # Infineon SLB9645 I2C TPM (new protocol, max 400khz)
           - infineon,slb9645tt
+            # Infineon SLB9673 I2C TPM 2.0
+          - infineon,slb9673
             # Infineon TLV493D-A1B6 I2C 3D Magnetic Sensor
           - infineon,tlv493d-a1b6
             # Infineon Multi-phase Digital VR Controller xdpe12254
-- 
2.37.1

