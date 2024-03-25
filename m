Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDFE888F00
	for <lists+openbmc@lfdr.de>; Mon, 25 Mar 2024 06:33:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=beHRHQTi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V31mb58Mhz3cGc
	for <lists+openbmc@lfdr.de>; Mon, 25 Mar 2024 16:33:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=beHRHQTi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V31m466MPz2yGk
	for <openbmc@lists.ozlabs.org>; Mon, 25 Mar 2024 16:32:36 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-177-226.adl-adc-lon-bras34.tpg.internode.on.net [118.210.177.226])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3B53F20173;
	Mon, 25 Mar 2024 13:32:31 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1711344756;
	bh=4zMFm3cEUu9LBU+50WlOUI5pRCFKXq9CsV+f7ujQHRQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=beHRHQTiqodIIveKZA4abhda4Sx4vCQUBVPhjZzhHKUXb4YEhzRSSBmZdwQvYvMiS
	 nyr3U24DQOE5q21KejpUCInCYcihWhSNyXEjEVhUZ3Zc7Wk0WqlxNpDbbH516m49tv
	 p4XF6xS1X/nPJZnwCqNNwv3yKOL2RLSoDlQ23a6opYEb7cgTmeilf8uG1ZZBChtNEc
	 V+NYkoYmVKS6nWJxfjtyT2ALMIx53B13AXxaTpS+pQbAiVwZICWcAfoIkwgPwj5g0Y
	 uQR1S7510TPs5NArmPJpW8DphxJuPkOUqOckaIdegAN3kSohx9KMKKbiUJV4D6cS2B
	 0G5Kn/nuBm3jA==
Message-ID: <2a55a4544f3c1c9b31ecf5232a8d8409a87a6f2a.camel@codeconstruct.com.au>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: aspeed: Add
 Ampere's BMC platform (AST2600)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Chanh Nguyen <chanh@os.amperecomputing.com>, u-boot@lists.denx.de, 
 Albert Aribaud <albert.u.boot@aribaud.net>, Joel Stanley <joel@jms.id.au>,
 Zev Weiss <zev@bewilderbeest.net>,  Andrew Jeffery <andrew@aj.id.au>,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Jae Hyun Yoo
 <quic_jaehyoo@quicinc.com>, Patrick Rudolph
 <patrick.rudolph@9elements.com>, Dylan Hung <dylan_hung@aspeedtech.com>,
 Graeme Gregory <quic_ggregory@quicinc.com>,  Eddie James
 <eajames@linux.ibm.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Open
 Source Submission <patches@amperecomputing.com>
Date: Mon, 25 Mar 2024 16:02:31 +1030
In-Reply-To: <20240319072137.16695-1-chanh@os.amperecomputing.com>
References: <20240319072137.16695-1-chanh@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Chanh,

On Tue, 2024-03-19 at 14:21 +0700, Chanh Nguyen wrote:
> Add the initial version of the device tree for the Ampere BMC
> platform, which is equipped with the Aspeed AST2600 BMC SoC.
>=20
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> ---
>  arch/arm/dts/Makefile           |   1 +
>  arch/arm/dts/ast2600-ampere.dts | 113 ++++++++++++++++++++++++++++++++
>  2 files changed, 114 insertions(+)
>  create mode 100644 arch/arm/dts/ast2600-ampere.dts
>=20
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index 37675a3277..3642d59c89 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -691,6 +691,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
>  	ast2600-greatlakes.dtb \
>  	ast2600-intel.dtb \
>  	ast2600-ncsi.dtb \
> +	ast2600-ampere.dtb \
>  	ast2600-p10bmc.dtb \
>  	ast2600-pfr.dtb \
>  	ast2600-qcom-dc-scm-v1.dtb \

Given this hunk and the tags in the `[PATCH]` prefix of the mail
subject you've based this change on OpenBMC's fork of u-boot, which is
heavily (out of date, and) inspired by Aspeed's SDK tree. I've applied
this to OpenBMC's fork for now.

However, you've sent this to the upstream list. You will need to rework
your patch on top of mainline u-boot if you want it accepted there, and
follow all the usual documentation on how to submit patches to the u-
boot project (e.g. you should not be including `u-boot v2019.04-aspeed-
openbmc` in the patch subject prefix in upstream submissions).

Andrew
