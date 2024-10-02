Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7EA98CB68
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2024 05:11:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJKZr3T6Vz30g3
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2024 13:11:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727838673;
	cv=none; b=WPxXahy4LQAO01UF1uwUr8Cg2nEUFuwyPmGQM3Qc8RixMkX3j3Az3r3utmExNP8ZhHOoJOX5py4yAJ00m92LLkHSJvMMRhBYL3p33K5rECpqmCtbv/Eb8TiXsMjZousCG2/Y03vHeOYcUnbnJs0zBsrjysA0o+VhBeboD6jtkEvGTmIzPzhRB/l1uRcx8jT7IHn1AHa3mZ0vg66JDPHEtX/HweGpHXSjXYnLNiUEsoHQugxYBgmqCjs1W1xnhv2+rjEBgp5laojtKSMZvo9Yv+ou+zWi0i0m1rFCyeJniO8ZvEtppofZ1BGgEOtQtp7GbY2Pa35BvT14q6UD8vx0ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727838673; c=relaxed/relaxed;
	bh=5+asHEmTWbRF/II5PIT3MLf7M7hMkwvunY3a2j/zFXQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Osu4izvOiByYS4VjbehoH4QIwIyILOLFJyyFXyGe7gZBbagZQSwm9rUl2bA1mcN3uDLkmR6ZRNmQ8MHTbcUrwj/5h0D9uRf3tWCLgR0Vn/j9WvFjaZCEOkM9JnMuF71HqHXQpa4ISjNXHuriJm+ZfDVxlkeiRO1WaE21FyiT4msQoHcc1FzJjWHoqsO34kUEZNo7NcP2oJtn/X6gFQS6ARARzIF13D/N0BxJUBo4/aQqOUFo8/OyXyraYlIZXiM1iIIjadfqwGMwaN1tG9XZwadXzyBLv4224qTyaEBtofKgMHu7fuF4O5yT2OXGWooVzj0P6aw5VWltaZZJlCbc7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=WIz+3wtD; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=WIz+3wtD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJKZn1mNlz2yF1
	for <openbmc@lists.ozlabs.org>; Wed,  2 Oct 2024 13:11:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727838672;
	bh=5+asHEmTWbRF/II5PIT3MLf7M7hMkwvunY3a2j/zFXQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WIz+3wtDEOPuqhHkWCGrbFDl6OzMEGcsELflmuL2LYvknCn2+a/L/zlnO15OH+XnF
	 yD3O1zLkpD/I1GexNgNIUtVqMEFBiJtSr8dT4T/d9Pht28WP1yEnuWWyZufHzgcrTv
	 WOhiCd9Y4+8nDxy78Tam3+xdK0IpeFAjsg4+Jr5WYEii/b0rpqwxUInAFIRW0z6CqO
	 FW+N/lLaJP1D1oGeLqz8psgdiXJzvkHhDDaIdN7qIYtB+w0/xTa1OGYnL22owPebkv
	 1J8RO3uYfxDU3WWwjXXfHpNWimwbm+KB0BZODG9+23P+hilDJNKEM5wr6quEx8vg3d
	 QFHX1o7olPf2w==
Received: from [192.168.68.112] (ppp118-210-73-17.adl-adc-lon-bras32.tpg.internode.on.net [118.210.73.17])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3FE7264BDC;
	Wed,  2 Oct 2024 11:11:12 +0800 (AWST)
Message-ID: <0ce7c039983bbc0c5bc1a1600a3613337cc45ae9.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts nuvoton: Add EDAC node
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "William A. Kennington III" <william@wkennington.com>, Tomer Maimon
	 <tmaimon77@gmail.com>, Rob Herring <robh@kernel.org>
Date: Wed, 02 Oct 2024 12:41:11 +0930
In-Reply-To: <20240930214659.193376-1-william@wkennington.com>
References: <20240930214659.193376-1-william@wkennington.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, "William A. Kennington III" <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi William,

As a bit of a nit, you missed the `:` after `dts` in the patch subject.

On Mon, 2024-09-30 at 14:46 -0700, William A. Kennington III wrote:
> From: "William A. Kennington III" <wak@google.com>
>=20
> We have the driver support code, now we just need to expose the device
> node which can export the EDAC properties for the system memory
> controller. Tested on real hardware to verify that error counters show
> up.
>=20
> Signed-off-by: William A. Kennington III <wak@google.com>
> ---
>  arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch=
/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
> index 5aeb5009a5d7..019abceb16a0 100644
> --- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
> +++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
> @@ -127,6 +127,13 @@ clk: clock-controller@f0801000 {
>  			clocks =3D <&clk_refclk>, <&clk_sysbypck>, <&clk_mcbypck>;
>  		};
> =20
> +		mc: memory-controller@f0824000 {
> +			compatible =3D "nuvoton,";

This compatible string doesn't look right to me. Are you sure?

Andrew
