Return-Path: <openbmc+bounces-1345-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBLGChc0i2mhRgAAu9opvQ
	(envelope-from <openbmc+bounces-1345-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 10 Feb 2026 14:35:19 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 973F411B41B
	for <lists+openbmc@lfdr.de>; Tue, 10 Feb 2026 14:35:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9Mxt68tkz2xN5;
	Wed, 11 Feb 2026 00:35:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770730514;
	cv=none; b=bG0PiIvYxoTJSh2etaz00cV1pqB5St+DA8sFT5DaWt+40mCmRW8eSoP8Kp6q9W4weofs5KNX9hXQkOKGQC+x+d8YOZoVM1o6OONNSD9G03qy31biNSBzHwou0R8rpMAHY23H2+raSBbH89Y5Dd2HSLug/iCYugjUtihTWC7CQRxzEiB27fngwOcQbKuCzfTdbcRkQaj0roi7hRbzQsmjgike7jcUzxmfmBVSwSa/GI7qtNPUdMdj8CQTuDmPucKl0YSMuEqOCqKpBlmECInUTZE3Lj6wvwThNxudxv6p1QTFLvfx0Myn1ku7fdM0lTjTtnDsLfNsFWUDQx19d4a8HA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770730514; c=relaxed/relaxed;
	bh=4uRWFPdHEmXPuzgw91gqbQWD+F9tqzm+QUuGOLt9pcs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=IsVkKWbE7AKJufe5WnVsjQnbwqx8KWW7aYQ7Hd0lBmj8CezAcGND2QozwFaI1/uBPAEz7cyKejtWqNn4s0d+YPOnn+TNslCbHT7pp3Os0qrWZd5Jo2Fa+fC3CIlWHIwMNI8gUzgYIaxM5sKgEwTnRfHUObla29APpKtN28nJ+AwDTQp4fqe0Dse3dPuKDDCK+LQBluE+Yw0C7p9J1skNu3AaZTRIIBsvrs3Yckr2qfcdAmHuAP+qwlPPbY6p8vOe384PJezztJkXRnyv+RnxoUdFnlCZYuauVU5vp6WBlZVsFiOBT6L4+QfVbZXlOIJrPvoGS3f3OrqlK3+dACsHQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DPO2T1h+; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DPO2T1h+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9Mxs22vzz2xKx
	for <openbmc@lists.ozlabs.org>; Wed, 11 Feb 2026 00:35:13 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6EF8660097;
	Tue, 10 Feb 2026 13:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA280C116C6;
	Tue, 10 Feb 2026 13:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770730510;
	bh=pOU4O74VvKCHJ34mMFpIVQ+S/He2Ol8rafSLir616W4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=DPO2T1h+M+Nha4vZaFiTCBZ/lAH+hR/wqUxZb5qfbGyg77+pHgj4+LRd9CqCinMKQ
	 8FF+Gs/Gkna9qwtaxuho8WLcoTbQ7XDzPChAGmfCsXtc5pAYFbLQfzUjfZR83+ikVB
	 VR16qpeIRW9bhXA4H6RnEBvcCKdz1R0X5vb96GaH33oMebEmFGeI5gIL6N0sMIh62n
	 k2efThEbB47mBL6mCkXbc8S5xfeRnl9/Bbu29gv/PcHvO4FbLf2z+Uj9xmwnQP6lV9
	 uCzp6sItHaozwRAD7tfSNtldQacJg1MmTVgq5gOY9yF/oYxlD02SHMi/UN88WtzwuD
	 03Yien9BUoOJg==
Date: Tue, 10 Feb 2026 07:35:09 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, 
 mcoquelin.stm32@gmail.com, yclu4@nuvoton.com, alexandre.torgue@foss.st.com, 
 linux-kernel@vger.kernel.org, edumazet@google.com, 
 linux-stm32@st-md-mailman.stormreply.com, schung@nuvoton.com, 
 netdev@vger.kernel.org, conor+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, richardcochran@gmail.com, 
 davem@davemloft.net, openbmc@lists.ozlabs.org, krzk+dt@kernel.org, 
 kuba@kernel.org, ychuang3@nuvoton.com, peppe.cavallaro@st.com, 
 pabeni@redhat.com, joabreu@synopsys.com
To: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260210052226.3005666-2-a0987203069@gmail.com>
References: <20260210052226.3005666-1-a0987203069@gmail.com>
 <20260210052226.3005666-2-a0987203069@gmail.com>
Message-Id: <177073050804.2585725.9186824856266132663.robh@kernel.org>
Subject: Re: [PATCH net-next v12 1/3] dt-bindings: net: nuvoton: Add schema
 for Nuvoton MA35 family GMAC
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.30 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-1345-lists,openbmc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[robh@kernel.org,openbmc@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:devicetree@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:yclu4@nuvoton.com,m:alexandre.torgue@foss.st.com,m:linux-kernel@vger.kernel.org,m:edumazet@google.com,m:linux-stm32@st-md-mailman.stormreply.com,m:schung@nuvoton.com,m:netdev@vger.kernel.org,m:conor+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:richardcochran@gmail.com,m:davem@davemloft.net,m:openbmc@lists.ozlabs.org,m:krzk+dt@kernel.org,m:kuba@kernel.org,m:ychuang3@nuvoton.com,m:peppe.cavallaro@st.com,m:pabeni@redhat.com,m:joabreu@synopsys.com,m:a0987203069@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	DBL_PROHIBIT(0.00)[0.62.26.112:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,openbmc@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lunn.ch,gmail.com,nuvoton.com,foss.st.com,google.com,st-md-mailman.stormreply.com,kernel.org,lists.infradead.org,davemloft.net,lists.ozlabs.org,st.com,redhat.com,synopsys.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[openbmc,netdev,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[e7070000:email]
X-Rspamd-Queue-Id: 973F411B41B
X-Rspamd-Action: no action


On Tue, 10 Feb 2026 13:22:24 +0800, Joey Lu wrote:
> Create initial schema for Nuvoton MA35 family Gigabit MAC.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 133 ++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  2 files changed, 134 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.example.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.example.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[4294967295]] is too short
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.example.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'altr,socfpga-stmmac' is not one of ['nuvoton,ma35d1-dwmac']
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.example.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.example.dtb: ethernet@ff700000 (altr,socfpga-stmmac): phy-mode:0: 'sgmii' is not one of ['rmii', 'rgmii', 'rgmii-id', 'rgmii-txid', 'rgmii-rxid']
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.example.dtb: ethernet@ff700000 (altr,socfpga-stmmac): 'nuvoton,sys' is a required property
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.example.dtb: ethernet@ff700000 (altr,socfpga-stmmac): 'resets' is a required property
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.example.dtb: ethernet@ff700000 (altr,socfpga-stmmac): 'reset-names' is a required property
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.example.dtb: ethernet@ff700000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('altr,sysmgr-syscon' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.example.dtb: ethernet@4070000 (sophgo,cv1800b-dwmac): compatible:0: 'sophgo,cv1800b-dwmac' is not one of ['nuvoton,ma35d1-dwmac']
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.example.dtb: ethernet@4070000 (sophgo,cv1800b-dwmac): phy-mode:0: 'internal' is not one of ['rmii', 'rgmii', 'rgmii-id', 'rgmii-txid', 'rgmii-rxid']
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.example.dtb: ethernet@4070000 (sophgo,cv1800b-dwmac): 'nuvoton,sys' is a required property
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,th1520-gmac.example.dtb: ethernet@e7070000 (thead,th1520-gmac): clock-names:1: 'ptp_ref' was expected
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,th1520-gmac.example.dtb: ethernet@e7070000 (thead,th1520-gmac): clock-names: ['stmmaceth', 'pclk', 'apb'] is too long
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,th1520-gmac.example.dtb: ethernet@e7070000 (thead,th1520-gmac): clocks: [[4294967295, 1], [4294967295, 2], [4294967295, 3]] is too long
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,th1520-gmac.example.dtb: ethernet@e7070000 (thead,th1520-gmac): compatible:0: 'thead,th1520-gmac' is not one of ['nuvoton,ma35d1-dwmac']
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,th1520-gmac.example.dtb: ethernet@e7070000 (thead,th1520-gmac): reg: [[3875995648, 8192], [3959435264, 4096]] is too long
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,th1520-gmac.example.dtb: ethernet@e7070000 (thead,th1520-gmac): 'nuvoton,sys' is a required property
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,th1520-gmac.example.dtb: ethernet@e7070000 (thead,th1520-gmac): 'resets' is a required property
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,th1520-gmac.example.dtb: ethernet@e7070000 (thead,th1520-gmac): 'reset-names' is a required property
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,th1520-gmac.example.dtb: ethernet@e7070000 (thead,th1520-gmac): Unevaluated properties are not allowed ('reg-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260210052226.3005666-2-a0987203069@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


