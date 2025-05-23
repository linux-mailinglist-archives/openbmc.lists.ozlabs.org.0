Return-Path: <openbmc+bounces-60-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1BDAC1AD2
	for <lists+openbmc@lfdr.de>; Fri, 23 May 2025 05:53:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3WTW0ztRz3c4y;
	Fri, 23 May 2025 13:53:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747972383;
	cv=none; b=im8GLSJ46Xd1HDVBkcMKwc+TwllsdAjfg2GqLWRwKX9n+0wOXRi8WMuj1PyGrJDJ+71/258UcauhYsJS6szleSAP9+OpQQZi9//rRqw0EWoIaDdyGze2EfDsSWUTaSkSf+6FuGD+6MrJX93jKHsTyby2ZF76rOpOGO9oUo7SAFvBKx51OtkpBsRhmZ9DNYgy+o8nSWMgX/9VphKyQI95SSbC7dAyK/tHMp9HsGOQeTq7t+HUyn+C1BHbYqFMKPk1MSr+7TPDeAVqRl5NwOB4/Y4zjheM3GC6hKcdXj0Sa6DA7NpsF4YatJKSJ9d1AX+9f+Wdpj+WYqoTUklOIUX1kg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747972383; c=relaxed/relaxed;
	bh=fnSFVSrumrN4RJIZD+eJRO4WU+UFCsWEKM5q+p6FZYo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lfIxZ7CY5+mV7X9crl5mPwDNgNYreDdNsTOGSKNoA7yKgKjTnraWHi6i7TkVYkKs62+7PlIPje69axsFHb1gRdhIMlt6MC7Hb3dFL6JS10GVQU7xgg897vwST4yZEp2lHijEky7EtP6MA5z848fu+PA/BAwg63wDSJvTe8S502VuM0Eu+rAw+3LdpWj2izqmTaeqezIbs2HcAOrA2qIooz/vUrZo/iv/PLeUf04STpmZLbLXBPlO6bpy1N+ehIPMt0wn7GUI24kpoP1G4Rf622nS4eaXk9dXku8Yw4HwJfFGqxDsp5i3Two9VpDL14o+tCEnvb43rLOc021DyIKGAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NpA2SvMo; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NpA2SvMo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3WTT5Yc6z3c3s
	for <openbmc@lists.ozlabs.org>; Fri, 23 May 2025 13:53:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1747972379;
	bh=fnSFVSrumrN4RJIZD+eJRO4WU+UFCsWEKM5q+p6FZYo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NpA2SvMoCzJf4jy4BIB5Fv6PmmEiVuCvkuicu1n4mq+Ew1hE5hzVpMjw90ZAb4rb2
	 4h0FfTGckJ1DMGCkFDcCILbrGFQx3THtmZs0M4uKjKopjWkOIIx1MS24/cc1uXv5h7
	 98AAx8Z2AH6pHECbFzlR2wViQ6nFgx0XvHrMY/pkUXt6PK0YtmhCqhZISzG2Pjunpn
	 WITEIW/iqltPvtW1ZnwpO5Z9JAsd47AI4P/Xu3eSpdUdix5EtoY4sYogcNMXFi8I7K
	 XmazGrSMHPBcezxpYmfd9OUHOqWf8DxcKf3RzpBbjl94A0b/APpUgcXgvptMjnWdQ+
	 d6f/MyAFBi46w==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id AFBB0640CD;
	Fri, 23 May 2025 11:52:58 +0800 (AWST)
Message-ID: <e253a6ec996903f8c3177832e98f25c54f11457c.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.6 v2] usb: typec: tcpm: Add support for
 parsing pd-revision DT property
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cosmo Chou <chou.cosmo@gmail.com>, openbmc@lists.ozlabs.org
Cc: cosmo.chou@quantatw.com, Amit Sunil Dhamne <amitsd@google.com>
Date: Fri, 23 May 2025 13:22:57 +0930
In-Reply-To: <20250516105223.1804718-1-chou.cosmo@gmail.com>
References: <20250516105223.1804718-1-chou.cosmo@gmail.com>
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

On Fri, 2025-05-16 at 18:52 +0800, Cosmo Chou wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
>=20
> Add support for parsing "pd-revision" DT property in TCPM and store PD
> revision and version supported by the Type-C connnector.
>=20
> It should be noted that the PD revision is the maximum possible revision
> supported by the port. This is different from the 2 bit revision set in
> PD msg headers. The purpose of the 2 bit revision value is to negotiate
> between Rev 2.X & 3.X spec rev as part of contract negotiation, while
> this is used for Get_Revision AMS after a contract is in place.
>=20
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
> Link: https://lore.kernel.org/r/20241210-get_rev_upstream-v2-2-d0094e52d4=
8f@google.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> [Cosmo: Resolved merge conflicts for backport]
> Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
> ---
> =C2=A0drivers/usb/typec/tcpm/tcpm.c | 47 ++++++++++++++++++++++++++++++++=
+--
> =C2=A01 file changed, 45 insertions(+), 2 deletions(-)

Applied to dev-6.6.

Thanks,

Andrew

