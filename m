Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A8A8555B8
	for <lists+openbmc@lfdr.de>; Wed, 14 Feb 2024 23:25:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZt7n54L1z3dX3
	for <lists+openbmc@lfdr.de>; Thu, 15 Feb 2024 09:25:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=etezian.org (client-ip=188.165.38.232; helo=15.mo550.mail-out.ovh.net; envelope-from=andi@etezian.org; receiver=lists.ozlabs.org)
Received: from 15.mo550.mail-out.ovh.net (15.mo550.mail-out.ovh.net [188.165.38.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZt7N4mQDz3cSd
	for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2024 09:25:33 +1100 (AEDT)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.176.110])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4TZt7D5F8Bz1DM0
	for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2024 22:25:28 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-g6lsk (unknown [10.110.113.83])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5CEE21FDC1;
	Wed, 14 Feb 2024 22:25:24 +0000 (UTC)
Received: from etezian.org ([37.59.142.108])
	by ghost-submission-6684bf9d7b-g6lsk with ESMTPSA
	id kOdFN9Q9zWW2+BMA5AQA5w
	(envelope-from <andi@etezian.org>); Wed, 14 Feb 2024 22:25:24 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-108S0028a4cc169-7cca-414a-93f3-2f549766b70e,
                    C0FC2E5C6A7315DD97BDDE4B9606AB6EEADB6D9F) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, 
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rand Deeb <rand.sec96@gmail.com>
In-Reply-To: <20240206194201.10054-1-rand.sec96@gmail.com>
References: <20240206194201.10054-1-rand.sec96@gmail.com>
Subject: Re: [PATCH] i2c: Remove redundant comparison in npcm_i2c_reg_slave
Message-Id: <170794952331.4171357.5051078389218008556.b4-ty@kernel.org>
Date: Wed, 14 Feb 2024 23:25:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
X-Ovh-Tracer-Id: 4456311833711348360
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrudejgdduiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeffteehudffvdfhudfgffdugfejjeduheehgeefgeeuhfeiuefghffgueffvdfgfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdekledrvddujedruddtledrudeiledpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegrnhguihesvghtvgiiihgrnhdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrdhorhhgpdfovfetjfhoshhtpehmohehhedtpdhmohguvgepshhmthhpohhuth
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
Cc: voskresenski.stanislav@confident.ru, deeb.rand@confident.ru, lvc-project@linuxtesting.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi

On Tue, 06 Feb 2024 22:42:01 +0300, Rand Deeb wrote:
> In the npcm_i2c_reg_slave() function, there was a redundant
> comparison that checked if 'bus->slave' was null immediately after
> assigning it the 'client' value. There were concerns about a
> potential null dereference because of `client->adapter`, but
> according to Wolfram Sang, "we trusted ourselves here" Therefore,
> this comparison is unnecessary.
> 
> [...]

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] i2c: Remove redundant comparison in npcm_i2c_reg_slave
      commit: 48acf8292280f257fb0047478153a81471ee7f4d

