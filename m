Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D001E25460D
	for <lists+openbmc@lfdr.de>; Thu, 27 Aug 2020 15:38:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BckLy6Fj7zDqLw
	for <lists+openbmc@lfdr.de>; Thu, 27 Aug 2020 23:38:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=HmBqcziV; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=FIrcxpQM; 
 dkim-atps=neutral
X-Greylist: delayed 345 seconds by postgrey-1.36 at bilbo;
 Thu, 27 Aug 2020 23:36:32 AEST
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BckKF03YszDqCM
 for <openbmc@lists.ozlabs.org>; Thu, 27 Aug 2020 23:36:32 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 44E015C0312;
 Thu, 27 Aug 2020 09:30:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 27 Aug 2020 09:30:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=PMs+6LTNtp05O79NL5wgPPQNQk
 fO8KQcdfIeIrWUeMI=; b=HmBqcziVdNIP9orzBnrBVbM7RTgkgstaniNnBFXLMf
 mGMxyxBv8tMVrvFY8nlw5CHEnoSd3HhZGzAa9kPC2V9yD9zE1SrRBTp03ZCBl/PQ
 p9Z/kgSwY5mUqNIjEm1AdIfAR3vD9z4hjcWW+EqAcL7/0p90v0jiRKPSWpzqrNKv
 v4yUC+zqusXQcpxcZa+ge5T+8bygkgnbLuDCwNvQNqk4aMnGwy+lCfwqvU47DtRK
 yaa6iEeuQC5jhrN1lN4Ar8Y8nDPRaoKlfH4TgaXMTkXW/B9LXzLUm3at8zXUTRQF
 7tZ0xfm35ABT+LqZSBOeB6if4WkEqyRR40V8OWgNyePA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=PMs+6LTNtp05O79NL
 5wgPPQNQkfO8KQcdfIeIrWUeMI=; b=FIrcxpQMedtzV4mrJ6xjnSsNITXDdFTiQ
 rI158rjwIpRpfXTF6HF8j3eWfQ6tV0e4gyj63Mft6XgvkMaUpJB/ZTgcfTHSmhPb
 LGRjgy0OkUWML9wd3RxSRG7u/mPlqlHnMVmeUeC7qRUHWYojHSwSC48Wlw7Cidov
 5RdV//atRh1FmhhklYK0U278WtvP/I2NdiTYDqz1xf9Y1UGAeNzJUkzV4xuEAEMc
 zSVgVL8HKabSmzNgoQNbelM+zgW9jzHBRbebCP/Ezpi2bke4/WYI7Rdgf3OibjMu
 Earmv/yOorqyc+5PpZcX613f0DJYGJZh9tJfJHrsIR4dMN665w12A==
X-ME-Sender: <xms:grVHXzKN7kfrkoLjisBQt6JNgvMwJ1H-ke6mgU7BLDrI_TkkH0edTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvgedgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuggftrfgrthhtvghrnhepkefhieffjeevfeevhedtieeihfefvdejle
 dvvddthefftedujeethfeuueelfedtnecukfhppedugedrvddrudduiedruddtnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifse
 grjhdrihgurdgruh
X-ME-Proxy: <xmx:grVHX3Ime8GEhm7ScG1VHbOJYa7uiEdLyHOj_Urgv8rzD_Sp2_D14w>
 <xmx:grVHX7sickourHuq-6oJStJr_OWBVQpv-2cHpxoVnduh0jmKgSVnOQ>
 <xmx:grVHX8Y3FLHs17eJ9fabE4j-MfqN5LW5ghHYyVShWTOwXtnTbKxnHQ>
 <xmx:g7VHXzms_HGEVuXwzVQEbbAK3v_Jnkugl7FADXBIi-W_9Rqa6wCulw>
Received: from localhost.localdomain
 (ppp14-2-116-10.adl-apt-pir-bras32.tpg.internode.on.net [14.2.116.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 29255328005E;
 Thu, 27 Aug 2020 09:30:40 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.8 0/3] MAX31785 Fan Controller Work-arounds
Date: Thu, 27 Aug 2020 22:59:59 +0930
Message-Id: <20200827133002.369439-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

This series works around reliability problems with the MAX31785 fan controller
as observed in the field on some POWER systems.

I'm the first to admit the patches are not elegant, so feedback there is
appreciated.

Separately, our previous workarounds have run aground upstream as the hwmon
maintainer was unable to reproduce our observations on the MAX31785 evaluation
kit. I've recently received an evaluation kit, so I plan on putting some of
these issues to the test myself. Ultimately this will help determine whether we
have issues with our fan card designs or whether the controller itself is at
fault (I have to admit, given some of the failures, it's hard to see how the
controller might not be at fault). Basically, this paragraph is my excuse for
not pushing these patches further upstream for the moment; I will re-evaluate
once I have the results from testing against the evkit.

In the mean time, these patches resolve issues we've seen in some system
deployments. Taken together, I've put the driver through an unbind/bind loop
of over 20,000 iterations with no "loss" of fans, where prior to the series we
typically achieved only a few hundred. This feels like a significant
improvement, so please consider merging despite their ugliness.

Cheers,

Andrew

Andrew Jeffery (3):
  pmbus: (max31785) Retry enabling fans after writing MFR_FAN_CONFIG
  pmbus: (max31785) Add a local pmbus_set_page() implementation
  pmbus: (core) Add a one-shot retry in pmbus_set_page()

 drivers/hwmon/pmbus/max31785.c   | 55 ++++++++++++++++++++++++++------
 drivers/hwmon/pmbus/pmbus_core.c | 33 ++++++++++++-------
 2 files changed, 66 insertions(+), 22 deletions(-)

-- 
2.25.1

