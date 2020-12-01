Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 736102C947E
	for <lists+openbmc@lfdr.de>; Tue,  1 Dec 2020 02:15:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClPL42DPZzDqjk
	for <lists+openbmc@lfdr.de>; Tue,  1 Dec 2020 12:15:40 +1100 (AEDT)
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
 header.s=fm1 header.b=CRL07yhN; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Qyct34Mh; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClPK16Cw8zDqjZ
 for <openbmc@lists.ozlabs.org>; Tue,  1 Dec 2020 12:14:45 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C998B5C01B6;
 Mon, 30 Nov 2020 20:14:43 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 30 Nov 2020 20:14:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=e7iDmbzBWHkOP9/UlXewgpEbJRfc81x
 r16KQBT1BQRs=; b=CRL07yhNyOLuZY4+WiNVfqSCF3z5j1Hx6s18KVwuYgQwr5H
 5l0He5D9LpEEGaN6zWsNZrguFj1JKGOKiWn1YbrSn6IKLhOJTvLODnFnGLX5zRcL
 dJmD2CMYXx3CGcf77IeaRlogoA8fQImoTQd++hq0QrFcdPuqA6QCjNxf2OfY9SNU
 wUXyBdIuck7brIbszKZMxY5coSjndUGyWSW+9p7wDy0tzaS3yd5llPn7uUMkL65i
 gWHeMiPFrB4sEJ9ut6b67nxlXcSTmzOUL5+xsP1VoItu5fErlu5Qud6Qwfe+gWSv
 FDAi3x65fTsNrEthnw8c6YsdIZVG3knm/0QbzhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=e7iDmb
 zBWHkOP9/UlXewgpEbJRfc81xr16KQBT1BQRs=; b=Qyct34Mhz6KpFlSGTkIDjE
 XiFu1pSOCdn6WV3yyq8l7AePY/X+R6UHBmaETsZ3nM2/vcFmxDn0eDa5XGDR9uIN
 2NwNQB7lo7eHXwSSF5QHlDqZGqKG+vjuED9hlgmN2lvo/YLYGn197coSnAmLmZo4
 757x4M6buM8sRYAMqodjjM7WEfY+sdRz5Gl8R+zECEDOScShGQ7sbx1ggedjTPPp
 KxoFF9nn/sCEnens2jQ2rmaS0t52uH1X/Otmdr3GgReay0rOwpkxWRYUFcl3Ey+A
 Fpjqe/ZuSg4ONnEYhTwlqBeBbrfgQIo4JwGclLOGKDb1rnw9MwdmFZtXFAKzok2A
 ==
X-ME-Sender: <xms:A5nFX1WgX6ErXiHhrJ0rKW05Dfg8cVxmTjXqK_yRM-A_j3APbk9SiQ>
 <xme:A5nFX1m-FWysnl6Z3Z21R91pHIeCZufHi2r3n1VS3Cr9qjweEXjONYzzwvGYPZYJ4
 A_y7LTkFEdWv6jdQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeiuddgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:A5nFXxZasi2fbT48NHcETvQuHoAEcuUZ1t474lLmkjcNlCwsRTi-oA>
 <xmx:A5nFX4WLCxfEGeqUbHQs8qczWXpFMM1Lx5WFMsZCcYo9kBNu8FqBrw>
 <xmx:A5nFX_mpI2AtF105pbh61xarG9Czx90pFAiexQ09IgcVC_cKPUe2rA>
 <xmx:A5nFX9hKrmxPY5EeeQ6hjvKs5DwlgzdnBVkwgU6ou04hqq7guwpyHg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 718E3E00A6; Mon, 30 Nov 2020 20:14:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-622-g4a97c0b-fm-20201115.001-g4a97c0b3
Mime-Version: 1.0
Message-Id: <6e28c009-dbf9-4d6e-bc98-ccaa5e0c9b02@www.fastmail.com>
In-Reply-To: <20201130081733.18893-2-quan@os.amperecomputing.com>
References: <20201130081733.18893-1-quan@os.amperecomputing.com>
 <20201130081733.18893-2-quan@os.amperecomputing.com>
Date: Tue, 01 Dec 2020 11:44:22 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Quan Nguyen" <quan@os.amperecomputing.com>,
 "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_v2_1/2]_dt-bindings:_vendor-prefixes:_Add_an_entry_?=
 =?UTF-8?Q?for_AmpereComputing.com?=
Content-Type: text/plain
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
Cc: Open Source Submission <patches@amperecomputing.com>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 30 Nov 2020, at 18:47, Quan Nguyen wrote:
> Add "ampere" entry for Ampere Computing LLC: amperecomputing.com
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> Signed-off-by: Phong Vo <phong@os.amperecomputing.com>
> Signed-off-by: Thang Q. Nguyen <thang@os.amperecomputing.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml 
> b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 604166ecaefb..10f12e98762f 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -85,6 +85,8 @@ patternProperties:
>      description: Shenzhen Amediatech Technology Co., Ltd
>    "^amlogic,.*":
>      description: Amlogic, Inc.
> +  "^ampere,.*":
> +    description: Ampere Computing LLC

This looks okay to me, but it should go upstream.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
