Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAEC9C17C5
	for <lists+openbmc@lfdr.de>; Fri,  8 Nov 2024 09:21:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlBjL6xcKz3cPm
	for <lists+openbmc@lfdr.de>; Fri,  8 Nov 2024 19:21:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731054067;
	cv=none; b=nXzL0t9I7ZLjqJqWF72vpP0eW5qjq30cuTMSp957TfiksQrpI+7Iv+38Y66TZrTMI9FMLZTwaVHO0hu5elEwd7EYEl2PjQajZM8w6A4kpzooIBDOj2DtGBmYlDMiB20DvJoC4EKvQgYACcqlRQ+RSZttLZAZ1BmV5yn5mYxHMpantxpJNsjcGxgTiuCDRTDzi6sUJ81keautz/ELNCjjpT3YZ5fPKdlcePnG7LXWjqjNMqgksivgZ2SWXMjY+1vR8BUTz9Um3Jgt5DlHENtc7hCrO8SGBcvs+xkfwfVBpOhmGRjVDXdYXSzH9uUTlpQNDwk2xIdDHwpXf+GcF00fOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731054067; c=relaxed/relaxed;
	bh=cRdY/ye+3agJ02o6hil39dpSqzUS9DutLmgp5HUYkK0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gAIS129WVwp+nCCtIkpnVWBw6g9VzdQC/cv9FCc3sPHCI7HNOOVc4/Z6ZzhyiPxknF3GrKYoQgP7OsTrZXQ7NHkysM8cnCRyTMUAPTrZv1KnCETmfY47aqr/J+biAJxlcaDbgGl+5Zgop3IPMoPszB6ojFsqAVIOwUm/q5DQm7tnU7JkENikfCvl3HUXcKC7Ulg6c+07szGr2wVWElT6YTBzwKZVs9vDDtnf7hONxgEzpzg2vpkClL3D+aEZdH5Jxgw0ByF+5fCnGjLoffcRLYSowAL2ITc6bzg1tWIkPe2GYjeEgVLQcNYVoI0HPzHjTJNQil1bPM2T2F7JbwtvYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bNaTsDHG; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bNaTsDHG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org)
X-Greylist: delayed 608 seconds by postgrey-1.37 at boromir; Fri, 08 Nov 2024 19:21:02 AEDT
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XlBjB3dH5z3bs2
	for <openbmc@lists.ozlabs.org>; Fri,  8 Nov 2024 19:21:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1731053452;
	bh=cRdY/ye+3agJ02o6hil39dpSqzUS9DutLmgp5HUYkK0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bNaTsDHG8znmHdUOCeji9LJUUP5buLzrb+QyOLt8KeKMSW3Fs7JljiTlwu/wOqPcR
	 6SLwGgUnqnjkXM1z+GigY+LdYu7I2TRx4lGbqr+aOQ3PGxyjeO6MKRBQsREiTK99mD
	 KA6F1fb4a+yWvCjD00z/nQtxQJDTa8+DY2aF4e4nnXP3ayM4FL7eA+5cwWUVrBPoGz
	 38LrpWziZCeGHnBf08uBN+VWUBmkRvQDzWDK33K8rmBRg1mPiuItnRG1xecuqEQVSk
	 nUnXZAZ6qjY5a4DjtLhjWWI8gfqEdHlDAR/pa1B8Vlfg4zvyMWUQ3MCpuaq05szE6E
	 fL7VIAcuqCztQ==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4B2ED6A95A;
	Fri,  8 Nov 2024 16:10:50 +0800 (AWST)
Message-ID: <84fa07f08bce8af2018e4f81949d227c9b97fe0c.camel@codeconstruct.com.au>
Subject: Re: [PATCH net-next] net: mctp: Expose transport binding identifier
 via IFLA attribute
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Jakub Kicinski <kuba@kernel.org>, Khang Nguyen
	 <khangng@os.amperecomputing.com>
Date: Fri, 08 Nov 2024 16:10:49 +0800
In-Reply-To: <20241107204157.683bca11@kernel.org>
References: <20241105071915.821871-1-khangng@os.amperecomputing.com>
	 <20241107204157.683bca11@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
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
Cc: patches@amperecomputing.com, Thu Nguyen <thu@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, ampere-linux-kernel@lists.amperecomputing.com, Phong Vo <phong@os.amperecomputing.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, Hieu Le <hieul@amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Simon Horman <horms@kernel.org>, Phong Vo <pvo@amperecomputing.com>, Matt Johnston <matt@codeconstruct.com.au>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jakub,

> > However, we currently have no means to get this information from
> > MCTP links.
>=20
> I'm not opposed to the netlink attribute, but to be clear this info=20
> is indirectly available in sysfs, right? We link the netdev to=20
> the parent device so the type of /sys/class/net/$your_ifc/device
> should reveal what the transport is?

It's likely derivable from the parent device, but requires some
heuristics in userspace to map this to a transport type.

Having a well-defined place to provide the DMTF-specified transport
identifier makes this a little more straightforward to determine which
spec we're dealing with, for any transport-specific behaviour. For
example, some bus types require endpoints to announce their presence,
others do not.

Cheers,


Jeremy

