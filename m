Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 939648735EE
	for <lists+openbmc@lfdr.de>; Wed,  6 Mar 2024 12:56:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqW9Y253Zz3dXD
	for <lists+openbmc@lfdr.de>; Wed,  6 Mar 2024 22:56:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=etezian.org (client-ip=87.98.143.68; helo=2.mo581.mail-out.ovh.net; envelope-from=andi@etezian.org; receiver=lists.ozlabs.org)
Received: from 2.mo581.mail-out.ovh.net (2.mo581.mail-out.ovh.net [87.98.143.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqW9C6NJDz3cL0
	for <openbmc@lists.ozlabs.org>; Wed,  6 Mar 2024 22:55:57 +1100 (AEDT)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.25.111])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4TqW933fhpz1Fqj
	for <openbmc@lists.ozlabs.org>; Wed,  6 Mar 2024 11:55:51 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-7smw2 (unknown [10.111.182.47])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id AC5801FF06;
	Wed,  6 Mar 2024 11:55:44 +0000 (UTC)
Received: from etezian.org ([37.59.142.101])
	by ghost-submission-6684bf9d7b-7smw2 with ESMTPSA
	id sAEZNcBZ6GXmNgEA++KPQQ
	(envelope-from <andi@etezian.org>); Wed, 06 Mar 2024 11:55:44 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-101G0043716780f-fe81-4286-987a-6a321cced5bc,
                    62DEF991EB217AB86F953B10C2782167B22AFEEB) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: brendan.higgins@linux.dev, benh@kernel.crashing.org, joel@jms.id.au, 
 andrew@codeconstruct.com.au, jae.hyun.yoo@linux.intel.com, wsa@kernel.org, 
 Tommy Huang <tommy_huang@aspeedtech.com>
In-Reply-To: <20240305011906.2745639-1-tommy_huang@aspeedtech.com>
References: <20240305011906.2745639-1-tommy_huang@aspeedtech.com>
Subject: Re: [PATCH v2] i2c: aspeed: Fix the dummy irq expected print
Message-Id: <170972614153.1712532.8035778125665215281.b4-ty@kernel.org>
Date: Wed, 06 Mar 2024 12:55:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 6468857915411270185
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledriedugdefudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthejredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepffetheduffdvhfdugfffudfgjeejudehheegfeeguefhieeugffhgfeuffdvgfefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpkeelrddvudejrddutdelrdduieelpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgsmhgtsehlihhsthhsrdhoiihlrggsshdrohhrghdpoffvtefjohhsthepmhhoheekuddpmhhouggvpehsmhhtphhouhht
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
Cc: BMC-SW@aspeedtech.com, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi

On Tue, 05 Mar 2024 09:19:06 +0800, Tommy Huang wrote:
> When the i2c error condition occurred and master state was not
> idle, the master irq function will goto complete state without any
> other interrupt handling. It would cause dummy irq expected print.
> Under this condition, assign the irq_status into irq_handle.
> 
> For example, when the abnormal start / stop occurred (bit 5) with
> normal stop status (bit 4) at same time. Then the normal stop status
> would not be handled and it would cause irq expected print in
> the aspeed_i2c_bus_irq.
> 
> [...]

Applied to i2c/i2c-host-fixes on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] i2c: aspeed: Fix the dummy irq expected print
      commit: 94e889260a5bae7d4c06de90f1724aeb8b1175c6

