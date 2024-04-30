Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9618B6CE3
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2024 10:37:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=q627AnsM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTD8p65Qrz3cSd
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2024 18:37:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=q627AnsM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microchip.com (client-ip=68.232.154.123; helo=esa.microchip.iphmx.com; envelope-from=prvs=84336adb1=conor.dooley@microchip.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Tue, 30 Apr 2024 18:36:59 AEST
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTD8C545jz2yk7;
	Tue, 30 Apr 2024 18:36:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1714466220; x=1746002220;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UkUh+w+9HKgqtj0RQ8rDB4l/giBKlbL8suSDRZ8mUi8=;
  b=q627AnsMBZq7FpVggNhgYedzrcfgmEjnZUuRf4QjJgfnDckeSMmc8npc
   6MIEcNMV2j/fdr48Njz4zVkeQz8FZd0XfAQ3E1hIxTwjdlIdyzlhBTF72
   QUlFwLvq2baaUd4EuKPZMsDn6JicUkA4d2UMdxTL8mqdrVfhvl2Xb+7Lw
   /nprZzdPhKW6ciL88o+xtt55+CyCfeM5rNSLbeXDN2LEz9Kk8/EdkyyFg
   JnBEodSZX2P3uwmAXcCaUElGkDLoOj6SnMdTVxmywTSAikgOQ99l1BeiU
   sGh0Ity4o5EmEBOlhUauMKPMs8gVFn+AQ1Dk0b5vj/KYkQCLkn4fkTEzG
   g==;
X-CSE-ConnectionGUID: 7ymLGdXlRHel0zLr79q6yg==
X-CSE-MsgGUID: jVEWITJCTba7if8za9kRJw==
X-IronPort-AV: E=Sophos;i="6.07,241,1708412400"; 
   d="asc'?scan'208";a="23835974"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Apr 2024 01:35:51 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 01:35:21 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 30 Apr 2024 01:35:19 -0700
Date: Tue, 30 Apr 2024 09:35:02 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Kelly Hung <ppighouse@gmail.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: arm: aspeed: add ASUS X4TF board
Message-ID: <20240430-spotty-generic-f34c53e2e50a@wendy>
References: <20240430045853.3894633-1-Kelly_Hung@asus.com>
 <20240430045853.3894633-2-Kelly_Hung@asus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vW1rHMiWjpv9z2U+"
Content-Disposition: inline
In-Reply-To: <20240430045853.3894633-2-Kelly_Hung@asus.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, kelly_hung@asus.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, Allenyy_Hsu@asus.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--vW1rHMiWjpv9z2U+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2024 at 12:58:52PM +0800, Kelly Hung wrote:
> Document the new compatibles used on ASUS X4TF.
>=20
> Signed-off-by: Kelly Hung <ppighouse@gmail.com>
>=20
> ---
> V6 -> v7:
> - Remove incorrect tags.
> - Modify Signed-off-by field.
> v5 -> v6:
> - Add Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> - Add Reviewed-by: Rob Herring <robh@kernel.org>
> - Add Reviewed-by: Zev Weiss <zweiss@equinix.com>
> - Add Acked-by: Conor Dooley <conor.dooley@microchip.com>

I did actually ack this, so dropping mine was not required:
https://lore.kernel.org/all/20240229-rocket-fraction-76e85d9f4bfb@spud/

> V4 -> V5: Update all changelog from v1 to v5.
> V3 -> V4: The new compatible is a BMC for a ASUS X4TF server which use
> a ast2600-a3 chip, so correct string to asus,x4tf-bmc.
> V2 -> V3: Add a label to indicate it is new compatible for bmc.
> V1 -> V2: Remove blank in front of the string x4tf.
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/D=
ocumentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index 749ee54a3..0047eb4ab 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -74,6 +74,7 @@ properties:
>                - ampere,mtmitchell-bmc
>                - aspeed,ast2600-evb
>                - aspeed,ast2600-evb-a1
> +              - asus,x4tf-bmc
>                - facebook,bletchley-bmc
>                - facebook,cloudripper-bmc
>                - facebook,elbert-bmc
> --=20
> 2.25.1
>=20

--vW1rHMiWjpv9z2U+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjCtKQAKCRB4tDGHoIJi
0i5AAP9qVLkKpEN9rrz34Szz04MkcJNQzs9JmnwGVYOJeL2kBwEAmSfZuCKsFjWk
cLm/Ud2P6LCWU/IaEX8UoRgQZVq7UAo=
=uHbO
-----END PGP SIGNATURE-----

--vW1rHMiWjpv9z2U+--
