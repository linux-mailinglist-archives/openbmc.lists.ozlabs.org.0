Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2C7195158
	for <lists+openbmc@lfdr.de>; Fri, 27 Mar 2020 07:35:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pXD15wL2zDqKh
	for <lists+openbmc@lfdr.de>; Fri, 27 Mar 2020 17:35:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=P80r9LKV; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Yh0B1kza; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pX8M1S0RzDr43
 for <openbmc@lists.ozlabs.org>; Fri, 27 Mar 2020 17:32:18 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 8DD465C033D;
 Fri, 27 Mar 2020 02:32:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 27 Mar 2020 02:32:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=yQLl94OOmQDoiE9AHsqlA1RKvM
 9x1rdqcoLJPXM3YoU=; b=P80r9LKVXB2L/9yDeoq7RWhCRXPW+vAmyIGaIHyLcW
 lfggpnABe5GHPQYyhXCwS1kGYm9ucuT1n6Xwz9ERP8Xl1IcDcvVFo6l17Kf/IGcm
 TjWO5aMhOD3wgd+M8XAvcMSerIAnq+uTJ7gKur54SMzNJOWCaIMN07yynMWYrVHy
 NXA22UdEunBGJUQFbXFGngn+AvdTGCucH61eilAW24Iq7VSs6Leu9c9kALJAUw4P
 Tdig310oM7c9d2vse3rD0PC9uLTOcK9rU7fji0K9MvNEXKjo+de5nQLl9rcekrWY
 z/Bx8e1/gmr6kA1BUaJ9Ctmfqh4TwbB7m7P422tEt8EA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=yQLl94OOmQDoiE9AH
 sqlA1RKvM9x1rdqcoLJPXM3YoU=; b=Yh0B1kza56HElagDXXsk11JsaRRNb2NtT
 HrwbMg6gC1EKFXSreGCEeyTSJObsR7bt7E2RnN7z6X9liIu6FTFD/FvQf4273BT0
 6Vksl7kCyehi93manjrL4LP3jO6WpyiDi+vxYhXFPPXZdez4SqplqMdGyK6yo9Tf
 bvGQH3ycols91oXj0Z6bbOQp47WhNM8eAP6cPBv2ZwiVGhi4Vk35MzXhesbDYzRh
 C500lZKuHH9dStKLiMgVu7jLkk0q1c7R1o8t2x7ERa353lKUXjm1k23x2lryA00c
 NRKEzH67gjrsVj0kcy2URzm2dBQoP+eVyAeHmQ/2MFdx5/f3rNHbA==
X-ME-Sender: <xms:7p19Xm_yBx58hF0tRGDfkKtiHpYVYp2hngnJ2e2uWQvw9ZC1dixEbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudehjedgudelhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduudekrd
 dvuddtrddukeefrdduleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:7p19XsVCYM3rXcSihKEIVn_9ouPP8BNhz0nM20HK8QWs5MDIgPG4Kg>
 <xmx:7p19XrNeJ7LY1OAwcpQZgGUOu0jvDgKVD_DDDNWdLGLBRfjBNm6Hag>
 <xmx:7p19XsawLqiXpA-e9WHpOIqwPld1tgoZEcyeRxUT2wDU-TXYY-ySJg>
 <xmx:7p19XoyiGdcdVbtZ4CZqwaIC1spp8bPTXKm28tKDNmwaNCtErsy7fQ>
Received: from localhost.localdomain
 (ppp118-210-183-198.adl-adc-lon-bras34.tpg.internode.on.net
 [118.210.183.198])
 by mail.messagingengine.com (Postfix) with ESMTPA id C609E3280063;
 Fri, 27 Mar 2020 02:32:12 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [WIP PATCH linux dev-5.4 0/4] KCS driver for LPC MCTP binding
Date: Fri, 27 Mar 2020 17:01:42 +1030
Message-Id: <20200327063146.28885-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

This is a series that cleans up a driver that we (IBM) have been using
internally for some time to expose the KCS device required by the astlpc
binding found in libmctp[1]. The driver is generally terrible, and the
userspace interface will no-longer be needed once I get to implementing
socket-based MCTP support (which we should have roughly around the same time as
practical nuclear fusion*).

We would like to apply this to the OpenBMC tree whilst _not_ upstreaming it on
the basis that its userspace API will become obsolete in the future and the
effort isn't worth the hassle, but we still need the functionality until we get
socket support. Several IBM system configurations make use of the driver as is,
and it serves to demonstrate the purpose of the astlpc binding in libmctp.

I've marked the series WIP because of the above reasons, not as indicator to
not apply it. However, please don't stare at the code too hard in case it
breaks you.

Andrew

[1] https://github.com/openbmc/libmctp/blob/master/astlpc.c

* Not serious, but it feels this way.

Andrew Geissler (1):
  ARM: dts: tacoma: Add KCS node for LPC MCTP

Andrew Jeffery (2):
  misc: Add ASPEED KCS driver for MCTP purposes
  ARM: dts: witherspoon: Add KCS node for LPC MCTP

Eddie James (1):
  ARM: dts: rainier: Add KCS node for LPC MCTP

 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  |   8 +
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts   |   8 +
 .../boot/dts/aspeed-bmc-opp-witherspoon.dts   |   8 +
 drivers/misc/Kconfig                          |   7 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/mctp-lpc.c                       | 443 ++++++++++++++++++
 6 files changed, 475 insertions(+)
 create mode 100644 drivers/misc/mctp-lpc.c

-- 
2.20.1

