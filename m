Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D19B58D006
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 00:10:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1r4G01z3z2xr6
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 08:10:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm2 header.b=QiUBmHu0;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=f6oa3rTU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pjd.dev (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com; envelope-from=peter@pjd.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm2 header.b=QiUBmHu0;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=f6oa3rTU;
	dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1r2K3LTKz2xGK
	for <openbmc@lists.ozlabs.org>; Tue,  9 Aug 2022 08:08:55 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.nyi.internal (Postfix) with ESMTP id B327E5815F2;
	Mon,  8 Aug 2022 18:08:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 08 Aug 2022 18:08:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
	:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1659996530; x=1660000130; bh=Q3vCnxUlWJb/aB3bt0IFVGwIw
	SNE6NzBOerycodAhFc=; b=QiUBmHu0Tw4ncuBkTeFf9GDBci7MwU/qh4XFY1Im2
	S9ozLP/NNVBtjZp8XzGZf1JKbzUyjtNUuXa6vWZxLBTc5sSooVa4+ymC7+eNZyH5
	1ocX5eIq6hf97lXKBPh5nopbVCeYlY6DvaLpcKhKIBCbB1LZvEdYvePbfoDE73Vf
	eQtzixB6wf3B/tzt4+99dVLExJXKrURoxAwSWHf3bB3Ejb+Ndhhmi60QONQQz2mz
	BbTPdv7wYp8XEGLOhk7E8eVJ++BtqJ1Wp7+dwLEDg1q5D6gyGzmZ8x1YDKRAnSGQ
	PBE5zQK6E/8SqnsuEkkwnQ/Qzg5wkoywEVEmvbi1R9g6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1659996530; x=1660000130; bh=Q3vCnxUlWJb/aB3bt0IFVGwIwSNE6NzBOer
	ycodAhFc=; b=f6oa3rTUIALc2SAambDHYp2n/6nvo/LVUivcFW1d3hV/OaSik8U
	uDpH3e+tfNSfT1mosY4Gu9qnFyUwqiFU65Ik7oIoxCWoOyGWZFaWUf9++TeqKdej
	101SEVDUDBBzm7QEeTEBN5SGN6/AHoMbSE0k8d3559B8s0Tbl3ZuqKoVFcHFtzWP
	aoWIsPyKCKzN8jDSc/NIqubkt+Dme1noycryIzF/1banFAD/+HiVKLC6g3VpbM3V
	Kl/gIkQ2Gwj5t/bASJdWckK0PCMdYt4gh8/xj6hqwNqOZFZcwpqP7zjlPOTUGkB5
	UuX+DBvyJVXfdDUmC4ehk4RVPDOh2bkbWyw==
X-ME-Sender: <xms:conxYtR9I2WTxqPmhIqzS2MN269TGLoT26Kay7tmTWwgZDPgDXA-VA>
    <xme:conxYmwnjxJS1QUr4xaT4yVUGR9QKzyOYsIoUoBakO0EFEyOvPDB4UzxpUoruPI68
    FWKX7B5KBgyrtsyCJk>
X-ME-Received: <xmr:conxYi0pT3tZ3hfxadJP_4UsQgHgUHTpICmcnMIpxdh0pn1wXqGT2omd-06P0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefledgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
    dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgggfestdekredt
    redttdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesph
    hjugdruggvvheqnecuggftrfgrthhtvghrnhepteellefgudelfeeikeejvddtieeiffek
    heekleekteehveffieejffeigeevkeehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvght
    vghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:conxYlBiEuCiLsVrH3I4De7bfCaaKaEIs6lzRsb7q3uumRxOZmGMng>
    <xmx:conxYmiAKyo5mOm2qkfTmdmkkPmRjzLBeu0AN6lNClEhZOdtpLwm9w>
    <xmx:conxYpq4qRoK-Yhu2xVqCAOqoDWfRw3wnrEUTP-xJ1Tp0xP7AbZpLQ>
    <xmx:conxYnvXchOdNFwigsXCoF-eAtPa5Sgqx9c92aTcNBmkJn0_R9fV8w>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Aug 2022 18:08:49 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Subject: [PATCH 0/7] tpm: Pull tpm_tis_phy_ops and tpm_tis_i2c updates
Date: Mon,  8 Aug 2022 15:08:32 -0700
Message-Id: <20220808220839.1006341-1-peter@pjd.dev>
X-Mailer: git-send-email 2.37.1
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

OpenBMC's Linux dev-5.15 has an old tpm_tis_i2c driver from Nuvoton, but
it was never merged upstreamed and produces compilation warnings now.

Infineon took that driver, modified it, and merged it upstream. Nuvoton
never merged theirs, so the first patch in this series reverts theirs.

Also, I included the "Remove read16, read32, write32" patch because
otherwise Alexander's patches don't apply cleanly. But, I could actually
resolve the merge conflicts. I figured it will be easier later to just
include more patches from upstream to make it clean.

I also noticed there was one follow-up change submitted by alibaba to
remove one line, so I included that.

Alexander didn't include the compatible strings from the old driver,
even though it should be compatible, so I've included a patch at the end
which fixes that. I did it as a separate patch so that we maintain a
patch series closer to what the upstream will be.

cc'ing Alexander on this thread too to see if he has any suggestions, or
thinks I missed anything.

I haven't cc'd the linux kernel mailing list aliases because I don't
think this is relevant to them. Only the patch including the compatible
strings will be relevant.

checkpath.pl warns agains MAINTAINERS, but I'm pretty sure it's fine.
The upstream MAINTAINERS file hasn't been updated with these changes, so
we probably don't need to do anything there.

This was a follow-up from the following OpenBMC mailing list thread:

https://lore.kernel.org/openbmc/20220725225151.393384-1-peter@pjd.dev/

Thanks,
Peter

Alexander Steffen (3):
  dt-bindings: trivial-devices: Add Infineon SLB9673 TPM
  tpm: Add tpm_tis_verify_crc to the tpm_tis_phy_ops protocol layer
  tpm: Add tpm_tis_i2c backend for tpm_tis_core

Johannes Holland (1):
  tpm: Remove read16/read32/write32 calls from tpm_tis_phy_ops

Peter Delevoryas (2):
  Revert "tpm: tpm_tis: Add tpm_tis_i2c driver"
  tpm_tis_i2c: Add old compatible strings back

Yang Li (1):
  tpm: fix platform_no_drv_owner.cocci warning

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 drivers/char/tpm/Kconfig                      |  24 +-
 drivers/char/tpm/tpm_tis.c                    |  67 ++-
 drivers/char/tpm/tpm_tis_core.c               |  14 +
 drivers/char/tpm/tpm_tis_core.h               |  68 ++-
 drivers/char/tpm/tpm_tis_i2c.c                | 431 ++++++++++++------
 drivers/char/tpm/tpm_tis_spi.h                |   4 -
 drivers/char/tpm/tpm_tis_spi_cr50.c           |   7 +-
 drivers/char/tpm/tpm_tis_spi_main.c           |  45 +-
 drivers/char/tpm/tpm_tis_synquacer.c          |  98 ++--
 10 files changed, 436 insertions(+), 324 deletions(-)

-- 
2.37.1

