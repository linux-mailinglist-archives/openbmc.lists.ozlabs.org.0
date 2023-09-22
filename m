Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DABA7AA7FC
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 06:55:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Hg/jnYst;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsKh26YZHz3cNW
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 14:54:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Hg/jnYst;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
X-Greylist: delayed 557 seconds by postgrey-1.37 at boromir; Fri, 22 Sep 2023 14:26:17 AEST
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsK2x5V5jz2yW6;
	Fri, 22 Sep 2023 14:26:17 +1000 (AEST)
Received: from [192.168.68.112] (ppp14-2-88-115.adl-apt-pir-bras31.tpg.internode.on.net [14.2.88.115])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 12076201B9;
	Fri, 22 Sep 2023 12:16:51 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1695356217;
	bh=Qb0gRj6pnqlTclpvVQaaCBr09PUiG9zueH5w8ndfnhk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Hg/jnYstvcPUnQYL7gXd43PHO+Cy5vuOCBxTd3C/au0t02Z1QLZB+yiTYoG2IkuU4
	 9JIDRFmpJFTDDJbnKB0iO9xFWyWSq2WHirAma7WtkuA+6Io3MT/IbRHkmuvyvxScR8
	 RO4T/44rfsOv7adGIcwkYeFZmfdGTSn2rUJxOW4AfDTlVOuqIkS8/AGFFaahnfUUb9
	 /gyrPVeacfZahfQjrvco1R1ztvzSD/4kyBAmsl+mm2+rCoeRnFn+8oTiRoGR0uCI6C
	 7gD5p0XannjiyPhnwVJCE0TLzPQ2GT466QgZZRhzuyo5WTV31Z5g8RZc7inBxDDLJ9
	 H7/7om750V2PQ==
Message-ID: <91be26169ebbddf3c05cd19626478246cb72a72a.camel@codeconstruct.com.au>
Subject: Re: [PATCH] watchdog: aspeed: Add sysfs attributes for reset mask
 bits
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Zev Weiss <zev@bewilderbeest.net>, Wim Van Sebroeck
 <wim@linux-watchdog.org>,  Guenter Roeck <linux@roeck-us.net>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Date: Fri, 22 Sep 2023 13:46:50 +0930
In-Reply-To: <20230922013542.29136-2-zev@bewilderbeest.net>
References: <20230922013542.29136-2-zev@bewilderbeest.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 22 Sep 2023 14:53:04 +1000
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
Cc: linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>, Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>, linux-kernel@vger.kernel.org, Ivan Mikhaylov <i.mikhaylov@yadro.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2023-09-21 at 18:35 -0700, Zev Weiss wrote:
> The AST2500 and AST2600 watchdog timers provide the ability to control
> which devices are reset by the watchdog timer via a reset mask
> resgister.  Previously the driver ignored that register, leaving
> whatever configuration it found at boot and offering no way of
> altering its settings.  Add a 'reset_ctrl' sysfs subdirectory with a
> file per bit so that userspace can determine which devices the reset
> is applied to.
>=20
> Note that not all bits in the hardware register are exposed -- in
> particular, the ARM CPU and SOC/misc reset bits are left hidden since
> clearing them can render the system unable to reboot.
>=20
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>=20
> I'm porting OpenBMC to a platform that requires that the LPC controller r=
emain
> un-reset by a BMC reboot.  With this patch userspace can control the rese=
t
> mask of the Aspeed watchdog timer, with a few bits remaining unexposed so=
 as
> to prevent some almost-certainly undesirable situations.  If there are ot=
her
> bits that people feel shouldn't be exposed (or conversely if someone feel=
s
> strongly that the "dangerous" bits _should_ be exposed) I can adjust
> accordingly.


Is there a reason this has to be managed by userspace? It sounds a lot
like a property of platform design, in which case exposing this feature
in the devicetree might be a better approach.

Andrew
