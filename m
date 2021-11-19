Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AF9456A48
	for <lists+openbmc@lfdr.de>; Fri, 19 Nov 2021 07:32:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwRgF3tdtz308J
	for <lists+openbmc@lfdr.de>; Fri, 19 Nov 2021 17:32:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=deOy+AnU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=deOy+AnU; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwRfn2W59z2xsh;
 Fri, 19 Nov 2021 17:32:33 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7FDC561154;
 Fri, 19 Nov 2021 06:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637303549;
 bh=OHkAYsvD0uKPKb8nG+HuJxykyXW7Ftf3m1+RoFYWSW8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=deOy+AnUvi+g1408Su7D3Z8MNREHZaOt8joLNAtV22FgtduKQEf7T6GvU8fiQqekE
 NUY1T/IeO+JYqKpWjx+tWfCYPxkL9IJ0yaTi9wTO2ZLEseTx3tD4V+PipYzhUiYOXN
 BAbGTnNURMDwcCRJprTWAOqlvZrEKnkGQY9K7hhCLggGOXeNjpl8i3aNmbXZdQqsE6
 OidbUst6fx4OCfB8cZYebpun+PVsGm21hijVN0GKLB7215lizhtXZ/2Gt82uiK8oLw
 FFdgGXvz3s9KPwOQ8//L6/BYj+uXNgvWjUOzUnuhGzv9/JVX+zB4DasVOLMVH2JdzW
 p8ng3bwVYIJ2w==
Date: Thu, 18 Nov 2021 22:32:28 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Subject: Re: [PATCH v7] Add payload to be 32-bit aligned to fix dropped packets
Message-ID: <20211118223228.7edfeade@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211118160301.GA19542@gmail.com>
References: <20211118160301.GA19542@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, Amithash Prasad <amithash@fb.com>, patrickw3@fb.com,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>, velumanit@hcl.com,
 "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 18 Nov 2021 21:33:02 +0530 Kumar Thangavel wrote:
> +const static int padding_bytes =3D 26;

/net/ncsi/ncsi-cmd.c:21:1: warning: =E2=80=98static=E2=80=99 is not at begi=
nning of declaration [-Wold-style-declaration]
   21 | const static int padding_bytes =3D 26;
      | ^~~~~
