Return-Path: <openbmc+bounces-37-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED56AAF471
	for <lists+openbmc@lfdr.de>; Thu,  8 May 2025 09:12:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtNd52CNYz2ygh;
	Thu,  8 May 2025 17:12:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746688377;
	cv=none; b=T/7K2yQ7HIGMERWX6uEgu7ZQyeAV0iNCuk3zgwRNgNEsL5e+ScodCmL4E0gg4NfUR7j8TeheO2a69p5CDWl/vm6WhZ6a0SdRepcxRYF/R9eD/bpQFBgC9eLP25XkkAAoID/HTeFJZcaLwJlsF44ORZtHX8//4WUvtradQve/zmHyjJJCx++Mx81T7aeJGUKW5768c8sXAHTrm3Vkx7+sBVQLVG8V2aEgLPYOSVAF1gqrcqme9lf/hhpxl7uPFHsnGB3eM+UWdrRxFirBE9paQzsWC//uGfsFz0q3oIBr2m9RbEseJFXGW2jVlPWzuRTVg2dhYUvWhqiiyIZL9yp/ww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746688377; c=relaxed/relaxed;
	bh=xP8431J740+lycfocE6wILMGJQqVTjbgXFMsRTBLxFE=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cVwvOS7D+WA+GvoGiXmVbAx7Xb9P2AjVZk53vZPA3XqI2Nm0YjYCaSDl+DXQo5OBMxdl626OcNThrtccAJ66v7n4wFxxBfO8BqTCd4EbHelFxS63R5GLn0keBfb6j5BDY4P9IVlVmqUd0c2yGvkBUDe5YlbHWJnQJTWI8SjcAJEfEjqrQiOaLJFEeSPkkyFPmb4uelRAg5FlgH3AinbU64NrTDD4aRi2DuJ0Fm2VvHjVu57cOS1yUOkNt8Lzrs7s/WQUh1FBGtZg+eFuUPMWtuDOhfIV3li4zqBi4m3c6K25s1fa9ek2jylHiMDenFUX5DbO1AzbgPBpsQCLSKLORA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=JOEe2G5q; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=JOEe2G5q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZtNd430ltz2xHY
	for <openbmc@lists.ozlabs.org>; Thu,  8 May 2025 17:12:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1746688373;
	bh=xP8431J740+lycfocE6wILMGJQqVTjbgXFMsRTBLxFE=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=JOEe2G5q1XPHNvMjNTrZHRqgmxP4hzkWafeRSmprpi28UEdjgrEhAjnEr1uKwv/og
	 J4OKoE8jn+YRqWHTwyqeUVJk6Ivdhbw/FQOIpBGlim8fiByB8FZACo+3/kcKxdnITi
	 WWqaLoFwFPVDL2AMWy/NOT7sakbd3RY2ukCwSi0nDIFIdWvH5inMEiKcb1IuiP04kb
	 7bNEV0hq0tIB+LkVb/yXZPu2bxyuk0TGkEQANqeFgrO0eGPdL3m+i1Am+z7Tv63uKu
	 qenx3hhkZPOShC4w7OBz3XzNntbw1AwygDKt6rFUGzB8zY7p4kA5ALNcWNG0OFIwE8
	 mAs+/KGEdAoeQ==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 378426449A;
	Thu,  8 May 2025 15:12:52 +0800 (AWST)
Message-ID: <8fac6e31411b6879bcc325813cc6bca8744e8c2c.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.6 v2 3/3] net: mctp: usb: Port for kernel 6.6
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Santosh Puranik <santosh.puranik.ibm@gmail.com>,
 openbmc@lists.ozlabs.org,  joel@jms.id.au, jk@codeconstruct.com.au
Date: Thu, 08 May 2025 16:42:51 +0930
In-Reply-To: <20250507173806.5371-4-santosh.puranik.ibm@gmail.com>
References: <20250507173806.5371-1-santosh.puranik.ibm@gmail.com>
	 <20250507173806.5371-4-santosh.puranik.ibm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 2025-05-07 at 23:08 +0530, Santosh Puranik wrote:
> From: Santosh Puranik <spuranik@nvidia.com>
>=20
> Fix the way the mctp usb binding driver records netdev stats.
>=20
> Signed-off-by: Santosh Puranik <santosh.puranik.ibm@gmail.com>

I've squashed this into the previous patch with a note in the trailer.

Cheers,

Andrew

