Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A4F25A664
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 09:23:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhFlm13v5zDqlD
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 17:23:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=LZTLvhOI; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=pCVhS8lQ; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhFf30VPyzDqLs
 for <openbmc@lists.ozlabs.org>; Wed,  2 Sep 2020 17:18:18 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 255B95C00DA;
 Wed,  2 Sep 2020 03:18:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 02 Sep 2020 03:18:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=/egf1TaXcxu6w0wkJKeMbGgH5g
 pKO+aaBYZZVW9eoC8=; b=LZTLvhOIFPWpjfQrbTttBoxaQexM6vuIHMbRJTlLWf
 jYIunt/NIn2Ike2pG1DZ7YyMvtqSDt2zrj981KHS500PTxecr4mYkmaylEGxvdDd
 N7vBIVhW4ZVTzXaCh1Ml3KVM++tVXoEDNb2qH3agygfrk4jyB34+4yP3i7cANnkO
 eUIXp89xur10x7Te11mXPP4KYUCh53PInV+gtUIRk2tONOmNPZT69MwZcSwtwXvx
 Dm0rSfIPJMCWp3wh5oa1KSGct7fD5RsHawodJQNRZiGWVt+1NUoDFkGjvUrYK+XA
 BcZ/VMOcTrCWkb67BLTKW98phJLVzs6klQU7g66vVBIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=/egf1TaXcxu6w0wkJ
 KeMbGgH5gpKO+aaBYZZVW9eoC8=; b=pCVhS8lQBFlG2WXbCGw3lLccqoWzcLSfW
 xnAdhrgyGTDJ/WuKbQQebP9ZqgCH9Z9DEdDQIdGavlxBYNYOu8scKpxDvpQ+BVXk
 o6xz4oMOwB/zaVWU1+HrfVWfY9F3gTZADAMmByHWHWGYIV5dmuqsF5VV3eOBWY3g
 2KLm7vUUodeN4mpRAL08YzddujS/IBdoLpXoemGEZ1U8qQ+vcDixAvIP+sny0JMC
 EW0hpxRNo0uw7wyD4noGI++3Upm2zb5vaDjM+10UPBFBQi3SXjGhEAOYmpZlOjVx
 jpJi9K7g4YhUvCiIU5WfoOL+cek/8l3xPle0TW0w8QeMy5+b9lZ8g==
X-ME-Sender: <xms:NkdPX72nDECLPbJsERMadXaG4ZKCgEwli5eDiDbfTPoZZB__NUf7Hw>
 <xme:NkdPX6FVSXQXzo3TLsu-sC8uE6suMvAxrVZPbSoB02bNQNWIymeQHmmYiVjRVgblA
 1oGyzCFkDhAHKvEHQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefkedguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeekhfeiffejveefveehtdeiiefhfedvje
 elvddvtdehffetudejtefhueeuleeftdenucfkphepudegrddvrddutdelrdekheenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfi
 esrghjrdhiugdrrghu
X-ME-Proxy: <xmx:NkdPX75z9OtsbHNKxAHS-_eF7RUSbwBqVYRTZigjcxFyC-mcPirwrw>
 <xmx:NkdPXw1oHdP5UlvbxDrspF_WdzYKwiWyhj_7XpqUwFKXH6gf_3FQvA>
 <xmx:NkdPX-G_QL1iOFnvjQU3x8kEF0sG2_PGr48Q-rrcsPEBjEKBeHRoYQ>
 <xmx:N0dPX5w7rFiBcSpO9vcPtsie4lrBajdX-JY3qyUAhI5W6mpOgJxC8A>
Received: from localhost.localdomain
 (ppp14-2-109-85.adl-apt-pir-bras32.tpg.internode.on.net [14.2.109.85])
 by mail.messagingengine.com (Postfix) with ESMTPA id 133463280063;
 Wed,  2 Sep 2020 03:18:12 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 0/3] i2c: Introduce transfer throttling
Date: Wed,  2 Sep 2020 16:47:33 +0930
Message-Id: <20200902071736.2578715-1-andrew@aj.id.au>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

It turns out that some I2C/SMBus devices get unhappy if we "hammer" them with
commands. A concrete example is the TI UCD90320 power sequencer, and I strongly
suspect the Maxim MAX31785 fan controller also suffers this issue. In the case
of the UCD90320 we see behaviours ranging across 35ms clock stretches (SMBus
limit), bus lockups where SDA, SCL or both become stuck low (must assert the
device RESET line to recover) or corruption of the volatile state of the device
(which can bring down rails).

Further, by "hammer" I don't even mean anything that might be coming close to
the SMBus tBUF requirements - the UCD90320 in particular starts getting upset
if we issue commands back-to-back with around 250us of delay between commands
addressing the device (for contrast the 100kHz tBUF requirement of SMBus is no
less than 4.7us idle time between STOP and START).

This series implements per-client throttling in the I2C/SMBus core as a proxy
for per-device throttling, and then patches the ucd9000 device driver to
throttle commands such that at least 1000ms passes between consecutive commands
to the target device.

The implementation augments `struct i2c_client` to track the time of the last
command to the associated device. While the "proxy" nature isn't ideal, the
implementation at least gets us past a hump of system instability.

So, TODO:

1. Remove the "proxy" nature by eliminating the schism between the client
   associated with a device's driver and accesses via /dev/i2c-*
2. Consider whether this feature should be expanded beyond the SMBus-specific
   parts of the i2c subsystem.

Nice-to-haves:

3. Implement devicetree support
4. Attach the debugfs attribute to where-ever is appropriate as after resolving
   1.

After I've thought a bit more about 1. I plan to send the patches upstream. I
think at that point I can take feedback from Wolfram on 2, but for the moment
I'd like this series to bake in the OpenBMC kernel tree.

The third patch is a bit WIP-y; it was mainly to perform experiments with the
UCD90320 in particular. If the attribute is to be exposed it probably should be
a property of either the client or the associated device once we solve 1 (as
mentioned in 4.) Anyway, it's at least in debugfs, so I don't think it matters
a great deal if we take it as there's no promise of ABI stability there.

The patches have been tested on several Rainier systems and the desired bus
behaviour confirmed with a logic analyser.

Please review!

Andrew

Andrew Jeffery (3):
  i2c: Allow throttling of transfers to client devices
  pmbus: (ucd9000) Throttle SMBus transfers to avoid poor behaviour
  ucd9000: Add a throttle delay attribute in debugfs

 drivers/hwmon/pmbus/ucd9000.c |  37 ++++++++
 drivers/i2c/i2c-core-base.c   |   8 +-
 drivers/i2c/i2c-core-smbus.c  | 169 ++++++++++++++++++++++++++++------
 drivers/i2c/i2c-core.h        |  21 +++++
 include/linux/i2c.h           |   5 +
 5 files changed, 209 insertions(+), 31 deletions(-)

-- 
2.25.1

