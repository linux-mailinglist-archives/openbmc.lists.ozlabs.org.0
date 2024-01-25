Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F36F83BFFC
	for <lists+openbmc@lfdr.de>; Thu, 25 Jan 2024 12:03:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=b3+gBlDX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLHx31gw3z3cGL
	for <lists+openbmc@lfdr.de>; Thu, 25 Jan 2024 22:03:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=b3+gBlDX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=opensource.cirrus.com (client-ip=67.231.149.25; helo=mx0b-001ae601.pphosted.com; envelope-from=prvs=8754d201d6=ckeepax@opensource.cirrus.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1395 seconds by postgrey-1.37 at boromir; Thu, 25 Jan 2024 22:02:31 AEDT
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLHwR6jc9z3br3
	for <openbmc@lists.ozlabs.org>; Thu, 25 Jan 2024 22:02:30 +1100 (AEDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40P5AAgS030847;
	Thu, 25 Jan 2024 04:38:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=H+pywFxcGO3YzfU
	rAAIpNM2vOQO6zCM1bhi8m27y6OI=; b=b3+gBlDXeNI33HTb3T7utPWf75UcvTs
	ZcP/BhOpa3V4+/1KG2aJyhJmonJrkg58ulrc3GIVe4IVnfvBgY+Lox1KAI5JisQZ
	3b8JM2obfJM4NwlhRimVpm5BIoKJwxQ8WkYJbiWHrReD3jNTTwvK53q4/to2Qrsq
	ixXzNZmnJ0tBc4agwBubW1bNhaNmJACR47haBNshaI4PnGrKytTXJGGT7aHEnwcq
	y7UamTq69F0kQ+sPr/N7LOuKbnexmfPuOe9AwibpexoZATYkP67Q7C/b1PTV1G+k
	mm+nux6AVYhCUDatO6NJuqJP/k/tOfKBSSFfQEKidf2uiaZ2ktIvQ8g==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhj3tc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 04:38:57 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 25 Jan
 2024 10:38:55 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Thu, 25 Jan 2024 10:38:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 21112820246;
	Thu, 25 Jan 2024 10:38:55 +0000 (UTC)
Date: Thu, 25 Jan 2024 10:38:54 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Unify "input-debounce" schema
Message-ID: <ZbI6PrrQsVDIjt69@ediswmail9.ad.cirrus.com>
References: <20240124190106.1540585-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240124190106.1540585-1-robh@kernel.org>
X-Proofpoint-ORIG-GUID: 8iYiuE_6G63A78QKjJlEqxQHoZze71Jp
X-Proofpoint-GUID: 8iYiuE_6G63A78QKjJlEqxQHoZze71Jp
X-Proofpoint-Spam-Reason: safe
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Tomer Maimon <tmaimon77@gmail.com>, alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org, Avi
 Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Linus Walleij <linus.walleij@linaro.org>, Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, Tali
 Perry <tali.perry1@gmail.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, patches@opensource.cirrus.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jan 24, 2024 at 01:01:04PM -0600, Rob Herring wrote:
> nuvoton,npcm845-pinctrl defines the common "input-debounce" property as
> an array rather than an scalar. Update the common definition to expand
> it to an uint32-array, and update all the users of the property with
> array constraints.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml   | 3 ++-

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
